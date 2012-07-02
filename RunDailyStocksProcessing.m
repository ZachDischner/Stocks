% Main script, handles daily task of fetching and updating database

% Steps
% 
% [1]--Base (Science) Data
%  |
%  |\
%  | \
%  |  1A
%  |   |--Add table to database to accomidate dataset if not defined
%  |   |--Get Base Dataset For Processing 
%  |   |--Write base data to Ticker table
%  |   |--Update "STATUS" table 
%  |
% [2] 
%  |
%  |\
%  | \
%  |  2A
%  |   |--Read "STATUS" Table for updating tasks
%  |   |--Perform basic analysis on data
%  |   |--Update Ticker table
%  |   |--Update "STATUS" table
%  |




clc;clear all;close all;
startup_stocks;

%% Load List of Tickers
if params('debug')   
    importfile('test_list.csv')
    tickers = test_list;
else
    importfile('full_list.csv')
    tickers = full_list;
end


%% Start Processing LEVEL 1A 

Perform1AProcessing(tickers)











