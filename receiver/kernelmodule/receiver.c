/*
 * receiver.c - linux kernel module for the fsk receiver
*/

#include<linux/module.h>
#include <asm/errno.h>
#include <linux/cdev.h>
#include <linux/of.h>
#include <linux/platform_device.h>
#include <linux/miscdevice.h>
#include <linux/io.h>
#include <linux/kfifo.h>
#include <linux/interrupt.h>
#include <linux/spinlock.h>
#include <linux/timer.h>
#include <linux/ktime.h>
#include <linux/wait.h>
#include <linux/sched.h>
#include <linux/uaccess.h>

#define RECEIVER_DRIVER_NAME    "receiver"
#define FIFO_SIZE               16
#define TIMER_INTERVAL			50

#define RECEIVER_CONFIG_REG		0x02
#define RECEIVER_TIME_LOW_REG	0x01
#define RECEIVER_TIME_HIGH_REG	0x00

#define RECEIVER_IRQ_ENABLE		0x02
#define RECEIVER_IRQ_START		0x01
#define RECEIVER_IRQ_RESET		0x04	

static DEFINE_KFIFO(timestamps, u64, FIFO_SIZE); 

struct receiver
{
	u32 *register_base;
	struct miscdevice misc;
	struct timer_list tmr;
	spinlock_t lock;
	wait_queue_head_t wq;
};

static const struct of_device_id receiver_of_match[] = {
	{ .compatible = "unknown,unknown-1.0", },
	{ },
};
MODULE_DEVICE_TABLE(of, receiver_of_match);

static int receiver_probe(struct platform_device *pdev);
static int receiver_remove(struct platform_device *pdev);

static struct platform_driver receiver_driver = {
	.driver = {
		.name = RECEIVER_DRIVER_NAME,
		.owner = THIS_MODULE,
		.of_match_table = of_match_ptr(receiver_of_match)
	},
	.probe = receiver_probe,
	.remove = receiver_remove
};
module_platform_driver(receiver_driver);

static ssize_t receiver_read(struct file *filp, char __user *buff,
	size_t count, loff_t *offp);

static const struct file_operations receiver_fops = {
	.read = receiver_read
};

static void timer_callback(struct timer_list *timer)
{
	struct receiver *rcvr = from_timer(rcvr, timer, tmr);
	u64 const timestamp = ktime_get_real_ns();

	iowrite32((u32)(timestamp >> 32), rcvr->register_base + RECEIVER_TIME_HIGH_REG);
	iowrite32((u32)(timestamp), rcvr->register_base + RECEIVER_TIME_LOW_REG);

	// set timer again
	mod_timer(&rcvr->tmr, jiffies + msecs_to_jiffies(TIMER_INTERVAL));
}

static irqreturn_t handler(int irq, void *data)
{
	struct receiver *rcvr = data;
	unsigned long flags;
	int val = 0;
	
	u32 const time_high = ioread32(rcvr->register_base + RECEIVER_TIME_HIGH_REG);
	u32 const time_low = ioread32(rcvr->register_base + RECEIVER_TIME_LOW_REG);
	u64 const timestamp = ((u64)time_high << 32) | time_low;
    u64 old_time = 0;

	u32 irq_config = ioread32(rcvr->register_base + RECEIVER_CONFIG_REG);
	irq_config |= RECEIVER_IRQ_RESET;
	
	printk(KERN_INFO "got an interrupt, time high is %u, time low is %u",time_high,time_low);
	printk(KERN_INFO "timestamp written data: %llu\n",timestamp);

	spin_lock_irqsave(&rcvr->lock, flags);
	
	if (kfifo_is_full(&timestamps) == 1) {
		val = kfifo_get(&timestamps, &old_time);
	}
    val = kfifo_put(&timestamps, timestamp);
	spin_unlock_irqrestore(&rcvr->lock, flags);

	wake_up_interruptible(&rcvr->wq);
	iowrite32(irq_config, rcvr->register_base + RECEIVER_CONFIG_REG);

	return IRQ_HANDLED;
}

