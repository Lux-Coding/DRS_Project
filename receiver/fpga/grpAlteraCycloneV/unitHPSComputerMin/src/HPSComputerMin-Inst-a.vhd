--------------------------------------------------------------------------------
-- Title       : HPS instantiation helper
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: HPSComputerMin-Inst-a.vhd 739 2017-12-04 03:59:51Z mroland $
-- Authors     : Michael Roland, Hagenberg/Austria, Copyright (c) 2016-2017
--------------------------------------------------------------------------------
-- Description : Minimal Hard Prosessor System SoC Instantiation for access to
--               UART pins of HPS on Altera DE1-SoC
--------------------------------------------------------------------------------

architecture Inst of HPSComputerMin is

  constant cIsSimulation : boolean := false
    --pragma synthesis_off
                                      or true
    --pragma synthesis_on
    ;

	component Computer_System is
		port (
			f2h_bootflags_boot_from_fpga_ready      : in    std_logic                     := 'X';             -- boot_from_fpga_ready
			f2h_bootflags_boot_from_fpga_on_failure : in    std_logic                     := 'X';             -- boot_from_fpga_on_failure
			fpga_reset_reset_n                      : out   std_logic;                                        -- reset_n
			h2f_loan_io_in                          : out   std_logic_vector(66 downto 0);                    -- in
			h2f_loan_io_out                         : in    std_logic_vector(66 downto 0) := (others => 'X'); -- out
			h2f_loan_io_oe                          : in    std_logic_vector(66 downto 0) := (others => 'X'); -- oe
			hps_io_hps_io_emac1_inst_TX_CLK         : out   std_logic;                                        -- hps_io_emac1_inst_TX_CLK
			hps_io_hps_io_emac1_inst_TXD0           : out   std_logic;                                        -- hps_io_emac1_inst_TXD0
			hps_io_hps_io_emac1_inst_TXD1           : out   std_logic;                                        -- hps_io_emac1_inst_TXD1
			hps_io_hps_io_emac1_inst_TXD2           : out   std_logic;                                        -- hps_io_emac1_inst_TXD2
			hps_io_hps_io_emac1_inst_TXD3           : out   std_logic;                                        -- hps_io_emac1_inst_TXD3
			hps_io_hps_io_emac1_inst_RXD0           : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD0
			hps_io_hps_io_emac1_inst_MDIO           : inout std_logic                     := 'X';             -- hps_io_emac1_inst_MDIO
			hps_io_hps_io_emac1_inst_MDC            : out   std_logic;                                        -- hps_io_emac1_inst_MDC
			hps_io_hps_io_emac1_inst_RX_CTL         : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CTL
			hps_io_hps_io_emac1_inst_TX_CTL         : out   std_logic;                                        -- hps_io_emac1_inst_TX_CTL
			hps_io_hps_io_emac1_inst_RX_CLK         : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CLK
			hps_io_hps_io_emac1_inst_RXD1           : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD1
			hps_io_hps_io_emac1_inst_RXD2           : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD2
			hps_io_hps_io_emac1_inst_RXD3           : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD3
			hps_io_hps_io_qspi_inst_IO0             : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO0
			hps_io_hps_io_qspi_inst_IO1             : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO1
			hps_io_hps_io_qspi_inst_IO2             : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO2
			hps_io_hps_io_qspi_inst_IO3             : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO3
			hps_io_hps_io_qspi_inst_SS0             : out   std_logic;                                        -- hps_io_qspi_inst_SS0
			hps_io_hps_io_qspi_inst_CLK             : out   std_logic;                                        -- hps_io_qspi_inst_CLK
			hps_io_hps_io_sdio_inst_CMD             : inout std_logic                     := 'X';             -- hps_io_sdio_inst_CMD
			hps_io_hps_io_sdio_inst_D0              : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D0
			hps_io_hps_io_sdio_inst_D1              : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D1
			hps_io_hps_io_sdio_inst_CLK             : out   std_logic;                                        -- hps_io_sdio_inst_CLK
			hps_io_hps_io_sdio_inst_D2              : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D2
			hps_io_hps_io_sdio_inst_D3              : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D3
			hps_io_hps_io_usb1_inst_D0              : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D0
			hps_io_hps_io_usb1_inst_D1              : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D1
			hps_io_hps_io_usb1_inst_D2              : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D2
			hps_io_hps_io_usb1_inst_D3              : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D3
			hps_io_hps_io_usb1_inst_D4              : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D4
			hps_io_hps_io_usb1_inst_D5              : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D5
			hps_io_hps_io_usb1_inst_D6              : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D6
			hps_io_hps_io_usb1_inst_D7              : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D7
			hps_io_hps_io_usb1_inst_CLK             : in    std_logic                     := 'X';             -- hps_io_usb1_inst_CLK
			hps_io_hps_io_usb1_inst_STP             : out   std_logic;                                        -- hps_io_usb1_inst_STP
			hps_io_hps_io_usb1_inst_DIR             : in    std_logic                     := 'X';             -- hps_io_usb1_inst_DIR
			hps_io_hps_io_usb1_inst_NXT             : in    std_logic                     := 'X';             -- hps_io_usb1_inst_NXT
			hps_io_hps_io_spim1_inst_CLK            : out   std_logic;                                        -- hps_io_spim1_inst_CLK
			hps_io_hps_io_spim1_inst_MOSI           : out   std_logic;                                        -- hps_io_spim1_inst_MOSI
			hps_io_hps_io_spim1_inst_MISO           : in    std_logic                     := 'X';             -- hps_io_spim1_inst_MISO
			hps_io_hps_io_spim1_inst_SS0            : out   std_logic;                                        -- hps_io_spim1_inst_SS0
			hps_io_hps_io_i2c0_inst_SDA             : inout std_logic                     := 'X';             -- hps_io_i2c0_inst_SDA
			hps_io_hps_io_i2c0_inst_SCL             : inout std_logic                     := 'X';             -- hps_io_i2c0_inst_SCL
			hps_io_hps_io_i2c1_inst_SDA             : inout std_logic                     := 'X';             -- hps_io_i2c1_inst_SDA
			hps_io_hps_io_i2c1_inst_SCL             : inout std_logic                     := 'X';             -- hps_io_i2c1_inst_SCL
			hps_io_hps_io_gpio_inst_GPIO09          : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO09
			hps_io_hps_io_gpio_inst_GPIO35          : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO35
			hps_io_hps_io_gpio_inst_GPIO40          : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO40
			hps_io_hps_io_gpio_inst_GPIO48          : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO48
			hps_io_hps_io_gpio_inst_GPIO61          : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO61
			hps_io_hps_io_gpio_inst_LOANIO49        : inout std_logic                     := 'X';             -- hps_io_gpio_inst_LOANIO49
			hps_io_hps_io_gpio_inst_LOANIO50        : inout std_logic                     := 'X';             -- hps_io_gpio_inst_LOANIO50
			hps_io_hps_io_gpio_inst_LOANIO53        : inout std_logic                     := 'X';             -- hps_io_gpio_inst_LOANIO53
			hps_io_hps_io_gpio_inst_LOANIO54        : inout std_logic                     := 'X';             -- hps_io_gpio_inst_LOANIO54
			hps_uart0_cts                           : in    std_logic                     := 'X';             -- cts
			hps_uart0_dsr                           : in    std_logic                     := 'X';             -- dsr
			hps_uart0_dcd                           : in    std_logic                     := 'X';             -- dcd
			hps_uart0_ri                            : in    std_logic                     := 'X';             -- ri
			hps_uart0_dtr                           : out   std_logic;                                        -- dtr
			hps_uart0_rts                           : out   std_logic;                                        -- rts
			hps_uart0_out1_n                        : out   std_logic;                                        -- out1_n
			hps_uart0_out2_n                        : out   std_logic;                                        -- out2_n
			hps_uart0_rxd                           : in    std_logic                     := 'X';             -- rxd
			hps_uart0_txd                           : out   std_logic;                                        -- txd
			memory_mem_a                            : out   std_logic_vector(14 downto 0);                    -- mem_a
			memory_mem_ba                           : out   std_logic_vector(2 downto 0);                     -- mem_ba
			memory_mem_ck                           : out   std_logic;                                        -- mem_ck
			memory_mem_ck_n                         : out   std_logic;                                        -- mem_ck_n
			memory_mem_cke                          : out   std_logic;                                        -- mem_cke
			memory_mem_cs_n                         : out   std_logic;                                        -- mem_cs_n
			memory_mem_ras_n                        : out   std_logic;                                        -- mem_ras_n
			memory_mem_cas_n                        : out   std_logic;                                        -- mem_cas_n
			memory_mem_we_n                         : out   std_logic;                                        -- mem_we_n
			memory_mem_reset_n                      : out   std_logic;                                        -- mem_reset_n
			memory_mem_dq                           : inout std_logic_vector(31 downto 0) := (others => 'X'); -- mem_dq
			memory_mem_dqs                          : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs
			memory_mem_dqs_n                        : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_n
			memory_mem_odt                          : out   std_logic;                                        -- mem_odt
			memory_mem_dm                           : out   std_logic_vector(3 downto 0);                     -- mem_dm
			memory_oct_rzqin                        : in    std_logic                     := 'X';             -- oct_rzqin
			system_clk_clk                          : in    std_logic                     := 'X';             -- clk
			system_reset_reset                      : in    std_logic                     := 'X'              -- reset
		);
	end component Computer_System;

  -- loan I/O indices
  constant LOAN_IO_UART_RX     : natural := 49;
  constant LOAN_IO_UART_TX     : natural := 50;
  constant LOAN_IO_LED         : natural := 53;
  constant LOAN_IO_KEY         : natural := 54;
  
  -- component ports
  signal system_reset          : std_ulogic;
  signal h2f_reset_n           : std_ulogic;
  signal boot_from_fpga_ready  : std_ulogic;
  signal h2f_loan_io_in        : std_logic_vector(66 downto 0);
  signal h2f_loan_io_out       : std_logic_vector(66 downto 0);
  signal h2f_loan_io_oe        : std_logic_vector(66 downto 0);
  signal hps_uart0_txd         : std_ulogic;
  signal hps_uart0_rxd         : std_ulogic;
  
  -- UART to USB converter
  signal uart_to_usb_txd       : std_ulogic;
  signal uart_to_usb_rxd       : std_ulogic;
  
  -- configuration indicator
  signal hps_key_input_async   : std_ulogic;
  signal hps_key_input         : std_ulogic;
  signal hps_led_output        : std_ulogic;
  signal frequency1            : std_ulogic;
  signal frequency2            : std_ulogic;
  
