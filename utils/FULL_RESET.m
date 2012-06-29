% Run this to completely empty and reset your database




function FULL_RESET(dbname)

verify = max(strcmp(input(['You are about to completely erase ', dbname,'. Ar you SURE?? Y/N \n\n>> '],'s'),{'y','Y','yes','Yes','YES'}));

if verify
    mysql(['DROP DATABASE ',dbname]);
    mysql(['CREATE DATABASE ',dbname]);
end





end