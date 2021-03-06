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

% ampli: gain=30, varGain=max
amplitude=3.3; % % 0.33(1V), 3.3(10V) peak-to-peak
freq=1000; % 1000
freqStep= 50000;
tEvents=[0.01 0.03 10 0.087];

% Light
light=99;


% Loading the step events
disp('Loading events...');
setEvents_noise(micro,amplitude,light,freq,freqStep,tEvents);

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