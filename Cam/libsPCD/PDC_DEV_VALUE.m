
%% PDCDEV

% Device Code
PDC_DEVTYPE_UNKNOWN                     = hex2dec('00000000');
PDC_DEVTYPE_FCAM_VIRTUAL                = hex2dec('00000001');
PDC_DEVTYPE_FCAM_MAX                    = hex2dec('00000002');
PDC_DEVTYPE_FCAM_APX                    = hex2dec('00000002');
PDC_DEVTYPE_FCAM_NEO                    = hex2dec('00000003');
PDC_DEVTYPE_FCAM_UL512                  = hex2dec('00000003');
PDC_DEVTYPE_FCAM_MAX_II                 = hex2dec('00000004');
PDC_DEVTYPE_FCAM_APX_II                 = hex2dec('00000004');
PDC_DEVTYPE_FCAM_APXRS                  = hex2dec('00000005');
PDC_DEVTYPE_FCAM_MH4                    = hex2dec('00000006');
PDC_DEVTYPE_FCAM_SA1                    = hex2dec('00000007');
PDC_DEVTYPE_FCAM_MC1                    = hex2dec('00000008');
PDC_DEVTYPE_FCAM_SA2                    = hex2dec('00000009');
PDC_DEVTYPE_FCAM_SA3                    = hex2dec('0000000a');
PDC_DEVTYPE_FCAM_CT3                    = hex2dec('0000000a');
PDC_DEVTYPE_FCAM_MC2                    = hex2dec('0000000b');
PDC_DEVTYPE_FCAM_SA5                    = hex2dec('0000000c');
PDC_DEVTYPE_FCAM_BC2                    = hex2dec('0000000d');
PDC_DEVTYPE_FCAM_SA4                    = hex2dec('0000000e');
PDC_DEVTYPE_FCAM_SAX                    = hex2dec('0000000f');
PDC_DEVTYPE_FCAM_PCI2                   = hex2dec('00000101');
PDC_DEVTYPE_FCAM_512PCI                 = hex2dec('00000102');
PDC_DEVTYPE_FCAM_SUSPCI                 = hex2dec('00000103');
PDC_DEVTYPE_FCAM_1024PCI                = hex2dec('00000104');
PDC_DEVTYPE_FCAM_1024PCIE               = hex2dec('00000105');
PDC_DEVTYPE_FCAM_DVR                    = hex2dec('00000200');
PDC_DEVTYPE_IDPEXPRESS                  = hex2dec('00000400');
PDC_DEVTYPE_FDM_PCIE_CL                 = hex2dec('00001000');
PDC_DEVTYPE_FCAM_SP8                    = hex2dec('00010000');
 
% Interface Code
PDC_INTTYPE_VIRTUAL                     = hex2dec('00000001');
PDC_INTTYPE_G_ETHER                     = hex2dec('00000002');
PDC_INTTYPE_IEEE1394                    = hex2dec('00000003');
PDC_INTTYPE_OPTICAL                     = hex2dec('00000004');
PDC_INTTYPE_USB2                        = hex2dec('00000005');
PDC_INTTYPE_PCI                         = hex2dec('00000100');
PDC_INTTYPE_DVR                         = hex2dec('00000200');


%% PDCVALUE

% General
PDC_MAX_DEVICE                          = 64;		% Maximum connection devices
PDC_MAX_INTERFACE_TYPE                  = 10;		% Maximum interface type
PDC_MAX_DEVICE_TYPE                     = 64;		% Maximum device type
PDC_MAX_CHILD_DEVICE                    = 4;        % Maximum child devices
PDC_MAX_PARTITION                       = 64;		% Maximum partitions
PDC_MAX_LIST_NUMBER                     = 256;		% Maximum list parameters
PDC_MAX_STRING_LENGTH                   = 256;		% Maximum strings
PDC_MAX_LUTLIST_NUMBER                  = 4096;     % Maximum LUT list parameters

% Function On/Off(General)
PDC_FUNCTION_OFF                        = 0;
PDC_FUNCTION_ON                         = 1;

