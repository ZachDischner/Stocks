% simply ask the database if the table exists or not

function TorF = TableExist(table_name)

tmp = max(strcmp(table_name,mysql('show tables')));

TorF = (tmp == 1);

end
