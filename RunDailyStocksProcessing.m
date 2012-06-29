% Main script, handles daily task of fetching and updating database


%% Load List of Tickers
if params('debug')   
    importfile('test_list.csv')
    tickers = test_list;
else
    importfile('full_list.csv')
    tickers = full_list;
end


%% Start Processing

% For each ticker...
for ii = 1:length(tickers)
   ticker = tickers(ii);
   
   % See if table has already been defined
   if TableExist(ticker)
      UpdateTable(ticker); 
   else
      InitializeTable(ticker);
   end
    
end