function clear_events(handles)
  
    write_byte(handles,handles.r.EVENTS_CONTROL,handles.r.EVENTS_CLEAR_ALL);
    
end