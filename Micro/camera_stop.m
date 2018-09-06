function camera_stop(handles)

  write_byte(handles.r.CAM_TRIG_CONTROL,handles.r.CAM_TRIG_STOP);
end