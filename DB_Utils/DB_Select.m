% Function to put lots of Database Select statements. 
% The goal is to keep SQL logic out of the application logic as much as 
% possible.
% In addition, these statemnts should be eventually ported to MySQL
% stored procedures for speed purposes. Oh well, for later. 

function output = DB_Select(query,spec)


switch strrep(upper(query),'_',' ')
    % Simplest one, get "Filled To" date for a given ticker 
    case 'FILLED TO'
        cmd = [...
               'SELECT Filled_To FROM status WHERE( Ticker = "',spec,'")'
              ];
        output = datestr(mysql(cmd));
        return
        
    otherwise
        fprintf(2,'SNAP!, Unknown Database Selection Request!\n')
        dbstack(2,'-completenames')
          
end

output = mysql(cmd);




end











