% Similar to DB_Insert and DB_Select, just now for Update statemnts.
% Goal is to remove keep SQL from application, to ensure flexibility for future
% iterations with different databases.
% Also, this stuff would be good to be put in stored procedures at some time.


function status = DB_Update(type,spec,value,condition)

%This time, for random inputs...? spec input is expected to be a structure. Parses fieldnames
% and field values into the column names and column values for input. 

switch strrep(upper(type),'_',' ')
    case 'FILLED TO'
        cmd = [...
               'UPDATE status SET filled_to = "',value,'" ',...
               'WHERE (ticker = "',spec,'")'...
               ];
           
    case '50AVG'
        cmd = [...
            'UPDATE ',spec,' SET 50_day_average = ',num2str(value),...
            ' WHERE (date = "',condition,'")'...
            ];
        
    case '200AVG'
        
        cmd = [...
            'UPDATE ',spec,' SET 200_day_average = ',num2str(value),...
            ' WHERE (date = "',condition,'")'...
            ];
        
    case '52MAX'
        cmd = [...
            'UPDATE ',spec,' SET 52_high  = ',num2str(value),...
            ' WHERE (date = "',condition,'")'...
            ];
        
    case '52MIN'
        cmd = [...
            'UPDATE ',spec,' SET 52_low  = ',num2str(value),...
            ' WHERE (date = "',condition,'")'...
            ];
        
        
    otherwise
        fprintf(2,'Uh oh, invalid INSERT request!\n')
        dbstack(2,'-completenames')
        
end

if params('DEBUG')
%     fprintf(1,[cmd,'\n'])
end

status = mysql(cmd);



end