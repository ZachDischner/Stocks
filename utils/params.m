% Use this fuction to store information/global specs throughout app


function output = params(input)

switch strrep(upper(input),'_',' ')
    
    case 'START DATE'
        output = datestr('2008/01/01');
        
    case 'DEBUG'
        output = true;
        
    case 'logID'
        if params('debug')
            output = 0;
        else
            % Gotta Fix This
            currtime = datestr(now,'mmm dd yyyy hh:ss');
            filename = ['./Logs/',datestr(date,'mm-dd-yyyy'),'_Log.txt'];
            save(filename,'currtime')
            fid = fopen(filename);
            output = 1; 
            
        end
        
    otherwise
        fprintf(2,'Uh oh, invalid parameter request!\n')
        dbstack(2,'-completenames')
        
        
end
