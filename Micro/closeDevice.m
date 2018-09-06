function closeDevice(handles)

  calllib(handles.AliasLib,'dxl_terminate');
  unloadlibrary(handles.AliasLib);
end