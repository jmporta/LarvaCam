function ping(handles)
    
  global COMM_RXSUCCESS
  
  calllib(handles.AliasLib,'dxl_ping',handles.id) ;  
  StatusError=calllib(handles.AliasLib,'dxl_get_result');
  if StatusError~=COMM_RXSUCCESS
    ME=MException('DeviceUndetected:error','Ping against the microcontroller failed. Check and fix the default port of the microcontroller.');
    throw(ME);
    %error(['Write byte error: ' num2str(StatusError)]);
  end
end