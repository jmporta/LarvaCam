function configCamera(nDeviceNo,nChildNo)
  global g;
  
  % ----------------------------------------------------------------
  % Configuration parameters
  % ----------------------------------------------------------------
  
  tMode=g.PDC_TRIGGER_RANDOM; %manual
  nAFrames=uint32(0); % not used in random trigger mode
  nRFrames=uint32(120); % Frames to record after each trigger
  nRCount=uint32(10); % not used in random trigger mode
  
  rMode=g.PDC_RECORDING_TYPE_READY_AND_TRIG; % record mode: Input the "REC"trigger after the camera is in the "READY" state.
  
  nRate=uint32(1000); % 1000 frames/s
  
  nCount=uint32(1); % No. partitions
  nBlocks=uint32(0); % Partition blocks
  
  nWidth=uint32(896); % Image resolution
  nHeight=uint32(896);  % Image resolution
  
  % ----------------------------------------------------------------
  % ----------------------------------------------------------------
  
  % To configure the status, the camera must be in live mode
  [nRet, nErrorCode] = PDC_SetStatus(nDeviceNo, g.PDC_STATUS_LIVE);
  checkError(nRet,nErrorCode);
  waitState(nDeviceNo,g.PDC_STATUS_LIVE);
  
  % Set the trigger mode
  [nRet, nErrorCode] = PDC_SetTriggerMode(nDeviceNo, tMode, nAFrames, nRFrames, nRCount);
  checkError(nRet,nErrorCode);
  
  % Set the recording type: rec+trigger
  [nRet, nErrorCode] = PDC_SetRecordingType(nDeviceNo, rMode);
  checkError(nRet,nErrorCode);
  
  % Frame rate (1000)
  [nRet, nErrorCode] = PDC_SetRecordRate(nDeviceNo, nChildNo, nRate);
  checkError(nRet,nErrorCode);
  
  % Resolution (896x896)
  [nRet, nErrorCode] = PDC_SetResolution(nDeviceNo, nChildNo, nWidth, nHeight);
  checkError(nRet,nErrorCode);
  
  % Ensure we use a single partition (store as much images as possible)
  [nRet, nErrorCode] = PDC_SetPartitionList(nDeviceNo, nChildNo, nCount, nBlocks);
  checkError(nRet,nErrorCode);
  
  % Trigger input mode
  nMode=g.PDC_EXT_IN_TRIGGER_NEGA;
  nPort=2;
  [nRet, nErrorCode] = PDC_SetExternalInMode(nDeviceNo, nPort, nMode);
  checkError(nRet,nErrorCode);
  
  % just for curiosity, get the maximum number of frames that fit in memory
  %[nRet, nFrames, nBlocks, nErrorCode] = PDC_GetMaxFrames(nDeviceNo, nChildNo); % nFrames that can be stored in memory
  %checkError(nRet,nErrorCode);
end