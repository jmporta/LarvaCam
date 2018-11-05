% Run an experiment through a data table with amplitude,delayStep,delayBlock parameters 
function runExpTable(expID,savePath,dataTable,freq,freqStep,tEvents,tStep,micro,nDeviceNo,nChildNo)

nBlocks=size(dataTable,1);


if dataTable(:,2)
    light_set_duty_cycle(micro,99);
    light_start(micro);
end    

for i=1:nBlocks
    offset=1;
        % Get the initial data
        blockName=dataTable(i,1);
        nSteps=dataTable(i,2);
        light=dataTable(i,3);
        amplitude=dataTable(i,4);
        delayStep=dataTable(i,5)-10; % ms (0.01 s from the initial event delay)
        delayBlock=dataTable(i,6); % ms
        
        % Convert the amplitude index to a firmware amplitude
        if amplitude == 0
            amplitude = 0;
        elseif amplitude == 1
            amplitude = 0.33; % amplitude to 1V
        elseif amplitude == 2
            amplitude = 3.3; % amplitude to 10V
        end
        
        
        % Define the events
        setEvents(micro,amplitude,light,freq,freqStep,tEvents);
        
        % Run the events
        if nSteps ~= 0
            if delayBlock >= tStep*nSteps % all steps, save final
                saveTime=record(nDeviceNo,nChildNo,micro,expID,i,nSteps,offset,delayStep,blockName,savePath);
                java.lang.Thread.sleep(delayBlock-saveTime*1000);
                disp(delayBlock-saveTime*1000);
            elseif delayStep + 10 >= tStep % step by step, save on each step
                for j=1:nSteps
                     saveTime=record(nDeviceNo,nChildNo,micro,expID,i,1,offset,0,blockName,savePath);
                     offset=offset+1;
                     java.lang.Thread.sleep(delayStep-saveTime*1000);
                end
                java.lang.Thread.sleep(delayBlock);
            end
        end
end

if dataTable(:,2)
    light_stop(micro);
end

end