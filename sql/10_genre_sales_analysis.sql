--链接检查
--不能直接连接 invoice_line 和 genre，因为 invoice_line 没有 genre_id。需要通过 track 中转：
select 
count(*)as joined_rows
from invoice_line as il
inner join track as t
on il.track_id=t.track_id
inner join genre as g
on t.genre_id=g.genre_id;



--现在按音乐类型汇总销售表现：
select 
g.name as genre_name,
count(distinct il.invoice_id) as invoice_count,
sum(il.quantity) as units_sold,
round(sum(il.unit_price * il.quantity)::numeric,2) as total_revenue
from invoice_line as il
inner join track as t
on il.track_id=t.track_id
inner join genre as g
on t.genre_id=g.genre_id
group by g.genre_id,
g.name
order by total_revenue desc;




--计算每个类型占总收入的比例
with genre_sales as (select 
g.genre_id, g.name as genre_name, 
count(distinct il.invoice_id) as invoice_count,
sum(il.quantity) as units_sold,
sum(il.unit_price * il.quantity)::numeric as total_revenue

from invoice_line as il
inner join track as t
on il.track_id=t.track_id
inner join genre as g
on t.genre_id=g.genre_id
group by g.genre_id,
g.name
)
select 
genre_name, 
invoice_count, 
units_sold, 
round(total_revenue,2)as total_revenue,
round(total_revenue/nullif (sum(total_revenue)over(),0)*100,2) as revenue_share_pct
from genre_sales
order by total_revenue desc;

