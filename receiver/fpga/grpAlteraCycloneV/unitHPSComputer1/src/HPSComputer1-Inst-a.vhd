--------------------------------------------------------------------------------
-- Title       : HPS instantiation helper
-- Project     : FPGA Based Digital Signal Processing
--               FH OÖ Hagenberg/HSD, SCD5
--------------------------------------------------------------------------------
-- RevCtrl     : $Id: HPSComputer1-Inst-a.vhd 755 2017-12-10 22:43:13Z mroland $
-- Authors     : Michael Roland, Hagenberg/Austria, Copyright (c) 2016-2017
--------------------------------------------------------------------------------
-- Description : 
--------------------------------------------------------------------------------

architecture Inst of HPSComputer1 is

  constant cIsSimulation : boolean := false
    --pragma synthesis_off
                                      or true
    --pragma synthesis_on
    ;

  component Computer_System is
		port (
			fpga_reset_reset_n               : out   std_logic;                                        -- reset_n
			h2f_loan_io_in                   : out   std_logic_vector(66 downto 0);                    -- in
			h2f_loan_io_out                  : in    std_logic_vector(66 downto 0) := (others => 'X'); -- out
			h2f_loan_io_oe                   : in    std_logic_vector(66 downto 0) := (others => 'X'); -- oe
			hps_io_hps_io_emac1_inst_TX_CLK  : out   std_logic;                                        -- hps_io_emac1_inst_TX_CLK
			hps_io_hps_io_emac1_inst_TXD0    : out   std_logic;                                        -- hps_io_emac1_inst_TXD0
			hps_io_hps_io_emac1_inst_TXD1    : out   std_logic;                                        -- hps_io_emac1_inst_TXD1
			hps_io_hps_io_emac1_inst_TXD2    : out   std_logic;                                        -- hps_io_emac1_inst_TXD2
			hps_io_hps_io_emac1_inst_TXD3    : out   std_logic;                                        -- hps_io_emac1_inst_TXD3
			hps_io_hps_io_emac1_inst_RXD0    : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD0
			hps_io_hps_io_emac1_inst_MDIO    : inout std_logic                     := 'X';             -- hps_io_emac1_inst_MDIO
			hps_io_hps_io_emac1_inst_MDC     : out   std_logic;                                        -- hps_io_emac1_inst_MDC
			hps_io_hps_io_emac1_inst_RX_CTL  : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CTL
			hps_io_hps_io_emac1_inst_TX_CTL  : out   std_logic;                                        -- hps_io_emac1_inst_TX_CTL
			hps_io_hps_io_emac1_inst_RX_CLK  : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CLK
			hps_io_hps_io_emac1_inst_RXD1    : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD1
			hps_io_hps_io_emac1_inst_RXD2    : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD2
			hps_io_hps_io_emac1_inst_RXD3    : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD3
			hps_io_hps_io_qspi_inst_IO0      : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO0
			hps_io_hps_io_qspi_inst_IO1      : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO1
			hps_io_hps_io_qspi_inst_IO2      : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO2
			hps_io_hps_io_qspi_inst_IO3      : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO3
			hps_io_hps_io_qspi_inst_SS0      : out   std_logic;                                        -- hps_io_qspi_inst_SS0
			hps_io_hps_io_qspi_inst_CLK      : out   std_logic;                                        -- hps_io_qspi_inst_CLK
			hps_io_hps_io_sdio_inst_CMD      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_CMD
			hps_io_hps_io_sdio_inst_D0       : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D0
			hps_io_hps_io_sdio_inst_D1       : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D1
			hps_io_hps_io_sdio_inst_CLK      : out   std_logic;                                        -- hps_io_sdio_inst_CLK
			hps_io_hps_io_sdio_inst_D2       : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D2
			hps_io_hps_io_sdio_inst_D3       : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D3
			hps_io_hps_io_usb1_inst_D0       : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D0
			hps_io_hps_io_usb1_inst_D1       : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D1
			hps_io_hps_io_usb1_inst_D2       : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D2
			hps_io_hps_io_usb1_inst_D3       : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D3
			hps_io_hps_io_usb1_inst_D4       : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D4
			hps_io_hps_io_usb1_inst_D5       : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D5
			hps_io_hps_io_usb1_inst_D6       : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D6
			hps_io_hps_io_usb1_inst_D7       : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D7
			hps_io_hps_io_usb1_inst_CLK      : in    std_logic                     := 'X';             -- hps_io_usb1_inst_CLK
			hps_io_hps_io_usb1_inst_STP      : out   std_logic;                                        -- hps_io_usb1_inst_STP
			hps_io_hps_io_usb1_inst_DIR      : in    std_logic                     := 'X';             -- hps_io_usb1_inst_DIR
			hps_io_hps_io_usb1_inst_NXT      : in    std_logic                     := 'X';             -- hps_io_usb1_inst_NXT
			hps_io_hps_io_spim1_inst_CLK     : out   std_logic;                                        -- hps_io_spim1_inst_CLK
			hps_io_hps_io_spim1_inst_MOSI    : out   std_logic;                                        -- hps_io_spim1_inst_MOSI
			hps_io_hps_io_spim1_inst_MISO    : in    std_logic                     := 'X';             -- hps_io_spim1_inst_MISO
			hps_io_hps_io_spim1_inst_SS0     : out   std_logic;                                        -- hps_io_spim1_inst_SS0
			hps_io_hps_io_uart0_inst_RX      : in    std_logic                     := 'X';             -- hps_io_uart0_inst_RX
			hps_io_hps_io_uart0_inst_TX      : out   std_logic;                                        -- hps_io_uart0_inst_TX
			hps_io_hps_io_i2c0_inst_SDA      : inout std_logic                     := 'X';             -- hps_io_i2c0_inst_SDA
			hps_io_hps_io_i2c0_inst_SCL      : inout std_logic                     := 'X';             -- hps_io_i2c0_inst_SCL
			hps_io_hps_io_i2c1_inst_SDA      : inout std_logic                     := 'X';             -- hps_io_i2c1_inst_SDA
			hps_io_hps_io_i2c1_inst_SCL      : inout std_logic                     := 'X';             -- hps_io_i2c1_inst_SCL
			hps_io_hps_io_gpio_inst_GPIO09   : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO09
			hps_io_hps_io_gpio_inst_GPIO35   : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO35
			hps_io_hps_io_gpio_inst_GPIO40   : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO40
			hps_io_hps_io_gpio_inst_GPIO48   : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO48
			hps_io_hps_io_gpio_inst_GPIO61   : inout std_logic                     := 'X';             -- hps_io_gpio_inst_GPIO61
			hps_io_hps_io_gpio_inst_LOANIO53 : inout std_logic                     := 'X';             -- hps_io_gpio_inst_LOANIO53
			hps_io_hps_io_gpio_inst_LOANIO54 : inout std_logic                     := 'X';             -- hps_io_gpio_inst_LOANIO54
			hps_uart1_cts                    : in    std_logic                     := 'X';             -- cts
			hps_uart1_dsr                    : in    std_logic                     := 'X';             -- dsr
			hps_uart1_dcd                    : in    std_logic                     := 'X';             -- dcd
			hps_uart1_ri                     : in    std_logic                     := 'X';             -- ri
			hps_uart1_dtr                    : out   std_logic;                                        -- dtr
			hps_uart1_rts                    : out   std_logic;                                        -- rts
			hps_uart1_out1_n                 : out   std_logic;                                        -- out1_n
			hps_uart1_out2_n                 : out   std_logic;                                        -- out2_n
			hps_uart1_rxd                    : in    std_logic                     := 'X';             -- rxd
			hps_uart1_txd                    : out   std_logic;                                        -- txd
			memory_mem_a                     : out   std_logic_vector(14 downto 0);                    -- mem_a
			memory_mem_ba                    : out   std_logic_vector(2 downto 0);                     -- mem_ba
			memory_mem_ck                    : out   std_logic;                                        -- mem_ck
			memory_mem_ck_n                  : out   std_logic;                                        -- mem_ck_n
			memory_mem_cke                   : out   std_logic;                                        -- mem_cke
			memory_mem_cs_n                  : out   std_logic;                                        -- mem_cs_n
			memory_mem_ras_n                 : out   std_logic;                                        -- mem_ras_n
			memory_mem_cas_n                 : out   std_logic;                                        -- mem_cas_n
			memory_mem_we_n                  : out   std_logic;                                        -- mem_we_n
			memory_mem_reset_n               : out   std_logic;                                        -- mem_reset_n
			memory_mem_dq                    : inout std_logic_vector(31 downto 0) := (others => 'X'); -- mem_dq
			memory_mem_dqs                   : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs
			memory_mem_dqs_n                 : inout std_logic_vector(3 downto 0)  := (others => 'X'); -- mem_dqs_n
			memory_mem_odt                   : out   std_logic;                                        -- mem_odt
			memory_mem_dm                    : out   std_logic_vector(3 downto 0);                     -- mem_dm
			memory_oct_rzqin                 : in    std_logic                     := 'X';             -- oct_rzqin
			seven_seg_0_output               : out   std_logic_vector(6 downto 0);                     -- output
			seven_seg_1_output               : out   std_logic_vector(6 downto 0);                     -- output
			system_clk_clk                   : in    std_logic                     := 'X';             -- clk
			system_reset_reset               : in    std_logic                     := 'X';             -- reset
			modem_tx_channel_output          : out   std_logic_vector(3 downto 0);                     -- output
			modem_rx_channel_output          : out   std_logic_vector(3 downto 0)                      -- output
		);
	end component Computer_System;

  type aHexDigits is array (natural range <>) of std_ulogic_vector(6 downto 0);
  constant cHexDigits : aHexDigits := (
          --   +--0--+
          --   |     |
          --   5     1
          --   |     |
          --   +--6--+
          --   |     |
          --   4     2
          --   |     |
          --   +--3--+
          0 => "1000000",  -- 0
          1 => "1111001",  -- 1
          2 => "0100100",  -- 2
          3 => "0110000",  -- 3
          4 => "0011001",  -- 4
          5 => "0010010",  -- 5
          6 => "0000010",  -- 6
          7 => "1111000",  -- 7
          8 => "0000000",  -- 8
          9 => "0011000",  -- 9
         10 => "0001000",  -- A
         11 => "0000011",  -- b
         12 => "1000110",  -- C
         13 => "0100001",  -- d
         14 => "0000110",  -- E
         15 => "0001110"); -- F
  
  -- loan I/O indices
  constant LOAN_IO_LED         : natural := 53;
  constant LOAN_IO_KEY         : natural := 54;
  
  -- component ports
  signal system_reset          : std_ulogic;
  signal h2f_reset_n           : std_ulogic;
  signal h2f_loan_io_in        : std_logic_vector(66 downto 0);
  signal h2f_loan_io_out       : std_logic_vector(66 downto 0);
  signal h2f_loan_io_oe        : std_logic_vector(66 downto 0);
  signal hps_uart1_txd         : std_ulogic;
  signal hps_uart1_rxd         : std_ulogic;
  
  signal seven_seg_0           : std_logic_vector(6 downto 0);
  signal seven_seg_1           : std_logic_vector(6 downto 0);
  signal modem_tx_channel_vec  : std_logic_vector(3 downto 0);
  signal modem_rx_channel_vec  : std_logic_vector(3 downto 0);
  signal modem_tx_channel_num  : unsigned(3 downto 0);
  signal modem_rx_channel_num  : unsigned(3 downto 0);
      
  -- configuration indicator
  signal hps_key_input_async   : std_ulogic;
  signal hps_key_input         : std_ulogic;
  signal hps_led_output        : std_ulogic;
  signal frequency1            : std_ulogic;
  signal frequency2            : std_ulogic;
  
