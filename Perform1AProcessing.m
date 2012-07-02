% Perform 1A Processing, fetch base scientific data and put it into tables


function status = Perform1AProcessing(tickers)


% For each ticker...
for ii = 1:length(tickers)
   ticker = tickers{ii};
   
   % See if table has already been defined
   if ~TableExist(ticker)
      InitializeTickerTable(ticker);
   end
   
   UpdateTickerTable(ticker)
    
end


end