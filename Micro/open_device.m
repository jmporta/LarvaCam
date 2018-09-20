function open_device(handles)

  global COMM_RXSUCCESS
  
  response = calllib(handles.AliasLib,'dxl_initialize',handles.DEFAULT_PORTNUM,handles.DEFAULT_BAUDNUM);
  
  if response ~= COMM_RXSUCCESS % if port does not opens
    ME=MException('DeviceUndetected:error','Microprocessor connection failed.');
    throw(ME); 
    %StatusError=calllib(handles.AliasLib,'dxl_get_result');
    %error(strcat('Comm OK =',num2str(typecast(uint16(response),'int16')),'.    .','StatusError =',num2str(StatusError)));
  end
  
end