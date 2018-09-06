function data=read_word(handles,pos)

  data=calllib(handles.AliasLib,'dxl_read_word',handles.id,pos); 
  StatusError=calllib(handles.AliasLib,'dxl_get_result'); 
  if StatusError~=COMM_TXSUCCESS
    error(['Read wrod error: ' num2str(StatusError)]);
  end
end
  
  
  