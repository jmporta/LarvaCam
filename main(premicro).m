% Init some global variables
initEnvironment;

% Open the connection with the camera
[nDeviceNo, nChildNo]=initCamera;

% Configure the camera
configCamera(nDeviceNo,nChildNo);

% Get an image, just to check that the camera actually works
[nData,h]=getImage(nDeviceNo, nChildNo);

% Open the connection with the microcontroler
micro=InitDevice(4);

% Proceed to the experiment: record images (synchronized with vibration)
record(nDeviceNo,nChildNo,micro,1,2);

% Read video
v=VideoReader('block_1_step_1.avi');

% compare images
imshowpair(getFrame(v,0),getFrame(v,10),'diff');

% Stop the camera
closeCamera(nDeviceNo);