function setEvents(handles,amplitude,light,freq,freqHz,tEvents)

% Set the discretization interval of the noise (dx)
set_dac_sampling_freq(handles,freqHz);

% Clear the previous events and noises
clear_events(handles);
clear_noise_signals(handles);
pause(0.05); % gap time (inside clear_noise??)

% Set the noise
noise_id=add_noise_signal(handles,freq,amplitude,amplitude/2);

% Set the events (The time steps are incremental. Total default: 120 ms)

event1_id=add_event(handles,tEvents(1)); %0.01 default
action1_id=add_event_action(handles,event1_id,handles.r.CAMERA_START);
%action2_id=add_event_action(handles,event1_id,bitor(handles.r.LIGHT_START,50));

event2_id=add_event(handles,tEvents(2)); %0.03 default
action3_id=add_event_action(handles,event2_id,bitor(handles.r.NOISE_START,noise_id));

event3_id=add_event(handles,tEvents(3));%0.003 default
action4_id=add_event_action(handles,event3_id,handles.r.NOISE_STOP);

event4_id=add_event(handles,tEvents(4));%0.087 default
action5_id=add_event_action(handles,event4_id,handles.r.CAMERA_STOP);
%action6_id=add_event_action(handles,event4_id,handles.r.LIGHT_STOP);


end