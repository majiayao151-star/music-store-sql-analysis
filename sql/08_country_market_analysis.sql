--哪些国家贡献了最多收入？这些收入来自多少客户和多少张发票？
select billing_country,
count(distinct customer_id)as customer_count, 
count (*) invoice_count,
round(avg(total)::numeric,2)as avg_order_value,
round(sum(total)::numeric,2)as total_revenue
from invoice
group by (billing_country)
order by total_revenue desc;