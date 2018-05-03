function varargout = cw2_GUI(varargin)
% CW2_GUI MATLAB code for cw2_GUI.fig
%      CW2_GUI, by itself, creates a new CW2_GUI or raises the existing
%      singleton*.
%
%      H = CW2_GUI returns the handle to a new CW2_GUI or the handle to
%      the existing singleton*.
%
%      CW2_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CW2_GUI.M with the given input arguments.
%
%      CW2_GUI('Property','Value',...) creates a new CW2_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cw2_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cw2_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cw2_GUI

% Last Modified by GUIDE v2.5 17-Apr-2018 17:57:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cw2_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @cw2_GUI_OutputFcn, ...
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

% --- Executes just before cw2_GUI is made visible.
function cw2_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cw2_GUI (see VARARGIN)

% Choose default command line output for cw2_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cw2_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cw2_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1 - upload button
function pushbutton1_Callback(hObject, eventdata, handles)

databaseFolder = getGlobalDatabaseFolder;
[File_Name, Path_Name] = uigetfile(databaseFolder);
axes(handles.axes1);
uploadedFile = [Path_Name,File_Name];
imshow(uploadedFile);

%sets globals
setGlobalUploadedFile(uploadedFile);


% --- Executes on button press in pushbutton2 - search database
function pushbutton2_Callback(hObject, eventdata, handles)

%get database
images = imageDatastore('FlowerDatabase',...
    'IncludeSubfolders',true,...
    'LabelSource','foldernames');

databaseFolder = getGlobalDatabaseFolder;

a=dir([databaseFolder '/*.png']);
numImages=size(a,1);

%compare images
uploadedFile = getGlobalUploadedFile;
closestMatch = searchDatabase(uploadedFile, images, numImages);

axes(handles.axes2)
imshow(closestMatch);

%show image


% --- Executes on button press in pushbutton3 - quit button
function pushbutton3_Callback(hObject, eventdata, handles)


close all force;


% --- Executes on button press in pushbutton4 - select database button
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[File_Name, Path_Name] = uigetfile('C:\');
setGlobalDatabaseFolder([Path_Name]);
