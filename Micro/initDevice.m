function handles=initDevice(port)

  global ERRBIT_VOLTAGE  ERRBIT_ANGLE ERRBIT_OVERHEAT ERRBIT_RANGE ERRBIT_CHECKSUM ERRBIT_OVERLOAD ERRBIT_INSTRUCTION
  global COMM_TXSUCCESS COMM_RXSUCCESS COMM_TXFAIL COMM_RXFAIL COMM_TXERROR COMM_RXWAITING COMM_RXTIMEOUT COMM_RXCORRUPT
  
  ERRBIT_VOLTAGE     = 1;
  ERRBIT_ANGLE       = 2;
  ERRBIT_OVERHEAT    = 4;
  ERRBIT_RANGE       = 8;
  ERRBIT_CHECKSUM    = 16;
  ERRBIT_OVERLOAD    = 32;
  ERRBIT_INSTRUCTION = 64;
  
  COMM_TXSUCCESS     = 0;
  COMM_RXSUCCESS     = 1;
  COMM_TXFAIL        = 2;
  COMM_RXFAIL        = 3;
  COMM_TXERROR       = 4;
  COMM_RXWAITING     = 5;
  COMM_RXTIMEOUT     = 6;
  COMM_RXCORRUPT     = 7;
  
  % Set USB2Dynamixel comunication parameters
  handles.DEFAULT_PORTNUM = port;   % Com Port
  handles.DEFAULT_BAUDNUM = 1;      % 1Mbps Baud rate
  
  % Set win64 or win32  to be used
  handles.OS_Option.Win32option=1;
  handles.OS_Option.Win64option=2;
  handles.OS_Option.Actual=handles.OS_Option.Win64option;
  handles.AliasLib='dynamixel';
  handles.AliasLib_h='dynamixel.h';
  
  % Added fields
  handles.id=1; % motor number 
  handles.r=defineRegisters;
  
  % Start usb comunication
  if libisloaded(handles.AliasLib)
    disp('The dynamixel lib is already loaded.');
  else
    disp('Loading dynamixel lib...');
    addpath('.\dxl_sdk_win64_v1_02\bin');
    addpath('.\dxl_sdk_win64_v1_02\import');
    loadlibrary(handles.AliasLib,handles.AliasLib_h);
  end
  
%   % Show available dynamixel libs
%   libfunctions('dynamixel');
  
end
  

 
 
 
 
 
 
