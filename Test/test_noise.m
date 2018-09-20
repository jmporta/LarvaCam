%% Clean memory commands
clear all; % Clean all the memory
clc; % Clear command window

%% Initial conditions
port = 4; % microcontroller port (COM4)

%% Loading initial stuff

% Add lib paths
addpath('..\Micro'); % Micropocessor libs/function path
addpath('..\dxl_sdk_win64_v1_02\bin'); 
addpath('..\dxl_sdk_win64_v1_02\import');
  
% Open the connection of the microcontroller
disp('Opening microcontroller connection...');
micro=initDevice(port);
open_device(micro);

% Ping against the microcontroller (check)
disp('Checking microcontroller connection...');
ping(micro);


amplitude=3; %peak-to-peak
freq=10;
freqStep= 250;
tEvents=[0.01 0.03 1 0.087];


% Loading the step events
disp('Loading events...');
setEvents_noise(micro,amplitude,freq,freqStep,tEvents);

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

close_device(micro);