function light_set_duty_cycle(handles,duty)

  value=int8(duty);
  write_byte(handles.r.LIGHT_DUTY_CYCLE,value);
end