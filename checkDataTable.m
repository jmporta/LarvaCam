function check = checkDataTable(dataTable)

nBlocks = size(dataTable,1);

for i=1:nBlocks
    
    check=true;
    nSteps=dataTable(i,1);
    light=dataTable(i,2);
    amplitude=dataTable(i,3);
    delayStep = dataTable(i,4);
    delayBlock = dataTable(i,5);
    
    if nSteps < 0
        check = false;
    end
    if light < 0 || light > 1
        check = false;
    end
    if amplitude < 0
        check = false;
    end
    if delayBlock < 7000*nSteps && delayStep < 7000
        check = false;
    end

end