function varargout = DataReview(varargin)
% DATAREVIEW MATLAB code for DataReview.fig
%      DATAREVIEW, by itself, creates a new DATAREVIEW or raises the existing
%      singleton*.
%
%      H = DATAREVIEW returns the handle to a new DATAREVIEW or the handle to
%      the existing singleton*.
%
%      DATAREVIEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATAREVIEW.M with the given input arguments.
%
%      DATAREVIEW('Property','Value',...) creates a new DATAREVIEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DataReview_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DataReview_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DataReview

% Last Modified by GUIDE v2.5 08-Jul-2018 02:44:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DataReview_OpeningFcn, ...
                   'gui_OutputFcn',  @DataReview_OutputFcn, ...
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


% --- Executes just before DataReview is made visible.
function DataReview_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DataReview (see VARARGIN)

% Choose default command line output for DataReview
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

new_case = varargin{1};

set(handles.editprice, 'string', num2str(new_case.price));
set(handles.edityearbuilt, 'string', num2str(new_case.yearBuilt));
set(handles.editbedroom2, 'string', num2str(new_case.bedroom2));
set(handles.editbathroom, 'string', num2str(new_case.bathroom));
set(handles.editcar, 'string', num2str(new_case.car));
set(handles.editlandsize, 'string', num2str(new_case.landSize));
set(handles.editbuildingarea, 'string', num2str(new_case.buildingArea));
set(handles.editlatitude, 'string', num2str(new_case.latitude));
set(handles.editlongitude, 'string', num2str(new_case.longitude));
set(handles.editcouncilarea, 'string', new_case.councilArea);
set(handles.editsuburb, 'string', new_case.suburb);
set(handles.editaddress, 'string', new_case.address);
set(handles.edittype, 'string', new_case.type);


% setGlobalValue(load(new_case.mat));
% UIWAIT makes DataReview wait for user response (see UIRESUME)
uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DataReview_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles;



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


% --- Executes on button press in sendbutton1.
function sendbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to sendbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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



function editlandsize_Callback(hObject, eventdata, handles)
% hObject    handle to editlandsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editlandsize as text
%        str2double(get(hObject,'String')) returns contents of editlandsize as a double


% --- Executes during object creation, after setting all properties.
function editlandsize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editlandsize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editbuildingarea_Callback(hObject, eventdata, handles)
% hObject    handle to editbuildingarea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editbuildingarea as text
%        str2double(get(hObject,'String')) returns contents of editbuildingarea as a double


% --- Executes during object creation, after setting all properties.
function editbuildingarea_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editbuildingarea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editprice_Callback(hObject, eventdata, handles)
% hObject    handle to editprice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editprice as text
%        str2double(get(hObject,'String')) returns contents of editprice as a double


% --- Executes during object creation, after setting all properties.
function editprice_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editprice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');

end

function setGlobalValue(val)
global x
x = val;

function r = getGlobalValue
global x
r = x;
