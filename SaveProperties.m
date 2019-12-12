function varargout = SaveProperties(varargin)
% SAVEPROPERTIES MATLAB code for SaveProperties.fig
%      SAVEPROPERTIES, by itself, creates a new SAVEPROPERTIES or raises the existing
%      singleton*.
%
%      H = SAVEPROPERTIES returns the handle to a new SAVEPROPERTIES or the handle to
%      the existing singleton*.
%
%      SAVEPROPERTIES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SAVEPROPERTIES.M with the given input arguments.
%
%      SAVEPROPERTIES('Property','Value',...) creates a new SAVEPROPERTIES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SaveProperties_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SaveProperties_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SaveProperties

% Last Modified by GUIDE v2.5 08-Jul-2018 06:47:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SaveProperties_OpeningFcn, ...
                   'gui_OutputFcn',  @SaveProperties_OutputFcn, ...
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


% --- Executes just before SaveProperties is made visible.
function SaveProperties_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SaveProperties (see VARARGIN)

% Choose default command line output for SaveProperties
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

newCase = varargin{1};
n = table2cell(newCase);
set(handles.uitable1, 'Data', n);

% UIWAIT makes SaveProperties wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SaveProperties_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
r = getGlobalValue;
if(strcmp(r,'save') == 0)
    varargout{1} = handles.savebutton;
end
if(strcmp(r,'discard') == 0)
    varargout{1} = handles.discardbutton;
end



function editpassword_Callback(hObject, eventdata, handles)
% hObject    handle to editpassword (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editpassword as text
%        str2double(get(hObject,'String')) returns contents of editpassword as a double


% --- Executes during object creation, after setting all properties.
function editpassword_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editpassword (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in savebutton.
function savebutton_Callback(hObject, eventdata, handles)
% hObject    handle to savebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setGlobalValue('save');
guidata(hObject, handles);
uiresume(handles.figure1);


% --- Executes on button press in discardbutton.
function discardbutton_Callback(hObject, eventdata, handles)
% hObject    handle to discardbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
setGlobalValue('discard');
guidata(hObject, handles);
uiresume(handles.figure1);


% --- Executes on button press in loginbutton.
function loginbutton_Callback(hObject, eventdata, handles)
% hObject    handle to loginbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pass = get(handles.editpassword, 'string');
%if(strcmp(pass, 'admin') == 0)
    set(handles.textpassword, 'visible', 'off');
    set(handles.editpassword, 'visible', 'off');
    set(handles.loginbutton, 'visible', 'off');
    set(handles.textquestion, 'visible', 'on');
    set(handles.uitable1, 'visible', 'on');
    set(handles.savebutton, 'visible', 'on');
    set(handles.discardbutton, 'visible', 'on');

%end
guidata(hObject, handles);

function setGlobalValue(val)
global x
x = val;

function r = getGlobalValue
global x
r = x;