% Function presence
PDC_EXIST_NOTSUPPORTED                  = 0;
PDC_EXIST_SUPPORTED                     = 1;
PDC_EXIST_SENSOR_GAIN                   = 2;
PDC_EXIST_SENSOR_GAMMA                  = 3;
PDC_EXIST_COLORTEMP                     = 4;
PDC_EXIST_DSSHUTTER                     = 5;
PDC_EXIST_LUT                           = 6;
PDC_EXIST_SHADING                       = 7;
PDC_EXIST_II                            = 8;
PDC_EXIST_EDGE_ENHANCE                  = 9;
PDC_EXIST_VIDEO_OUT                     = 10;
PDC_EXIST_SHUTTERLOCK                   = 11;
PDC_EXIST_PARTITIONINC                  = 12;
PDC_EXIST_HEADEXCHANGE                  = 13;
PDC_EXIST_KEYLOCK                       = 14;
PDC_EXIST_IRIG                          = 15;
PDC_EXIST_MCDL                          = 16;
PDC_EXIST_FRAME_ZERO                    = 17;
PDC_EXIST_PIXELGAIN                     = 18;
PDC_EXIST_COLOR_ENHANCE                 = 19;
PDC_EXIST_AUTO_EXPOSURE                 = 20;
PDC_EXIST_DELAY                         = 21;
PDC_EXIST_DOWNLOAD_MODE                 = 22;
PDC_EXIST_VARIABLE_FUNCTION             = 23;
PDC_EXIST_LOWLIGHT_MODE                 = 24;
PDC_EXIST_PROGSWITCH_MODE               = 25;
PDC_EXIST_SHUTTERSPEED_USEC             = 26;
PDC_EXIST_SYNCOUT_TIMES                 = 27;
PDC_EXIST_STORE                         = 28;
PDC_EXIST_ETHER_INFO                    = 29;
PDC_EXIST_IRIG_PHASELOCK                = 30;
PDC_EXIST_HIGH_SPEED_MODE               = 31;
PDC_EXIST_BURST_TRANSFER                = 32;
PDC_EXIST_STEP_SHUTTER                  = 33;
PDC_EXIST_LIVE_RESOLUTION               = 34;
PDC_EXIST_BITDEPTH                      = 35;
PDC_EXIST_FPGA_SETTING                  = 36;
PDC_EXIST_CAMERA_DEF_FILE               = 37;
PDC_EXIST_IMAGE_ADDRESS                 = 38;
PDC_EXIST_SYNC_PRIORITY                 = 39;
PDC_EXIST_ROI                           = 40;
PDC_EXIST_CAMERA_COMMAND                = 41;
PDC_EXIST_VIDEO_SIGNAL                  = 42;
PDC_EXIST_VIDEO_HDSDI                   = 43;
PDC_EXIST_RECORDING_TYPE                = 44;
PDC_EXIST_GHOST_REDUCTION               = 45;
PDC_EXIST_SOFT_COLORTEMP                = 46;
PDC_EXIST_AUTO_PLAY                     = 47;
PDC_EXIST_FACTORY_DEFAULTS              = 48;
PDC_EXIST_STORE_PRESET                  = 49;
PDC_EXIST_SHUTTERSPEED_NSEC             = 50;
PDC_EXIST_INSTRUCTIONSET                = 51;
PDC_EXIST_RESOLUTIONLOCK                = 52;
PDC_EXIST_LED_MODE                      = 53;
PDC_EXIST_LIVE_IRIG                     = 54;
PDC_EXIST_VIDEO_OSD                     = 55;
PDC_EXIST_SENSOR_TEMP                   = 56;
PDC_EXIST_SHADING_OFFSET                = 57;
PDC_EXIST_MEMORY_BLOCK                  = 58;
PDC_EXIST_LIVE_RESOLUTION_SCALE         = 59;
PDC_EXIST_FRAME_ADDRESS                 = 60;
PDC_EXIST_DROP_FRAME                    = 61;
PDC_EXIST_TEST_PATERN                   = 62;
PDC_EXIST_OFFSET_AS                     = 63;
PDC_EXIST_H_BANDING                     = 64;
PDC_EXIST_KEYPAD_COMMAND                = 65;
PDC_EXIST_POLARIZATION                  = 66;
PDC_EXIST_SHADING_TYPE                  = 67;
PDC_EXIST_BLACK_CLIP_LEVEL              = 68;
PDC_EXIST_BITDEPTH2                     = 69;
PDC_EXIST_SUB_PORT                      = 70;
PDC_EXIST_SUB_INTERFACE                 = 71;

% Color / Monochrome
PDC_COLORTYPE_MONO                      = 0;
PDC_COLORTYPE_COLOR                     = 1;

% Status
PDC_STATUS_LIVE                         = hex2dec('00');
PDC_STATUS_PLAYBACK                     = hex2dec('01');
PDC_STATUS_RECREADY                     = hex2dec('02');
PDC_STATUS_ENDLESS                      = hex2dec('04');					
PDC_STATUS_REC                          = hex2dec('08');
PDC_STATUS_SAVE                         = hex2dec('10');
PDC_STATUS_LOAD                         = hex2dec('20');

