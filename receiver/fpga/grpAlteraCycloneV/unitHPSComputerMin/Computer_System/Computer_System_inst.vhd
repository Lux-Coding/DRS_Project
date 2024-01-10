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

	u0 : component Computer_System
		port map (
			f2h_bootflags_boot_from_fpga_ready      => CONNECTED_TO_f2h_bootflags_boot_from_fpga_ready,      -- f2h_bootflags.boot_from_fpga_ready
			f2h_bootflags_boot_from_fpga_on_failure => CONNECTED_TO_f2h_bootflags_boot_from_fpga_on_failure, --              .boot_from_fpga_on_failure
			fpga_reset_reset_n                      => CONNECTED_TO_fpga_reset_reset_n,                      --    fpga_reset.reset_n
			h2f_loan_io_in                          => CONNECTED_TO_h2f_loan_io_in,                          --   h2f_loan_io.in
			h2f_loan_io_out                         => CONNECTED_TO_h2f_loan_io_out,                         --              .out
			h2f_loan_io_oe                          => CONNECTED_TO_h2f_loan_io_oe,                          --              .oe
			hps_io_hps_io_emac1_inst_TX_CLK         => CONNECTED_TO_hps_io_hps_io_emac1_inst_TX_CLK,         --        hps_io.hps_io_emac1_inst_TX_CLK
			hps_io_hps_io_emac1_inst_TXD0           => CONNECTED_TO_hps_io_hps_io_emac1_inst_TXD0,           --              .hps_io_emac1_inst_TXD0
			hps_io_hps_io_emac1_inst_TXD1           => CONNECTED_TO_hps_io_hps_io_emac1_inst_TXD1,           --              .hps_io_emac1_inst_TXD1
			hps_io_hps_io_emac1_inst_TXD2           => CONNECTED_TO_hps_io_hps_io_emac1_inst_TXD2,           --              .hps_io_emac1_inst_TXD2
			hps_io_hps_io_emac1_inst_TXD3           => CONNECTED_TO_hps_io_hps_io_emac1_inst_TXD3,           --              .hps_io_emac1_inst_TXD3
			hps_io_hps_io_emac1_inst_RXD0           => CONNECTED_TO_hps_io_hps_io_emac1_inst_RXD0,           --              .hps_io_emac1_inst_RXD0
			hps_io_hps_io_emac1_inst_MDIO           => CONNECTED_TO_hps_io_hps_io_emac1_inst_MDIO,           --              .hps_io_emac1_inst_MDIO
			hps_io_hps_io_emac1_inst_MDC            => CONNECTED_TO_hps_io_hps_io_emac1_inst_MDC,            --              .hps_io_emac1_inst_MDC
			hps_io_hps_io_emac1_inst_RX_CTL         => CONNECTED_TO_hps_io_hps_io_emac1_inst_RX_CTL,         --              .hps_io_emac1_inst_RX_CTL
			hps_io_hps_io_emac1_inst_TX_CTL         => CONNECTED_TO_hps_io_hps_io_emac1_inst_TX_CTL,         --              .hps_io_emac1_inst_TX_CTL
			hps_io_hps_io_emac1_inst_RX_CLK         => CONNECTED_TO_hps_io_hps_io_emac1_inst_RX_CLK,         --              .hps_io_emac1_inst_RX_CLK
			hps_io_hps_io_emac1_inst_RXD1           => CONNECTED_TO_hps_io_hps_io_emac1_inst_RXD1,           --              .hps_io_emac1_inst_RXD1
			hps_io_hps_io_emac1_inst_RXD2           => CONNECTED_TO_hps_io_hps_io_emac1_inst_RXD2,           --              .hps_io_emac1_inst_RXD2
			hps_io_hps_io_emac1_inst_RXD3           => CONNECTED_TO_hps_io_hps_io_emac1_inst_RXD3,           --              .hps_io_emac1_inst_RXD3
			hps_io_hps_io_qspi_inst_IO0             => CONNECTED_TO_hps_io_hps_io_qspi_inst_IO0,             --              .hps_io_qspi_inst_IO0
			hps_io_hps_io_qspi_inst_IO1             => CONNECTED_TO_hps_io_hps_io_qspi_inst_IO1,             --              .hps_io_qspi_inst_IO1
			hps_io_hps_io_qspi_inst_IO2             => CONNECTED_TO_hps_io_hps_io_qspi_inst_IO2,             --              .hps_io_qspi_inst_IO2
			hps_io_hps_io_qspi_inst_IO3             => CONNECTED_TO_hps_io_hps_io_qspi_inst_IO3,             --              .hps_io_qspi_inst_IO3
			hps_io_hps_io_qspi_inst_SS0             => CONNECTED_TO_hps_io_hps_io_qspi_inst_SS0,             --              .hps_io_qspi_inst_SS0
			hps_io_hps_io_qspi_inst_CLK             => CONNECTED_TO_hps_io_hps_io_qspi_inst_CLK,             --              .hps_io_qspi_inst_CLK
			hps_io_hps_io_sdio_inst_CMD             => CONNECTED_TO_hps_io_hps_io_sdio_inst_CMD,             --              .hps_io_sdio_inst_CMD
			hps_io_hps_io_sdio_inst_D0              => CONNECTED_TO_hps_io_hps_io_sdio_inst_D0,              --              .hps_io_sdio_inst_D0
			hps_io_hps_io_sdio_inst_D1              => CONNECTED_TO_hps_io_hps_io_sdio_inst_D1,              --              .hps_io_sdio_inst_D1
			hps_io_hps_io_sdio_inst_CLK             => CONNECTED_TO_hps_io_hps_io_sdio_inst_CLK,             --              .hps_io_sdio_inst_CLK
			hps_io_hps_io_sdio_inst_D2              => CONNECTED_TO_hps_io_hps_io_sdio_inst_D2,              --              .hps_io_sdio_inst_D2
			hps_io_hps_io_sdio_inst_D3              => CONNECTED_TO_hps_io_hps_io_sdio_inst_D3,              --              .hps_io_sdio_inst_D3
			hps_io_hps_io_usb1_inst_D0              => CONNECTED_TO_hps_io_hps_io_usb1_inst_D0,              --              .hps_io_usb1_inst_D0
			hps_io_hps_io_usb1_inst_D1              => CONNECTED_TO_hps_io_hps_io_usb1_inst_D1,              --              .hps_io_usb1_inst_D1
			hps_io_hps_io_usb1_inst_D2              => CONNECTED_TO_hps_io_hps_io_usb1_inst_D2,              --              .hps_io_usb1_inst_D2
			hps_io_hps_io_usb1_inst_D3              => CONNECTED_TO_hps_io_hps_io_usb1_inst_D3,              --              .hps_io_usb1_inst_D3
			hps_io_hps_io_usb1_inst_D4              => CONNECTED_TO_hps_io_hps_io_usb1_inst_D4,              --              .hps_io_usb1_inst_D4
			hps_io_hps_io_usb1_inst_D5              => CONNECTED_TO_hps_io_hps_io_usb1_inst_D5,              --              .hps_io_usb1_inst_D5
			hps_io_hps_io_usb1_inst_D6              => CONNECTED_TO_hps_io_hps_io_usb1_inst_D6,              --              .hps_io_usb1_inst_D6
			hps_io_hps_io_usb1_inst_D7              => CONNECTED_TO_hps_io_hps_io_usb1_inst_D7,              --              .hps_io_usb1_inst_D7
			hps_io_hps_io_usb1_inst_CLK             => CONNECTED_TO_hps_io_hps_io_usb1_inst_CLK,             --              .hps_io_usb1_inst_CLK
			hps_io_hps_io_usb1_inst_STP             => CONNECTED_TO_hps_io_hps_io_usb1_inst_STP,             --              .hps_io_usb1_inst_STP
			hps_io_hps_io_usb1_inst_DIR             => CONNECTED_TO_hps_io_hps_io_usb1_inst_DIR,             --              .hps_io_usb1_inst_DIR
			hps_io_hps_io_usb1_inst_NXT             => CONNECTED_TO_hps_io_hps_io_usb1_inst_NXT,             --              .hps_io_usb1_inst_NXT
			hps_io_hps_io_spim1_inst_CLK            => CONNECTED_TO_hps_io_hps_io_spim1_inst_CLK,            --              .hps_io_spim1_inst_CLK
			hps_io_hps_io_spim1_inst_MOSI           => CONNECTED_TO_hps_io_hps_io_spim1_inst_MOSI,           --              .hps_io_spim1_inst_MOSI
			hps_io_hps_io_spim1_inst_MISO           => CONNECTED_TO_hps_io_hps_io_spim1_inst_MISO,           --              .hps_io_spim1_inst_MISO
			hps_io_hps_io_spim1_inst_SS0            => CONNECTED_TO_hps_io_hps_io_spim1_inst_SS0,            --              .hps_io_spim1_inst_SS0
			hps_io_hps_io_i2c0_inst_SDA             => CONNECTED_TO_hps_io_hps_io_i2c0_inst_SDA,             --              .hps_io_i2c0_inst_SDA
			hps_io_hps_io_i2c0_inst_SCL             => CONNECTED_TO_hps_io_hps_io_i2c0_inst_SCL,             --              .hps_io_i2c0_inst_SCL
			hps_io_hps_io_i2c1_inst_SDA             => CONNECTED_TO_hps_io_hps_io_i2c1_inst_SDA,             --              .hps_io_i2c1_inst_SDA
			hps_io_hps_io_i2c1_inst_SCL             => CONNECTED_TO_hps_io_hps_io_i2c1_inst_SCL,             --              .hps_io_i2c1_inst_SCL
			hps_io_hps_io_gpio_inst_GPIO09          => CONNECTED_TO_hps_io_hps_io_gpio_inst_GPIO09,          --              .hps_io_gpio_inst_GPIO09
			hps_io_hps_io_gpio_inst_GPIO35          => CONNECTED_TO_hps_io_hps_io_gpio_inst_GPIO35,          --              .hps_io_gpio_inst_GPIO35
			hps_io_hps_io_gpio_inst_GPIO40          => CONNECTED_TO_hps_io_hps_io_gpio_inst_GPIO40,          --              .hps_io_gpio_inst_GPIO40
			hps_io_hps_io_gpio_inst_GPIO48          => CONNECTED_TO_hps_io_hps_io_gpio_inst_GPIO48,          --              .hps_io_gpio_inst_GPIO48
			hps_io_hps_io_gpio_inst_GPIO61          => CONNECTED_TO_hps_io_hps_io_gpio_inst_GPIO61,          --              .hps_io_gpio_inst_GPIO61
			hps_io_hps_io_gpio_inst_LOANIO49        => CONNECTED_TO_hps_io_hps_io_gpio_inst_LOANIO49,        --              .hps_io_gpio_inst_LOANIO49
			hps_io_hps_io_gpio_inst_LOANIO50        => CONNECTED_TO_hps_io_hps_io_gpio_inst_LOANIO50,        --              .hps_io_gpio_inst_LOANIO50
			hps_io_hps_io_gpio_inst_LOANIO53        => CONNECTED_TO_hps_io_hps_io_gpio_inst_LOANIO53,        --              .hps_io_gpio_inst_LOANIO53
			hps_io_hps_io_gpio_inst_LOANIO54        => CONNECTED_TO_hps_io_hps_io_gpio_inst_LOANIO54,        --              .hps_io_gpio_inst_LOANIO54
			hps_uart0_cts                           => CONNECTED_TO_hps_uart0_cts,                           --     hps_uart0.cts
			hps_uart0_dsr                           => CONNECTED_TO_hps_uart0_dsr,                           --              .dsr
			hps_uart0_dcd                           => CONNECTED_TO_hps_uart0_dcd,                           --              .dcd
			hps_uart0_ri                            => CONNECTED_TO_hps_uart0_ri,                            --              .ri
			hps_uart0_dtr                           => CONNECTED_TO_hps_uart0_dtr,                           --              .dtr
			hps_uart0_rts                           => CONNECTED_TO_hps_uart0_rts,                           --              .rts
			hps_uart0_out1_n                        => CONNECTED_TO_hps_uart0_out1_n,                        --              .out1_n
			hps_uart0_out2_n                        => CONNECTED_TO_hps_uart0_out2_n,                        --              .out2_n
			hps_uart0_rxd                           => CONNECTED_TO_hps_uart0_rxd,                           --              .rxd
			hps_uart0_txd                           => CONNECTED_TO_hps_uart0_txd,                           --              .txd
			memory_mem_a                            => CONNECTED_TO_memory_mem_a,                            --        memory.mem_a
			memory_mem_ba                           => CONNECTED_TO_memory_mem_ba,                           --              .mem_ba
			memory_mem_ck                           => CONNECTED_TO_memory_mem_ck,                           --              .mem_ck
			memory_mem_ck_n                         => CONNECTED_TO_memory_mem_ck_n,                         --              .mem_ck_n
			memory_mem_cke                          => CONNECTED_TO_memory_mem_cke,                          --              .mem_cke
			memory_mem_cs_n                         => CONNECTED_TO_memory_mem_cs_n,                         --              .mem_cs_n
			memory_mem_ras_n                        => CONNECTED_TO_memory_mem_ras_n,                        --              .mem_ras_n
			memory_mem_cas_n                        => CONNECTED_TO_memory_mem_cas_n,                        --              .mem_cas_n
			memory_mem_we_n                         => CONNECTED_TO_memory_mem_we_n,                         --              .mem_we_n
			memory_mem_reset_n                      => CONNECTED_TO_memory_mem_reset_n,                      --              .mem_reset_n
			memory_mem_dq                           => CONNECTED_TO_memory_mem_dq,                           --              .mem_dq
			memory_mem_dqs                          => CONNECTED_TO_memory_mem_dqs,                          --              .mem_dqs
			memory_mem_dqs_n                        => CONNECTED_TO_memory_mem_dqs_n,                        --              .mem_dqs_n
			memory_mem_odt                          => CONNECTED_TO_memory_mem_odt,                          --              .mem_odt
			memory_mem_dm                           => CONNECTED_TO_memory_mem_dm,                           --              .mem_dm
			memory_oct_rzqin                        => CONNECTED_TO_memory_oct_rzqin,                        --              .oct_rzqin
			system_clk_clk                          => CONNECTED_TO_system_clk_clk,                          --    system_clk.clk
			system_reset_reset                      => CONNECTED_TO_system_reset_reset                       --  system_reset.reset
		);

