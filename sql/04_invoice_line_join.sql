-- 查看一张发票及其商品明细
SELECT
    i.invoice_id,
    i.invoice_date,
    i.total AS invoice_total,
    il.invoice_line_id,
    il.track_id,
    il.unit_price,
    il.quantity,
    il.unit_price * il.quantity AS line_revenue
FROM invoice AS i
INNER JOIN invoice_line AS il
    ON i.invoice_id = il.invoice_id
WHERE i.invoice_id = 1
ORDER BY il.invoice_line_id;


-- 检查发票数量
SELECT
    COUNT(*) AS invoice_rows
FROM invoice;


-- 检查发票明细数量
SELECT
    COUNT(*) AS invoice_line_rows
FROM invoice_line;


-- 检查连接后的行数
SELECT
    COUNT(*) AS joined_invoice_line_rows
FROM invoice AS i
INNER JOIN invoice_line AS il
    ON i.invoice_id = il.invoice_id;
