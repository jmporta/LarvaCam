function varargout = LarvaCam(varargin)
% LARVACAM MATLAB code for LarvaCam.fig
%      LARVACAM, by itself, creates a new LARVACAM or raises the existing
%      singleton*.
%
%      H = LARVACAM returns the handle to a new LARVACAM or the handle to
%      the existing singleton*.
%
%      LARVACAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LARVACAM.M with the given input arguments.
%
%      LARVACAM('Property','Value',...) creates a new LARVACAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LarvaCam_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LarvaCam_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LarvaCam

% Last Modified by GUIDE v2.5 19-Nov-2018 11:04:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LarvaCam_OpeningFcn, ...
                   'gui_OutputFcn',  @LarvaCam_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before LarvaCam is made visible.
function LarvaCam_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LarvaCam (see VARARGIN)

% Choose default command line output for LarvaCam
handles.output = hObject;

% UIWAIT makes LarvaCam wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%% Initial GUI Data

% Define the structure of the uitable
handles.nColmn =6;

% Set the default uitable experiment
set(handles.popupmenuNumBlocks,'Value',4)
set(handles.uitableData,'data',[{'Sensitivity'} 10 1 1 20000 0;
                                {'PreHabituation'} 10 1 2 20000 0;
                                {'Habituation'} 30 1 2 1000 180000;
                                {'Recovery'} 10 1 2 20000 0;]);

% connection flag
handles.connected=false;

handles.stop= false;
% Experiment id default
handles.expID = 'DefaultID';

% Habituation light default (seconds)
handles.habLight = 300;

% Save path
handles.savePath = strcat(getenv('HOMEDRIVE'),getenv('HOMEPATH'));
set(handles.pathBox, 'String', handles.savePath);

% Stablish the config files path
if isdeployed 
    % User is running an executable in standalone mode. 
    [status, result] = system('set PATH');
    execFolder = char(regexpi(result, 'Path=(.*?);', 'tokens', 'once'));
    %fprintf(1, '\nIn function GetExecutableFolder(), currentWorkingDirectory = %s\n', executableFolder);
else
    %User is running an m-file from the MATLAB integrated development environment (regular MATLAB).
    execFolder = pwd; 
end

disp('Loading init. config. file data...')
%% Initial Cam Configuration
try
    % Load cam config. data from file
    cData=loadData(strcat(execFolder,'\CamData.dat'));
    
    % Assign the data. The first row is the header, omitted.
    handles.camConf.framesToRec=cData(2);
    handles.camConf.framesRate=cData(3);
    handles.camConf.vWidth=cData(4);
    handles.camConf.vHeight=cData(5);
catch
   dialogbox=msgbox('The config. file "camData.dat" does not has the proper format. Please, fix it and restart de program.', 'Wrong Data', 'error');
   uiwait(dialogbox);
end

%% Initial Experiment Conditions
try
   % Load config. data from file
   iData=loadData(strcat(execFolder,'\initialData.dat'));

   % Assign the data. The first row is the header, omitted.
   handles.freq=iData(2); % freq of the wave (1000 default)
   handles.freqStep=iData(3); % Value of one step of the freq discretization
   handles.port=iData(4); % microcontroller port (COM4 default)
   handles.tEvents = zeros(1,4); %init array
   handles.tEvents = [iData(5)/1000 iData(6)/1000 iData(7)/1000 iData(8)/1000]; % Delay times of the events (event works in s)
   handles.tStep = iData(9); % Limit time to save an image between event steps
catch
   dialogbox=msgbox('The config. file "initialData.dat" does not has the proper format. Please, fix it and restart de program.', 'Wrong Data', 'error');
   disp('ERROR: The config. file "initialData.dat" does not has the proper format. Please, fix it and restart de program.');
   set(handles.pushbuttonConnect,'Enable','off');
   set(handles.textConnect,'BackgroundColor','yellow');
   set(handles.textConnect,'String','Invalid conf.');
   uiwait(dialogbox); 
end

if uint16((handles.camConf.framesToRec/handles.camConf.framesRate)*1000) < uint16((sum(handles.tEvents)-handles.tEvents(1))*1000)
   dialogbox=msgbox('The time of the event step is larger than the cam recording time: FramesToRec/framesRate < sum_i(tEvents(i)). Please, fix it on the config files and restart de program.', 'Wrong Data', 'error');
   disp('ERROR: The time of the event step is larger than the cam recording time: FramesToRec/framesRate < sum_i(tEvents(i)). Please, fix it on the config files and restart de program.')
   set(handles.pushbuttonConnect,'Enable','off');
   set(handles.textConnect,'BackgroundColor','yellow');
   set(handles.textConnect,'String','Invalid conf.');
   uiwait(dialogbox); 
end

disp('Waiting for a connection...');

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = LarvaCam_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbuttonRun.
function pushbuttonRun_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonRun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get the table data
tableData=get(handles.uitableData,'Data');

