function initPaths

    if ~isdeployed
      %% Add lib paths
      addpath('Micro'); % Micropocessor libs/function path
      addpath('.\dxl_sdk_win64_v1_02\bin');
      addpath('.\dxl_sdk_win64_v1_02\import');
      addpath('Cam'); % Cam libs/functions path
      addpath('Cam\libsPCD'); % CamPCD libs/functions path
      addpath('GUI'); % GUI path
      addpath('.\SharedLibsProt') % dll prototypes path
      addpath('.\Patches') % patches for matlab bugs
    end
      
end
  
  