% Use this fuction to store information/global specs throughout app


function output = params(input)

switch strrep(upper(input),'_',' ')
    
    case 'START DATE'
        output = datestr('2008/01/01');
        
    case 'DEBUG'
        output = true;
        
    case 'LOGID'
        if params('DEBUG')
            output = 1;
        else     
            currtime = datestr(now,'mmm dd yyyy hh:ss');
            filename = ['./Logs/',datestr(date,'mm-dd-yyyy'),'_Log.txt'];
            if fopen(filename) == -1
                fid = fopen(filename,'a+');
                fprintf(['Log for Stocks Processing \t',currtime,'\n\n']);
                fclose('all');
            end
  
            fid = fopen(filename);
            fprintf([currtime,'\n']);
            output = fid; 
            
        end
        
    otherwise
        fprintf(2,'Uh oh, invalid parameter request!\n')
        dbstack(2,'-completenames')
        
        
end
