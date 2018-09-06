function [nDeviceNo, nChildNo]=initCamera
  %% Loading PDC lib
  global g;
  g = load('PDC_DEV_VALUE.mat');

  g.errorMsg=cell(1,203);
  for i=1:203
      g.errorMsg{i}='';
  end
  g.errorMsg{1}='NOERROR (Normal)';
  g.errorMsg{2}='UNINITIALIZE (PDCLIB is not initialized)';
  g.errorMsg{3}='ILLEGAL_DEV_NO (A problem exists in the specified device number)';
  g.errorMsg{4}='ILLEGAL_CHILD_NO (A problem exists in the specified child device number)';
  g.errorMsg{5}='ILLEGAL_VALUE (A problem exists in an argument)';
  g.errorMsg{6}='ALLOCATE_FAILED (Securing a memory area failed)';
  g.errorMsg{7}='INITIALIZED (PDCLIB has already been initialized)';
  g.errorMsg{8}='NO_DEVICE (A device cannot be found)';
  g.errorMsg{9}='TIMEOUT (Time-out occurred during processing)';
  g.errorMsg{10}='FUNCTION_FAILED (A function failed in execution)';
  g.errorMsg{16}='FILEREAD_FAILED (A file failed in read operation)';
  g.errorMsg{17}='FILEWRITE_FAILED (A file failed in write operation)';
  g.errorMsg{21}='NOT_SUPPORTED (Not supported in this child device)';
  g.errorMsg{100}='LOAD_FAILED (A module failed in loading)';
  g.errorMsg{101}='FREE_FAILED (A module failed in opening)';
  g.errorMsg{102}='LOADED (A module is not loaded)';
  g.errorMsg{103}='NOTLOADED (A device is not opened)';
  g.errorMsg{104}='UNDETECTED (A device search has not been performed)';
  g.errorMsg{105}='OVER_DEVICE (The number of devices is too large)';
  g.errorMsg{106}='INIT_FAILED (Initialization failed)';
  g.errorMsg{107}='OPEN_ALREADY (A device has already been opened)';
  g.errorMsg{108}='NOTOPEN (A device is not opened)';
  g.errorMsg{110}='LIVEONLY (This function is valid in the live mode)';
  g.errorMsg{111}='PLAYBACKONLY (This function is valid in the memory playback mode)';
  g.errorMsg{200}='SEND_ERROR (Command transmission failed)';
  g.errorMsg{201}='RECIEVE_ERROR (Command reception failed)';
  g.errorMsg{202}='CLEAR_ERROR (An interface re-initialization failed)';
  g.errorMsg{203}='COMMAND_ERROR (An abnormal command is found)';
  
  %% Connection parameters
  
  %nInterfaceCode=uint32(2);  % Gigabit
  nInterfaceCode=g.PDC_INTTYPE_G_ETHER;
  
  nDetectNo=uint32(hex2dec('C0A8000A'));  % IP address
  nDetectNum=uint32(1); % Just one device
  nDetectParam=uint32(0); % No search

  nChildNo=uint32(1); % We only have one camera
  
 %% Init camera
 
  [nRet, nErrorCode] = PDC_Init;
  checkError(nRet,nErrorCode);
  
  % Detect the camera
  [nRet, nDetectNumInfo, nErrorCode] = PDC_DetectDevice(nInterfaceCode, nDetectNo, nDetectNum, nDetectParam);
  checkError(nRet,nErrorCode);
  DetectInfo = nDetectNumInfo.m_DetectInfo(1);
  
  % Open the connection to the camera
  [nRet, nDeviceNo, nErrorCode] = PDC_OpenDevice(DetectInfo);
  checkError(nRet,nErrorCode);
end

