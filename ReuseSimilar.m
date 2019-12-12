function varargout = ReuseSimilar(varargin)
% REUSESIMILAR MATLAB code for ReuseSimilar.fig
%      REUSESIMILAR, by itself, creates a new REUSESIMILAR or raises the existing
%      singleton*.
%
%      H = REUSESIMILAR returns the handle to a new REUSESIMILAR or the handle to
%      the existing singleton*.
%
%      REUSESIMILAR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REUSESIMILAR.M with the given input arguments.
%
%      REUSESIMILAR('Property','Value',...) creates a new REUSESIMILAR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ReuseSimilar_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ReuseSimilar_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ReuseSimilar

% Last Modified by GUIDE v2.5 07-Jul-2018 23:27:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ReuseSimilar_OpeningFcn, ...
                   'gui_OutputFcn',  @ReuseSimilar_OutputFcn, ...
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


% --- Executes just before ReuseSimilar is made visible.
function ReuseSimilar_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ReuseSimilar (see VARARGIN)

% Choose default command line output for ReuseSimilar
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

similar = varargin{1};
s = table2cell(similar);
set(handles.uitable, 'Data', s);

% UIWAIT makes ReuseSimilar wait for user response (see UIRESUME)
 uiwait(handles.figure3);


% --- Outputs from this function are returned to the command line.
function varargout = ReuseSimilar_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
guidata(hObject, handles);
r = getGlobalValue;
if(strcmp(r,'save') == 0)
    varargout{1} = handles.savebutton;
end
if(strcmp(r,'price') == 0)
    varargout{1} = handles.pricebutton;
end

% --- Executes on button press in savebutton.
function savebutton_Callback(hObject, eventdata, handles)
% hObject    handle to savebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setGlobalValue('save');
guidata(hObject, handles);
uiresume(handles.figure3);


% --- Executes on button press in pricebutton.
function pricebutton_Callback(hObject, eventdata, handles)
% hObject    handle to pricebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setGlobalValue('price');
guidata(hObject, handles);
uiresume(handles.figure3);

function setGlobalValue(val)
global x
x = val;

function r = getGlobalValue
global x
r = x;
