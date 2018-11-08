function varargout = Light(varargin)
% LIGHT MATLAB code for Light.fig
%      LIGHT, by itself, creates a new LIGHT or raises the existing
%      singleton*.
%
%      H = LIGHT returns the handle to a new LIGHT or the handle to
%      the existing singleton*.
%
%      LIGHT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LIGHT.M with the given input arguments.
%
%      LIGHT('Property','Value',...) creates a new LIGHT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Light_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Light_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Light

% Last Modified by GUIDE v2.5 08-Nov-2018 10:11:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Light_OpeningFcn, ...
                   'gui_OutputFcn',  @Light_OutputFcn, ...
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


% --- Executes just before Light is made visible.
function Light_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Light (see VARARGIN)

% Choose default command line output for Light
handles.output = hObject;

handles.connected = false;
handles.power = false;

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

try
   % Load config. data from file
   iData=loadData(strcat(execFolder,'\initialData.dat'));
   % Assign the data. The first row is the header, omitted.
   handles.port=iData(4); % microcontroller port (COM4 default)
catch
   dialogbox=msgbox('The config. file "initialData.dat" does not has the proper format. Please, fix it and restart de program.', 'Wrong Data', 'error');
   disp('ERROR: The config. file "initialData.dat" does not has the proper format. Please, fix it and restart de program.');
   set(handles.connectButton,'Enable','off');
   uiwait(dialogbox); 
end

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Light wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Light_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in onButton.
function onButton_Callback(hObject, eventdata, handles)
% hObject    handle to onButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    if ~handles.power
        light_set_duty_cycle(handles.micro,99);
        light_start(handles.micro);
        handles.power = true;
    end
    
    guidata(hObject, handles);



% --- Executes on button press in offButton.
function offButton_Callback(hObject, eventdata, handles)
% hObject    handle to offButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    if handles.power
        light_stop(handles.micro);
        handles.power = false;
    end
    
    guidata(hObject, handles);



function portEdit_Callback(hObject, eventdata, handles)
% hObject    handle to portEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of portEdit as text
%        str2double(get(hObject,'String')) returns contents of portEdit as a double


% --- Executes during object creation, after setting all properties.
function portEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to portEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in connectButton.
function connectButton_Callback(hObject, eventdata, handles)
% hObject    handle to connectButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Close divices connections and init devices connectons again

if handles.connected == true
    set(handles.onButton,'Enable','off');
    set(handles.offButton,'Enable','off');
    handles.connected = false;
    close_device(handles.micro);
end

try
    
	% Open the connection of the microcontroller
    disp('Opening microcontroller connection...');
    handles.micro = initDevice(handles.port);
    open_device(handles.micro);

    % Ping against the microcontroller (check)
    disp('Checking microcontroller connection...');
    ping(handles.micro);
    handles.connected = true;
    % Close if open
    light_stop(handles.micro);
catch ME
    dialogbox=msgbox(ME.message, 'Error', 'error');
    disp(strcat('ERROR: ',ME.message));
    set(handles.onButton,'Enable','off');
    set(handles.offButton,'Enable','off');
    uiwait(dialogbox);
end

if handles.connected == true
    set(handles.onButton,'Enable','on');
    set(handles.offButton,'Enable','on');
    disp('Ready to shine!')
end

guidata(hObject, handles);


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.power
    light_stop(handles.micro);
end
if handles.connected
    close_device(handles.micro);
end
disp('Light control closed.')
% Hint: delete(hObject) closes the figure
delete(hObject);
