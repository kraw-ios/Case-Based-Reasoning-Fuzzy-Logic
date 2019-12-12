function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 07-Jul-2018 12:49:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
 uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles;
% delete(handles.figure1);



function edittype_Callback(hObject, eventdata, handles)
% hObject    handle to edittype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edittype as text
%        str2double(get(hObject,'String')) returns contents of edittype as a double


% --- Executes during object creation, after setting all properties.
function edittype_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edittype (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editcouncilarea_Callback(hObject, eventdata, handles)
% hObject    handle to editcouncilarea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editcouncilarea as text
%        str2double(get(hObject,'String')) returns contents of editcouncilarea as a double


% --- Executes during object creation, after setting all properties.
function editcouncilarea_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editcouncilarea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edityearbuilt_Callback(hObject, eventdata, handles)
% hObject    handle to edityearbuilt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edityearbuilt as text
%        str2double(get(hObject,'String')) returns contents of edityearbuilt as a double


% --- Executes during object creation, after setting all properties.
function edityearbuilt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edityearbuilt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editbedroom2_Callback(hObject, eventdata, handles)
% hObject    handle to editbedroom2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editbedroom2 as text
%        str2double(get(hObject,'String')) returns contents of editbedroom2 as a double


% --- Executes during object creation, after setting all properties.
function editbedroom2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editbedroom2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in create.
function create_Callback(hObject, eventdata, handles)
% hObject    handle to create (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
type =  get(handles.edittype, 'string');
councilArea = get(handles.editcouncilarea, 'string');
yearBuilt = get(handles.edityearbuilt, 'string');
bedroom2 = get(handles.editbedroom2, 'string');
suburb = get(handles.editsuburb, 'string');
address = get(handles.editaddress, 'string');
bathroom = get(handles.editbathroom, 'string');
car = get(handles.editcar, 'string');
latitude = get(handles.editlatitude, 'string');
longitude = get(handles.editlongitude, 'string');
guidata(hObject, handles);

uiresume(handles.figure1);




function editcar_Callback(hObject, eventdata, handles)
% hObject    handle to editcar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editcar as text
%        str2double(get(hObject,'String')) returns contents of editcar as a double


% --- Executes during object creation, after setting all properties.
function editcar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editcar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editbathroom_Callback(hObject, eventdata, handles)
% hObject    handle to editbathroom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editbathroom as text
%        str2double(get(hObject,'String')) returns contents of editbathroom as a double


% --- Executes during object creation, after setting all properties.
function editbathroom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editbathroom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editsuburb_Callback(hObject, eventdata, handles)
% hObject    handle to editsuburb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editsuburb as text
%        str2double(get(hObject,'String')) returns contents of editsuburb as a double


% --- Executes during object creation, after setting all properties.
function editsuburb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editsuburb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editaddress_Callback(hObject, eventdata, handles)
% hObject    handle to editaddress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editaddress as text
%        str2double(get(hObject,'String')) returns contents of editaddress as a double




% --- Executes during object creation, after setting all properties.
function editaddress_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editaddress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlatitude_Callback(hObject, eventdata, handles)
% hObject    handle to editlatitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlatitude as text
%        str2double(get(hObject,'String')) returns contents of editlatitude as a double


% --- Executes during object creation, after setting all properties.
function editlatitude_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlatitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlongitude_Callback(hObject, eventdata, handles)
% hObject    handle to editlongitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlongitude as text
%        str2double(get(hObject,'String')) returns contents of editlongitude as a double


% --- Executes during object creation, after setting all properties.
function editlongitude_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlongitude (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editlandSize_Callback(hObject, eventdata, handles)
% hObject    handle to editlandSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlandSize as text
%        str2double(get(hObject,'String')) returns contents of editlandSize as a double


% --- Executes during object creation, after setting all properties.
function editlandSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlandSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editbuildingArea_Callback(hObject, eventdata, handles)
% hObject    handle to editbuildingArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editbuildingArea as text
%        str2double(get(hObject,'String')) returns contents of editbuildingArea as a double


% --- Executes during object creation, after setting all properties.
function editbuildingArea_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editbuildingArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