begin  -- architecture Inst
  
  system_reset <= cInactivated;
  FPGA_RESET_N <= h2f_reset_n;
  
  -- HPS UART1 <-> FPGA
  hps_uart1_rxd <= FPGA_UART_TX;
  FPGA_UART_RX  <= hps_uart1_txd;
  
  -- Modem Channel Selection Controller
  modem_tx_channel_num <= unsigned(modem_tx_channel_vec(modem_tx_channel_num'range));
  MODEM_TX_CHANNEL <= modem_tx_channel_num;
  MODEM_TX_7SEG    <= cHexDigits(to_integer(modem_tx_channel_num));
  modem_rx_channel_num <= unsigned(modem_rx_channel_vec(modem_rx_channel_num'range));
  MODEM_RX_CHANNEL <= modem_rx_channel_num;
  MODEM_RX_7SEG    <= cHexDigits(to_integer(modem_rx_channel_num));
  
  -- 7-Segment Hex Digit Controller
  SEVEN_SEGMENT_0 <= std_ulogic_vector(seven_seg_0);
  SEVEN_SEGMENT_1 <= std_ulogic_vector(seven_seg_1);
  
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

        -- HPS LOAN I/O CONTROL
        h2f_loan_io_in                          => h2f_loan_io_in,
        h2f_loan_io_out                         => h2f_loan_io_out,
        h2f_loan_io_oe                          => h2f_loan_io_oe,
        
        -- HPS UART0
        --hps_uart0_cts                           => cActivated,
        --hps_uart0_dsr                           => cActivated,
        --hps_uart0_dcd                           => cInactivated,
        --hps_uart0_ri                            => cInactivated,
        --hps_uart0_dtr                           => open,
        --hps_uart0_rts                           => open,
        --hps_uart0_out1_n                        => open,
        --hps_uart0_out2_n                        => open,
        --hps_uart0_rxd                           => hps_uart1_rxd,
        --hps_uart0_txd                           => hps_uart1_txd,
        
        -- HPS UART1
        hps_uart1_cts                           => cActivated,
        hps_uart1_dsr                           => cActivated,
        hps_uart1_dcd                           => cInactivated,
        hps_uart1_ri                            => cInactivated,
        hps_uart1_dtr                           => open,
        hps_uart1_rts                           => open,
        hps_uart1_out1_n                        => open,
        hps_uart1_out2_n                        => open,
        hps_uart1_rxd                           => hps_uart1_rxd,
        hps_uart1_txd                           => hps_uart1_txd,
        
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
        --hps_io_hps_io_gpio_inst_LOANIO50        => HPS_UART_TX,
        --hps_io_hps_io_gpio_inst_LOANIO49        => HPS_UART_RX,
        hps_io_hps_io_uart0_inst_RX             => HPS_UART_RX,
        hps_io_hps_io_uart0_inst_TX             => HPS_UART_TX,
        
        -- GPIO
        hps_io_hps_io_gpio_inst_LOANIO54        => HPS_KEY,
        hps_io_hps_io_gpio_inst_LOANIO53        => HPS_LED,
        hps_io_hps_io_gpio_inst_GPIO40          => HPS_LTC_GPIO,
        hps_io_hps_io_gpio_inst_GPIO61          => HPS_GSENSOR_INT,
        
        seven_seg_0_output                      => seven_seg_0,
        seven_seg_1_output                      => seven_seg_1,
        modem_tx_channel_output                 => modem_tx_channel_vec,
        modem_rx_channel_output                 => modem_rx_channel_vec
      );

  end generate;

  SkipInstForSim : if cIsSimulation generate
    
    -- simulate FPGA reset signal
    h2f_reset_n <= cResetActive     after 0 ns,
                   not cResetActive after gSimulationResetDeassertAfter;

    -- simulate HPS LOAN I/O inputs
    h2f_loan_io_in(LOAN_IO_KEY)     <= HPS_KEY;
    h2f_loan_io_in(LOAN_IO_LED)     <= HPS_LED;
    
    -- simulate HPS LOAN I/O outputs
    HPS_KEY     <= h2f_loan_io_out(LOAN_IO_KEY) when h2f_loan_io_oe(LOAN_IO_KEY) = cActivated else 'Z';
    HPS_LED     <= h2f_loan_io_out(LOAN_IO_LED) when h2f_loan_io_oe(LOAN_IO_LED) = cActivated else 'Z';

    -- simulate HPS UART peripherals as simple loop-back
    hps_uart1_txd <= hps_uart1_rxd;
    
    -- simulate modem channel selection peripherals
    modem_tx_channel_vec <= (others => '0');
    modem_rx_channel_vec <= (others => '0');
    
    -- simulate 7-segment hex digit display peripherals
    seven_seg_0 <= (others => '0');
    seven_seg_1 <= (others => '0');
    
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
