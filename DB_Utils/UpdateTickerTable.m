% Perform the data collection for, and population of the TickerTable


function status = UpdateTickerTable(ticker)

%% Fetch Raw Market Data
fprintf(params('logID'),['Fetching stock data for ', ticker,'\n'])

start_date = datestr(DB_Select('Filled To',ticker),'ddmmyyyy');
end_date   = datestr(date,'ddmmyyyy');

fprintf(params('logID'),['\tBetween \n\t\t',datestr(end_date,'yyyy-mm-dd'),...
                         '\n\tAnd \n\t\t',datestr(end_date,'yyyy-mm-dd'),'\n\n'])


%Fetch
data = hist_stock_data(start_date,end_date,ticker);


%% Put Raw Data In Database

% Might Be Slower, But doing single queries for each date for the sake of
% robustness in case of unanticipated crashes.

for ii=1:length(data)
    
   status = DB_Insert('Raw',data(ii)); 
end






end



