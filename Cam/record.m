function saveTime=record(nDeviceNo,nChildNo,handles,expID,expInd,nSteps,offset,delayStep,blockName,savePath)
  global g
  
  % Set camera to trigger-waiting mode
  [nRet, nErrorCode] = PDC_SetRecReady(nDeviceNo);
  checkError(nRet,nErrorCode);
  
  % Do the steps
  for i=1:nSteps
    start_events(handles);
    
    done = false;
    while(~done)
      done=events_are_done(handles);
    end
    
    java.lang.Thread.sleep(delayStep);
  end
  
  t=clock;
  
  % Stop recording status -> return to live status
  [nRet, nErrorCode] = PDC_SetStatus(nDeviceNo, g.PDC_STATUS_LIVE);
  checkError(nRet,nErrorCode);
  waitState(nDeviceNo,g.PDC_STATUS_LIVE);
  
  % The system must be in playback mode to get the data
  [nRet, nErrorCode ] = PDC_SetStatus( nDeviceNo, g.PDC_STATUS_PLAYBACK );
  checkError(nRet,nErrorCode);
  waitState(nDeviceNo,g.PDC_STATUS_PLAYBACK);
  
  % Get the number of frames in memory
  [nRet, fInfo, nErrorCode] = PDC_GetMemFrameInfo(nDeviceNo, nChildNo);
  checkError(nRet,nErrorCode);
  frame1=fInfo.m_nStart;
  frame2=fInfo.m_nEnd;
  frameTrigger=(frame2-frame1+1)/nSteps; % frames at each trigger
  currentFrame=frame1-1; % First frame to save (numbering from 1!)
  
  % Save
 
  vRate=uint32(30);
    
    for it=1:nSteps
        nlpszFileName=sprintf(savePath + '%s_%u%s_step_%u.avi',expID,expInd,blockName,it-1+offset);
        
        disp(['Saving ' nlpszFileName]);
        
        [nRet, nErrorCode] = PDC_AVIFileSaveOpen(nDeviceNo, nChildNo, nlpszFileName,vRate,g.FALSE);
        checkError(nRet,nErrorCode);
        
        for i=1:frameTrigger
            [nRet, ~, nErrorCode] = PDC_AVIFileSave(nDeviceNo, nChildNo, currentFrame+i);
            checkError(nRet,nErrorCode);
        end
        currentFrame=currentFrame+frameTrigger;
        
        [nRet, nErrorCode] = PDC_AVIFileSaveClose(nDeviceNo, nChildNo);
        checkError(nRet,nErrorCode);
    end
  
  % Return to the live status
  [nRet, nErrorCode] = PDC_SetStatus(nDeviceNo, g.PDC_STATUS_LIVE);
  checkError(nRet,nErrorCode);
  waitState(nDeviceNo,g.PDC_STATUS_LIVE);
  
  saveTime =etime(clock,t);
  disp(['    -> Video/s saved in ' num2str(saveTime) ' s']);
end