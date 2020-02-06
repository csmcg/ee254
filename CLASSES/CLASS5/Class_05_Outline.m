%% Class_05_Outline: Control of flow and more I/O
% File: Class_05_Outline.m
% Copy: Copyright (c) 2020 Gregory C. Myers
% BlazerID: gmyers
% Vers: 1.0.0 01/28/2020 GCM - Presented Spring 2020 to EE254 Section2F
% Desc: Driver for testing concepts in Class_05_Outline.m 

%% Introduction to Control of Flow

% if...else...end

% if...elseif...else...end

% switch...case...otherwise...end

% for...end

% while...end

% break

% user defined functions

% try...catch...end

%% Other File I/O

load('HighTempsWithCodes.mat');

% xlsread
% https://www.mathworks.com/help/matlab/ref/xlsread.html
Sample_xls = xlsread('HighTempsWithCodes.xlsx');


% readtable
% https://www.mathworks.com/help/matlab/ref/readtable.html
% readtable determines the file format from the file extension:
%   .txt, .dat, or .csv for delimited text files
%   .xls, .xlsb, .xlsm, .xlsx, .xltm, .xltx, or .ods for spreadsheet files
Sample_Table = readtable('HighTempsWithCodes.csv');
% have to learn a new datatype (table)
% !!!!!detectImportOptions!!!!!

% When all else fails...
% fopen, textread and fclose
FileID = fopen('HighTempsWithCodes.csv','r');
Output = textscan(FileID, '%s', 'delimter',',');
fclose(FileID);