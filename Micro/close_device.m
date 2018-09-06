function close_device(handles)

  calllib(handles.AliasLib,'dxl_terminate');

end