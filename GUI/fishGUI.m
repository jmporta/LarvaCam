function varargout = fishGUI(varargin)
% FISHGUI MATLAB code for fishGUI.fig
%      FISHGUI, by itself, creates a new FISHGUI or raises the existing
%      singleton*.
%
%      H = FISHGUI returns the handle to a new FISHGUI or the handle to
%      the existing singleton*.
%
%      FISHGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FISHGUI.M with the given input arguments.
%
%      FISHGUI('Property','Value',...) creates a new FISHGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fishGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fishGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fishGUI

% Last Modified by GUIDE v2.5 19-Sep-2018 10:35:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fishGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @fishGUI_OutputFcn, ...
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


% --- Executes just before fishGUI is made visible.
function fishGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fishGUI (see VARARGIN)

% Choose default command line output for fishGUI
handles.output = hObject;

% UIWAIT makes fishGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%% Initial GUI Data

% Define the structure of the uitable
handles.nColmn =5;
set(handles.uitableData,'data',[1 0 0.5 7020 1000]);

% connection flag
handles.connected=false; 

%% Initial Cam Configuration
    cData=loadData('CamData.dat');
    handles.camConf.

%% Initial Experiment Conditions
try
   % Load config. data from file
   iData=loadData('initialData.dat');

   % Assign the data. The first row is the header, omitted.
   handles.freq=iData(2); % freq of the wave (1000 default)
   handles.freqStep=iData(3); % Value of one step of the freq discretization
   handles.port=iData(4); % microcontroller port (COM4 default)
   handles.tEvents = zeros(1,4); %init array
   handles.tEvents = [iData(5) iData(6) iData(7) iData(8)]; % Delay times of the events
   handles.tStep = iData(9); % Limit time to save an image between event steps
catch
   dialogbox=msgbox('The config. file "initialData.dat" does not has the proper format. Please, fix it and restart de program.', 'Wrong Data', 'warn');
   uiwait(dialogbox); 
end

% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = fishGUI_OutputFcn(hObject, eventdata, handles) 
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
    checkDataTable(tableData,handles.tStep) % Check the data table

    % Run the experiment through a table
    runExpTable(tableData,handles.freq,handles.freqStep,handles.tEvents,handles.tStep,handles.micro,handles.nDeviceNo,handles.nChildNo);

    dialogbox=msgbox('Experiment done!', 'Success', 'help');
    uiwait(dialogbox);
catch ME
    dialogbox=msgbox(ME.message, 'Error', 'error');
    uiwait(dialogbox);
end

% Stop progress icon
loopProgress(false);

% Unblock the button
set(handles.pushbuttonRun,'Enable','on');

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Close the connections of the cam and the micro
if handles.connected == true
    closeConnections(handles.nDeviceNo,handles.micro);
end
% Hint: delete(hObject) closes the figure
delete(hObject);
clear all;


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
	[handles.micro,handles.nDeviceNo,handles.nChildNo,handles.connected]=initConnections(handles.port);
catch ME
    dialogbox=msgbox(ME.message, 'Error', 'error');
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
set(handles.uitableData,'data',zeros(nRows,handles.nColmn)); % Redifine the dimensions of the uitable

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