% Trigger mode
PDC_TRIGGER_START                       = bitshift(hex2dec('00'),24);
PDC_TRIGGER_CENTER                      = bitshift(hex2dec('01'),24);
PDC_TRIGGER_END                         = bitshift(hex2dec('02'),24);
PDC_TRIGGER_RANDOM                      = bitshift(hex2dec('03'),24);
PDC_TRIGGER_MANUAL                      = bitshift(hex2dec('04'),24);
PDC_TRIGGER_RANDOM_RESET                = bitshift(hex2dec('05'),24);
PDC_TRIGGER_RANDOM_CENTER               = bitshift(hex2dec('06'),24);
PDC_TRIGGER_RANDOM_MANUAL               = bitshift(hex2dec('07'),24);
PDC_TRIGGER_TWOSTAGE                    = bitshift(hex2dec('08'),24);
PDC_TRIGGER_TWOSTAGE_HALF               = bitor( bitshift(hex2dec('08'),24), 1 );
PDC_TRIGGER_TWOSTAGE_QUARTER            = bitor( bitshift(hex2dec('08'),24), 2 );
PDC_TRIGGER_TWOSTAGE_ONEEIGHTH          = bitor( bitshift(hex2dec('08'),24), 3 );
PDC_TRIGGER_RESET                       = bitshift(hex2dec('09'),24);

% Sensor Gamma
PDC_SENSOR_GAMMA_1_0                    = 1;
PDC_SENSOR_GAMMA_0_9                    = 2;
PDC_SENSOR_GAMMA_0_8                    = 3;
PDC_SENSOR_GAMMA_0_7                    = 4;
PDC_SENSOR_GAMMA_0_6                    = 5;
PDC_SENSOR_GAMMA_0_5                    = 6;
PDC_SENSOR_GAMMA_0_4                    = 7;

% Sensor Gain
PDC_SENSOR_GAIN_X1                      = 1;
PDC_SENSOR_GAIN_X1_5                    = 2;
PDC_SENSOR_GAIN_X2                      = 3;
PDC_SENSOR_GAIN_X3                      = 4;
PDC_SENSOR_GAIN_X4                      = 5;
PDC_SENSOR_GAIN_X6                      = 6;
PDC_SENSOR_GAIN_X8                      = 7;
PDC_SENSOR_GAIN_X12                     = 8;
PDC_SENSOR_GAIN_X16                     = 9;
PDC_SENSOR_GAIN_X24                     = 10;
PDC_SENSOR_GAIN_X32                     = 11;
PDC_SENSOR_GAIN_X64                     = 12;

% Color Temperature	
PDC_COLORTEMP_5100K                     = 1;
PDC_COLORTEMP_3100K                     = 2;
PDC_COLORTEMP_USER1                     = 3;
PDC_COLORTEMP_USER2                     = 4;
PDC_COLORTEMP_USER3                     = 5;
PDC_COLORTEMP_USER4                     = 6;

% Sync Priority
PDC_SYNCPRIORITY_OFF                    = hex2dec('00');
PDC_SYNCPRIORITY_MASTER                 = hex2dec('01');
PDC_SYNCPRIORITY_SLAVE                  = hex2dec('02');

% External Input Signal
PDC_EXT_IN_NONE                         = hex2dec('01');
PDC_EXT_IN_CAMSYNC_POSI                 = hex2dec('02');
PDC_EXT_IN_CAMSYNC_NEGA                 = hex2dec('03');
PDC_EXT_IN_OTHERSSYNC_POSI              = hex2dec('04');
PDC_EXT_IN_OTHERSSYNC_NEGA              = hex2dec('05');
PDC_EXT_IN_EVENT_POSI                   = hex2dec('06');
PDC_EXT_IN_EVENT_NEGA                   = hex2dec('07');
PDC_EXT_IN_TRIGGER_POSI                 = hex2dec('08');
PDC_EXT_IN_TRIGGER_NEGA                 = hex2dec('09');
PDC_EXT_IN_READY_POSI                   = hex2dec('0A');
PDC_EXT_IN_READY_NEGA                   = hex2dec('0B');

