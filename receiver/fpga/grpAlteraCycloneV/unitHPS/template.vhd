library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY template IS

    PORT(
        ---------FPGA Connections-------------
        CLOCK_50    : in std_logic;
        SW          : in std_logic_vector(9 downto 0);
        LEDR        : out std_logic_vector(9 downto 0);
        KEY      : in  std_logic_vector(3 downto 0);


        -- //////////// SEG7 //////////
        HEX0                   : out   std_logic_vector(6 downto 0);
        HEX1                   : out   std_logic_vector(6 downto 0);
        HEX2                   : out   std_logic_vector(6 downto 0);
        HEX3                   : out   std_logic_vector(6 downto 0);
        HEX4                   : out   std_logic_vector(6 downto 0);
        HEX5                   : out   std_logic_vector(6 downto 0);


        ---------HPS Connections---------------
        HPS_CONV_USB_N          : inout std_logic;
        HPS_DDR3_ADDR           : out std_logic_vector(14 downto 0);
        HPS_DDR3_BA             : out std_logic_vector(2 downto 0);
        HPS_DDR3_CAS_N          : out std_logic;
        HPS_DDR3_CKE            : out std_logic;
        HPS_DDR3_CK_N           : out std_logic;
        HPS_DDR3_CK_P           : out std_logic;
        HPS_DDR3_CS_N           : out std_logic;
        HPS_DDR3_DM             : out std_logic_vector(3 downto 0);
        HPS_DDR3_DQ             : inout std_logic_vector(31 downto 0);
        HPS_DDR3_DQS_N          : inout std_logic_vector(3 downto 0);
        HPS_DDR3_DQS_P          : inout std_logic_vector(3 downto 0);
        HPS_DDR3_ODT            : out std_logic;
        HPS_DDR3_RAS_N          : out std_logic;
        HPS_DDR3_RESET_N        : out std_logic;
        HPS_DDR3_RZQ            : in  std_logic;
        HPS_DDR3_WE_N           : out std_logic;
        
        HPS_ENET_GTX_CLK        : out std_logic;
        HPS_ENET_INT_N          : inout std_logic;
        HPS_ENET_MDC            : out std_logic;
        HPS_ENET_MDIO           : inout std_logic;
        HPS_ENET_RX_CLK         : in std_logic;
        HPS_ENET_RX_DATA        : in std_logic_vector(3 downto 0);
        HPS_ENET_RX_DV          : in std_logic;
        HPS_ENET_TX_DATA        : out std_logic_vector(3 downto 0);
        HPS_ENET_TX_EN          : out std_logic;
        
        HPS_KEY                 : inout std_logic;
        HPS_LED                 : inout std_logic;      
        
        HPS_SD_CLK              : out std_logic;
        HPS_SD_CMD              : inout std_logic;
        HPS_SD_DATA             : inout std_logic_vector(3 downto 0);
        
        HPS_UART_RX             : in std_logic;
        HPS_UART_TX             : out std_logic;
        
        HPS_USB_CLKOUT          : in std_logic;
        HPS_USB_DATA            : inout std_logic_vector(7 downto 0);
        HPS_USB_DIR             : in std_logic;
        HPS_USB_NXT             : in std_logic;
        HPS_USB_STP             : out std_logic;
        
        HPS_I2C1_SCLK           : inout std_logic;
        HPS_I2C1_SDAT           : inout std_logic;
        HPS_I2C2_SCLK           : inout std_logic;
        HPS_I2C2_SDAT           : inout std_logic;
        HPS_I2C_CONTROL         : inout std_logic;
        
        HPS_LTC_GPIO            : inout std_logic;
        HPS_GSENSOR_INT         : inout std_logic;

        HPS_SPIM_CLK            : out std_logic;
        HPS_SPIM_MISO           : in std_logic;
        HPS_SPIM_MOSI           : out std_logic;
        HPS_SPIM_SS             : inout std_logic;

        -- Audio codec
        FPGA_I2C_SCLK           : out   std_ulogic;
        FPGA_I2C_SDAT           : inout std_logic;
        AUD_XCK                 : out std_ulogic;
        AUD_BCLK                : out std_ulogic;
        AUD_ADCDAT              : in  std_ulogic;
        AUD_DACDAT              : out std_ulogic;
        AUD_ADCLRCK             : out std_ulogic;
        AUD_DACLRCK             : out std_ulogic;
        
        --////////// GPIO, GPIO connect to RFS - RF and Sensor //////////
        --BT_KEY            : inout     std_logic;          
        --BT_UART_RX            : in        std_logic;
        --BT_UART_TX            : out       std_logic;

        -- from SSL
        LSENSOR_INT             : in        std_logic;
        LSENSOR_SCL             : inout     std_logic;
        LSENSOR_SDA             : inout     std_logic;
        MPU_AD0_SDO             : in        std_logic;
        MPU_CS_n                : inout     std_logic;
        MPU_FSYNC               : out       std_logic;
        MPU_INT                 : in        std_logic;
        MPU_SCL_SCLK            : inout     std_logic;
        MPU_SDA_SDI             : inout     std_logic;
        RH_TEMP_DRDY_n          : in        std_ulogic;
        RH_TEMP_I2C_SCL         : inout     std_logic;
        RH_TEMP_I2C_SDA         : inout     std_logic;
        TMD_D                   : out   std_logic_vector(7 downto 0)

        --UART2USB_CTS      : in        std_logic;
        --UART2USB_RTS      : out       std_logic;
        --UART2USB_RX           : in        std_logic;
        --UART2USB_TX           : out       std_logic;
        --WIFI_EN           : out       std_logic;
        --WIFI_RST_n            : out       std_logic;
        --WIFI_UART0_CTS        : in        std_logic;
        --WIFI_UART0_RTS        : out       std_logic;
        --WIFI_UART0_RX     : in        std_logic;
        --WIFI_UART0_TX     : out       std_logic;
        --WIFI_UART1_RX     : in        std_logic

    );

