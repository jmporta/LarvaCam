function varargout = Home(varargin)
% HOME MATLAB code for Home.fig
%      HOME, by itself, creates a new HOME or raises the existing
%      singleton*.
%
%      H = HOME returns the handle to a new HOME or the handle to
%      the existing singleton*.
%
%      HOME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOME.M with the given input arguments.
%
%      HOME('Property','Value',...) creates a new HOME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Home_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Home_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Home

% Last Modified by GUIDE v2.5 08-Nov-2018 10:18:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Home_OpeningFcn, ...
                   'gui_OutputFcn',  @Home_OutputFcn, ...
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


% --- Executes just before Home is made visible.
function Home_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Home (see VARARGIN)

% Choose default command line output for Home
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Home wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Home_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in runButton.
function runButton_Callback(hObject, eventdata, handles)
% hObject    handle to runButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gui=LarvaCam;
disp("LarvaCam Opened.");
close(Home);


% --- Executes on button press in lightButton.
function lightButton_Callback(hObject, eventdata, handles)
% hObject    handle to lightButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gui=Light;
disp("Light Opened.");
close(Home);
