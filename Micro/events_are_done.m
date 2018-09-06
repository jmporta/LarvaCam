function ret=events_are_done(handles)

  status=read_byte(handles,handles.r.EVENTS_CONTROL);
  
  if bitand(status,handles.r.EVENTS_RUNNING)
    ret=false;
  else
    ret=true;
  end
  
end