END ENTITY;

ARCHITECTURE MAIN OF template IS

    component HPSPlatform is
        port (
            clk_clk                                             : in    std_logic                     := 'X';             -- clk
            drs_receiver_interface_0_ibytedetected_1_ibytedetected          : in    std_logic                     := 'X';             -- ibytedetected
            drs_receiver_interface_0_ibytedetected_1_obytedetectedack       : out   std_logic;                                        -- obytedetectedack
            drs_receiver_interface_0_ibytedetected_1_obytedetected_int_cond : out   std_logic;       
            h2f_reset_reset_n                                   : out   std_logic;                                        -- reset_n
            hps_0_f2h_cold_reset_req_reset_n                    : in    std_logic                     := 'X';             -- reset_n
            hps_0_f2h_debug_reset_req_reset_n                   : in    std_logic                     := 'X';             -- reset_n
            hps_0_f2h_stm_hw_events_stm_hwevents                : in    std_logic_vector(27 downto 0) := (others => 'X'); -- stm_hwevents
            hps_0_f2h_warm_reset_req_reset_n                    : in    std_logic                     := 'X';             -- reset_n
            hps_io_hps_io_emac1_inst_TX_CLK                     : out   std_logic;                                        -- hps_io_emac1_inst_TX_CLK
            hps_io_hps_io_emac1_inst_TXD0                       : out   std_logic;                                        -- hps_io_emac1_inst_TXD0
            hps_io_hps_io_emac1_inst_TXD1                       : out   std_logic;                                        -- hps_io_emac1_inst_TXD1
            hps_io_hps_io_emac1_inst_TXD2                       : out   std_logic;                                        -- hps_io_emac1_inst_TXD2
            hps_io_hps_io_emac1_inst_TXD3                       : out   std_logic;                                        -- hps_io_emac1_inst_TXD3
            hps_io_hps_io_emac1_inst_RXD0                       : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD0
            hps_io_hps_io_emac1_inst_MDIO                       : inout std_logic                     := 'X';             -- hps_io_emac1_inst_MDIO
            hps_io_hps_io_emac1_inst_MDC                        : out   std_logic;                                        -- hps_io_emac1_inst_MDC
            hps_io_hps_io_emac1_inst_RX_CTL                     : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CTL
            hps_io_hps_io_emac1_inst_TX_CTL                     : out   std_logic;                                        -- hps_io_emac1_inst_TX_CTL
            hps_io_hps_io_emac1_inst_RX_CLK                     : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CLK
            hps_io_hps_io_emac1_inst_RXD1                       : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD1
            hps_io_hps_io_emac1_inst_RXD2                       : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD2
            hps_io_hps_io_emac1_inst_RXD3                       : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD3
            hps_io_hps_io_sdio_inst_CMD                         : inout std_logic                     := 'X';             -- hps_io_sdio_inst_CMD
            hps_io_hps_io_sdio_inst_D0                          : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D0
            hps_io_hps_io_sdio_inst_D1                          : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D1
            hps_io_hps_io_sdio_inst_CLK                         : out   std_logic;                                        -- hps_io_sdio_inst_CLK
            hps_io_hps_io_sdio_inst_D2                          : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D2
            hps_io_hps_io_sdio_inst_D3                          : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D3
            hps_io_hps_io_usb1_inst_D0                          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D0
            hps_io_hps_io_usb1_inst_D1                          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D1
            hps_io_hps_io_usb1_inst_D2                          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D2
            hps_io_hps_io_usb1_inst_D3                          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D3
            hps_io_hps_io_usb1_inst_D4                          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D4
            hps_io_hps_io_usb1_inst_D5                          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D5
            hps_io_hps_io_usb1_inst_D6                          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D6
            hps_io_hps_io_usb1_inst_D7                          : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D7
            hps_io_hps_io_usb1_inst_CLK                         : in    std_logic                     := 'X';             -- hps_io_usb1_inst_CLK
            hps_io_hps_io_usb1_inst_STP                         : out   std_logic;                                        -- hps_io_usb1_inst_STP
            hps_io_hps_io_usb1_inst_DIR                         : in    std_logic                     := 'X';             -- hps_io_usb1_inst_DIR
            hps_io_hps_io_usb1_inst_NXT                         : in    std_logic                     := 'X';             -- hps_io_usb1_inst_NXT
            hps_io_hps_io_spim1_inst_CLK                        : out   std_logic;                                        -- hps_io_spim1_inst_CLK
            hps_io_hps_io_spim1_inst_MOSI                       : out   std_logic;                                        -- hps_io_spim1_inst_MOSI
            hps_io_hps_io_spim1_inst_MISO                       : in    std_logic                     := 'X';             -- hps_io_spim1_inst_MISO
            hps_io_hps_io_spim1_inst_SS0                        : out   std_logic;                                        -- hps_io_spim1_inst_SS0
            hps_io_hps_io_uart0_inst_RX                         : in    std_logic                     := 'X';             -- hps_io_uart0_inst_RX
            hps_io_hps_io_uart0_inst_TX                         : out   std_logic;                                        -- hps_io_uart0_inst_TX
            hps_io_hps_io_i2c0_inst_SDA                         : inout std_logic                     := 'X';             -- hps_io_i2c0_inst_SDA
            hps_io_hps_io_i2c0_inst_SCL                         : inout std_logic                     := 'X';             -- hps_io_i2c0_inst_SCL
            hps_io_hps_io_i2c1_inst_SDA                         : inout std_logic                     := 'X';             -- hps_io_i2c1_inst_SDA
            hps_io_hps_io_i2c1_inst_SCL                         : inout std_logic                     := 'X';             -- hps_io_i2c1_inst_SCL
            hps_io_hps_io_gpio_inst_GPIO09                      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO09
            hps_io_hps_io_gpio_inst_GPIO35                      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO35
            hps_io_hps_io_gpio_inst_GPIO40                      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO40
            hps_io_hps_io_gpio_inst_GPIO48                      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO48
            hps_io_hps_io_gpio_inst_GPIO53                      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO53
            hps_io_hps_io_gpio_inst_GPIO54                      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO54
            hps_io_hps_io_gpio_inst_GPIO61                      : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO61
            memory_mem_a                                        : out   std_logic_vector(14 downto 0);                    -- mem_a
            memory_mem_ba                                       : out   std_logic_vector(2 downto 0);                     -- mem_ba
            memory_mem_ck                                       : out   std_logic;                                        -- mem_ck
            memory_mem_ck_n                                     : out   std_logic;                                        -- mem_ck_n
            memory_mem_cke                                      : out   std_logic;                                        -- mem_cke
            memory_mem_cs_n                                     : out   std_logic;                                        -- mem_cs_n
            memory_mem_ras_n                                    : out   std_logic;                                        -- mem_ras_n
            memory_mem_cas_n                                    : out   std_logic;                                        -- mem_cas_n
            memory_mem_we_n                                     : out   std_logic;                                        -- mem_we_n
            memory_mem_reset_n                                  : out   std_logic;                                        -- mem_reset_n
            memory_mem_dq                                       : inout std_logic_vector(31 downto 0) := (others => 'X'); -- mem_dq
            memory_mem_dqs                                      : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs
            memory_mem_dqs_n                                    : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_n
            memory_mem_odt                                      : out   std_logic;                                        -- mem_odt
            memory_mem_dm                                       : out   std_logic_vector(3 downto 0);                     -- mem_dm
            memory_oct_rzqin                                    : in    std_logic                     := 'X';             -- oct_rzqin
            reset_reset_n                                       : in    std_logic                     := 'X';             -- reset_n
            drs_receiver_interface_0_otimestampcounter_otimestampcounter : out   std_logic_vector(63 downto 0);           -- otimestampcounter
            drs_receiver_interface_0_otimestampcapture_otimestampcapture : out   std_logic_vector(63 downto 0)            -- otimestampcapture
        );
    end component HPSPlatform;

    constant        hps_cold_reset  : std_logic := '0';
    constant        hps_warm_reset  : std_logic := '0';
    constant        hps_debug_reset : std_logic := '0';
    
    signal HPS_H2F_RST : std_logic;

    signal stm_hw_events : std_logic_vector(27 downto 0);

    signal ByteDetected : std_ulogic := '0';

    signal ByteDetectedAck : std_ulogic := '0';
    signal ByteDetectedInt : std_ulogic := '0';

    signal TimeStampCapture : std_logic_vector(63 downto 0) := (others => '0');
    signal TimeStampCounter : std_logic_vector(63 downto 0) := (others => '0');

    signal LedOutput : std_logic_vector(9 downto 0) := (others => '0');

