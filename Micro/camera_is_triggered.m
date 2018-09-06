function ret=camera_is_triggered(handles)

  status=read_byte(handles.r.CAM_TRIG_CONTROL);
  if bitand(status,handles.r.CAM_TRIGGERED)
    ret=false;
  else
    ret=true;
  end
  
end