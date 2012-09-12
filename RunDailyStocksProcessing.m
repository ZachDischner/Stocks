% Main script, handles daily task of fetching and updating database

% Steps
% 
% [1]--Raw (Science) Data
%  |
%  |\
%  | \
%  |  1A
%  |   |--Add table to database to accomidate dataset if not defined
%  |   |--Get Base Dataset For Processing 
%  |   |--Write Raw data to Ticker table
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

% Output List of Tickers Being Updated
fprintf(params('LogId'),'Updating Stocks for Tickers:\n')
for ii = 1:length(tickers)
    fprintf(params('LogId'),[tickers{ii},'\n'])
end
fprintf(params('LogId'),'\n\n');


%% Start Processing LEVEL 1A 
fprintf('\n\n\n+----------------------------------------------------------------------------------+\n\n\n')
fprintf(params('LogId'),[datestr(date,'mmm dd yyyy hh:ss\t'),'Performing 1A Data Analysis \n\n'])
Perform1AProcessing(tickers);



%% Start Processing LEVEL 2A
fprintf('\n\n\n+----------------------------------------------------------------------------------+\n\n\n')
fprintf(params('LogId'),'Performing 2A Data Analysis \n\n')
Perform2AProcessing(tickers);



%% Start Processing Level 3A
fprintf('\n\n\n+----------------------------------------------------------------------------------+\n\n\n')
fprintf(params('LogId'),'Performing 3A Data Analysis \n\n')
Perform3AProcessing(tickers)










