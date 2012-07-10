% Similar to DB_Select, just now for insert statemnts.
% Goal is to remove keep SQL from application, to ensure flexibility for future
% iterations with different databases.
% Also, this stuff would be good to be put in stored procedures at some time.

function status = DB_Insert(type,spec)

%This time, for random inputs...? spec input is expected to be a structure. Parses fieldnames
% and field values into the column names and column values for input. 

switch strrep(upper(type),'_',' ')
    case 'STATUS'
        cmd = ['INSERT INTO status (ticker) values("',spec,'")'];
        
    case 'RAW'
        cmd = ['INSERT INTO ',spec.Ticker,...
               '(date,open,close,adjclose,high,low,volume) ',...
               'VALUES (',...
               '"',spec.Date,'",',...
               num2str(spec.Open)     ,',',...
               num2str(spec.Close)    ,',',...
               num2str(spec.AdjClose) ,',',...
               num2str(spec.High)     ,',',...
               num2str(spec.Low)      ,',',...
               num2str(spec.Volume)   ,')'...
               ];
               
        
        
    otherwise
        fprintf(2,'Uh oh, invalid INSERT request!\n')
        dbstack(2,'-completenames')
        
end


if params('DEBUG')
    % Hmmm not working...
%     fprintf(1,[cmd,'\n'])
end

status = mysql(cmd); 


end



