--计算发票总金额
select Round (sum(total)::numeric, 2) as invoice_revenue
from invoice;
--验证数据
select round(sum(unit_price*quantity)::numeric, 2) as invoice_revenue
from invoice_line;
-- 错误示例：连接明细表后直接汇总发票金额，
-- 会因为一张发票对应多条明细而造成重复统计。
select round (sum(i.total)::numeric,2)as infated_revenue
from invoice as i
inner join invoice_line as il
on i.invoice_id=il.invoice_id;
