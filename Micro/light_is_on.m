function ret=light_is_on(handles)

  status=read_byte(handles,handles.r.LIGHT_CONTROL);
  if bitand(status,handles.r.LIGHT_ON)
    ret=false;
  else
    ret=true;
  end
end