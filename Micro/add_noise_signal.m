function n=add_noise_signal(handles,freq_hz,amplitude_v,offset_v)
    
    value=uint16(freq_hz);
    write_word(handles,handles.r.NOISE_GEN_FREQ,value);
    
    value=uint16(amplitude_v*1000);
    write_word(handles,handles.r.NOISE_GEN_AMPLITUDE,value);
    
    value=uint16(offset_v*1000);
    write_word(handles,handles.r.NOISE_GEN_OFFSET,value);
    
    write_byte(handles,handles.r.NOISE_GEN_CONTROL,handles.r.NOISE_GEN_ADD_BUFFER);
    
    num=read_byte(handles,handles.r.NOISE_GEN_NUM_BUFFERS);

    n=num-1;
    
end