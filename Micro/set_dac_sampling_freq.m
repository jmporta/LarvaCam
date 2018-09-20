function set_dac_sampling_freq(handles,freqStep)
  
  % Discretization interval of the noise (dx)
  value=uint16(freqStep);
  write_word(handles,handles.r.NOISE_GEN_SAMPLING_FREQ,value);

end