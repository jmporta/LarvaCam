function closeCamera(nDeviceNo)
  global g;

  [nRet, nErrorCode] = PDC_CloseDevice(nDeviceNo);
  checkError(nRet,nErrorCode);
  
 release(g.fileReader);
 release(g.deviceWriter);
end