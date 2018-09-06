function vidFrame=getFrame(v,frame)
  v.CurrentTime=frame/v.frameRate;
  vidFrame = readFrame(v);
end