% Given a data set, return current trend info and averages.



function [trend_dir trend_mag typical_trend_mag] = TrendAnalysis(ticker,date)

%% Get 52 Week Dataset
data        = DB_Select('52 Close',ticker, datestr(date,'yyyy-mm-dd'));
old_trend   = DB_Select('Current Trend',ticker);

%% Get Current Trend    
if data(end) > data(end-1)
    current_trend = 1;
elseif data(end) < data(end-1)
    current_trend = -1;
else
    current_trend = 0;
end


% If trends have same sign, add. Otherwise, use new trend
if abs(old_trend + current_trend) == abs(old_trend) + abs(current_trend)
    trend_dir = old_trend + current_trend;
else
    trend_dir = current_trend;
end


%% Get Typical Trend Run-Outs
change      = diff(data);
up_buf      = zeros(length(change));
down_buf    = zeros(length(change));
up_idx      = change > 0;
down_idx    = change < 0;

for ii = 2:length(change)
    % 1 Means Up, 0 Means Down
    dir = up_idx(ii) == 1;
    
    if change(ii) > change(ii-1)
    
end











end