% External Output Signal
PDC_EXT_OUT_SYNC_POSI                   = hex2dec('01');
PDC_EXT_OUT_SYNC_NEGA                   = hex2dec('02');
PDC_EXT_OUT_RECORD_POSI                 = hex2dec('03');
PDC_EXT_OUT_RECORD_NEGA                 = hex2dec('04');
PDC_EXT_OUT_TRIGGER_POSI                = hex2dec('05');
PDC_EXT_OUT_TRIGGER_NEGA                = hex2dec('06');
PDC_EXT_OUT_READY_POSI                  = hex2dec('07');
PDC_EXT_OUT_READY_NEGA                  = hex2dec('08');
PDC_EXT_OUT_IRIG_RESET_POSI             = hex2dec('09');
PDC_EXT_OUT_IRIG_RESET_NEGA             = hex2dec('0A');
PDC_EXT_OUT_TTLIN_THRU_POSI             = hex2dec('0B');
PDC_EXT_OUT_TTLIN_THRU_NEGA             = hex2dec('0C');
PDC_EXT_OUT_EXPOSE_POSI                 = hex2dec('0D');
PDC_EXT_OUT_EXPOSE_NEGA                 = hex2dec('0E');
PDC_EXT_OUT_EXPOSE_H1_POSI              = hex2dec('1D');
PDC_EXT_OUT_EXPOSE_H1_NEGA              = hex2dec('1E');
PDC_EXT_OUT_EXPOSE_H2_POSI              = hex2dec('2D');
PDC_EXT_OUT_EXPOSE_H2_NEGA              = hex2dec('2E');
PDC_EXT_OUT_EXPOSE_H3_POSI              = hex2dec('3D');
PDC_EXT_OUT_EXPOSE_H3_NEGA              = hex2dec('3E');
PDC_EXT_OUT_EXPOSE_H4_POSI              = hex2dec('4D');
PDC_EXT_OUT_EXPOSE_H4_NEGA              = hex2dec('4E');
PDC_EXT_OUT_TRIGGER                     = hex2dec('50');
PDC_EXT_OUT_REC_POS_AND_SYNC_POS        = hex2dec('51');
PDC_EXT_OUT_REC_POS_AND_EXPOSE_POS      = hex2dec('52');
PDC_EXT_OUT_ODD_REC_POS_AND_SYNC_POS    = hex2dec('53');
PDC_EXT_OUT_EVEN_REC_POS_AND_SYNC_POS   = hex2dec('54');

PDC_EXTIO_MAX_PORT                      = 4;

% Dualslope Shutter
PDC_DSSHUTTER_OFF                       = hex2dec('01');
PDC_DSSHUTTER_MODE1                     = hex2dec('02');
DSSHUTTER_MODE2                         = hex2dec('03');
PDC_DSSHUTTER_MODE3                     = hex2dec('04');
PDC_DSSHUTTER_VALUE_STEP5               = hex2dec('11');

% LUT
PDC_LUT_DEFAULT1                        = 1;
PDC_LUT_DEFAULT2                        = 2;
PDC_LUT_DEFAULT3                        = 3;
PDC_LUT_DEFAULT4                        = 4;
PDC_LUT_DEFAULT5                        = 5;
PDC_LUT_DEFAULT6                        = 6;
PDC_LUT_DEFAULT7                        = 7;
PDC_LUT_DEFAULT8                        = 8;
PDC_LUT_DEFAULT9                        = 9;
PDC_LUT_DEFAULT10                       = 10;
PDC_LUT_USER1                           = 11;
PDC_LUT_USER2                           = 12;
PDC_LUT_USER3                           = 13;
PDC_LUT_USER4                           = 14;

% Shading
PDC_SHADING_OFF                         = 1;
PDC_SHADING_ON                          = 2;
PDC_SHADING_SAVE                        = 3;
PDC_SHADING_LOAD                        = 4;
PDC_SHADING_UPDATE                      = 5;
PDC_SHADING_SAVE_FILE                   = 6;
PDC_SHADING_LOAD_FILE                   = 7;

% Shading type
PDC_SHADING_TYPE_NORMAL                 = 0;
PDC_SHADING_TYPE_FINE                   = 1;

% Pixel Gain
PDC_PIXELGAIN_OFF                       = 0;
PDC_PIXELGAIN_NORMAL                    = 1;
PDC_PIXELGAIN_SOFT                      = 2;
PDC_PIXELGAIN_FLAT                      = 3;
PDC_PIXELGAIN_SAVE                      = 4;	% Reserve
PDC_PIXELGAIN_LOAD                      = 5;	% Reserve
PDC_PIXELGAIN_SAVE_FILE                 = 6;
PDC_PIXELGAIN_LOAD_FILE                 = 7;
PDC_PIXELGAIN_NORMAL_64CH               = 8;

