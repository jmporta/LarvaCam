function clear_noise_signals(handles)

    write_byte(handles,handles.r.NOISE_GEN_CONTROL,handles.r.NOISE_GEN_CLEAR);
    
end