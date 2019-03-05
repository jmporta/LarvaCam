function write_word(handles,pos,value)

    global COMM_RXSUCCESS
    
  calllib(handles.AliasLib,'dxl_write_word',handles.id,pos,uint16(value)) ;  
  StatusError=calllib(handles.AliasLib,'dxl_get_result');  
  if StatusError~=COMM_RXSUCCESS
    error(['Write word error: ' num2str(StatusError)]);
  end
end
  
  
  
