function check = checkDataTable(dataTable,tStep)

nBlocks = size(dataTable,1);

for i=1:nBlocks
    
    check = true;
    nSteps = dataTable{i,2};
    light = dataTable{i,3};
    amplitude = dataTable{i,4};
    delayStep = dataTable{i,5};
    delayBlock = dataTable{i,6};
    
    if ~isnumeric(nSteps) || isnan(nSteps) || nSteps < 0
        ME=MException('WrongInput:error', 'The number of the steps must be a positive integer.');
        throw(ME); 
    end
    if light ~= 0 && light ~= 1
        ME=MException('WrongInput:error', 'The light value must be [0=OFF, 1=ON].');
        throw(ME); 
    end
    if amplitude ~= 0 && amplitude ~= 1 && amplitude ~= 2
        ME=MException('WrongInput:error', 'The shake value must be [0=None, 1=Soft, 2= Heavy].');
        throw(ME); 
    end
    if ~isnumeric(delayBlock) || isnan(delayBlock) || delayBlock < 0
        ME=MException('WrongInput:error', 'The delayStage value must be a positive integer.');
        throw(ME); 
    end
    if ~isnumeric(delayStep) || isnan(delayStep) || delayStep < 0
        ME=MException('WrongInput:error', 'The delayStep value must be a positive integer.');
        throw(ME); 
    end
    if (delayBlock < tStep*nSteps) && (delayStep + 10 < tStep)
        ME=MException('WrongInput:error', 'Conflicting delay values in stage %i.\n \n If (delayStage < tStep*nSteps) and (delayStep < tStep) the resultant video cannot be saved due to the limitation of the camera cache.\n\n The tStep=%d is the limit video recording time. \n\n Try to readjust the values or change the current values of tStep and/or the camera resolution.',i,tStep);
        throw(ME); 
    end

end