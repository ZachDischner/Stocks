function trend_analysis(tickers)
% Perform trend analysis on a given range of tickers
% probably port this over to MYSQL eventually

    
%% Get Momentum value
if nargout == 1    
    query         = ['SELECT (date,EOD_price) FROM EOD WHERE id = (SELECT id FROM company_list WHERE ticker = ''',tickers{ii},''')'];
    [date,price]  = mysql(query); 
end  
    
    
    
    
    
    
