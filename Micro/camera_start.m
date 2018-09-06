function camera_start(handles)

  write_byte(handles.r.CAM_TRIG_CONTROL,handles.r.CAM_TRIG_START);
end