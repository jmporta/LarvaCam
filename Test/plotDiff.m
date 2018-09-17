function plotDiff(v)

  nf=v.Duration*v.FrameRate;
  
  d=zeros(1,nf);
  for i=1:nf
    d(i)=max(max(imabsdiff(getFrame(v,0),getFrame(v,i-1))));
  end
  plot(d);
end