% This means the table must be initialized and populated for the first time

%% Create Table
function status = InitializeTickerTable(ticker)

%% Create Table using base definitions 
fprintf(params('logID'),['Creating table for ',ticker,'\n']) 

CreateTable(ticker);

%% Define bounds for data query
start_date = datestr(params('Start Date'),'ddmmyyyy');
end_date   = datestr(date,'ddmmyyyy');

%% Update the Status Table 
fprintf(params('logID'),['Updating Status Table, adding row for ',ticker,'\n'])
mysql(['INSERT INTO status ticker values(',ticker,')'])


%MOVE TO UPDATE!!


end