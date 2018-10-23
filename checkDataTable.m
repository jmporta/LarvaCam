function check = checkDataTable(dataTable,tStep)

nBlocks = size(dataTable,1);

for i=1:nBlocks
    
    check=true;
    nSteps=dataTable(i,1);
    light=dataTable(i,2);
    amplitude=dataTable(i,3);
    delayStep = dataTable(i,4);
    delayBlock = dataTable(i,5);
    
    if nSteps < 0
        ME=MException('WrongInput:error', 'The number of the steps must be positive.');
        throw(ME); 
    end
    if light ~= 0 && light ~= 1
        ME=MException('WrongInput:error', 'The light value must be [0=OFF, 1=ON].');
        throw(ME); 
    end
    if amplitude ~= 0 && amplitude ~= 1 && amplitude ~= 2
        ME=MException('WrongInput:error', 'The max. acceleration must be [0= None, 1=Soft, 2= Hard].');
        throw(ME); 
    end
    if delayBlock < tStep*nSteps && delayStep < tStep
        ME=MException('WrongInput:error', 'Conflicting delay values. The time limit (tStep=%d ms) to save an image is smaller than the delay step (delayStep=%d ms).',tStep,delayStep);
        throw(ME); 
    end

end