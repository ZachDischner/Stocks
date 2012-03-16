%startup

if mysql('status') == 1
    mysql('open','localhost','zachd1_618','veyron')

    mysql('SHOW databases')
    
    mysql('USE stocks')

    mysql('SHOW tables')
else 
    disp('MYSQL is already running'),mysql('status')
end

if mysql('SELECT last_date from stocks.update_info') ~= mysql('SELECT last_date from stocks.update_info')
     mysql('update stocks.update_info set last_date = (SELECT MAX(date) FROM stocks.EOD)')
end


addpath('company_lists')