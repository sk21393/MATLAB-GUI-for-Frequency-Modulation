function varargout = freqmod(varargin)
% FREQMOD MATLAB code for freqmod.fig
%      FREQMOD, by itself, creates a new FREQMOD or raises the existing
%      singleton*.
%
%      H = FREQMOD returns the handle to a new FREQMOD or the handle to
%      the existing singleton*.
%
%      FREQMOD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FREQMOD.M with the given input arguments.
%
%      FREQMOD('Property','Value',...) creates a new FREQMOD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before freqmod_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to freqmod_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help freqmod

% Last Modified by GUIDE v2.5 19-Nov-2013 01:17:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @freqmod_OpeningFcn, ...
                   'gui_OutputFcn',  @freqmod_OutputFcn, ...
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


% --- Executes just before freqmod is made visible.
function freqmod_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to freqmod (see VARARGIN)

% Choose default command line output for freqmod
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes freqmod wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = freqmod_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in msgfunc.
function msgfunc_Callback(hObject, eventdata, handles)
% hObject    handle to msgfunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns msgfunc contents as cell array
%        contents{get(hObject,'Value')} returns selected item from msgfunc


% --- Executes during object creation, after setting all properties.
function msgfunc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to msgfunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t_Callback(hObject, eventdata, handles)
% hObject    handle to t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t as text
%        str2double(get(hObject,'String')) returns contents of t as a double


% --- Executes during object creation, after setting all properties.
function t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function K_Callback(hObject, eventdata, handles)
% hObject    handle to K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of K as text
%        str2double(get(hObject,'String')) returns contents of K as a double


% --- Executes during object creation, after setting all properties.
function K_CreateFcn(hObject, eventdata, handles)
% hObject    handle to K (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in gen.
function gen_Callback(hObject, eventdata, handles)
% hObject    handle to gen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vm=(get(handles.Vm,'string'));
if(strcmp(get(handles.kbkb1,'visible'),['off']))
    wm=2*pi*str2num(get(handles.wm,'string'));
    beta=str2num(get(handles.edit14,'string'));
    k=beta*wm/vm;
    set(handles.frame2,'string',num2str(k));
else
    wm=2*pi*str2num(get(handles.wm,'string'));
    k=str2num(get(handles.K,'string'));
    beta=k*vm/wm;
    set(handles.beta,'string',num2str(beta));
end;

n=str2num(get(handles.t,'string'));
step=0.0001;
Ts=1/str2num(get(handles.wm,'string'));
simtime=0:step:n*Ts;
a=(get(handles.A,'string'));
vm=(get(handles.Vm,'string'));
wm=num2str(2*pi*str2num(get(handles.wm,'string')));
wc=num2str(2*pi*str2num(get(handles.wc,'string')));
func1=get(handles.msgfunc,'string');
func2=get(handles.carfunc,'string');
x=[];
y=[];
for i=1:length(simtime)
    t1=simtime(i);
    msgfcn=[vm '*' char(func1(get(handles.msgfunc,'value'))) '(' wm '*' num2str(t1) ')'];
    x(i)=str2num(msgfcn);
end;

for i=1:length(simtime)
    t1=simtime(i);
     carrierfunc=[a '*' char(func2(get(handles.carfunc,'value'))) '(' wc '*' num2str(t1) ')'];
    y(i)=str2num(carrierfunc);
end;
type=get(handles.radiobutton6,'value');
z=frequency_modulator(a,char(func2(get(handles.carfunc,'value'))),wc,vm,char(func1(get(handles.msgfunc,'value'))),wm,beta,simtime,type);
t=simtime';
    N = size(t,1);
    X = fftshift(fft(x));
    Fm=str2num(get(handles.wm,'string'));
    dF = Fm/N;                      % hertz
    f1 = -Fm/2:dF:Fm/2-dF;
    Y = fftshift(fft(y));
    Fc=str2num(get(handles.wc,'string'));
    dF = Fc/N;                      % hertz
    f = -Fc/2:dF:Fc/2-dF;
    Z = fftshift(fft(z));
    
axes(handles.time_msg)
    plot(simtime,x)
    axes(handles.time_car)
    plot(simtime,y)
    axes(handles.time_FM)
    plot(simtime,z)
    axes(handles.freq_msg)
    plot(f1,abs(X)/N);
    axes(handles.freq_car)
    plot(f,abs(Y)/N);
    axes(handles.freq_FM)
    plot(f,abs(Z)/N);
    

function wc_Callback(hObject, eventdata, handles)
% hObject    handle to wc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wc as text
%        str2double(get(hObject,'String')) returns contents of wc as a double


% --- Executes during object creation, after setting all properties.
function wc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function A_Callback(hObject, eventdata, handles)
% hObject    handle to A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of A as text
%        str2double(get(hObject,'String')) returns contents of A as a double


% --- Executes during object creation, after setting all properties.
function A_CreateFcn(hObject, eventdata, handles)
% hObject    handle to A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in carfunc.
function carfunc_Callback(hObject, eventdata, handles)
% hObject    handle to carfunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns carfunc contents as cell array
%        contents{get(hObject,'Value')} returns selected item from carfunc


% --- Executes during object creation, after setting all properties.
function carfunc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to carfunc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Vm_Callback(hObject, eventdata, handles)
% hObject    handle to Vm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Vm as text
%        str2double(get(hObject,'String')) returns contents of Vm as a double


% --- Executes during object creation, after setting all properties.
function Vm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Vm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function wm_Callback(hObject, eventdata, handles)
% hObject    handle to wm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wm as text
%        str2double(get(hObject,'String')) returns contents of wm as a double


% --- Executes during object creation, after setting all properties.
function wm_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wm (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function message_freq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to message_freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate message_freq


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes during object creation, after setting all properties.
function beta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to beta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in k_beta.
function k_beta_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in k_beta 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
val=get(eventdata.NewValue,'Tag');
if(strcmp(val,['rad_k']))
    set(handles.kbkb1,'visible','on')
    set(handles.kbkb2,'visible','off')
else
    set(handles.kbkb1,'visible','off')
    set(handles.kbkb2,'visible','on')
end;



% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in uipanel19.
function uipanel19_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel19 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
val=get(eventdata.NewValue,'String');
if(strcmp(val,['Time Domain']))
    set(handles.panel_time,'visible','on')
    set(handles.panel_freq,'visible','off')
else
    set(handles.panel_time,'visible','off')
    set(handles.panel_freq,'visible','on')
end;


% --- Executes when selected object is changed in uipanel10.
function uipanel10_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel10 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
type=get(handles.radiobutton6,'value');
if type==0
    set(handles.text40,'string','s(t)=A*function(2*pi*fc*t+K*integral(m(t)dt))')
else
    set(handles.text40,'string','s(t)=A*summation(J(ß,n)*function((wc+n*wm)*t))')
end;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open('Help.pdf')

% --------------------------------------------------------------------
function About_Callback(hObject, eventdata, handles)
% hObject    handle to About (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('Developed By:                                                               Saurabh Khatri        sk21393@gmail.com                                                 Nishant Parashar     11iec066@gbu.ac.in                                                 Rajat Sidana            rocks98@gmail.com                                                 Gautam Buddha University','About','help');
