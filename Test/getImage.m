function [nData,h]=getImage(nDeviceNo, nChildNo)
  
  global g;
  
  % Assumes that camera is already initialized
  
  %[nRet, nDepth, nErrorCode] = PDC_GetBitDepth(nDeviceNo, nChildNo);
  %checkError(nRet,nErrorCode);
  
  [nRet, nWidth, nHeight, nErrorCode] = PDC_GetResolution(nDeviceNo, nChildNo);
  checkError(nRet,nErrorCode);
  
  [nRet, cMode, nErrorCode] = PDC_GetColorType(nDeviceNo, nChildNo);
  checkError(nRet,nErrorCode);
  
  nBayer=uint32(0);

  % must be in live mode to get images
  [nRet, nErrorCode] = PDC_SetStatus(nDeviceNo, g.PDC_STATUS_LIVE);
  checkError(nRet,nErrorCode);
  waitState(nDeviceNo,g.PDC_STATUS_LIVE);
  
  % Get and display image
  [nRet, nData, nErrorCode] = PDC_GetLiveImageData(nDeviceNo, nChildNo, 8, cMode, nBayer, nWidth, nHeight);
  checkError(nRet,nErrorCode);
  
  h=figure();
  colormap(h,gray(256));
  image(nData');
end
