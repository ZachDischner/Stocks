% Perform the data collection for, and population of the TickerTable


function status = UpdateTickerTable(ticker)

%% Fetch Raw Market Data
fprintf(params('logID'),['Fetching stock data for ', ticker,'\n'])

start_date = DB_Select('Filled To',ticker);
end_date   = date;

fprintf(params('logID'),['\tBetween \n\t\t',datestr(start_date,'mmm dd yyyy'),...
                         '\n\tAnd \n\t\t',datestr(end_date,'mmm dd yyyy'),'\n\n'])


%Fetch
d1   = datestr(start_date,'ddmmyyyy');
d2   = datestr(end_date,'ddmmyyyy');
data = hist_stock_data(d1,d2,ticker);


%% Put Raw Data In Database

% Might Be Slower, But doing single queries for each date for the sake of
% robustness in case of unanticipated crashes.

fprintf(params('logID'),['Raw Market Data Obtained. Now populating Ticker Table "',ticker,'"\n'])
fprintf(params('logID'),['Initial table length for:\t',ticker,'\t is \t',num2str(DB_Select('count',ticker)),'\n'])

for ii=1:length(data)
    % Don't Like how HIST_STOCK_DATA Does This. Want to Reform to be Arrays
    % of structures for single ticker calls, ordered with EARLIER DATE
    % FIRST!!!!!!!!
   this_date = datestr(data(ii).Date,'yyyy-mm-dd');
   status = DB_Insert('Raw',data(ii));
   status = DB_Update('Filled To',ticker,this_date);
end

fprintf(params('logID'),['New table length for:\t',ticker,'\t is \t',num2str(DB_Select('count',ticker)),'\n\n'])

%% Cleanup Variables
clear data
clear start_date
clear end_date
clear d1
clear d2
clear ii
clear status
clear this_date 




end



