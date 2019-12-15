  function varargout = DICOM_READER(varargin)
% DICOM_READER MATLAB code for DICOM_READER.fig
%      DICOM_READER, by itself, creates a new DICOM_READER or raises the existing
%      singleton*.
%
%      H = DICOM_READER returns the handle to a new DICOM_READER or the handle to
%      the existing singleton*.
%
%      DICOM_READER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DICOM_READER.M with the given input arguments.
%
%      DICOM_READER('Property','Value',...) creates a new DICOM_READER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DICOM_READER_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DICOM_READER_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DICOM_READER

% Last Modified by GUIDE v2.5 13-Aug-2014 21:54:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DICOM_READER_OpeningFcn, ...
                   'gui_OutputFcn',  @DICOM_READER_OutputFcn, ...
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


% --- Executes just before DICOM_READER is made visible.
function DICOM_READER_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DICOM_READER (see VARARGIN)

% Choose default command line output for DICOM_READER
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DICOM_READER wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DICOM_READER_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;






function EditInput2_Callback(hObject, eventdata, handles)
% hObject    handle to EditInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditInput2 as text
%        str2double(get(hObject,'String')) returns contents of EditInput2 as a double


% --- Executes during object creation, after setting all properties.
function EditInput2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditInput2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function EditBrowse_Callback(hObject, eventdata, handles)
% hObject    handle to EditBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditBrowse as text
%        str2double(get(hObject,'String')) returns contents of EditBrowse as a double


% --- Executes during object creation, after setting all properties.
function EditBrowse_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ButtonBrowse.
function ButtonBrowse_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonBrowse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%[FileName, PathName] = uigetfile('*.*', 'Select an Image');     % A window is opened for the user to select an image
[FileName, PathName] = uigetfile('*.*', 'Select an Image');     % A window is opened for the user to select an image
set (handles.EditBrowse, 'string', strcat(PathName,FileName));  % Directory path of the selected image is written to the Edit box.



% --- Executes on button press in ButtonLoadBrowsed.
function ButtonLoadBrowsed_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonLoadBrowsed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Global variables are defined here.


global Image;


axes(handles.AxesOutputImagePlot1);
DirectoryPath = get(handles.EditBrowse, 'String');  % Directory path that image is selected is read.
LengthOfDirectory = length(DirectoryPath);

%Extension(i.e. jpg, jpeg, bmp, png...) of the image file is detected
%below.
for i=LengthOfDirectory:-1:1
    if (DirectoryPath(i)== '.')
        FileExtension = DirectoryPath(i+1 : LengthOfDirectory);
    end
end

Image = imread(DirectoryPath, FileExtension);  % Image is read from the selected directory


% if(strcmp(FileExtension, 'png'))
%     imshow(Image);
%     imagesc(Image);
% else
%     imshow(Image);
%     imagesc(Image);
% end

imshow(Image);
guidata(hObject, handles);







% --- Executes on button press in ButtonCLEAR.
function ButtonCLEAR_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonCLEAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.AxesOutputImagePlot1);

cla(handles.AxesOutputImagePlot1,'reset')
guidata(hObject, handles);



function EditInput1_Callback(hObject, eventdata, handles)
% hObject    handle to EditInput1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditInput1 as text
%        str2double(get(hObject,'String')) returns contents of EditInput1 as a double


% --- Executes during object creation, after setting all properties.
function EditInput1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditInput1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ButtonPrevious.
function ButtonPrevious_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonPrevious (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.AxesOutputImagePlot1);

global Image;
global Counter;
global DicomImage;
global NumberOfFrames;

if(Counter >= 1)
      
        if(Counter == 1)
            Counter = NumberOfFrames;
        else
            
            Counter = Counter - 1;
        end
   
elseif(Counter == 0)    % ilk basýlan tuþ PREVIOUS olursa Counter 0 baþlar.
    Counter = NumberOfFrames;
end


imshow(DicomImage(:,:,Counter));

Image = DicomImage(:,:,Counter);
imagesc(Image);

counter = num2str(Counter);
numberOfFrames = num2str(NumberOfFrames);
set(handles.StaticTextFileNumber, 'string', strcat(counter,' /',  numberOfFrames));


% --- Executes on button press in ButtonNext.
function ButtonNext_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonNext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.AxesOutputImagePlot1);

global Image;
global Counter;
global DicomImage;
global NumberOfFrames;
global FileName;
global PathName;
global DicomInfo;



