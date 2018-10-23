function setEvents(handles,amplitude,light,freq,freqStep,tEvents)

% Set the discretization interval of the noise (dx)
set_dac_sampling_freq(handles,freqStep);

% Clear the previous events and noises
clear_events(handles);
clear_noise_signals(handles);
pause(0.05); % gap time (inside clear_noise??)

% Set the noise
try
    noise_id=add_noise_signal(handles,freq,amplitude,amplitude/2);
catch ME
    ME=MException('ConflictingInputs:error','The frequency time step value (freqStep= %d) overflow the microprocessor noise cache.', freqStep);
    throw(ME); 
end

% Set the events (The time steps are incremental. Total default: 120 ms)

event1_id=add_event(handles,tEvents(1)); %0.01 default
action1_id=add_event_action(handles,event1_id,handles.r.CAMERA_START);


event2_id=add_event(handles,tEvents(2)); %0.03 default
if (light==1)
    action3_id=add_event_action(handles,event2_id,bitor(handles.r.LIGHT_STOP));
else
    action3_id=add_event_action(handles,event2_id,bitor(handles.r.NOISE_START,noise_id));
end

event3_id=add_event(handles,tEvents(3));%0.003 default
if (light==1)
    action4_id=add_event_action(handles,event3_id,handles.r.LIGHT_START,99);
else
    action4_id=add_event_action(handles,event3_id,handles.r.NOISE_STOP);
end

event4_id=add_event(handles,tEvents(4));%0.087 default
action5_id=add_event_action(handles,event4_id,handles.r.CAMERA_STOP);



end