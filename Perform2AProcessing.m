% Perform 2A Processing
% Analyze Raw data to obtain basic statistics about it.
% No Probability insight yet

function status = Perform2AProcessing(tickers)

for ii = 1:length(tickers)
    ticker = tickers{ii};
    
    fprintf(params('logID'),['Performing basic statistical analysis on\t',ticker,'\n\n'])
    
    
    %% Until The Analyzed Data Has Caught Up to the  Filled To Data
    while DB_Select('analyzed to','cmg') <= DB_Select('filled to','cmg')
        
        % Get Basic Stats
        Analyzed_to = DB_Select('Analyzed To',ticker);
        AVG50   = DB_Select('50avg',ticker,Analyzed_to);
        AVG200  = DB_Select('200avg',ticker,Analyzed_to);
        MAX52   = DB_Select('52max',ticker,Analyzed_to);
        MIN52   = DB_Select('52min',ticker,Analyzed_to);
        
        % Update Ticker Table
        status = DB_Update('50avg',ticker,AVG50,Analyzed_to);
        status = DB_Update('200avg',ticker,AVG200,Analyzed_to);
        status = DB_Update('52max',ticker,MAX52,Analyzed_to);
        status = DB_Update('52min',ticker,MIN52,Analyzed_to);
        
        
    end
    
    
    
    
    
    
    
    
end


end