% Color Plane
PDC_COLOR_PLANE_R                       = 1;
PDC_COLOR_PLANE_G                       = 2;
PDC_COLOR_PLANE_B                       = 3;

% I.I. Power
PDC_II_POWER_OFF                        = 1;
PDC_II_POWER_ON                         = 2;
PDC_II_POWER_ON_LOAD                    = 3;

% I.I. Gate Select
PDC_II_GATEMODE_OFF                     = 1;
PDC_II_GATEMODE_CONTINUOUS              = 2;
PDC_II_GATEMODE_EXTERNAL                = 3;
PDC_II_GATEMODE_GATING                  = 4;
PDC_II_GATEMODE_DELAY                   = 5;

% Edge Enhancement
PDC_EDGE_ENHANCE_OFF                    = 1;
PDC_EDGE_ENHANCE_MODE1                  = 2;
PDC_EDGE_ENHANCE_MODE2                  = 3;
PDC_EDGE_ENHANCE_MODE3                  = 4;

% Video Output
PDC_VIDEO_OUT_VGA                       = hex2dec('0001');
PDC_VIDEO_OUT_NTSC                      = hex2dec('0002');
PDC_VIDEO_OUT_PAL                       = hex2dec('0003');

% Video Output Signal
PDC_VIDEO_SIGNAL_VBS                    = 0;
PDC_VIDEO_SIGNAL_HDSDI                  = 1;

% HD-SDI Mode
PDC_VIDEO_HDSDI_1080_60I                = 0;
PDC_VIDEO_HDSDI_1080_59_94I             = 1;
PDC_VIDEO_HDSDI_1080_50I                = 2;
PDC_VIDEO_HDSDI_1080_30P                = 3;
PDC_VIDEO_HDSDI_1080_29_97P             = 4;
PDC_VIDEO_HDSDI_1080_25P                = 5;
PDC_VIDEO_HDSDI_1080_24P                = 6;
PDC_VIDEO_HDSDI_1080_23_98P             = 7;
PDC_VIDEO_HDSDI_1080_24SF               = 8;
PDC_VIDEO_HDSDI_1080_23_98SF            = 9;
PDC_VIDEO_HDSDI_720_60P                 = 10;
PDC_VIDEO_HDSDI_720_59_94P              = 11;
PDC_VIDEO_HDSDI_720_50P                 = 12;

% Shutter Mode
PDC_SHUTTERLOCK_MODE1                   = 0;
PDC_SHUTTERLOCK_MODE2                   = 1;

% Resolution Mode
PDC_RESOLUTIONLOCK_MODE1                = 0;
PDC_RESOLUTIONLOCK_MODE2                = 1;

% Partition Mode
PDC_PARTITIONINC_MODE1                  = 0;
PDC_PARTITIONINC_MODE2                  = 1;
PDC_PARTITIONINC_MODE3                  = 2;

% 8bit select
PDC_8BITSEL_10UPPER                     = 2;
PDC_8BITSEL_10MIDDLE                    = 1;
PDC_8BITSEL_10LOWER                     = 0;
PDC_8BITSEL_12UPPER                     = 4;
PDC_8BITSEL_12MIDDLE_U                  = 3;
PDC_8BITSEL_12MIDDLE                    = 2;
PDC_8BITSEL_12MIDDLE_L                  = 1;
PDC_8BITSEL_12LOWER                     = 0;
PDC_8BITSEL_16UPPER                     = 8;
PDC_8BITSEL_8NORMAL                     = 0;

% Color date tranfer interleave
PDC_COLORDATA_NOCOLOR                   = 0;
PDC_COLORDATA_INTERLEAVE_BGR            = 1;
PDC_COLORDATA_INTERLEAVE_RGB            = 2;

% Gigabit-Ether I/F Parameter
PDC_GETHER_CONNECT_NORMAL               = 1;
PDC_GETHER_CONNECT_LOWSPEED             = 0;
PDC_GETHER_PACKETSIZE_DEFAULT           = 0;
PDC_GETHER_PACKETSIZE_LOWSPEED          = 722;
PDC_GETHER_TIMEOUT_DEFAULT              = 5000;

% Detect mode
PDC_DETECT_NORMAL                       = 0;
PDC_DETECT_AUTO                         = 1;

% Variable pattern num
PDC_VARIABLE_NUM                        = 20;

% Variable Free Position
PDC_VARIABLE_FREE_CENTER_ONLY           = hex2dec('00');
PDC_VARIABLE_FREE_X                     = hex2dec('01');
PDC_VARIABLE_FREE_Y                     = hex2dec('10');