begin  -- architecture Inst
  
  system_reset <= cInactivated;
  FPGA_RESET_N <= h2f_reset_n;
  
  -- Boot from FPGA: Indicate that FPGA is ready
  BootFromFPGA : process (CLOCK_50, h2f_reset_n) is
  begin
    if (h2f_reset_n = cResetActive) then
      boot_from_fpga_ready <= cInactivated;
    elsif rising_edge(CLOCK_50) then  -- rising clock edge
      boot_from_fpga_ready <= cActivated;
    end if;
  end process BootFromFPGA;
  
  
  -- FTDI UART: transceive with FPGA
  FPGA_UART_RX    <= uart_to_usb_rxd;
  uart_to_usb_txd <= FPGA_UART_TX;
  hps_uart0_rxd   <= '1';
  
  -- LOAN I/O: read value from loaned external HPS UART RX pin and map to internal FPGA signal
  h2f_loan_io_oe(LOAN_IO_UART_RX) <= cInactivated;
  uart_to_usb_rxd                 <= h2f_loan_io_in(LOAN_IO_UART_RX);

  -- LOAN I/O: write internal FPGA signal to loaned external HPS UART TX pin (may be done asynchronously)
  h2f_loan_io_oe(LOAN_IO_UART_TX)  <= cActivated;
  h2f_loan_io_out(LOAN_IO_UART_TX) <= uart_to_usb_txd;
  
  -- LOAN I/O: use USER BUTTON as input
  h2f_loan_io_oe(LOAN_IO_KEY) <= cInactivated;
  hps_key_input_async         <= h2f_loan_io_in(LOAN_IO_KEY);

  SyncKey : entity work.Sync
    generic map (
      gInitialState => cActivated)
    port map (
      iClk         => CLOCK_50,
      inResetAsync => h2f_reset_n,
      iAsync       => hps_key_input_async,
      oSync        => hps_key_input);
  
  -- LOAN I/O: USER LED as output (may be done asynchronously)
  h2f_loan_io_oe(LOAN_IO_LED)  <= cActivated;
  h2f_loan_io_out(LOAN_IO_LED) <= hps_led_output;
  
  -- blink USER LED to indicate that we are up and properly running
  BlinkLed : process (CLOCK_50, h2f_reset_n) is
  begin
    if (h2f_reset_n = cResetActive) then
      hps_led_output <= cInactivated;
    elsif rising_edge(CLOCK_50) then  -- rising clock edge
      hps_led_output <= (frequency1 and frequency2) or not(hps_key_input);
    end if;
  end process BlinkLed;
  
  MIRROR_HPS_LED <= hps_led_output;
  
  GenFreq1 : entity work.FreqDivider
    generic map (
      gDivideBy => 50000000)
    port map (
      iClk         => CLOCK_50,
      inResetAsync => h2f_reset_n,
      oDivdClk     => frequency1);

  GenFreq2 : entity work.FreqDivider
    generic map (
      gDivideBy => 70000000)
    port map (
      iClk         => CLOCK_50,
      inResetAsync => h2f_reset_n,
      oDivdClk     => frequency2);
    
  
  GenerateInstForSyn : if not cIsSimulation generate

    Computer_System_inst : component Computer_System
      port map (
        -- SYSTEM BASE CLOCK
        system_clk_clk                          => CLOCK_50,
        system_reset_reset                      => system_reset,
        
        -- HPS -> FPGA RESET
        fpga_reset_reset_n                      => h2f_reset_n,

        -- HPS BOOT FROM FPGA CONTROL
        f2h_bootflags_boot_from_fpga_ready      => boot_from_fpga_ready,
        f2h_bootflags_boot_from_fpga_on_failure => cActivated,
        
        -- HPS LOAN I/O CONTROL
        h2f_loan_io_in                          => h2f_loan_io_in,
        h2f_loan_io_out                         => h2f_loan_io_out,
        h2f_loan_io_oe                          => h2f_loan_io_oe,
        
        -- HPS UART0
        hps_uart0_cts                           => cActivated,
        hps_uart0_dsr                           => cActivated,
        hps_uart0_dcd                           => cInactivated,
        hps_uart0_ri                            => cInactivated,
        hps_uart0_dtr                           => open,
        hps_uart0_rts                           => open,
        hps_uart0_out1_n                        => open,
        hps_uart0_out2_n                        => open,
        hps_uart0_rxd                           => hps_uart0_rxd,
        hps_uart0_txd                           => hps_uart0_txd,
        
        -- DDR3 SDRAM
        memory_mem_a                            => HPS_DDR3_ADDR,
        memory_mem_ba                           => HPS_DDR3_BA,
        memory_mem_ck                           => HPS_DDR3_CK_P,
        memory_mem_ck_n                         => HPS_DDR3_CK_N,
        memory_mem_cke                          => HPS_DDR3_CKE,
        memory_mem_cs_n                         => HPS_DDR3_CS_N,
        memory_mem_ras_n                        => HPS_DDR3_RAS_N,
        memory_mem_cas_n                        => HPS_DDR3_CAS_N,
        memory_mem_we_n                         => HPS_DDR3_WE_N,
        memory_mem_reset_n                      => HPS_DDR3_RESET_N,
        memory_mem_dq                           => HPS_DDR3_DQ,
        memory_mem_dqs                          => HPS_DDR3_DQS_P,
        memory_mem_dqs_n                        => HPS_DDR3_DQS_N,
        memory_mem_odt                          => HPS_DDR3_ODT,
        memory_mem_dm                           => HPS_DDR3_DM,
        memory_oct_rzqin                        => HPS_DDR3_RZQ,
        
        -- ETHERNET
        hps_io_hps_io_emac1_inst_TX_CLK         => HPS_ENET_GTX_CLK,
        hps_io_hps_io_emac1_inst_TXD0           => HPS_ENET_TX_DATA(0),
        hps_io_hps_io_emac1_inst_TXD1           => HPS_ENET_TX_DATA(1),
        hps_io_hps_io_emac1_inst_TXD2           => HPS_ENET_TX_DATA(2),
        hps_io_hps_io_emac1_inst_TXD3           => HPS_ENET_TX_DATA(3),
        hps_io_hps_io_emac1_inst_RXD0           => HPS_ENET_RX_DATA(0),
        hps_io_hps_io_emac1_inst_MDIO           => HPS_ENET_MDIO,
        hps_io_hps_io_emac1_inst_MDC            => HPS_ENET_MDC,
        hps_io_hps_io_emac1_inst_RX_CTL         => HPS_ENET_RX_DV,
        hps_io_hps_io_emac1_inst_TX_CTL         => HPS_ENET_TX_EN,
        hps_io_hps_io_emac1_inst_RX_CLK         => HPS_ENET_RX_CLK,
        hps_io_hps_io_emac1_inst_RXD1           => HPS_ENET_RX_DATA(1),
        hps_io_hps_io_emac1_inst_RXD2           => HPS_ENET_RX_DATA(2),
        hps_io_hps_io_emac1_inst_RXD3           => HPS_ENET_RX_DATA(3),
        hps_io_hps_io_gpio_inst_GPIO35          => HPS_ENET_INT_N,
        
        -- QSPI FLASH
        hps_io_hps_io_qspi_inst_IO0             => HPS_FLASH_DATA(0),
        hps_io_hps_io_qspi_inst_IO1             => HPS_FLASH_DATA(1),
        hps_io_hps_io_qspi_inst_IO2             => HPS_FLASH_DATA(2),
        hps_io_hps_io_qspi_inst_IO3             => HPS_FLASH_DATA(3),
        hps_io_hps_io_qspi_inst_SS0             => HPS_FLASH_NCSO,
        hps_io_hps_io_qspi_inst_CLK             => HPS_FLASH_DCLK,
        
        -- I2C
        hps_io_hps_io_gpio_inst_GPIO48          => HPS_I2C_CONTROL,
        hps_io_hps_io_i2c0_inst_SCL             => HPS_I2C1_SCLK,
        hps_io_hps_io_i2c0_inst_SDA             => HPS_I2C1_SDAT,
        hps_io_hps_io_i2c1_inst_SCL             => HPS_I2C2_SCLK,
        hps_io_hps_io_i2c1_inst_SDA             => HPS_I2C2_SDAT,
        
        -- SD CARD
        hps_io_hps_io_sdio_inst_CMD             => HPS_SD_CMD,
        hps_io_hps_io_sdio_inst_D0              => HPS_SD_DATA(0),
        hps_io_hps_io_sdio_inst_D1              => HPS_SD_DATA(1),
        hps_io_hps_io_sdio_inst_CLK             => HPS_SD_CLK,
        hps_io_hps_io_sdio_inst_D2              => HPS_SD_DATA(2),
        hps_io_hps_io_sdio_inst_D3              => HPS_SD_DATA(3),
        
        -- USB
        hps_io_hps_io_usb1_inst_D0              => HPS_USB_DATA(0),
        hps_io_hps_io_usb1_inst_D1              => HPS_USB_DATA(1),
        hps_io_hps_io_usb1_inst_D2              => HPS_USB_DATA(2),
        hps_io_hps_io_usb1_inst_D3              => HPS_USB_DATA(3),
        hps_io_hps_io_usb1_inst_D4              => HPS_USB_DATA(4),
        hps_io_hps_io_usb1_inst_D5              => HPS_USB_DATA(5),
        hps_io_hps_io_usb1_inst_D6              => HPS_USB_DATA(6),
        hps_io_hps_io_usb1_inst_D7              => HPS_USB_DATA(7),
        hps_io_hps_io_usb1_inst_CLK             => HPS_USB_CLKOUT,
        hps_io_hps_io_usb1_inst_STP             => HPS_USB_STP,
        hps_io_hps_io_usb1_inst_DIR             => HPS_USB_DIR,
        hps_io_hps_io_usb1_inst_NXT             => HPS_USB_NXT,
        hps_io_hps_io_gpio_inst_GPIO09          => HPS_CONV_USB_N,
        
        -- SPI
        hps_io_hps_io_spim1_inst_CLK            => HPS_SPIM_CLK,
        hps_io_hps_io_spim1_inst_MOSI           => HPS_SPIM_MOSI,
        hps_io_hps_io_spim1_inst_MISO           => HPS_SPIM_MISO,
        hps_io_hps_io_spim1_inst_SS0            => HPS_SPIM_SS,
        
        -- UART ADAPTER
        hps_io_hps_io_gpio_inst_LOANIO50        => HPS_UART_TX,
        hps_io_hps_io_gpio_inst_LOANIO49        => HPS_UART_RX,
        
        -- GPIO
        hps_io_hps_io_gpio_inst_LOANIO54        => HPS_KEY,
        hps_io_hps_io_gpio_inst_LOANIO53        => HPS_LED,
        hps_io_hps_io_gpio_inst_GPIO40          => HPS_LTC_GPIO,
        hps_io_hps_io_gpio_inst_GPIO61          => HPS_GSENSOR_INT
      );

  end generate;

  SkipInstForSim : if cIsSimulation generate
    
    -- simulate FPGA reset signal
    h2f_reset_n <= cResetActive     after 0 ns,
                   not cResetActive after gSimulationResetDeassertAfter;

    -- simulate HPS LOAN I/O inputs
    h2f_loan_io_in(LOAN_IO_UART_TX) <= HPS_UART_TX;
    h2f_loan_io_in(LOAN_IO_UART_RX) <= HPS_UART_RX;
    h2f_loan_io_in(LOAN_IO_KEY)     <= HPS_KEY;
    h2f_loan_io_in(LOAN_IO_LED)     <= HPS_LED;
    
    -- simulate HPS LOAN I/O outputs
    HPS_UART_TX <= h2f_loan_io_out(LOAN_IO_UART_TX) when h2f_loan_io_oe(LOAN_IO_UART_TX) = cActivated else 'Z';
    HPS_UART_RX <= h2f_loan_io_out(LOAN_IO_UART_RX) when h2f_loan_io_oe(LOAN_IO_UART_RX) = cActivated else 'Z';
    HPS_KEY     <= h2f_loan_io_out(LOAN_IO_KEY) when h2f_loan_io_oe(LOAN_IO_KEY) = cActivated else 'Z';
    HPS_LED     <= h2f_loan_io_out(LOAN_IO_LED) when h2f_loan_io_oe(LOAN_IO_LED) = cActivated else 'Z';

    -- simulate HPS UART peripherals as simple loop-back
    hps_uart0_txd <= hps_uart0_rxd;
    
    -- for simulation: other interfaces are not part of this simulation model
    HPS_DDR3_ADDR    <= (others => 'X');
    HPS_DDR3_BA      <= (others => 'X');
    HPS_DDR3_CK_P    <= 'X';
    HPS_DDR3_CK_N    <= 'X';
    HPS_DDR3_CKE     <= 'X';
    HPS_DDR3_CS_N    <= 'X';
    HPS_DDR3_RAS_N   <= 'X';
    HPS_DDR3_CAS_N   <= 'X';
    HPS_DDR3_WE_N    <= 'X';
    HPS_DDR3_RESET_N <= 'X';
    HPS_DDR3_DQ      <= (others => 'X');
    HPS_DDR3_DQS_P   <= (others => 'X');
    HPS_DDR3_DQS_N   <= (others => 'X');
    HPS_DDR3_ODT     <= 'X';
    HPS_DDR3_DM      <= (others => 'X');
    HPS_ENET_GTX_CLK <= 'X';
    HPS_ENET_MDC     <= 'X';
    HPS_ENET_MDIO    <= 'X';
    HPS_ENET_TX_DATA <= (others => 'X');
    HPS_ENET_TX_EN   <= 'X';
    HPS_ENET_INT_N   <= 'X';
    HPS_FLASH_DATA   <= (others => 'X');
    HPS_FLASH_DCLK   <= 'X';
    HPS_FLASH_NCSO   <= 'X';
    HPS_I2C_CONTROL     <= cInactivated;
    HPS_I2C1_SCLK    <= 'X';
    HPS_I2C1_SDAT    <= 'X';
    HPS_I2C2_SCLK    <= 'X';
    HPS_I2C2_SDAT    <= 'X';
    HPS_SD_CMD       <= 'X';
    HPS_SD_CLK       <= 'X';
    HPS_SD_DATA      <= (others => 'X');
    HPS_USB_DATA     <= (others => 'X');
    HPS_USB_STP      <= 'X';
    HPS_CONV_USB_N   <= 'X';
    HPS_SPIM_CLK     <= 'X';
    HPS_SPIM_MOSI    <= 'X';
    HPS_SPIM_SS      <= 'X';
    HPS_LTC_GPIO     <= 'X';
    HPS_GSENSOR_INT  <= 'X';
    
  end generate;
  
end architecture Inst;
