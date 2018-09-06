function set_dac_voltage(handles,voltage)

  value=uint16(voltage*1000.0);
  write_word(handles.r.NOISE_GEN_DAC_VCC,value);
end