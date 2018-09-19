% Run an experiment through a data table with amplitude,delayStep,delayBlock parameters 
function runExpTable(dataTable,freq,freqHz,tEvents,tStep,micro,nDeviceNo,nChildNo)
nBlocks=size(dataTable,1);
offset=1;

for i=1:nBlocks
    
        nSteps=dataTable(i,1);
        light=dataTable(i,2);
        amplitude=dataTable(i,3);
        delayStep=dataTable(i,4)-10; % ms (0.01 s from the initial event delay)
        delayBlock=dataTable(i,5); % ms
        
        setEvents(micro,amplitude,light,freq,freqHz,tEvents);
        
        if nSteps ~= 0
            if delayBlock >= tStep*nSteps %all steps, save final
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
            end
        end
        
end


end