% Signal Delay
PDC_DELAY_TRIGGER_IN                    = 1;
PDC_DELAY_VSYNC_IN                      = 2;
PDC_DELAY_GENERAL_IN                    = 3;
PDC_DELAY_TRIGGER_OUT_WIDTH             = 4;
PDC_DELAY_VSYNC_OUT                     = 5;
PDC_DELAY_VSYNC_OUT_WIDTH               = 6;
PDC_DELAY_EXPOSE                        = 7;

% Download mode
PDC_DOWNLOAD_MODE_VIDEO_ON              = 0;	% Reserve
PDC_DOWNLOAD_MODE_VIDEO_OFF             = 1;	% Reserve
PDC_DOWNLOAD_MODE_PLAYBACK_ON           = 0;
PDC_DOWNLOAD_MODE_PLAYBACK_OFF          = 1;
PDC_DOWNLOAD_MODE_LIVE_ON               = 2;

% Camera mode
PDC_CAM_MODE_DEFAULT                    = 0;
PDC_CAM_MODE_VARIABLE                   = 1;
PDC_CAM_MODE_EXTERNAL                   = 2;

% Programmable Switch mode
PDC_PROGSWITCH_NONE                     = 0;
PDC_PROGSWITCH_RECORDRATE_SEL           = 1;
PDC_PROGSWITCH_RESOLUTION_SEL           = 2;
PDC_PROGSWITCH_SHUTTER_SEL              = 3;
PDC_PROGSWITCH_TRIGGER_MODE_SEL         = 4;
PDC_PROGSWITCH_HEAD_SEL                 = 5;
PDC_PROGSWITCH_FIT                      = 6;
PDC_PROGSWITCH_STATUS                   = 7;
PDC_PROGSWITCH_LIVE                     = 8;
PDC_PROGSWITCH_RECREADY                 = 9;
PDC_PROGSWITCH_REC                      = 10;
PDC_PROGSWITCH_LOWLIGHT                 = 11;
PDC_PROGSWITCH_CALIBRATE                = 12;
PDC_PROGSWITCH_OFF                      = 13;
PDC_PROGSWITCH_OSD                      = 14;

PDC_PROGSWITCH_MAX_NUM                  = 4;

% Color Bayer Convert mode
PDC_BAYERCONVERT_MODE1                  = 0;
PDC_BAYERCONVERT_MODE2                  = 1;
PDC_BAYERCONVERT_MODE3                  = 2;
PDC_BAYERCONVERT_MODE4                  = 3;

% Sync Out Times
PDC_SYNCOUT_TIMES_X1                    = 1;
PDC_SYNCOUT_TIMES_X2                    = 2;
PDC_SYNCOUT_TIMES_X4                    = 4;
PDC_SYNCOUT_TIMES_X6                    = 6;
PDC_SYNCOUT_TIMES_X8                    = 8;
PDC_SYNCOUT_TIMES_X10                   = 10;
PDC_SYNCOUT_TIMES_X20                   = 20;
PDC_SYNCOUT_TIMES_X30                   = 30;
PDC_SYNCOUT_TIMES_X0_5                  = 101;

% Store Preset
PDC_STORE_PRESET_1                      = 1;
PDC_STORE_PRESET_2                      = 2;
PDC_STORE_PRESET_3                      = 3;
PDC_STORE_PRESET_4                      = 4;

% Color Enhancement
PDC_COLOR_ENHANCE_OFF                   = 0;
PDC_COLOR_ENHANCE_X0_5                  = 1;
PDC_COLOR_ENHANCE_X1                    = 2;
PDC_COLOR_ENHANCE_X1_5                  = 3;
PDC_COLOR_ENHANCE_X2                    = 4;

% Ethernet
PDC_ETHER_INFO_IP_ADDRESS               = 0;
PDC_ETHER_INFO_NETMASK                  = 1;
PDC_ETHER_INFO_GATEWAY                  = 2;
PDC_ETHER_INFO_DHCP                     = 3;

% Head Type
PDC_HEADTYPE_MONO                       = 0;
PDC_HEADTYPE_COLOR                      = 1;
PDC_HEADTYPE_II                         = 2;
PDC_HEADTYPE_UNKNOWN                    = hex2dec('FF');

% Auto Play
PDC_AUTOPLAY_OFF                        = 0;
PDC_AUTOPLAY_MEMORY_MODE                = 1;
PDC_AUTOPLAY_ON                         = 2;

