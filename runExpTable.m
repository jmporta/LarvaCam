% Run an experiment through a data table with amplitude,delayStep,delayBlock parameters 
function runExpTable(dataTable,freq,freqStep,tEvents,tStep,micro,nDeviceNo,nChildNo)

nBlocks=size(dataTable,1);
offset=1;

for i=1:nBlocks
    
        % Get the initial data
        nSteps=dataTable(i,1);
        light=dataTable(i,2);
        amplitude=dataTable(i,3);
        delayStep=dataTable(i,4)-10; % ms (0.01 s from the initial event delay)
        delayBlock=dataTable(i,5); % ms
        
        % Convert the amplitude index to a firmware amplitude
        if amplitude == 0
            amplitude = 0;
            light = 1;
        elseif amplitude == 1
            amplitude = 0.33; % amplitude to 1V
            light = 0;
        elseif amplitude == 2
            amplitude = 3.3; % amplitude to 10V
            light = 0;
        end
        
        if light == 1
            light_set_duty_cycle(micro,99);
            light_start(micro);
        end
        
        % Define the events
        setEvents(micro,amplitude,light,freq,freqStep,tEvents);
        
        % Run the events
        if nSteps ~= 0
            if delayBlock >= tStep*nSteps % all steps, save final
                saveTime=record(nDeviceNo,nChildNo,micro,i,nSteps,offset,delayStep);
                java.lang.Thread.sleep(delayBlock-saveTime*1000);
                disp(delayBlock-saveTime*1000);
            elseif delayStep + 10 >= tStep % step by step, save on each step
                for j=1:nSteps
                     saveTime=record(nDeviceNo,nChildNo,micro,i,1,offset,0);
                     offset=offset+1;
                     java.lang.Thread.sleep(delayStep-saveTime*1000);
                end
                java.lang.Thread.sleep(delayBlock);
            else
                ME=MException('ConflictingInputs:error','The time limit (tStep=%d ms) to save an image is smaller than the delay step (delayStep=%d ms).',tStep,delayStep);
                throw(ME); 
            end
        end
        
end


end