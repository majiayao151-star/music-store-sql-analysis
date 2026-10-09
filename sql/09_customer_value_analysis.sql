select 
c.customer_id, 
concat(c.first_name,'',c.last_name)as customer_name,
c.country,
--计算该客户有多少张发票，也就是购买了多少次。
count(i.invoice_id)as invoice_count,
round(avg(i.total)::numeric,2)as avg_order_value,
round(sum(i.total)::numeric,2)as total_spent
from customer as c
inner join invoice as i
on c.customer_id=i.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.country
order by total_spent desc
limit 10;


--计算前10位客户合计贡献了多少收入：
with customer_spending as (
select  c.customer_id, 
sum (i.total)::numeric as total_spent
from customer as c
inner join invoice as i
on c.customer_id = i.customer_id
group by c.customer_id),

top_10_customer as (
select 
customer_id, total_spent
from customer_spending 
order by total_spent desc
limit 10
)

select 
round(sum(total_spent),2) as top_10_revenue,
(select round(sum (total_spent),2) from customer_spending)
as total_revenue,

round(sum(total_spent/nullif((select sum(total_spent)from customer_spending),0)*100),2)
as top_10_revenue_pct 
from top_10_customer;