if(Counter <= NumberOfFrames)
    
    if(Counter == NumberOfFrames)
        Counter = 1;
    else
        Counter = Counter + 1;
    end
        
end

imshow(DicomImage(:,:,Counter));

Image = DicomImage(:,:,Counter);
%Image = im2double(Image);
imagesc(Image);

%%%%%%%%%%%%%%%%%   DENEME

% MyFileName = strcat(PathName, FileName);
% MyFileName = GetFileName(MyFileName);


% SaveImage( DicomImage, DicomInfo);



%%%%%%%%%%%%%%%%%%%%%%%%%
counter = num2str(Counter);
numberOfFrames = num2str(NumberOfFrames);
set(handles.StaticTextFileNumber, 'string', strcat(counter,' / ', numberOfFrames));
    
    


    



function EditBrowseForAFile_Callback(hObject, eventdata, handles)
% hObject    handle to EditBrowseForAFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of EditBrowseForAFile as text
%        str2double(get(hObject,'String')) returns contents of EditBrowseForAFile as a double


% --- Executes during object creation, after setting all properties.
function EditBrowseForAFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to EditBrowseForAFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ButtonBrowseForAFile.
function ButtonBrowseForAFile_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonBrowseForAFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global ReadedFiles;
global Counter;
global FileName;
global PathName;

[FileName, PathName] = uigetfile('*.dcm','Please Select a DICOM File');
set(handles.EditBrowseForAFile, 'string', strcat(PathName, FileName)); % Directory path of the selected image is written to the Edit box.
set(handles.StaticTextFileName, 'string', FileName);

% --- Executes on button press in ButtonReadDCM.
function ButtonReadDCM_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonReadDCM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global FileName; 
global PathName;
global DicomImage;
global DicomInfo;
global NumberOfFrames;
global FullPath;
global Counter;

FullPath = strcat(PathName,FileName);
Waitbar = waitbar(0, 'DICOM files are being read...');
DicomImage = dicomread(FullPath);
waitbar(1);
close(Waitbar);
DicomInfo = dicominfo(FullPath);

NumberOfFrames = DicomInfo.NumberOfFrames; 
PositionerPrimaryAngle = DicomInfo.PositionerPrimaryAngle;
PositionerSecondaryAngle = DicomInfo.PositionerSecondaryAngle;
Counter = 0;

set(handles.StaticTextFileNumber, 'string', '');
set(handles.StaticTextPPA, 'string', PositionerPrimaryAngle);
set(handles.StaticTextPSA, 'string', PositionerSecondaryAngle);
cla(handles.AxesOutputImagePlot1,'reset');


% --- Executes on button press in ButtonShowAll.
function ButtonShowAll_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonShowAll (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global NumberOfFrames;
global DicomImage;


numberOfFrames = num2str(NumberOfFrames);

myTimer = timer('TimerFcn', @MyCallBackFun, 'Period', 100);
for i=1:1:NumberOfFrames
    counter = num2str(i);
    set(handles.StaticTextFileNumber, 'string', strcat(counter,' / ', numberOfFrames));
    imshow(DicomImage(:,:,i));
    start(myTimer);
    wait(myTimer);
    %stop(t);
end
    


% --- Executes on button press in ButtonSaveDCM.
function ButtonSaveDCM_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonSaveDCM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global DicomImage;
global DicomInfo;

SaveImage( DicomImage, DicomInfo);


% --- Executes on button press in ButtonDoSthg.
function ButtonDoSthg_Callback(hObject, eventdata, handles)
% hObject    handle to ButtonDoSthg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


axes(handles.AxesOutputImagePlot2);
%Global variables are defined here.
global Image;


%%%%  TAKE INPUTS FROM THE USER
IterationNumber = str2double(get(handles.EditInput1, 'String'));                                                                                                                                                                                                                                                                                                        
r = str2double(get(handles.EditInput2, 'String'));


%%%%% CALL THE FUNCTION
[ OutputImage, Average, Std, StdOriginal ] = Diffuse( Image, IterationNumber, r );



%%%%% DISPLAY OUTPUTS
% set(handles.StaticTextAverage, 'string', Average);
% set(handles.StaticTextStdDevOrg, 'string', StdOriginal);
% set(handles.StaticTextStdDev, 'string',Std );

%imshow(ResultantImage);
imagesc(OutputImage);



%HisteqImage = histeq(Image);
%imshow(HisteqImage);
guidata(hObject, handles);
