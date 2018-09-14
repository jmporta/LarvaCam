function closeConnections(nDeviceNo,micro)
% Stop cam
closeCamera(nDeviceNo);

% Stop microprocessor
close_device(micro);