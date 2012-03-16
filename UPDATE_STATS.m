function UPDATE_STATS(tickers)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           Aug 8 2011
%      +-------------------------+------------------------\    __      ____
%  {=  |     Zach Dischner,      | Email:   zach.dischner  \___| \____/ ___\___|
%  {=  |  Aerospace Engineering  |         @colorado.edu   /   ===---======)--->
%      +-------------------------+------------------------/                    |
%
%     Function  :Update the "current_stats" table
%
%     Purpose   :
%
%     Input     :
%
%     Output    :
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
%                          /          |         \
%                                /   _|_   \
%                        /      ____/___\____     \
%                        ___________[o0o]___________
%                                 O   O    O
%
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

m_date = datestr(mysql('SELECT get_last_date()'),'yyyy-mm-dd');

for ii = 1:length(tickers)
    % [temp2,status] = ...
    %     urlread(strcat('http://finance.yahoo.com/d/moving_average.csv?s=',...
    %     tickers{ii},'&f=jkm3m4'))
    
    % we get [52WeekLow,52WeekHigh,50DayMovingAverage,200DayMovingAverage]
    id = mysql(['SELECT get_id(''',tickers{ii},''')']);
    if isnan(id) 
        'stop'
    end
    low52      = mysql(['SELECT get_52low(''' ,m_date,''',',num2str(id),') ']);
    high52     = mysql(['SELECT get_52high(''',m_date,''',',num2str(id),') ']);
    avg50      = mysql(['SELECT get_50avg(''' ,m_date,''',',num2str(id),') ']);
    avg200     = mysql(['SELECT get_200avg(''',m_date,''',',num2str(id),') ']);
    if isnan(low52) 
        'stop'
    end
    if isnan(high52) 
        'stop'
    end
    if isnan(avg50) 
        'stop'
    end
    if isnan(avg200) 
        'stop'
    end
    query       =['UPDATE stocks.current_stats SET ',...   % hmm ...not working exactly, is just putting todays value. Maybe check on that...
        '52_low = ',num2str(low52),',',...
        '52_high = ',num2str(high52),',',...
        '50_day_average = ',num2str(avg50),',',...
        '200_day_average = ',num2str(avg200),...
        ' WHERE id = ',num2str(id)];
    mysql(query);
    
end
end

%update market_stats SET ticker = 'aapl',52_low=9,52_high=3,50_day_average=100,200_day_average=99.2 WHERE id = 1;






