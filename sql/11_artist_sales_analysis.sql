--艺术家收入分析
select 
count(*)as joined_rows
from invoice_line as il
inner join track as t
on il.track_id=t.track_id
inner join album as al
on t.album_id = al.album_id
inner join artist as ar
on al.artist_id=ar.artist_id;

--艺术家汇总销售表现
select 
ar.artist_id,
ar.name as artist_name,
count(distinct il.invoice_id)as invoice_count,
count(distinct t.track_id)as distinct_tracks_sold,
sum(il.quantity)as units_sold,
round(sum(il.unit_price * il.quantity)::numeric,2)as total_revenue

from invoice_line as il
inner join track as t
on il.track_id=t.track_id
inner join album as al
on t.album_id = al.album_id
inner join artist as ar
on al.artist_id=ar.artist_id

group by
ar.artist_id, ar.name
order by total_revenue desc
limit 10;