function output = UPDATE_STOCKS()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           July 18 2011
%      +-------------------------+------------------------\    __      ____
%  {=  |     Zach Dischner,      | Email:   zach.dischner  \___| \____/ ___\___|
%  {=  |  Aerospace Engineering  |         @colorado.edu   /   ===---======)--->
%      +-------------------------+------------------------/                    |
%
%     Function  : UPDATE_STOCKS
%
%     Purpose   : Simply update the mysql database to the current date
%
%     Input     : NONE for now
%
%     Output    : NON for now
%
%     Procedure :
%
%
%
%
%
%
%                                                 _
%                   ___                          (_)
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
%                         /          _|_          \
%                        /      ____/___\____      \
%                        ___________[o0o]___________
%                                 O   O    O
%
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Get date range to populate
global m_stock_start
m_stock_start = '2008-01-01'; 
fill_to_date  = datestr(date,'ddmmyyyy');      % 'date' is a built in function 
% last_date  = datestr(mysql('SELECT last_date from STOCKS.update_info'),'ddmmyyyy');
% if isempty(last_date)
%     last_date = '01012008';
% end
    

%% Update EOD for given date range
tickers    = importdata('goodnames.txt');
update_EOD_table(tickers,fill_to_date)

%% Update the current stats
UPDATE_STATS(tickers);


%% Finish with updating the UPDATE_INFO table
cmd = ['update stocks.update_info set last_date = (get_last_date())'];
mysql(cmd);


end