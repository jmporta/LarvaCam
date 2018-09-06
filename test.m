clear all; % Clean all the memory
clc; % Clear command window

%% Initial conditions
port = 4; % microcontroller port (COM4)

%% Loading initial stuff

% Init some error global variables
disp('Loading environment...');
initEnvironment;

% Open the connection of the microcontroller
disp('Opening microcontroller connection...');
micro=initDevice(port);
open_device(micro);

% Ping against the microcontroller (check)
disp('Checking microcontroller connection...');
ping(micro);

% Loading the step events
disp('Loading events...');
basic_events(micro);

%% Running the steps
disp('Running steps...');
start_events(micro);

done = false;
tic;
while(~done)
       done=events_are_done(micro);
      %disp('events running');
      %pause(1);
end
toc

% % Open the connection of the camera
% [nDeviceNo, nChildNo]=initCamera;
% 
% % Configure the camera
% configCamera(nDeviceNo,nChildNo);
% 
% % Get an image, just to check that the camera actually works
% [nData,h]=getImage(nDeviceNo, nChildNo);

% % Proceed to the experiment: record images (deviceNum,childNum,micro,block,step,nt)
% record(nDeviceNo,nChildNo,micro,1,2);
% 
% % Stop the camera
% closeCamera(nDeviceNo);

close_device(micro);