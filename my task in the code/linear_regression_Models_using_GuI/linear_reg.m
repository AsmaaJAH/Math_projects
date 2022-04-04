clear all
clc
%%%%%%%%%%%%% linear regression using GUI (Dr. sara's project) %%%%%%%%%%%%%%%%%%%%%
function varargout = linear_reg(varargin)
% LINEAR_REG MATLAB code for linear_reg.fig
%      LINEAR_REG, by itself, creates a new LINEAR_REG or raises the existing
%      singleton*.
%
%      H = LINEAR_REG returns the handle to a new LINEAR_REG or the handle to
%      the existing singleton*.
%
%      LINEAR_REG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LINEAR_REG.M with the given input arguments.
%
%      LINEAR_REG('Property','Value',...) creates a new LINEAR_REG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before linear_reg_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to linear_reg_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help linear_reg

% Last Modified by GUIDE v2.5 12-Jul-2021 19:29:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @linear_reg_OpeningFcn, ...
                   'gui_OutputFcn',  @linear_reg_OutputFcn, ...
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


% --- Executes just before linear_reg is made visible.
function linear_reg_OpeningFcn(hObject, eventdata, handles, varargin)
global p
p.mydata=[] ;


handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes linear_reg wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = linear_reg_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ent.
function ent_Callback(hObject, eventdata, handles)
% hObject    handle to ent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%% initializing the table
global p 
xt=str2num(get(handles.x0,'string'));
yt=str2num(get(handles.y0,'string'));
p.mydata =[p.mydata; [xt yt]] ;
 set(handles.tab1,'data',p.mydata);
%% linear code


function y0_Callback(hObject, eventdata, handles)
% hObject    handle to y0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y0 as text
%        str2double(get(hObject,'String')) returns contents of y0 as a double


% --- Executes during object creation, after setting all properties.
function y0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x0_Callback(hObject, eventdata, handles)
% hObject    handle to x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0 as text
%        str2double(get(hObject,'String')) returns contents of x0 as a double


% --- Executes during object creation, after setting all properties.
function x0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calc.
function calc_Callback(hObject, eventdata, handles)
% hObject    handle to calc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
xy=get(handles.tab1,'data');
x=xy(:, 1);
y=xy(:, 2);

axes(handles.axes15);
plot(x,y)


%%%%%%%%%%%%%%%%%%%%%%%%%%linear reg%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (get(handles.ch1,'value')==1)

                axes(handles.axes15);
                scatter(x,y)
                
                sigmax=sum(x,'all')
                sigmay=sum(y,'all')
                squx=x.^2 ;  mulxy=x.*y ;
                sigmaxy=sum(mulxy,'all')
                sigmasqrx=sum(squx,'all')
                n=length(x)
                syms a0 a1
                eqn1=n*a0+sigmax*a1==sigmay ;
                eqn2=sigmax*a0+sigmasqrx*a1==sigmaxy ;
                sol=solve([eqn1,eqn2],[a0,a1])
                sol_a0=sol.a0
                sol_a1=sol.a1
                ssr=(y-(sol_a0)-(sol_a1.*x)).^2
                sr=sum(ssr,'all')
                sst=(y-(sigmay/n)).^2
                st=sum(sst,'all')
                rsqr=(st-sr)/st
                r=sqrt(rsqr)
                r=vpa(r,5)
                ynew=sol_a0+sol_a1.*x
 

elseif (get(handles.ch2,'value')==1) %exponintial model
                      axes(handles.axes15);
                      scatter(x,y)
                      
                      syms a00 a11
                       Y=log(y)
                       X=x
                       n1=length(x)
                       sigmax1=sum(X,'all')
                       sigmay1=sum(Y,'all')
                       sqrx=X.^2
                       sigmaxsqr=sum(sqrx,'all')
                       mullxy=X.*Y
                       sigmaxyc=sum(mullxy,'all')
                       eqn11=n1*a00+sigmax1*a11==sigmay1;
                       eqn22=sigmax1*a00+sigmaxsqr*a11==sigmaxyc;
                       sol2=solve([eqn11,eqn22],[a00,a11])
                       sol2_a00=sol2.a00
                       sol2_a11=sol2.a11
                       a=exp(sol2_a00)
                       b=sol2_a11
                       ynew1=a.*exp(b.*x)
                      axes(handles.axes17);
                       plot(x,ynew1)
                       
                       axes(handles.axes16);
                       plot(0,0)
                       axes(handles.axes19);
                       plot(0,0)
                       axes(handles.axes18);
                       plot(0,0)
                       
                       
elseif (get(handles.ch3,'value')==1) %power model

    %%%%%%%%%%%%%%%%%%%%% linear regression using power model%%%%%%%%%%%%%%%%%%%%%
                axes(handles.axes15);
                scatter(x,y,'b')
                ylabel('y,Y')
                xlabel('x,X')



            %linear regrission using power model 
                %a b for power model
                    X=log(x)
                    Y=log(y)
                    X_square= X.^2;
                    XY= X.*Y;

                    SumX=sum(X)
                    SumY=sum(Y)
                    SumX2=sum(X.^2)
                    SumXY=sum(X.*Y)



                % a0 and a1 definition for linear regression analysis 
                    n=length(X)
                    a1=  ( n*SumXY - (SumX.*SumY) )   /   ( n*SumX2 - ((SumX) .^2) )
                    a0= mean(Y)- a1*mean(X)


                %Correlation Coefficient   
                    Sr=sum((Y-a0-a1.*X).^2)
                    St=sum((y-mean(y)).^2);
                    r=sqrt(abs(St-Sr)/St)

                %plotting_data
                   b=a1
                   a=exp(a0)
                   Y_model=a.*(X.^b);
                   axes(handles.axes18);
                   plot(X,Y_model,'m')
                   title ('The Power Model Is: y=a* x^b')
                   fprintf('Our Power Model Is: y=%i * x^ %i',a,b)


                %zero plotting for all the other models except the current model (power regression model)
                    axes(handles.axes17);
                    plot(0,0)

                    axes(handles.axes16);
                    plot(0,0)

                    axes(handles.axes19);
                    plot(0,0)
        
        
        
        
    
elseif (get(handles.ch2,'value')==1)  %growth model
               axes(handles.axes15);
               scatter(x,y)    
%%%%%%%%%%%%% linear regression using Growth Rate Model %%%%%%%%%%%%%%%%%%%%%
                n=length(x) %num of points you want to enter
                X=[]
                Y=[]

                for i=(1:n)
                    x(i)=input("x=")
                    y(i)=input("y=")
                    X(i)=1./x(i)
                    Y(i)=1./y(i)

                end
                smX = sum(X)
                smY = sum(Y)
                smX2 = sum(X.^2)
                smXY=sum(Y.*X)
               g=[n smX ;smX smX2];
               h=[smY smXY]
               a0a1=h/g
               a=1./a0a1(1,1)
                b=a.*a0a1(1,2)
                f=(a.*x)./(b+x)
                
               %plotting
               axes(handles.axes19);
               plot (x,f)
               title('using growth rate model')

               sr=sum((Y-a0a1(1,1)-a0a1(1,2).*X).^2)
               Yavg =(sum(Y))./d
               st=sum((Y-Yavg).^2)
                r2=(st-sr)./st
                r=(r2)^0.5
                disp(sprintf("Coefficient of Determination=%d",r2))

                disp(sprintf("Correlation Coefficient=%d",r))


           %zero plotting for all the other models except the current model (power regression model)

               axes(handles.axes17);
               plot(0,0)
               axes(handles.axes16);
               plot(0,0)
               axes(handles.axes18);
               plot(0,0)
  end
% --- Executes on button press in ch3.
function ch3_Callback(hObject, eventdata, handles)
% hObject    handle to ch3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch3


% --- Executes on button press in ch1.
function ch1_Callback(hObject, eventdata, handles)
% hObject    handle to ch1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch1


% --- Executes on button press in ch2.
function ch2_Callback(hObject, eventdata, handles)
% hObject    handle to ch2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch2


% --- Executes on button press in ch4.
function ch4_Callback(hObject, eventdata, handles)
% hObject    handle to ch4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch4


% --- Executes on button press in ch5.
function ch5_Callback(hObject, eventdata, handles)
% hObject    handle to ch5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ch5


% --- Executes during object creation, after setting all properties.
function ax1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ax1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate ax1


% --- Executes during object creation, after setting all properties.
function axes15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes15


% --- Executes during object creation, after setting all properties.
function axes16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes16


% --- Executes during object creation, after setting all properties.
function axes17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes17


% --- Executes during object creation, after setting all properties.
function axes18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes18


% --- Executes during object creation, after setting all properties.
function axes19_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes19


% --- Executes on button press in exc.
function exc_Callback(hObject, eventdata, handles)
% hObject    handle to exc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.filename=uigetfile('xy.xlsx');
guidata(hObject,handles);
filename=handles.filename;
values=xlsread(filename);
set(handles.tab1,'data',values);
guidata(hObject,handles);
