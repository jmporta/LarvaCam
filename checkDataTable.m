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
        ME=MException('WrongInput:error', 'The max. acceleration must be [0=None, 1=Soft, 2= Hard].');
        throw(ME); 
    end
    if (delayBlock < tStep*nSteps) && (delayStep + 10 < tStep)
        ME=MException('WrongInput:error', 'Conflicting delay values in block %i.\n \n If (delayBlock < tStep*nSteps) and (delayStep < tStep) the resultant video cannot be saved due to the limitation of the camera cache.\n\n Try to readjust the values or change the values of tStep=%d and/or the camera resolution.',i,tStep);
        throw(ME); 
    end

end