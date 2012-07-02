%startup everything

PathFiles = {...
             'analysis',...
             'company_lists',...
             'connection',...
             'Documentation',...
             'DB_Utils',...
             'selection',...
             'utils',...
             'Logs'...
            };
        
AddOrCreatePath(PathFiles);        


if mysql('status') == 1
    mysql('open','localhost','root')
    
    mysql('SHOW databases')
    
        mysql('CREATE DATABASE IF NOT EXISTS Stocks')
    mysql('USE Stocks')
    
    mysql('SHOW tables')
else
    disp('MYSQL is already running'),mysql('status')
end

% if mysql('SELECT last_date from stocks.update_info') ~= mysql('SELECT last_date from stocks.update_info')
%      mysql('update stocks.update_info set last_date = (SELECT MAX(date) FROM stocks.EOD)')
% end


