% Simple function to create a MYSQL table with parameters defined here

function nil = CreateTable(tablename)

% might want schema in params
% might want to have multiple possibilities for table creation

tablename = strrep(tablename,' ','_');

switch upper(tablename)
    case 'STOCK_STATUS'
        start = datestr(params('start date'),'yyyy-mm-dd');
        cmd = [...
              'CREATE TABLE status (',...                            
              'ticker        VARCHAR(8) UNIQUE ,',...                       % Ticker
              'filled_to     DATE DEFAULT "',start,'",',...                 % Date the table has been updated until
              'stats_to      DATE DEFAULT "',start,'",',...                 % Date the table has statistics analyzed to
              'trend_to      DATE DEFAULT "',start,'",',...                 % Date the table has trend analysis to
              'trend         INT(5) DEFAULT 0,',...                         % Current Trend indicator of trend length and direction
              'trend_mag     DECIMAL(10,3) DEFAULT 0,',...                  % Current Percent change from trend origination
              'typ_trend_mag DECIMAL(10,3) DEFAULT 0',...                   % Current Normal trend amount
              ')'];
        cmd2 = 'CREATE INDEX tickerIDX ON status (ticker)';
              
        
    otherwise
        cmd =[...
            'CREATE  TABLE ',tablename,' ('...
            'date        DATE default  NULL,',...
            'open        DECIMAL(10,3) NOT NULL,',...
            'low         DECIMAL(10,3) NOT NULL,',...
            'high        DECIMAL(10,3) NOT NULL,',...
            'close       DECIMAL(10,3) NOT NULL,',...
            'adjclose    DECIMAL(10,3) NOT NULL,',...
            'volume      DECIMAL(15,3) NOT NULL,',...
            '52_low      DECIMAL(10,3) NOT NULL DEFAULT 0,'...
            '52_high     DECIMAL(10,3) NOT NULL DEFAULT 0,',...
            '50_day_average DECIMAL(10,3) NOT NULL DEFAULT 0,',...
            '200_day_average DECIMAL(10,3) NOT NULL DEFAULT 0,',...
            'trend       DECIMAL(5,3)  NOT NULL DEFAULT 0,',...
            'up_avg      DECIMAL(5,3)  NOT NULL DEFAULT 0,',...
            'down_avg    DECIMAL(5,3)  NOT NULL DEFAULT 0',...
            ')'
            ];
        cmd2 = ['CREATE INDEX dateIDX on ',tablename,' (date)'];
        
end

fprintf(params('LogId'),['\nCreating Table ',tablename,'\n'])

mysql(cmd);

if params('DEBUG')
    fprintf(1,[cmd,'\n'])
end

if exist('cmd2','var')
    mysql(cmd2);
    if params('DEBUG')
    fprintf(1,[cmd2,'\n'])
end
end


end

