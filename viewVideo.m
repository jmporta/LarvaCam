function viewVideo(name)

v=VideoReader(name);

currAxes = axes;
c = gray(256);
colormap(c);

while hasFrame(v) 
    vidFrame = readFrame(v);
    image(vidFrame, 'Parent', currAxes);
    currAxes.Visible = 'off';
    %disp(['Frame ' num2str(v.FrameRate*v.CurrentTime)]);
    %pause(1/v.frameRate);
    %pause();
end
end
