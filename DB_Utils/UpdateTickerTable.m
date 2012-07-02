% Perform the data collection for, and population of the TickerTable


function status = UpdateTickerTable(ticker)

%% Fetch Raw Market Data
fprintf(params('logID'),['Fetching stock data for ', ticker,'\n'])

start_date = DB_Select('Filled To',ticker);
end_date   = datestr(date,'ddmmyyyy');

fprintf(params('logID'),['Between \n\t\t\t',start_date,'\nAnd \n\t\t\t',end_date,'/n/n'])


data = hist_stock_data(start_date,end_date,ticker);


%% Put Raw Data In Database




end



