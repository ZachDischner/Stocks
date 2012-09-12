% Processing for Level 3A data. 
% This befins to get market insight/drawing conclusions from data. 
% Takes trends, stats, ect to produce buy/sell ratings. 


function status = Perform3AProcessing(tickers)


fprintf(params('LogId'),'Processing 3A Market Insight Data')

% For each ticker...
for ii = 1:length(tickers)
   ticker = tickers{ii};
   
   % While all data HAS NOT been analyzed...
   trend_to  = DB_Select('Trend to',ticker);
   filled_to = DB_Select('Filled_to',ticker);
   
   while trend_to < filled_to
   
    %% Perform Trend Analysis
    
    % Get 1 year range for analysis
    [trend_dir trend_mag typical_trend_mag] = TrendAnalysis(ticker,trend_to)

   end
   
end










end








