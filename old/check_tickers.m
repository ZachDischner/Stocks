function [good,bad] = check_tickers(tickers)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           July  31  2011
%      +-------------------------+------------------------\    __      ____
%  {=  |     Zach Dischner,      | Email:   zach.dischner  \___| \____/ ___\___|
%  {=  |  Aerospace Engineering  |         @colorado.edu   /   ===---======)--->
%      +-------------------------+------------------------/                    |
%
%     Function  : CHECK_TICKERS
%
%     Purpose   : Given a list of tickers (obtainable anywhere), sort out
%                 which ones are findable by HIST_STOCK_DATA, and which
%                 ones aren't. Make a list of each and return. In addition,
%                 save all the good tickers as a new .txt file
%
%     Input     : TICKERS - an array or cell array of ticker symbols. 
%
%     Output    : GOOD,BAD - Arrays of good and bad tickers, at least
%                 according to hist_stock_data
%
%     Procedure : TBD 
%
%
%     Notes     : Should recheck this periodically to check stocks
%
%
%     Calling   : tickers=[importdata('NYSE.csv');importdata('NASDAQ.csv');importdata('indices.csv')]
%               [good,bad] = check_tickers(tickers)
%
%                                               _
%                 ___                          (_)
%                 _/XXX\
%  _             /XXXXXX\_                                    __
%  X\__    __   /X XXXX XX\                          _       /XX\__      ___
%      \__/  \_/__       \ \                       _/X\__   /XX XXX\____/XXX\
%    \  ___   \/  \_      \ \               __   _/      \_/  _/  -   __  -  \
%   ___/   \__/   \ \__     \\__           /  \_//  _ _ \  \     __  /  \____/
%  /  __    \  /     \ \_   _//_\___    __/    //           \___/  \/     __/
%  __/_______\________\__\_/________\__/_/____/_____________/_______\____/____
%                                    ___
%                                   /L|0\
%                                  /  |  \
%                                 /       \
%                                /    |    \
%                               /           \
%                              /  __  | __   \
%                             /  __/    \__   \
%                            /  /__   |  __\   \
%                           /___________________\
%                          /          |          \
%                         /      /   _|_   \      \
%                        /      ____/___\____      \
%                        ___________[o0o]___________
%                                 O   O    O
%
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% check em
today        = datestr(date,'ddmmyyyy');;
yesterday    = today;
yesterday(2) = yesterday(2)-1;   % add check for first of the month

good = cell(length(tickers),1);
bad  = cell(length(tickers),1);
good_index = [];
bad_index  = []; 

%h = waitbar(0, 'Please Wait...');

for ii = 1:length(tickers)
    data = hist_stock_data(yesterday,today,tickers{ii});
    if isempty(data) 
        bad{ii} = tickers{ii};
        bad_index = [bad_index,ii];
    else
        good{ii} = tickers{ii};
        good_index = [good_index,ii];
    end
    %waitbar(ii/length(tickers),h)
    if mod(ii,10) == 0
        ii
    end
end

good = good(good_index);
bad  = bad (bad_index);
save goodnames.txt good; 
save badnames.txt  bad;
       
%% Todos, add code that will download the names from somewhere
% This will download the .txt file http://www.eoddata.com/Data/symbollist.aspx?e=NYSE












end