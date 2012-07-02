% Similar to DB_Select, just now for insert statemnts.
% Goal is to remove keep SQL from application, to ensure flexibility for future
% iterations with different databases.
% Also, this stuff would be good to be put in stored procedures at some time.

function status = DB_Insert(type,spec)

%This time, for random inputs...? spec input is expected to be a structure. Parses fieldnames
% and field values into the column names and column values for input. 

switch strrup(upper(type),'_',' ')
    case 'STATUS'
        cmd = ['INSERT INTO status ticker values(',spec,')'];
        
    case 'RAW'
        cmd = ['INSERT (date,open,close,adjclose)',...
               'INTO ',spec.Ticker,' VALUES (',...
               '"',spec.Date,'",',...
               spec.Open,',',...
               spec.Close,',',...
               spec.AdjClose,')'...
               ];
               
        
        
    otherwise
        fprintf(2,'Uh oh, invalid INSERT request!\n')
        dbstack(2,'-completenames')
        
end

mysql(cmd)



end