% CameraLink
PDC_CAM_STATUS_DEFAULT                  = 0;
PDC_CAM_STATUS_POW_CAB_NOT_CONNECT      = 1;
PDC_CAM_STATUS_CAM_NOT_CONNECT          = 2;
PDC_CAM_STATUS_CL_CONNECT               = 3;
PDC_CAM_STATUS_POCL_CONNECT             = 4;

% Live resolution
PDC_LIVE_RESO_FULL                      = 0;
PDC_LIVE_RESO_HALF                      = 1;
PDC_LIVE_RESO_3                         = 2;
PDC_LIVE_RESO_QUARTER                   = 3;
PDC_LIVE_RESO_5                         = 4;
PDC_LIVE_RESO_6                         = 5;
PDC_LIVE_RESO_7                         = 6;
PDC_LIVE_RESO_DQUARTER                  = 7;

% Baudrate
PDC_BAUDRATE_38400                      = 0;
PDC_BAUDRATE_19200                      = 1;
PDC_BAUDRATE_9600                       = 2;

% AVI Compress dialog
PDC_COMPRESS_DIALOG_HIDE                = 0;
PDC_COMPRESS_DIALOG_SHOW                = 1;

% Recording type
PDC_RECORDING_TYPE_READY_AND_TRIG       = 0;
PDC_RECORDING_TYPE_DIRECT_TRIG          = 1;
PDC_RECORDING_TYPE_DIRECT_START         = 2;

% MCDL Data Mode
PDC_MCDL_DATA_MODE1                     = 0;
PDC_MCDL_DATA_MODE2                     = 1;

% Display Mode with drawing function
PDC_DISPLAY_RESO_FULL                   = 0;
PDC_DISPLAY_RESO_HALF                   = 1;
PDC_DISPLAY_RESO_QUARTER                = 2;

% High Speed Mode
PDC_HIGHSPEED_MODE_NORMAL               = 0;
PDC_HIGHSPEED_MODE_HIGH                 = 1;
PDC_HIGHSPEED_MODE_SUPERHIGH            = 2;

% High Speed Mode List
PDC_HIGHSPEED_NORMAL_150K               = hex2dec('00009600');
PDC_HIGHSPEED_HIGH_675K                 = hex2dec('0002A301');
PDC_HIGHSPEED_SUPERHIGH_775K            = hex2dec('00030702');
PDC_HIGHSPEED_SUPERHIGH_1000K           = hex2dec('0003E802');
PDC_HIGHSPEED_SUPERHIGH_1300K           = hex2dec('00051402');

% Instruction Set
PDC_INSTSET_NONE                        = hex2dec('80000000');
PDC_INSTSET_AUTO                        = hex2dec('40000000');
PDC_INSTSET_MMX                         = hex2dec('00000001');
PDC_INSTSET_SSE2                        = hex2dec('00000002');

PDC_INSTSET_DEFAULT                     = PDC_INSTSET_NONE;	% The initial state of device

% Bayer Alignment
PDC_BAYER_ALIGNMENT_RGGB                = 0;
PDC_BAYER_ALIGNMENT_BGGR                = 1;
PDC_BAYER_ALIGNMENT_GRBG                = 2;
PDC_BAYER_ALIGNMENT_GBRG                = 3;

% Polarization Pattern	*/
PDC_POLARIZATION_PATTERN_1              = 1;
PDC_POLARIZATION_PATTERN_2              = 2;
PDC_POLARIZATION_PATTERN_3              = 3;
PDC_POLARIZATION_PATTERN_4              = 4;

% Degree of Polarizer
PDC_POLARIZER_DEGREE_0                  = 1;
PDC_POLARIZER_DEGREE_45                 = 2;
PDC_POLARIZER_DEGREE_90                 = 3;
PDC_POLARIZER_DEGREE_135                = 4;

% Colormap Index
PDC_POLARIZATION_COLORMAP_180           = 1;
PDC_POLARIZATION_COLORMAP_90            = 2;
PDC_POLARIZATION_COLORMAP_45            = 4;
PDC_POLARIZATION_COLORMAP_30            = 6;

% RESOLUTION_MODE
PDC_RESOLUTION_STANDARD_MODE            = 0;
PDC_RESOLUTION_VALIABLE_MODE            = 1;

% Bit Depth Mode of MRAW File
PDC_MRAW_BITDEPTH_8                     = 0;
PDC_MRAW_BITDEPTH_10                    = 1;
PDC_MRAW_BITDEPTH_12                    = 2;
PDC_MRAW_BITDEPTH_16                    = 3;

% Bit Depth Mode of RAW File
PDC_RAW_BITDEPTH_8                      = 0;
PDC_RAW_BITDEPTH_16                     = 1;

