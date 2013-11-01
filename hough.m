function varargout = hough(varargin)


% HOUGH M-file for hough.fig
%      HOUGH, by itself, creates a new HOUGH or raises the existing
%      singleton*.
%
%      H = HOUGH returns the handle to a new HOUGH or the handle to
%      the existing singleton*.
%
%      HOUGH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOUGH.M with the given input arguments.
%
%      HOUGH('Property','Value',...) creates a new HOUGH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before hough_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to hough_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help hough

% Last Modified by GUIDE v2.5 11-Dec-2007 09:33:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hough_OpeningFcn, ...
                   'gui_OutputFcn',  @hough_OutputFcn, ...
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

% --- Executes just before hough is made visible.
function hough_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to hough (see VARARGIN)

% Choose default command line output for hough
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using hough.
if strcmp(get(hObject,'Visible'),'off')
    
end

% UIWAIT makes hough wait for user response (see UIRESUME)
%  uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = hough_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
% varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% axes(handles.axes1);
  cla;

popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 1
        edgedetect2(handles,'coins1.png');
    case 2
        edgedetect2(handles,'coins2.tif');
   
end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end

set(hObject, 'String', {'coins1.png', 'coins2.tif'});



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function edgedetect2(ax,image)


%Program by Martin Turesson and Jose M. P�rez-Macias Martin
%December 10th 2007
%Project Image Analysis

clc
 tic
%% Loading the image
%Output: I
%  [Im,MAP]= imread('coins.png');
[Im,MAP]= imread(image);
I=Im;
%I = ind2gray(Im,MAP);
I=double(I);
I = I/max(I(:));
size1=size(I,1);size2=size(I,2);
%% Edge detection
logfilt = fspecial('log');
%figure(1);imshow(I);
filt = filter2(logfilt,I,'same');
% % % figure;imshow(filt);imhist(filt);
filtbw = im2bw(filt,0.25); % We convert the edge image in black and white w/ threshold 0.25

% Canny edge detection
%filtbw=edge(I, 'canny', [0.1 0.2], 2);

axes(ax.axes1);
cla reset;
imshow(filtbw);
axis equal
axis on
axis([0 size2 0 size1])
%% Edges (x,y) --> Edge points
[x,y]=find(filtbw);
%%

%% Radius loop
centers=[];
votes_radius=[];
size1=size(I,1);size2=size(I,2);
radio1 = str2num( get(ax.edit4,'String') );
radio2 = str2num( get(ax.edit5,'String') );
rad=radio1:radio2
NOP = 200;theta=linspace(0,2*pi,NOP); %Variables for plotting
threshold= str2num( get(ax.edit6,'String') );
axes(ax.axes2);
cla reset;
imshow(I),hold on
axis equal
axis on
axis([0 size2 0 size1])
m=zeros(1,NOP);
n=m;
for r=1:size(rad,2)

    radius=rad(r);r2=radius^2;
    H=zeros(size1,size2); % we create the voting matrix

    %Hough transform of the matrix. We draw a circle around all the edges
    %of the image. H
    tic
    for i=1:length(x)

        %Calculatin the coordinates of the circle for each edge point (x_i,y_i)
        last=[0,0];now=[0,0]; %We store the last draw value, because we just want to draw
        %one pixel for each edge. This is because rounding problems.

        %m,n coordinates of the possible centers

        m=ceil(x(i)+radius*cos(theta));n=ceil(y(i)+radius*sin(theta));
       
        for p=1:length(m)

            now=[m(p),n(p)]; %we store the pixel we are going to draw and check if its the same as the last pixel

            %If the point is within the H matrix and different to the last
            %point we voted, we vote for it

           if ((m(p)<size1)&&(n(p)<size2)&&(m(p)>0)&&(n(p)>0)&&(now(1,1)~=last(1,1))&&(now(1,2)~=last(1,2)))
                H(m(p),n(p))=H(m(p),n(p))+1;
            end

           last=[m(p),n(p)];

        end


    end
   
    toc


    %Plot of the Hough transform for an specific radius
    %g=fspecial('average'); %H=filter2(g,H);
    %     figure,Hmax = max(max(H));imshow(H/Hmax,[0 1]);title('Hough Transform')
    %     figure, surf(H)
    %peaks=houghpeaks(H,10,'threshold',ceil(0.3*max(H(:))));
    %peaks=houghpeaks(H,9,'Threshold',1-Hmax*0.40,'NHoodSize',[5 5])
    %peaks=houghpeaks(H,2,'Threshold',Hmax*0.15,'NHoodSize',[5 5])

    Hbis=H;

    %bwh = imdilate(d, ones(3, 3));
    %bwh = imerode(d, ones(3, 3));
    %stat = imfeature(bwh, 'Centroid')

    l=2*pi*radius;


    %We see if there are posible circles within the threshold


    if(find(Hbis>l*threshold))

        Hbis(find(Hbis<l*threshold))=0;
        [p,q]=find(Hbis);
        si=size(p,1); %Number of posible centers, to use with Houghpeaks
        peaks=houghpeaks(Hbis,si);
        %figure,imshow(Hbis);
        
        p=peaks(:,1);q=peaks(:,2);
        votes_radius=[];
        if(peaks)
            for h=1:size(peaks,1)
                votes_radius=[votes_radius;H(peaks(h,1),peaks(h,2)),radius];
            end

            centers=[centers;peaks,votes_radius];
        end

        % H2=imdilate(H, ones(1,1));highest=ordfilt2(H2,9,ones(3,3));secondhighest=ordfilt2(H2,8,ones(3,3)),
        % nounique= (highest == secondhighest),figure,imshow(nounique)

    end
end

%% end radius loop

%% Code for choosing the right circles. Operations with the centers matrix
% matrix=[1 2;1 3];
% matrix(1,:)=[]; deletes the entire row #1

%% Checking close centers of different radii
 
%Investigate if different radii give the same point, or almost
%the same
centers;
centers_delete=[];
for k=1:size(centers,1)
    for l=1:size(centers,1)
        %if the centers of two centerpoints occur on a distance that is
        %smaller than half of the smaller radius        
        if (sqrt( (centers(k,1)-centers(l,1))^2 + (centers(k,2)-centers(l,2))^2 ) < 5 && ...
                l~=k)%sqrt( (centers(k,1)-centers(l,1))^2 + (centers(k,2)-centers(l,2))^2 ) ~= 0)
            %then delete that row in 'centers' which contains the smallest
            %vote value
            if(centers(k,3)>centers(l,3))
                centers_delete = [centers_delete l];
            else
                centers_delete = [centers_delete k];                
            end      
        end
    end
end

centers(centers_delete,:)=[];

%% Ploting all the "valid" centers
% centers(x,y,vote,radius)

for n=1:size(centers,1)

    RHO=ones(1,NOP)*centers(n,4);
    [X,Y] = pol2cart(theta,RHO);

    % XX and YY all coordinates for one circle
    XX=round(X+centers(n,1));
    YY=round(Y+centers(n,2));

    plot(YY,XX)


    % % % % %     %We build a matrix of the same size as the image and put to one all the
    % % % % %     %last values
    % % % % %     HH=zeros(size1,size2);
    % % % % %
    % % % % %     for pp=1:length(XX)
    % % % % %         if XX(pp)>0 && YY(pp)>0
    % % % % %             HH(XX(pp),YY(pp))=1;
    % % % % %         end
    % % % % %     end


end


