BEGIN

    u0 : component HPSPlatform
        port map (
            clk_clk                                             => CLOCK_50,                                             --                                    clk.clk
            drs_receiver_interface_0_ibytedetected_1_ibytedetected          => ByteDetected,          --   drs_receiver_interface_0_ibytedetected_1.ibytedetected
            drs_receiver_interface_0_ibytedetected_1_obytedetectedack       => ByteDetectedAck,       --                                           .obytedetectedack
            drs_receiver_interface_0_ibytedetected_1_obytedetected_int_cond => ByteDetectedInt,
            h2f_reset_reset_n                                   => HPS_H2F_RST,                                   --                              h2f_reset.reset_n
            hps_0_f2h_cold_reset_req_reset_n     => not(hps_cold_reset),     --     hps_0_f2h_cold_reset_req.reset_n
            hps_0_f2h_debug_reset_req_reset_n    => not(hps_debug_reset),    --    hps_0_f2h_debug_reset_req.reset_n
            hps_0_f2h_stm_hw_events_stm_hwevents => stm_hw_events, --      hps_0_f2h_stm_hw_events.stm_hwevents
            hps_0_f2h_warm_reset_req_reset_n     => not(hps_warm_reset),     --     hps_0_f2h_warm_reset_req.reset_n
            hps_io_hps_io_emac1_inst_TX_CLK => HPS_ENET_GTX_CLK, --                  hps_io.hps_io_emac1_inst_TX_CLK
            hps_io_hps_io_emac1_inst_TXD0   => HPS_ENET_TX_DATA(0),   --                        .hps_io_emac1_inst_TXD0
            hps_io_hps_io_emac1_inst_TXD1   => HPS_ENET_TX_DATA(1),   --                        .hps_io_emac1_inst_TXD1
            hps_io_hps_io_emac1_inst_TXD2   => HPS_ENET_TX_DATA(2),   --                        .hps_io_emac1_inst_TXD2
            hps_io_hps_io_emac1_inst_TXD3   => HPS_ENET_TX_DATA(3),   --                        .hps_io_emac1_inst_TXD3
            hps_io_hps_io_emac1_inst_RXD0   => HPS_ENET_RX_DATA(0),   --                        .hps_io_emac1_inst_RXD0
            hps_io_hps_io_emac1_inst_MDIO   => HPS_ENET_MDIO,   --                        .hps_io_emac1_inst_MDIO
            hps_io_hps_io_emac1_inst_MDC    => HPS_ENET_MDC,    --                        .hps_io_emac1_inst_MDC
            hps_io_hps_io_emac1_inst_RX_CTL => HPS_ENET_RX_DV, --                        .hps_io_emac1_inst_RX_CTL
            hps_io_hps_io_emac1_inst_TX_CTL => HPS_ENET_TX_EN, --                        .hps_io_emac1_inst_TX_CTL
            hps_io_hps_io_emac1_inst_RX_CLK => HPS_ENET_RX_CLK, --                        .hps_io_emac1_inst_RX_CLK
            hps_io_hps_io_emac1_inst_RXD1   => HPS_ENET_RX_DATA(1),   --                        .hps_io_emac1_inst_RXD1
            hps_io_hps_io_emac1_inst_RXD2   => HPS_ENET_RX_DATA(2),   --                        .hps_io_emac1_inst_RXD2
            hps_io_hps_io_emac1_inst_RXD3   => HPS_ENET_RX_DATA(3),   --                        .hps_io_emac1_inst_RXD3
            hps_io_hps_io_sdio_inst_CMD     => HPS_SD_CMD,     --                        .hps_io_sdio_inst_CMD
            hps_io_hps_io_sdio_inst_D0      => HPS_SD_DATA(0),      --                        .hps_io_sdio_inst_D0
            hps_io_hps_io_sdio_inst_D1      => HPS_SD_DATA(1),      --                        .hps_io_sdio_inst_D1
            hps_io_hps_io_sdio_inst_CLK     => HPS_SD_CLK,     --                        .hps_io_sdio_inst_CLK
            hps_io_hps_io_sdio_inst_D2      => HPS_SD_DATA(2),      --                        .hps_io_sdio_inst_D2
            hps_io_hps_io_sdio_inst_D3      => HPS_SD_DATA(3),      --                        .hps_io_sdio_inst_D3
            hps_io_hps_io_usb1_inst_D0      => HPS_USB_DATA(0),      --                        .hps_io_usb1_inst_D0
            hps_io_hps_io_usb1_inst_D1      => HPS_USB_DATA(1),      --                        .hps_io_usb1_inst_D1
            hps_io_hps_io_usb1_inst_D2      => HPS_USB_DATA(2),      --                        .hps_io_usb1_inst_D2
            hps_io_hps_io_usb1_inst_D3      => HPS_USB_DATA(3),      --                        .hps_io_usb1_inst_D3
            hps_io_hps_io_usb1_inst_D4      => HPS_USB_DATA(4),      --                        .hps_io_usb1_inst_D4
            hps_io_hps_io_usb1_inst_D5      => HPS_USB_DATA(5),      --                        .hps_io_usb1_inst_D5
            hps_io_hps_io_usb1_inst_D6      => HPS_USB_DATA(6),      --                        .hps_io_usb1_inst_D6
            hps_io_hps_io_usb1_inst_D7      => HPS_USB_DATA(7),      --                        .hps_io_usb1_inst_D7
            hps_io_hps_io_usb1_inst_CLK     => HPS_USB_CLKOUT,     --                        .hps_io_usb1_inst_CLK
            hps_io_hps_io_usb1_inst_STP     => HPS_USB_STP,     --                        .hps_io_usb1_inst_STP
            hps_io_hps_io_usb1_inst_DIR     => HPS_USB_DIR,     --                        .hps_io_usb1_inst_DIR
            hps_io_hps_io_usb1_inst_NXT     => HPS_USB_NXT,     --                        .hps_io_usb1_inst_NXT
            hps_io_hps_io_spim1_inst_CLK    => HPS_SPIM_CLK,         --                             .hps_io_spim1_inst_CLK
            hps_io_hps_io_spim1_inst_MOSI   => HPS_SPIM_MOSI,        --                             .hps_io_spim1_inst_MOSI
            hps_io_hps_io_spim1_inst_MISO   => HPS_SPIM_MISO,        --                             .hps_io_spim1_inst_MISO
            hps_io_hps_io_spim1_inst_SS0    => HPS_SPIM_SS,         --                             .hps_io_spim1_inst_SS0
            hps_io_hps_io_uart0_inst_RX     => HPS_UART_RX,     --                        .hps_io_uart0_inst_RX
            hps_io_hps_io_uart0_inst_TX     => HPS_UART_TX,      --                        .hps_io_uart0_inst_TX
            hps_io_hps_io_i2c0_inst_SDA          => HPS_I2C1_SDAT,          --                             .hps_io_i2c0_inst_SDA
            hps_io_hps_io_i2c0_inst_SCL          => HPS_I2C1_SCLK,          --                             .hps_io_i2c0_inst_SCL
            hps_io_hps_io_i2c1_inst_SDA          => HPS_I2C2_SDAT,          --                             .hps_io_i2c1_inst_SDA
            hps_io_hps_io_i2c1_inst_SCL          => HPS_I2C2_SCLK,          --                             .hps_io_i2c1_inst_SCL
            hps_io_hps_io_gpio_inst_GPIO09  => HPS_CONV_USB_N,            -- hps_io_gpio_inst_GPIO09
            hps_io_hps_io_gpio_inst_GPIO35       => HPS_ENET_INT_N,       --                             .hps_io_gpio_inst_GPIO35
            hps_io_hps_io_gpio_inst_GPIO40       => HPS_LTC_GPIO,       --                             .hps_io_gpio_inst_GPIO40
            hps_io_hps_io_gpio_inst_GPIO48       => HPS_I2C_CONTROL,       --                             .hps_io_gpio_inst_GPIO48
            hps_io_hps_io_gpio_inst_GPIO53  => HPS_LED,         -- hps_io_gpio_inst_GPIO53
            hps_io_hps_io_gpio_inst_GPIO54  => HPS_KEY,            -- hps_io_gpio_inst_GPIO54
            hps_io_hps_io_gpio_inst_GPIO61       => HPS_GSENSOR_INT,       --                             .hps_io_gpio_inst_GPIO61_inst_GPIO61
            memory_mem_a                    => HPS_DDR3_ADDR,                    --                  memory.mem_a
            memory_mem_ba                   => HPS_DDR3_BA,                   --                        .mem_ba
            memory_mem_ck                   => HPS_DDR3_CK_P,                   --                        .mem_ck
            memory_mem_ck_n                 => HPS_DDR3_CK_N,                 --                        .mem_ck_n
            memory_mem_cke                  => HPS_DDR3_CKE,                  --                        .mem_cke
            memory_mem_cs_n                 => HPS_DDR3_CS_N,                 --                        .mem_cs_n
            memory_mem_ras_n                => HPS_DDR3_RAS_N,                --                        .mem_ras_n
            memory_mem_cas_n                => HPS_DDR3_CAS_N,                --                        .mem_cas_n
            memory_mem_we_n                 => HPS_DDR3_WE_N,                 --                        .mem_we_n
            memory_mem_reset_n              => HPS_DDR3_RESET_N,              --                        .mem_reset_n
            memory_mem_dq                   => HPS_DDR3_DQ,                   --                        .mem_dq
            memory_mem_dqs                  => HPS_DDR3_DQS_P,                  --                        .mem_dqs
            memory_mem_dqs_n                => HPS_DDR3_DQS_N,                --                        .mem_dqs_n
            memory_mem_odt                  => HPS_DDR3_ODT,                  --                        .mem_odt
            memory_mem_dm                   => HPS_DDR3_DM,                   --                        .mem_dm
            memory_oct_rzqin                => HPS_DDR3_RZQ,                --                        .oct_rzqin                        --                                       .oct_rzqin
            reset_reset_n                   => HPS_H2F_RST,                                      --                                  reset.reset_n
            drs_receiver_interface_0_otimestampcounter_otimestampcounter => TimeStampCounter, -- drs_receiver_interface_0_otimestampcounter.otimestampcounter
            drs_receiver_interface_0_otimestampcapture_otimestampcapture => TimeStampCapture  -- drs_receiver_interface_0_otimestampcapture.otimestampcapture
        );

    receiver: entity work.DrsReceiver
    port map (
        iClk            => CLOCK_50,
        inResetAsync    => HPS_H2F_RST,
        iDistanceSelect => SW(1 downto 0),
        oByteDetected   => ByteDetected,
        iByteDetectedAck => ByteDetectedAck,
        oI2cSclk        => FPGA_I2C_SCLK,
        ioI2cSdin       => FPGA_I2C_SDAT,
        oMclk           => AUD_XCK,
        oBclk           => AUD_BCLK,
        iADCdat         => AUD_ADCDAT,
        oDACdat         => AUD_DACDAT,
        oADClrc         => AUD_ADCLRCK,
        oDAClrc         => AUD_DACLRCK,
        iChannelSelect  => SW(2),
        oSegChannel     => HEX0,
        oSegDistance    => HEX1,
        oSeg0 => HEX2,
        oSeg1 => HEX3,
        oSeg2 => HEX4,
        oSeg3 => HEX5,
        iSetDetectedKey => KEY(0),
        oLed            => LedOutput
    );


    LEDR <= TimeStampCounter(9 downto 0) when SW(3) = '1' else LedOutput(9) & ByteDetectedInt & LedOutput(7 downto 0);

END ARCHITECTURE;