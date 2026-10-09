-- 1. 检查数据覆盖的日期范围
SELECT
    MIN(invoice_date) AS first_invoice_date,
    MAX(invoice_date) AS last_invoice_date,
    COUNT(*) AS invoice_count
FROM invoice;


-- 2. 按时间顺序查看每月收入
SELECT
    DATE_TRUNC('month', invoice_date)::date AS revenue_month,
    COUNT(*) AS invoice_count,
    ROUND(AVG(total)::numeric, 2) AS avg_order_value,
    ROUND(SUM(total)::numeric, 2) AS monthly_revenue
FROM invoice
GROUP BY DATE_TRUNC('month', invoice_date)::date
ORDER BY revenue_month;


-- 3. 找出收入最高的5个月
SELECT
    DATE_TRUNC('month', invoice_date)::date AS revenue_month,
    COUNT(*) AS invoice_count,
    ROUND(AVG(total)::numeric, 2) AS avg_order_value,
    ROUND(SUM(total)::numeric, 2) AS monthly_revenue
FROM invoice
GROUP BY DATE_TRUNC('month', invoice_date)::date
ORDER BY monthly_revenue DESC
LIMIT 5;