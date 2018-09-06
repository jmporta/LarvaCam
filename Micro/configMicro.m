function handles=configMicro(port) % po

  if ~exist('ERRBIT_VOLTAGE','var')
    addpath('Micro');
    handles=InitDevice(port); % verify port
  end
  
end