-- 检查核心业务表的字段结构
SELECT
    table_name,
    ordinal_position,
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name IN (
      'customer',
      'invoice',
      'invoice_line'
  )
ORDER BY
    table_name,
    ordinal_position;