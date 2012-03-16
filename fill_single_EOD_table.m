function fill_single_eod_table(symbols,start_date,end_date)
% symbol should be text ticker
% date should be ddmmyyyy
% NOTE, select date automatically gives "days since year 0"

%% Get the data

total_start_date = datestr(mysql('SELECT start_date from update_info'),'ddmmyyyy'); % The very beginning of our table

for jj=1:length(symbols)
    symbol = cell2mat(symbols(jj));
    
    %% Decide if the ticker has been defined and update accordingly put into funciotn!!
    query = ['SELECT get_id(''',symbol,''')'];
    exists = mysql(query);
    
    if (isnan(exists) || isempty(exists)) % if exists is empty, that means the ticker is undefined, so we put it in company_list
        query = ['INSERT into company_list (ticker) VALUES(''',symbol,''')'];
        mysql(query);
        query = ['SELECT (id) from company_list WHERE company_list.ticker = ''',symbol,''''];
        key_id = mysql(query);
        query = ['INSERT into current_stats (id,ticker) VALUES(',num2str(key_id),',''',symbol,''')'];
        mysql(query);
        m_start_date = datestr(start_date,'dd-mm-yyyy');
       % query = ['UPDATE stocks.update_info set start_date = (''',m_start_date,''') WHERE id = ',num2str(key_id)];
        query = ['INSERT INTO stocks.update_info (id,start_date) VALUES (',num2str(key_id),',''',m_start_date,''')'];
        
        mysql(query);
        stocks = hist_stock_data(total_start_date, end_date, symbol);
    else
        key_id = exists;
        stocks = hist_stock_data(start_date, end_date, symbol);
    end
    
    
    if ~isempty(stocks) && isfield(stocks,{'Date','Close','Ticker'})
        
        
        for ii = length(stocks.Date):-1:1
            %% Convert date to SQL date format
            date=cell2mat(stocks.Date(ii))
            
            m_date = date;
            
            
            %% Update EOD table, if not defined already
            query         = ['SELECT EOD_price,date FROM EOD WHERE (id = ',num2str(key_id),' AND date = ''',...
                m_date,''' AND EOD_price = ''',num2str(stocks.Close(ii)),''')'];
            
            [date,price]  = mysql(query);
            
            if isempty(date) || isempty(price) %GOTTA EDIT THIS TO WORK WITH EACH OF THE FUNCITONS!!!!
                %                    query     = ['INSERT INTO EOD (id,date,eod_price,52_low,52_high,50_day_average,200_day_average)',...
                %                        'VALUES (',num2str(key_id),' , ''',m_date,''' , ',num2str(stocks.Close(ii)),...
                %                        ', get_52low(''',m_date,''',',num2str(key_id),'), ',...
                %                        'get_52high(''',m_date,''',',num2str(key_id),'), ',...
                %                        'get_50avg(''',m_date,''',',num2str(key_id),'), ',...
                %                        'get_200avg(''',m_date,''',',num2str(key_id),')) '];
                %
                query     = ['INSERT INTO EOD (id,date,eod_price)',...
                    'VALUES (',num2str(key_id),' , ''',m_date,''' , ',num2str(stocks.Close(ii)),')'];
                mysql(query);
                
                low52      = mysql(['SELECT get_52low(''',m_date,''',',num2str(key_id),') ']);
                high52     = mysql(['SELECT get_52high(''',m_date,''',',num2str(key_id),') ']);
                avg50      = mysql(['SELECT get_50avg(''',m_date,''',',num2str(key_id),') ']);
                avg200     = mysql(['SELECT get_200avg(''',m_date,''',',num2str(key_id),') ']);
                
                query       =['UPDATE EOD SET ',...   % hmm ...not working exactly, is just putting todays value. Maybe check on that...
                    '52_low = ',num2str(low52),',',...
                    '52_high = ',num2str(high52),',',...
                    '50_day_average = ',num2str(avg50),',',...
                    '200_day_average = ',num2str(avg200),...
                    ' WHERE id = ',num2str(key_id),' and DATE = ''',m_date,''''];
                %problem is it goes backwards, starts with the
                %latest day and goes back to day 1, whereas this
                %algorithm looks back from the old days. Probably
                %new function to update all this data
                
                mysql(query);
            end
        end
    end
end
end