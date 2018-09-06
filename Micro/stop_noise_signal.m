function stop_noise_signal(handles)

  write_byte(handles.r.NOISE_GEN_CONTROL,handles.r.NOISE_GEN_STOP);
end