function [micro,nDeviceNo,nChildNo,connected]=initConnections(port)
% Open microcontroller connection
disp('Opening microcontroller connection...');
micro=initDevice(port);
open_device(micro);

% Ping against the microcontroller (check)
disp('Checking microcontroller connection...');
ping(micro);

% Open cam connection
disp('Opening cam connection...');
[nDeviceNo, nChildNo]=initCamera;

% Config cam
disp('Configurating cam...');
%configCamera(nDeviceNo,nChildNo,framesToRec,framesRate,vWidth,vHeight);
configCamera(nDeviceNo,nChildNo,framesToRec,framesRate,vWidth,vHeight);

disp('Ready to run the experiment.')
connected = true;
end