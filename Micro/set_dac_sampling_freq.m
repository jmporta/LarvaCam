function set_dac_sampling_freq(handles,freq_hz)
  
  % Discretization interval of the noise (dx)
  value=uint16(freq_hz);
  write_word(handles,handles.r.NOISE_GEN_SAMPLING_FREQ,value);

end