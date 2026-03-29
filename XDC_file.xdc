# =============================================================================
# ZedBoard Constraints for object_detector
# =============================================================================

# -----------------------------------------------------------------------------
# 100 MHz board clock input -> sys_clk  (Bank 35, 3.3V)
# -----------------------------------------------------------------------------
set_property PACKAGE_PIN Y9 [get_ports {sys_clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {sys_clk}]

# Define a named 100 MHz clock on the board pin.
create_clock -name sys_clk_100 -period 10.000 [get_ports {sys_clk}]

# -----------------------------------------------------------------------------
# Camera PCLK (input from sensor) ~24 MHz
# -----------------------------------------------------------------------------
set_property PACKAGE_PIN W8 [get_ports {i_cam_pclk_0}]   ;# JB4
set_property IOSTANDARD LVCMOS33 [get_ports {i_cam_pclk_0}]

create_clock -name cam_pclk -period 41.667 -waveform {0.000 20.833} \
    [get_ports {i_cam_pclk_0}]

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets -of_objects [get_ports {i_cam_pclk_0}]]

# -----------------------------------------------------------------------------
# JB Pmod - Camera control / XCLK / I2C / syncs (Bank 13, 3.3V)
# -----------------------------------------------------------------------------
set_property PACKAGE_PIN W12 [get_ports {cam_clk_24mhz_0}]  ;# JB1  - 24 MHz XCLK out
set_property PACKAGE_PIN W11 [get_ports {o_cam_rstn_0}]     ;# JB2  - RESET to camera
set_property PACKAGE_PIN V10 [get_ports {o_cam_pwdn_0}]     ;# JB3  - PWDN to camera
# JB4: i_cam_pclk_0 constrained above
set_property PACKAGE_PIN V12 [get_ports {i_cam_vsync_0}]    ;# JB7
set_property PACKAGE_PIN W10 [get_ports {i_cam_href_0}]     ;# JB8
set_property PACKAGE_PIN V9  [get_ports {CAM_SCL_0}]        ;# JB9  - I2C SCL
set_property PACKAGE_PIN V8  [get_ports {CAM_SDA_0}]        ;# JB10 - I2C SDA

# IOSTANDARD for these camera-side pins
set_property IOSTANDARD LVCMOS33 [get_ports {cam_clk_24mhz_0 o_cam_rstn_0 o_cam_pwdn_0 i_cam_vsync_0 i_cam_href_0 CAM_SCL_0 CAM_SDA_0}]


# -----------------------------------------------------------------------------
# JA Pmod - Camera Data in (Bank 13, 3.3V)
# -----------------------------------------------------------------------------
set_property PACKAGE_PIN Y11  [get_ports {i_cam_data_0[0]}]  ;# JA1
set_property PACKAGE_PIN AA11 [get_ports {i_cam_data_0[1]}]  ;# JA2
set_property PACKAGE_PIN Y10  [get_ports {i_cam_data_0[2]}]  ;# JA3
set_property PACKAGE_PIN AA9  [get_ports {i_cam_data_0[3]}]  ;# JA4
set_property PACKAGE_PIN AB11 [get_ports {i_cam_data_0[4]}]  ;# JA7
set_property PACKAGE_PIN AB10 [get_ports {i_cam_data_0[5]}]  ;# JA8
set_property PACKAGE_PIN AB9  [get_ports {i_cam_data_0[6]}]  ;# JA9
set_property PACKAGE_PIN AA8  [get_ports {i_cam_data_0[7]}]  ;# JA10

set_property IOSTANDARD LVCMOS33 [get_ports {i_cam_data_0[*]}]

# -----------------------------------------------------------------------------
# VGA Output - Bank 33 (3.3V)
# -----------------------------------------------------------------------------
set_property PACKAGE_PIN Y21  [get_ports {o_blue_0[0]}]  ;# VGA-B1
set_property PACKAGE_PIN Y20  [get_ports {o_blue_0[1]}]  ;# VGA-B2
set_property PACKAGE_PIN AB20 [get_ports {o_blue_0[2]}]  ;# VGA-B3
set_property PACKAGE_PIN AB19 [get_ports {o_blue_0[3]}]  ;# VGA-B4

set_property PACKAGE_PIN AB22 [get_ports {o_green_0[0]}] ;# VGA-G1
set_property PACKAGE_PIN AA22 [get_ports {o_green_0[1]}] ;# VGA-G2
set_property PACKAGE_PIN AB21 [get_ports {o_green_0[2]}] ;# VGA-G3
set_property PACKAGE_PIN AA21 [get_ports {o_green_0[3]}] ;# VGA-G4

