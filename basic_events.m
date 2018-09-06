function basic_events(handles)

% Set the discretization interval of the noise (dx)
set_dac_sampling_freq(handles,50000);

% Clear the previous events and noises
clear_events(handles);
clear_noise_signals(handles);
pause(0.05); % gap time (inside clear_noise??)

% Set the noise
noise_id=add_noise_signal(handles,1000,1,0.5);

% Set the events (The time steps are incremental. Total: 120 ms)

event1_id=add_event(handles,0.01); 
action1_id=add_event_action(handles,event1_id,handles.r.CAMERA_START);
action2_id=add_event_action(handles,event1_id,bitor(handles.r.LIGHT_START,50));

event2_id=add_event(handles,0.03);
action3_id=add_event_action(handles,event2_id,bitor(handles.r.NOISE_START,noise_id));

event3_id=add_event(handles,0.003);
action4_id=add_event_action(handles,event3_id,handles.r.NOISE_STOP);

event4_id=add_event(handles,0.087);
action5_id=add_event_action(handles,event4_id,handles.r.CAMERA_STOP);
action6_id=add_event_action(handles,event4_id,handles.r.LIGHT_START);

end