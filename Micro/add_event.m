function n=add_event(handles,time)

  value=uint32(time*1000.0);
  write_dword(handles,handles.r.EVENTS_DATA,value);
  
  write_byte(handles,handles.r.EVENTS_CONTROL,handles.r.EVENTS_ADD_EVENT);
  num=read_byte(handles,handles.r.EVENTS_NUM_EVENTS);

  n=num-1;
end