% FrameNumber
PDC_ILLEGAL_FRAME_NUMBER                = hex2dec('FFFFFFFF');     % 0xFFFFFFFFL

% KEYPAD COMMAND
PDC_KEYPAD_COMMAND_FRAMERATE_UP         = 0;
PDC_KEYPAD_COMMAND_FRAMERATE_DOWN       = 1;
PDC_KEYPAD_COMMAND_RESOLUTION_UP        = 2;
PDC_KEYPAD_COMMAND_RESOLUTION_DOWN      = 3;
PDC_KEYPAD_COMMAND_SHUTTER_UP           = 4;
PDC_KEYPAD_COMMAND_SHUTTER_DOWN         = 5;
PDC_KEYPAD_COMMAND_TRIGGER_UP           = 6;
PDC_KEYPAD_COMMAND_TRIGGER_DOWN         = 7;
PDC_KEYPAD_COMMAND_LIVE_MEM             = 8;
PDC_KEYPAD_COMMAND_PLAYBACK_FR          = 9;
PDC_KEYPAD_COMMAND_PLAYBACK_REV         = 10;
PDC_KEYPAD_COMMAND_PLAYBACK_PLAY        = 11;
PDC_KEYPAD_COMMAND_PLAYBACK_FF          = 12;
PDC_KEYPAD_COMMAND_PLAYBACK_PAUSE       = 13;
PDC_KEYPAD_COMMAND_PLAYBACK_STOP        = 14;
PDC_KEYPAD_COMMAND_SEGMENT_START        = 15;
PDC_KEYPAD_COMMAND_SEGMENT_END          = 16;
PDC_KEYPAD_COMMAND_SEGMENT_ON_OFF       = 17;
PDC_KEYPAD_COMMAND_REC_READY            = 18;
PDC_KEYPAD_COMMAND_REC                  = 19;
PDC_KEYPAD_COMMAND_STORE                = 20;
PDC_KEYPAD_COMMAND_MENU                 = 21;
PDC_KEYPAD_COMMAND_ENTER                = 22;
PDC_KEYPAD_COMMAND_ZOOM                 = 23;
PDC_KEYPAD_COMMAND_FIT_SAMESIZE         = 24;
PDC_KEYPAD_COMMAND_ARROW_UP             = 25;
PDC_KEYPAD_COMMAND_ARROW_DOWN           = 26;
PDC_KEYPAD_COMMAND_ARROW_LEFT           = 27;
PDC_KEYPAD_COMMAND_ARROW_RIGHT          = 28;
PDC_KEYPAD_COMMAND_BACK                 = 29;
PDC_KEYPAD_COMMAND_SCROLL               = 30;
PDC_KEYPAD_COMMAND_CALIBRATE            = 31;
PDC_KEYPAD_COMMAND_STATUS               = 32;
PDC_KEYPAD_COMMAND_PRESET1              = 33;
PDC_KEYPAD_COMMAND_PRESET2              = 34;
PDC_KEYPAD_COMMAND_PRESET3              = 35;
PDC_KEYPAD_COMMAND_PRESET4              = 36;
PDC_KEYPAD_COMMAND_FUNCTION             = 37;
PDC_KEYPAD_COMMAND_LOWLIGHT             = 38;

% FPGA CONFIG STATUS
PDC_FPGA_CONFIG_BUFFER_FILE_LOADING     = 0;
PDC_FPGA_CONFIG_ERASING                 = 1;
PDC_FPGA_CONFIG_PROGRAMMING             = 2;
PDC_FPGA_CONFIG_VERIFYING               = 3;

% REGISTER_SETTING_TYPE
PDC_REGISTER_SETTING_MAIN               = 0;
PDC_REGISTER_SETTING_SUB                = 1;
PDC_REGISTER_SETTING_HEAD1              = 2;
PDC_REGISTER_SETTING_HEAD2              = 3;

% RECORD BIT SELECT
PDC_RECBITSEL_8_12UPPER                 = hex2dec('00010000');
PDC_RECBITSEL_8_12MIDDLE_U              = hex2dec('00010001');
PDC_RECBITSEL_8_12MIDDLE                = hex2dec('00010002');
PDC_RECBITSEL_8_12MIDDLE_L              = hex2dec('00010003');
PDC_RECBITSEL_8_12LOWER                 = hex2dec('00010004');


%% Others

% Flag Code
FALSE                                   = 0;
TRUE                                    = 1;

% Ret Code
PDC_FAILED                              = 0;
PDC_SUCCEEDED                           = 1;

















