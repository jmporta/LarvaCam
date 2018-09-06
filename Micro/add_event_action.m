function n=add_event_action(handles,event_id,action)

  write_byte(handles,handles.r.EVENTS_EVENT_ID,event_id);
  write_dword(handles,handles.r.EVENTS_DATA,action);
  
  write_byte(handles,handles.r.EVENTS_CONTROL,handles.r.EVENTS_ADD_ACTION);
  num=read_byte(handles,handles.r.EVENTS_NUM_ACTIONS+event_id);

  n=num-1;
end