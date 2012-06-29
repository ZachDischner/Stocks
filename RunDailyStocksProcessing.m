% Main script, handles daily task of fetching and updating database


%% Load List of Tickers
if params('debug')
    
    importfile('test_list.csv')
else
    importfile('full_list.csv')
end