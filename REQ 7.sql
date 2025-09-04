USE ProjectDB;

-- 1. Create table to store comparison results
DROP TABLE IF EXISTS FeedComparisonResults;
CREATE TABLE FeedComparisonResults (
    FeedName VARCHAR(50),
    col1 INT,
    col2 VARCHAR(255),
    col3 VARCHAR(255),
    col4 VARCHAR(255),
    col5 VARCHAR(255),
    col6 VARCHAR(255),
    col7 VARCHAR(255),
    col8 VARCHAR(255),
    col9 VARCHAR(255),
    col10 VARCHAR(255),
    Status VARCHAR(50) -- Matched, Different, Missing in Feed1
);

-- 2. Compare Feed2 to Feed1
INSERT INTO FeedComparisonResults
(FeedName, col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, Status)
SELECT 
    'Feed2',
    f2.col1, f2.col2, f2.col3, f2.col4, f2.col5,
    f2.col6, f2.col7, f2.col8, f2.col9, f2.col10,
    CASE
        WHEN f1.col1 IS NULL THEN 'Missing in Feed1'
        WHEN f1.col2 = f2.col2 AND f1.col3 = f2.col3 AND f1.col4 = f2.col4
             AND f1.col5 = f2.col5 AND f1.col6 = f2.col6 AND f1.col7 = f2.col7
             AND f1.col8 = f2.col8 AND f1.col9 = f2.col9 AND f1.col10 = f2.col10
        THEN 'Matched'
        ELSE 'Different'
    END AS Status
FROM Feed2 f2
LEFT JOIN Feed1 f1 ON f2.col1 = f1.col1;

-- 3. Compare Feed3 to Feed1
INSERT INTO FeedComparisonResults
(FeedName, col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, Status)
SELECT 
    'Feed3',
    f3.col1, f3.col2, f3.col3, f3.col4, f3.col5,
    f3.col6, f3.col7, f3.col8, f3.col9, f3.col10,
    CASE
        WHEN f1.col1 IS NULL THEN 'Missing in Feed1'
        WHEN f1.col2 = f3.col2 AND f1.col3 = f3.col3 AND f1.col4 = f3.col4
             AND f1.col5 = f3.col5 AND f1.col6 = f3.col6 AND f1.col7 = f3.col7
             AND f1.col8 = f3.col8 AND f1.col9 = f3.col9 AND f1.col10 = f3.col10
        THEN 'Matched'
        ELSE 'Different'
    END AS Status
FROM Feed3 f3
LEFT JOIN Feed1 f1 ON f3.col1 = f1.col1;

-- 4. View results in SQL
SELECT * FROM FeedComparisonResults;


SHOW VARIABLES LIKE 'secure_file_priv';
