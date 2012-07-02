% Run this to completely empty and reset your database




function FULL_RESET(dbname)

verify = max(strcmp(input(['You are about to completely erase ', dbname,'. Ar you SURE?? Y/N \n\n>> '],'s'),{'y','Y','yes','Yes','YES'}));

%% Drop Database, Completely Reset it
if verify
    mysql(['DROP DATABASE ',dbname]);
    mysql(['CREATE DATABASE ',dbname]);
    mysql(['USE ',dbname]);
    
    %% Create A Table Of Status Information
    CreateTable('Stock_Status');
    
end




end