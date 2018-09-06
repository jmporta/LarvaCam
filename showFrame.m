function showFrame(v,frame)
  vidFrame=getFrame(v,frame);
  gcf;
  c = gray(256);
  colormap(c);
  image(vidFrame);
end