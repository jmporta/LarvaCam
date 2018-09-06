function stop_events(handles)

  write_byte(handles.r.EVENTS_CONTROL,handles.r.EVENTS_STOP);
  
end