function tm=record(nDeviceNo,nChildNo,micro,block,step,nt,delay)
  global g
  
  % Assumes the camera is already initialized 
  saveAVI=true;
  
  % Set camera to trigger-waiting mode
  [nRet, nErrorCode] = PDC_SetRecReady(nDeviceNo);
  checkError(nRet,nErrorCode);
     
  tBefore=30;
  tAfter=90;
  tLatency=130;
  
  tm=zeros(1,nt);
  t0=clock();
  
  for i=1:nt   
    % There is a considerable delay in the sound generation. Thus
    % we first send the sound and then trigger the camera, even
    % waiting in between.
    %sound(wav,sampleFreq); % should last 3ms
    %java.lang.Thread.sleep(200); 
    
    while ~isDone(g.fileReader)
        audioData = g.fileReader();
        g.deviceWriter(audioData);
    end
    reset(g.fileReader); % ready to play again
    java.lang.Thread.sleep(tLatency-tBefore);
    
    if i>1
      t1=clock;
      tm(i)=etime(t1,t0);
      t0=t1;
    end
    [nRet, nErrorCode] = PDC_TriggerIn(nDeviceNo);
    checkError(nRet,nErrorCode);
    
    java.lang.Thread.sleep(delay*1000-tAfter-(tLatency-tBefore));
  end
  
  % Stop recording -> return to live status
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
  frameTrigger=(frame2-frame1+1)/nt; % frames at each trigger
  currentFrame=frame1-1; % First frame to save (numbering from 1!)
  
  disp(['Num frames     : ' num2str(frame2-frame1+1)]);
  disp(['Frames/trigger : ' num2str(frameTrigger)]);
  
  % Save
  t=clock;
  if saveAVI
    vRate=uint32(30);
    
    for it=1:nt
        nlpszFileName=sprintf('block_%u_step_%u.avi',block,step+it-1);
        
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
  else
    [nRet, nDepth, nErrorCode] = PDC_GetMemBitDepth(nDeviceNo, nChildNo);
    checkError(nRet,nErrorCode);
    if nDepth==8
        bd=g.PDC_MRAW_BITDEPTH_8;
    else
        bd=g.PDC_MRAW_BITDEPTH_12;
    end
    
    for it=1:nt
        nlpszFileName=sprintf('block_%u_step_%u.raw',block,step+it-1);
        
        disp(['Saving ' nlpszFileName]);
        
        [nRet, nErrorCode] = PDC_MRAWFileSaveOpen(nDeviceNo, nChildNo, nlpszFileName, bd, frameTrigger);
        checkError(nRet,nErrorCode);
        
        for i=i:frameTrigger
            [nRet, nErrorCode] = PDC_MRAWFileSave(nDeviceNo, nChildNo, currentFrame+i);
            checkError(nRet,nErrorCode);
        end
        currentFrame=currentFrame+frameTrigger;
        
        [nRet, nErrorCode] = PDC_MRAWFileSaveClose(nDeviceNo, nChildNo);
        checkError(nRet,nErrorCode);
    end
  end
  disp(['Images saved in ' num2str(etime(clock,t)) ' sec']);
  
  % Return to the live status
  [nRet, nErrorCode] = PDC_SetStatus(nDeviceNo, g.PDC_STATUS_LIVE);
  checkError(nRet,nErrorCode);
  waitState(nDeviceNo,g.PDC_STATUS_LIVE);