function start_noise_signal(handles,buffer_id)

   write_byte(handles.r.NOISE_GEN_BUFFER_ID,buffer_id);
   write_byte(handles.r.NOISE_GEN_CONTROL,handles.r.NOISE_GEN_START);
end