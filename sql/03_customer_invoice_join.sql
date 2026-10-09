-- 连接客户与发票，查看每张发票所属的客户
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    i.invoice_id,
    i.invoice_date,
    i.billing_country,
    i.total
FROM customer AS c
INNER JOIN invoice AS i
    ON c.customer_id = i.customer_id
ORDER BY
    c.customer_id,
    i.invoice_date
LIMIT 20;


-- 检查原始发票数量
SELECT
    COUNT(*) AS invoice_rows
FROM invoice;


-- 检查连接后的行数
SELECT
    COUNT(*) AS joined_rows
FROM customer AS c
INNER JOIN invoice AS i
    ON c.customer_id = i.customer_id;