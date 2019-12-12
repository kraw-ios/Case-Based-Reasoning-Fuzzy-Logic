function varargout = Top10SimilarProperties(varargin)
% TOP10SIMILARPROPERTIES MATLAB code for Top10SimilarProperties.fig
%      TOP10SIMILARPROPERTIES, by itself, creates a new TOP10SIMILARPROPERTIES or raises the existing
%      singleton*.
%
%      H = TOP10SIMILARPROPERTIES returns the handle to a new TOP10SIMILARPROPERTIES or the handle to
%      the existing singleton*.
%
%      TOP10SIMILARPROPERTIES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TOP10SIMILARPROPERTIES.M with the given input arguments.
%
%      TOP10SIMILARPROPERTIES('Property','Value',...) creates a new TOP10SIMILARPROPERTIES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Top10SimilarProperties_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Top10SimilarProperties_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Top10SimilarProperties

% Last Modified by GUIDE v2.5 07-Jul-2018 12:25:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Top10SimilarProperties_OpeningFcn, ...
                   'gui_OutputFcn',  @Top10SimilarProperties_OutputFcn, ...
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


% --- Executes just before Top10SimilarProperties is made visible.
function Top10SimilarProperties_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Top10SimilarProperties (see VARARGIN)

% Choose default command line output for Top10SimilarProperties
handles.output = hObject;
table = varargin{1};
t = table2cell(table);
set(handles.uitable, 'Data', t);
% set(handles.uitable, 'Data', similarityTable);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Top10SimilarProperties wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Top10SimilarProperties_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
