function write_byte(handles,pos,value)
    global COMM_RXSUCCESS
  calllib(handles.AliasLib,'dxl_write_byte',handles.id,pos,int8(value)) ;  
  StatusError=calllib(handles.AliasLib,'dxl_get_result'); 
  if StatusError~=COMM_RXSUCCESS
    error(['Write byte error: ' num2str(StatusError)]);
  end
end