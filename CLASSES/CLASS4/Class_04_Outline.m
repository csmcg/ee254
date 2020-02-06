%% Class_03_Outline: Getting started with Matlab
% File: Class_03_Outline.m
% Copy: Copyright (c) 2020 Gregory C. Myers
% BlazerID: gmyers
% Vers: 1.0.0 01/21/2020 GCM - Presented Spring 2020 to EE254 Section2F
% Desc: Driver for testing concepts in Class_03_Outline.m 

%% Checklist: Done.

%% Checklist: ToDo.

%% Arrays: How are arrays different/same as vectors?
% multidimensional
% homogenous (type)

% Types (and can they be mixed)? no

% Manual creation
A = [ 1 : 1 : 10;
     10 : -1 : 1];
% rows x columns
B = [ 3.14, -5, 7, 0.1; 
    4, 5.6, 3.9, 8];

% colon (:)

% zeros
C = zeros(2,10);

% ones
D = zeros(10,3);
E = zeros(10, 2, 20); % 3D - 10 rows x 2 colummns x 20 layers

% rand
F = rand(1, 20); % 10 x 20 doubles from 0 to 1

% logical
G = false(4, 5); % 4x5 array of logicals

% size
length(F) % length returns max of the dimensions
size(F) % returns the size of each dimension
size(F,1) % size of 1st dimension (rows)
size(F,2) % size of 2nd dimension (columns)

% Operations on arrays
% same as vectors, arrays are multi-dimensional
a = randi(100, 5, 4) % random integers from 1 to 100, 5 row, 4 columns (5x4) of doubles

%% I/O: Matlab variable files.
% Input and output

% Different types
% .mat - storage of MATLAB variables
% images
% .csv - comma separated values

% load variables
load('high_temps.mat'); % do not assign output to variable, as in "a = load('x.mat');"
load('low_temps.mat');

highest = max(high_temps, [], 1) % 1x10 row, highest in each column
highest = max(high_temps, [], 2) % 5x1 column, highest in each row
highest = max(max(high_temps, [], 1))

lowest = min(high_temps, [], 1)
lowest = min(high_temps, [], 2)
lowest = min(min(high_temps, [], 1))

average = mean(mean(high_temps))

high_temp_by_city = max(high_temps,[],2) % highest temperature per city
high_temp_by_day = max(high_temps,[],1) % highest temperature on each day over all cities

weather_days = [1 : 1 : size(high_temps, 2)];
plot(weather_days,high_temps(1,:))
hold on
plot(weather_days,high_temps(2,:))
plot(weather_days,high_temps(3,:))
plot(weather_days,high_temps(4,:))
plot(weather_days,high_temps(5,:))

% plot difference in temps between days
temp_difference = high_temps(:, [1 : (end-1)]) - high_temps(:, [2 : end])
% t1-t2
figure
plot(weather_days(1:end-1), temp_difference)

% save variables

%% Examples

% Grade calculator

% Weather Data

%% I/O: Images: Gray scale
% List of monochrome and RGB palettes
% http://en.wikipedia.org/wiki/List_of_monochrome_and_RGB_palettes

% List of 8-bit computer hardware palettes
% http://en.wikipedia.org/wiki/List_of_8-bit_computer_hardware_palettes

% Opening and reading images (as 2 dimensional arrays)
% imread
blaze_gray= imread('Blaze_GrayScale.jpg','JPEG');
blaze_color = imread('Blaze_Color.jpg');

% Assigning images to a variable
% imshow
imshow(blaze_gray)

% Editing an image and saving it.
% How to invert the colors of a black and white image mathematically.
blaze_gray_new = 255 - blaze_gray;
imshow(blaze_gray_new)
imwrite(blaze_gray_new,'Blaze_GrayScale_Inverted.jpg');

% What do you think random numbers look like?
static = uint8(randi(256, 300, 400) - 1);
imshow(static)

save('All.mat')
save('Static.mat','static')
clear;
load('All.mat')
clear;
load('All.mat', 'static')
