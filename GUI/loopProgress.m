function loopProgress(mode)

iconsClassName = 'com.mathworks.widgets.BusyAffordance$AffordanceSize';
iconsSizeEnums = javaMethod('values',iconsClassName);
SIZE_32x32 = iconsSizeEnums(2);  % (1) = 16x16,  (2) = 32x32
jObj = com.mathworks.widgets.BusyAffordance(SIZE_32x32, '');  % icon, label
jObj.setPaintsWhenStopped(false);  % default = false
jObj.useWhiteDots(false);         % default = false (true is good for dark backgrounds)
javacomponent(jObj.getComponent, [435,23,32,32], gcf);

if mode == true % start
    jObj.start;
end

if mode == false % stop
    jObj.stop;
    %jObj.setBusyText('All done!');
end


%%% https://undocumentedmatlab.com/blog/animated-busy-spinning-icon

end