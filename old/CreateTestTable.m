clc;clear all; close all;

tickers = {'SPY','DOW','aapl','goog','arwr','pm','cmg','dsw','snpk','actg'};

fid = fopen('CreateTestTable.txt','w');

% in shell, mysql<CreateTestTable.txt

d1 = '01012009';
d2 = '01042012';

sqlstr = 'CREATE DATABASE IF NOT EXISTS test; USE test; DROP TABLE IF EXISTS stock_test;';
sqlstr = [sqlstr, 'CREATE TABLE stock_test (id bigint(20) unsigned NOT NULL AUTO_INCREMENT,',...
                    'ticker VARCHAR(6) NOT NULL,',...
                    'date DATETIME,',...
                    'open FLOAT(10,3),',...
                    'close FLOAT(10,3),',...
                    'high FLOAT(10,3),',...
                    'low FLOAT(10,3),',...
                    'volume FLOAT(10,3),',...
                    'adjclose FLOAT(10,3), PRIMARY KEY(id));'];
fprintf(fid,sqlstr);

for tt =1:length(tickers)
    dat = hist_stock_data(d1,d2,tickers{tt});
    for jj = 1:length(dat.Date)
    q = ['INSERT into stock_test (ticker,date,open,close,high,low,volume,adjclose) VALUES(',...
        '"' , num2str(dat.Ticker) , '",',...
        '"' , char(dat.Date(jj)), '",',...
        num2str(dat.Open(jj)), ',',...
        num2str(dat.Close(jj)), ',',...
        num2str(dat.High(jj)), ',',...
        num2str(dat.Low(jj)), ',',...
        num2str(dat.Volume(jj)), ',',...
        num2str(dat.AdjClose(jj)), ');'];
    
    fprintf(fid,q);
    end
    
    
end

    