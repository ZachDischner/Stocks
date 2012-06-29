%startup everything
if ~exist('analysis','dir')
    mkdir('analysis');
end
addpath('analysis')

if ~exist('company_lists','dir')
    mkdir('company_lists');
end
addpath('company_lists')

if ~exist('connection','dir')
    mkdir('connection');
end
addpath('connection')

if ~exist('Documentation','dir')
    mkdir('Documentation');
end
addpath('Documentation')

if ~exist('population','dir')
    mkdir('population');
end
addpath('population')

if ~exist('selection','dir')
    mkdir('selection');
end
addpath('selection')

if ~exist('utils','dir')
    mkdir('utils');
end
addpath('utils')



if mysql('status') == 1
    mysql('open','localhost','zachd1_618','veyron')
    
    mysql('SHOW databases')
    
    mysql('USE stocks')
    
    mysql('SHOW tables')
else
    disp('MYSQL is already running'),mysql('status')
end

% if mysql('SELECT last_date from stocks.update_info') ~= mysql('SELECT last_date from stocks.update_info')
%      mysql('update stocks.update_info set last_date = (SELECT MAX(date) FROM stocks.EOD)')
% end


