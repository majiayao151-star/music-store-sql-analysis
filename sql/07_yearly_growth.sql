--年度收入
select extract(year from invoice_date)::integer as revenue_year,
count (*)as invoice_count,
round(avg(total)::numeric,2)as avg_order_value,
round(sum(total)::numeric,2)as yearly_revenue
from invoice
group by extract(year from invoice_date)::integer
order by revenue_year;
--读取 invoice 表
--从 invoice_date 提取年份
--按年份分组
--计算每年发票数量和收入
--得到 yearly_sales 临时结果
--按年份排列临时结果
--LAG() 取得每一行的上一年收入
--输出最终结果
with yearly_sales as(
select extract(year from invoice_date)::integer as revenue_year,
count(*)as invoice_count,
round(sum(total)::numeric,2)as yearly_revenue
from invoice 
group by extract(year from invoice_date)::integer
)
--读取年度结果
select
revenue_year, invoice_count, yearly_revenue,
lag(yearly_revenue)over(order by revenue_year)as previous_year_revenue
from yearly_sales
order by revenue_year
--计算年度同比增长率
--公式：（本年收入 - 上年收入）÷ 上年收入 × 100

with yearly_sales as(
select extract(year from invoice_date)::integer as revenue_year,
count(*)as invoice_count,
round(sum(total)::numeric,2)as yearly_revenue
from invoice 
group by extract(year from invoice_date)::integer
),

yearly_comparison as (
select
revenue_year, invoice_count, yearly_revenue,
lag(yearly_revenue)over(order by revenue_year)as previous_year_revenue
from yearly_sales
)

select 
revenue_year, invoice_count, yearly_revenue, previous_year_revenue,
round((yearly_revenue-previous_year_revenue)/nullif (previous_year_revenue,0)*100,2)
as yoy_growth_pct
from yearly_comparison 
order by revenue_year;





