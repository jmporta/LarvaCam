function freq_hz=get_dac_sampling_freq(handles)
  
  value=read_word(handles.r.NOISE_GEN_SAMPLING_FREQ);
  freq_hz=single(value);
end
  