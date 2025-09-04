USE ProjectDB;

-- Check duplicates in Feed1
SELECT COUNT(*) AS duplicate_groups_Feed1
FROM (
    SELECT COUNT(*) 
    FROM Feed1
    GROUP BY col1, col2, col3, col4, col5, col6, col7, col8, col9, col10
    HAVING COUNT(*) > 1
) AS t1;

-- Check duplicates in Feed2
SELECT COUNT(*) AS duplicate_groups_Feed2
FROM (
    SELECT COUNT(*) 
    FROM Feed2
    GROUP BY col1, col2, col3, col4, col5, col6, col7, col8, col9, col10,
             col11, col12, col13, col14, col15
    HAVING COUNT(*) > 1
) AS t2;

-- Check duplicates in Feed3
SELECT COUNT(*) AS duplicate_groups_Feed3
FROM (
    SELECT COUNT(*) 
    FROM Feed3
    GROUP BY col1, col2, col3, col4, col5, col6, col7, col8, col9, col10,
             col11, col12, col13, col14, col15, col16, col17, col18, col19, col20
    HAVING COUNT(*) > 1
) AS t3;
