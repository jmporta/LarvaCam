function waitState(nDeviceNo,state)

  [nRet, nStatus, nErrorCode] = PDC_GetStatus(nDeviceNo);
  checkError(nRet,nErrorCode);
  while nStatus~=state
    [nRet, nStatus, nErrorCode] = PDC_GetStatus(nDeviceNo);
    checkError(nRet,nErrorCode);
  end
end