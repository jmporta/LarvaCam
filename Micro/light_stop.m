function light_stop(handles)

  write_byte(handles.r.LIGHT_CONTROL,handles.r.LIGHT_STOP_DUTY);
end