SELECT
    current_database() AS database_name,
    current_user AS user_name,
    version() AS postgres_version;
	SELECT
    table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;
-- 查看public区域中的所有表
SELECT
    table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;


-- 精确统计每张表的行数
SELECT 'album' AS table_name, COUNT(*) AS row_count
FROM album

UNION ALL

SELECT 'artist', COUNT(*)
FROM artist

UNION ALL

SELECT 'customer', COUNT(*)
FROM customer

UNION ALL

SELECT 'employee', COUNT(*)
FROM employee

UNION ALL

SELECT 'genre', COUNT(*)
FROM genre

UNION ALL

SELECT 'invoice', COUNT(*)
FROM invoice

UNION ALL

SELECT 'invoice_line', COUNT(*)
FROM invoice_line

UNION ALL

SELECT 'media_type', COUNT(*)
FROM media_type

UNION ALL

SELECT 'playlist', COUNT(*)
FROM playlist

UNION ALL

SELECT 'playlist_track', COUNT(*)
FROM playlist_track

UNION ALL

SELECT 'track', COUNT(*)
FROM track

ORDER BY table_name;
