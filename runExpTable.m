% Run an experiment through a data table with amplitude,delayStep,delayBlock parameters 
function runExpTable(dataTable,nSteps,micro,nDeviceNo,nChildNo)
nBlocks=size(dataTable,1);
offset=1;

for i=1:nBlocks
        amplitude=dataTable(i,1);
        delayStep=dataTable(i,2); % milliseconds
        delayBlock=dataTable(i,3); % milliseconds
        
        setEvents(micro,amplitude);
        
        if delayBlock >= 170000 %all steps, save final
            record(nDeviceNo,nChildNo,micro,i,nSteps,offset,delayStep);
            java.lang.Thread.sleep(delayBlock);
        elseif delayStep >= 7000 % step by step, save on each step
            for j=1:nSteps
                 record(nDeviceNo,nChildNo,micro,i,1,offset,delayStep);
                 offset=offset+1;
            end
            java.lang.Thread.sleep(delayBlock);
        else
            disp('The cam cannot work with these delay values.');
        end
end


end