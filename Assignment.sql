create schema assignment;

use assignment;

select str_to_date(date,'%d-%M-%Y') as curr_date,close_price
from bajaj_auto
order by str_to_date(date,'%d-%M-%Y');

select str_to_date(date,'%d-%M-%Y') as curr_date,close_price
from eicher_motors
order by str_to_date(date,'%d-%M-%Y');

select str_to_date(date,'%d-%M-%Y') as curr_date,close_price
from hero_motocorp
order by str_to_date(date,'%d-%M-%Y');

select str_to_date(date,'%d-%M-%Y') as curr_date,close_price
from infosys
order by str_to_date(date,'%d-%M-%Y');

select str_to_date(date,'%d-%M-%Y') as curr_date,close_price
from tcs
order by str_to_date(date,'%d-%M-%Y');

select str_to_date(date,'%d-%M-%Y') as curr_date,close_price
from tvs_motors
order by str_to_date(date,'%d-%M-%Y');

select curr_date,close_price,
cast(avg(close_price) over(rows 19 preceding) as decimal(8,2)) as 20_day_MA,
cast(avg(close_price) over(rows 49 preceding) as decimal(8,2)) as 50_day_MA,
rank() over(order by curr_date) as row_num
from bajaj_auto1;

select curr_date,close_price,
cast(avg(close_price) over(rows 19 preceding) as decimal(8,2)) as 20_day_MA,
cast(avg(close_price) over(rows 49 preceding) as decimal(8,2)) as 50_day_MA,
rank() over(order by curr_date) as row_num
from eicher_motors1;

select curr_date,close_price,
cast(avg(close_price) over(rows 19 preceding) as decimal(8,2)) as 20_day_MA,
cast(avg(close_price) over(rows 49 preceding) as decimal(8,2)) as 50_day_MA,
rank() over(order by curr_date) as row_num
from hero_motocorp1;

select curr_date,close_price,
cast(avg(close_price) over(rows 19 preceding) as decimal(8,2)) as 20_day_MA,
cast(avg(close_price) over(rows 49 preceding) as decimal(8,2)) as 50_day_MA,
rank() over(order by curr_date) as row_num
from info1;

select curr_date,close_price,
cast(avg(close_price) over(rows 19 preceding) as decimal(8,2)) as 20_day_MA,
cast(avg(close_price) over(rows 49 preceding) as decimal(8,2)) as 50_day_MA,
rank() over(order by curr_date) as row_num
from tc1;

select curr_date,close_price,
cast(avg(close_price) over(rows 19 preceding) as decimal(8,2)) as 20_day_MA,
cast(avg(close_price) over(rows 49 preceding) as decimal(8,2)) as 50_day_MA,
rank() over(order by curr_date) as row_num
from tv1;

select curr_date,b.close_price as bajaj,e.close_price as eicher,h.close_price as hero,i.close_price as infosys,t.close_price as tcs,tv.close_price as tvs
from bajaj1 b inner join eicher1 e
using (curr_date)
inner join hero1 h
using (curr_date)
inner join infosys1 i
using (curr_date)
inner join tcs1 t
using (curr_date)
inner join tvs1 tv
using (curr_date);

select curr_date,close_price,(20_day_MA - 50_day_MA) as flag,row_num,
lag(20_day_MA - 50_day_MA,1) over(order by row_num) as flagp,
case
	when (20_day_MA - 50_day_MA)>=0 and lag(20_day_MA - 50_day_MA,1) over(order by row_num)<0 then 'SELL' 
    when (20_day_MA - 50_day_MA)<0 and lag(20_day_MA - 50_day_MA,1) over(order by row_num)>=0 then 'BUY'
    else 'HOLD'
end as sign
from bajaj1
where row_num>50;

select curr_date,close_price,(20_day_MA - 50_day_MA) as flag,row_num,
lag(20_day_MA - 50_day_MA,1) over(order by row_num) as flagp,
case
	when (20_day_MA - 50_day_MA)>=0 and lag(20_day_MA - 50_day_MA,1) over(order by row_num)<0 then 'SELL' 
    when (20_day_MA - 50_day_MA)<0 and lag(20_day_MA - 50_day_MA,1) over(order by row_num)>=0 then 'BUY'
    else 'HOLD'
end as sign
from eicher1
where row_num>50;

select curr_date,close_price,(20_day_MA - 50_day_MA) as flag,row_num,
lag(20_day_MA - 50_day_MA,1) over(order by row_num) as flagp,
case
	when (20_day_MA - 50_day_MA)>=0 and lag(20_day_MA - 50_day_MA,1) over(order by row_num)<0 then 'SELL' 
    when (20_day_MA - 50_day_MA)<0 and lag(20_day_MA - 50_day_MA,1) over(order by row_num)>=0 then 'BUY'
    else 'HOLD'
end as sign
from hero1
where row_num>50;

select curr_date,close_price,(20_day_MA - 50_day_MA) as flag,row_num,
lag(20_day_MA - 50_day_MA,1) over(order by row_num) as flagp,
case
	when (20_day_MA - 50_day_MA)>=0 and lag(20_day_MA - 50_day_MA,1) over(order by row_num)<0 then 'SELL' 
    when (20_day_MA - 50_day_MA)<0 and lag(20_day_MA - 50_day_MA,1) over(order by row_num)>=0 then 'BUY'
    else 'HOLD'
end as sign
from infosys1
where row_num>50;


select curr_date,close_price,(20_day_MA - 50_day_MA) as flag,row_num,
lag(20_day_MA - 50_day_MA,1) over(order by row_num) as flagp,
case
	when (20_day_MA - 50_day_MA)>=0 and lag(20_day_MA - 50_day_MA,1) over(order by row_num)<0 then 'SELL' 
    when (20_day_MA - 50_day_MA)<0 and lag(20_day_MA - 50_day_MA,1) over(order by row_num)>=0 then 'BUY'
    else 'HOLD'
end as sign
from tcs1
where row_num>50;

select curr_date,close_price,(20_day_MA - 50_day_MA) as flag,row_num,
lag(20_day_MA - 50_day_MA,1) over(order by row_num) as flagp,
case
	when (20_day_MA - 50_day_MA)>=0 and lag(20_day_MA - 50_day_MA,1) over(order by row_num)<0 then 'SELL' 
    when (20_day_MA - 50_day_MA)<0 and lag(20_day_MA - 50_day_MA,1) over(order by row_num)>=0 then 'BUY'
    else 'HOLD'
end as sign
from tvs1
where row_num>50;

delimiter $$


create function date_today1(f_date Datetime)
returns varchar(20) deterministic  
begin
	declare recommendation varchar(20);
		set recommendation = (select sign from bajaj2 where curr_date = f_date);
	return recommendation;
end; $$

delimiter ;

select date_today1('2015-03-19 00:00:00') as recommendation;