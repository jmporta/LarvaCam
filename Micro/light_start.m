function light_start(handles)

  write_byte(handles,handles.r.LIGHT_CONTROL,handles.r.LIGHT_START_DUTY);
end