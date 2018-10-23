function value=light_get_duty_cycle(handles)

  value=read_byte(handles,handles.r.LIGHT_DUTY_CYCLE);
end