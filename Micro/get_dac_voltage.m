function voltage=get_dac_voltage(handles)

  value=read_word(handles.r.NOISE_GEN_DAC_VCC);
  voltage=singel(value)/1000.0;
  
end