set_property PACKAGE_PIN V20  [get_ports {o_red_0[0]}]   ;# VGA-R1
set_property PACKAGE_PIN U20  [get_ports {o_red_0[1]}]   ;# VGA-R2
set_property PACKAGE_PIN V19  [get_ports {o_red_0[2]}]   ;# VGA-R3
set_property PACKAGE_PIN V18  [get_ports {o_red_0[3]}]   ;# VGA-R4

set_property PACKAGE_PIN AA19 [get_ports {o_hsync_0}]    ;# VGA-HS
set_property PACKAGE_PIN Y19  [get_ports {o_vsync_0}]    ;# VGA-VS

set_property IOSTANDARD LVCMOS33 [get_ports {o_red_0[*] o_green_0[*] o_blue_0[*] o_hsync_0 o_vsync_0}]

# ----------------------------------------------------------------------------
# HDMI Output (no audio) - Bank 33
# ---------------------------------------------------------------------------- 
set_property PACKAGE_PIN W18  [get_ports {HD_CLK}];  # "HD-CLK"
set_property PACKAGE_PIN Y13  [get_ports {HD_D[0 ]}];  # "HD-D0"
set_property PACKAGE_PIN AA13 [get_ports {HD_D[1 ]}];  # "HD-D1"
set_property PACKAGE_PIN W13  [get_ports {HD_D[10]}];  # "HD-D10"
set_property PACKAGE_PIN W15  [get_ports {HD_D[11]}];  # "HD-D11"
set_property PACKAGE_PIN V15  [get_ports {HD_D[12]}];  # "HD-D12"
set_property PACKAGE_PIN U17  [get_ports {HD_D[13]}];  # "HD-D13"
set_property PACKAGE_PIN V14  [get_ports {HD_D[14]}];  # "HD-D14"
set_property PACKAGE_PIN V13  [get_ports {HS_D[15]}];  # "HD-D15"
set_property PACKAGE_PIN AA14 [get_ports {HD_D[2 ]}];  # "HD-D2"
set_property PACKAGE_PIN Y14  [get_ports {HD_D[3 ]}];  # "HD-D3"
set_property PACKAGE_PIN AB15 [get_ports {HD_D[4 ]}];  # "HD-D4"
set_property PACKAGE_PIN AB16 [get_ports {HD_D[5 ]}];  # "HD-D5"
set_property PACKAGE_PIN AA16 [get_ports {HD_D[6 ]}];  # "HD-D6"
set_property PACKAGE_PIN AB17 [get_ports {HD_D[7 ]}];  # "HD-D7"
set_property PACKAGE_PIN AA17 [get_ports {HD_D[8 ]}];  # "HD-D8"
set_property PACKAGE_PIN Y15  [get_ports {HD_D[9 ]}];  # "HD-D9"
set_property PACKAGE_PIN U16  [get_ports {HD_DE}];  # "HD-DE"
set_property PACKAGE_PIN V17  [get_ports {HD_HSYNC}];  # "HD-HSYNC"
set_property PACKAGE_PIN AA18 [get_ports {HD_SCL}];  # "HD-SCL"
set_property PACKAGE_PIN Y16  [get_ports {HD_SDA}];  # "HD-SDA"
set_property PACKAGE_PIN W17  [get_ports {HD_VSYNC}];  # "HD-VSYNC"


#set_property PACKAGE_PIN U15  [get_ports {HD_SPDIF}];  # "HD-SPDIF" (audio)
#set_property PACKAGE_PIN Y18  [get_ports {HD_SPDIFO}];  # "HD-SPDIFO" (audio)
#set_property PACKAGE_PIN W16  [get_ports {HD_INT}];  # "HD-INT" (leave commented out)

# -----------------------------------------------------------------------------
# User Push Button (Reset)  (Bank 35, 3.3V)
# -----------------------------------------------------------------------------
set_property PACKAGE_PIN P16 [get_ports {btn_n_async_0}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn_n_async_0}]

# =============================================================================
# FALSE PATHS / ASYNC CUTS
# =============================================================================

# 1) Button reset: asynchronous to system clocks
set_false_path -from [get_ports {btn_n_async_0}]

# 2) I2C: slow open-drain bus; exclude from timing
# (Use -through on the ports themselves.)
set_false_path -through [get_ports {CAM_SCL_0 CAM_SDA_0}]

# 3) Camera PCLK domain is asynchronous to system/derived clocks (100 MHz, 25 MHz, etc.)
set_clock_groups -asynchronous \
  -group [get_clocks cam_pclk] \
  -group [get_clocks {sys_clk_object_detector_clk_wiz_0_0_1 vga_clk}]
