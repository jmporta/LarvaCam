function data=read_byte(handles,pos)
    global COMM_RXSUCCESS;
  data=calllib(handles.AliasLib,'dxl_read_byte',handles.id,pos);  
  StatusError=calllib(handles.AliasLib,'dxl_get_result');    
  if StatusError~=COMM_RXSUCCESS
    error(['Read byte error: ' num2str(StatusError)]);
  end
end
  
  
  