// Load driver
static int receiver_probe(struct platform_device *pdev)
{
	struct resource *io = NULL;
	int status = 0;
	int irq = 0;

	// dynamically allocate memory for our driver data structure
	struct receiver *rcvr = devm_kzalloc(
		&pdev->dev, sizeof(struct receiver), GFP_KERNEL);

	if (rcvr == NULL) {
		dev_crit(&pdev->dev,
			"Failed to allocate memory for driver data structure");
		return -ENOMEM;
	}

	platform_set_drvdata(pdev, rcvr);

	// get first iomemory resource -> returns the single register address
	io = platform_get_resource(pdev, IORESOURCE_MEM, 0);

	if (io == NULL) {
		dev_crit(&pdev->dev, "Failed to get io memory resource.");
		return -ENOMEM;
	}

	// remap register into virtual space
	rcvr->register_base = devm_ioremap_resource(&pdev->dev, io);

	if (rcvr->register_base == NULL) {
		dev_crit(&pdev->dev,
			"Failed to map io memory into virtual space.");
		return -ENOMEM;
	}

	// create misc char device
	rcvr->misc.name = RECEIVER_DRIVER_NAME;
	rcvr->misc.minor = MISC_DYNAMIC_MINOR;
	rcvr->misc.fops = &receiver_fops;
	rcvr->misc.parent = &pdev->dev;
	status = misc_register(&rcvr->misc);

	if (status != 0) {
		dev_crit(&pdev->dev, "Failed to register misc device");
		return status;
	}

	// // check if the fifo is initialized
	if (kfifo_initialized(&timestamps) == 0) {
		dev_crit(&pdev->dev, "Failed to initialize kfifo");
		return status;
	}

	// init interrupt
	irq = platform_get_irq(pdev, 0);

	status = devm_request_irq(&pdev->dev, irq, handler, IRQF_SHARED,
		"reciver", rcvr);

	if (status != 0) {
		dev_crit(&pdev->dev, "Failed to request interrupt %d", irq);
		return status;
	}

	init_waitqueue_head(&rcvr->wq);

	// init spinlock
	spin_lock_init(&rcvr->lock);

	// init the timer
	timer_setup(&rcvr->tmr, timer_callback, 0);
	mod_timer(&rcvr->tmr, jiffies + msecs_to_jiffies(TIMER_INTERVAL));

	// enable interrupts
	iowrite32(RECEIVER_IRQ_ENABLE, rcvr->register_base + RECEIVER_CONFIG_REG);

	dev_info(&pdev->dev, "receiver driver loaded successfully");

	return status;
}

// Remove driver
static int receiver_remove(struct platform_device *pdev)
{
	struct receiver *rcvr = platform_get_drvdata(pdev);

	if (rcvr != NULL) {
		misc_deregister(&rcvr->misc);

		// disable interrupts
		iowrite32(0, rcvr->register_base + RECEIVER_CONFIG_REG);

		// remove the timer
		del_timer_sync(&rcvr->tmr);
	}

	platform_set_drvdata(pdev, NULL);

	dev_info(&pdev->dev, "unloaded driver\n");

	return 0;
}

static ssize_t receiver_read(struct file *filp, char __user *buff,
	size_t count, loff_t *offp)
{
	int ret = 0;
	ssize_t copied = 0;
	unsigned long flags;
	int err = 0;

	struct receiver *rcvr = container_of(
		filp->private_data, struct receiver, misc);

	if(count < sizeof(u64)){
		return 0;
	}

	// wait until the fifo is not empty
	if ((err = wait_event_interruptible(rcvr->wq, !kfifo_is_empty(&timestamps))))
	{
		return err;
	}

	// output the samples of the fifo to the user
	spin_lock_irqsave(&rcvr->lock, flags);
	ret = kfifo_to_user(&timestamps, buff, sizeof(u64), &copied);
	spin_unlock_irqrestore(&rcvr->lock, flags);
	
	pr_info("receiver: written: %d Bytes\n", copied);
	
	return copied;
}

MODULE_LICENSE("GPL");
MODULE_DESCRIPTION("DE1-SoC fsk receiver module");
MODULE_AUTHOR("Manuel Ahrer <S2220567016@fhooe.at>");
