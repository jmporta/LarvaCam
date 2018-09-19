function iData=loadData(fileName)

% Load the initial data from a file

fileId = fopen(fileName,'r');
iData = fscanf(fileId,'%f %*[^\n]'); % read only first column
fclose(fileId);

end