% Block the button while running
set(handles.pushbuttonRun,'Enable','off');  

% Start progress icon
loopProgress(true);

try
    disp('Checking the table data...');
    checkDataTable(tableData,handles.tStep); % Check the data table

    disp('Running the experiment...');
    % Run the experiment through a table
    handles.expID = get(handles.editID,'String');
    handles.habLight = str2num(get(handles.habLightText,'String'));
    runExpTable(handles.expID,handles.habLight,handles.savePath,tableData,handles.freq,handles.freqStep,handles.tEvents,handles.tStep,handles.micro,handles.nDeviceNo,handles.nChildNo);

    disp('Experiment DONE.');
    dialogbox=msgbox('Experiment done!', 'Success', 'help');
    uiwait(dialogbox);
    
    % Unblock the button
    set(handles.pushbuttonRun,'Enable','on');
catch ME
    dialogbox=msgbox(ME.message, 'Error', 'error');
    disp(strcat('ERROR: ',ME.message));
    set(handles.textConnect,'BackgroundColor','red');
    set(handles.textConnect,'String','Not Connected');
    set(handles.pushbuttonRun,'Enable','off');
    
    uiwait(dialogbox);
end

% Stop progress icon
loopProgress(false);



% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Close the connections of the cam and the micro
if handles.connected == true
    closeConnections(handles.nDeviceNo,handles.micro);
end
disp('LarvaCam closed.');
% Hint: delete(hObject) closes the figure
delete(hObject);


% --- Executes on button press in pushbuttonConnect.
function pushbuttonConnect_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonConnect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Close divices connections and init devices connectons again

if handles.connected == true
    set(handles.textConnect,'BackgroundColor','red');
    set(handles.textConnect,'String','Not Connected');
    set(handles.pushbuttonRun,'Enable','off');
    handles.connected = false;
    closeConnections(handles.nDeviceNo,handles.micro);
end

try
	[handles.micro,handles.nDeviceNo,handles.nChildNo,handles.connected]=initConnections(handles.port,handles.camConf);
    light_stop(handles.micro); %Close the light
catch ME
    dialogbox=msgbox(ME.message, 'Error', 'error');
    disp(strcat('ERROR: ',ME.message));
    set(handles.textConnect,'BackgroundColor','red');
    set(handles.textConnect,'String','Not Connected');
    set(handles.pushbuttonRun,'Enable','off');
    uiwait(dialogbox);
end

if handles.connected == true
    set(handles.textConnect,'BackgroundColor','green');
    set(handles.textConnect,'String','Connected');
    set(handles.pushbuttonRun,'Enable','on');
end

% Update handles structure
guidata(hObject, handles);

% --- Executes on selection change in popupmenuNumBlocks.
function popupmenuNumBlocks_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenuNumBlocks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenuNumBlocks contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenuNumBlocks

% Set the number of  the blocks (rows)
nRows = get(hObject,'Value');
if nRows == 1
    set(handles.uitableData,'data',[{'testName'} 1 1 1 6000 1000]);
elseif nRows == 4
    set(handles.uitableData,'data',[{'Sensitivity'} 10 1 1 20000 20000;
                                {'PreHabituation'} 10 1 2 20000 20000;
                                {'Habituation'} 30 1 2 1000 180000;
                                {'Recovery'} 30 1 2 20000 20000;]);
else
    set(handles.uitableData,'data',cell(nRows,handles.nColmn)); % Redifine the dimensions of the uitable
end

% --- Executes during object creation, after setting all properties.
function popupmenuNumBlocks_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenuNumBlocks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function uitableData_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitableData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function editID_Callback(hObject, eventdata, handles)
% hObject    handle to editID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editID as text
%        str2double(get(hObject,'String')) returns contents of editID as a double


% --- Executes during object creation, after setting all properties.
function editID_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pathBox_Callback(hObject, eventdata, handles)
% hObject    handle to pathBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pathBox as text
%        str2double(get(hObject,'String')) returns contents of pathBox as a double


% --- Executes during object creation, after setting all properties.
function pathBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pathBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in selectPath.
function selectPath_Callback(hObject, eventdata, handles)
    defaultPath = strcat(getenv('HOMEDRIVE'),getenv('HOMEPATH'));
   
    handles.savePath = uigetdir(defaultPath);
    
    if (handles.savePath == 0)
        handles.savePath = defaultPath;
        set(handles.pathBox, 'String', defaultPath);
    else
        set(handles.pathBox, 'String', handles.savePath);
    end
    
guidata(hObject, handles);
% hObject    handle to selectPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function habLightText_Callback(hObject, eventdata, handles)
% hObject    handle to habLightText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of habLightText as text
%        str2double(get(hObject,'String')) returns contents of habLightText as a double
    str = get(hObject,'String');
    if isempty(str2num(str))
        set(hObject,'string','3000');
        warndlg('Habituation light input must be numerical.');
    end

% --- Executes during object creation, after setting all properties.
function habLightText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to habLightText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
