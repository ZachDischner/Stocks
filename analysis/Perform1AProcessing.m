% Perform 1A Processing, fetch base scientific data and put it into tables


function status = Perform1AProcessing(tickers)

fprintf(params('LogId'),'Processing 1A Raw Data')

% For each ticker...
for ii = 1:length(tickers)
   ticker = tickers{ii};
   
   fprintf(params('LogId'),['Fetching/Updating Stock Data for:\t',ticker,'\n'])
   
   % See if table has already been defined
   if ~TableExist(ticker)
      InitializeTickerTable(ticker);
   end
   
   UpdateTickerTable(ticker)
    
end


end