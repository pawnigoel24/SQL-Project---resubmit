USE ProjectDB;

-- Step 1: Drop Duplicates table if already exists
DROP TABLE IF EXISTS Duplicates;

-- Step 2: Create Duplicates table
CREATE TABLE Duplicates (
    feed_name VARCHAR(50),
    duplicate_data TEXT,
    duplicate_count INT
);

-- Step 3: Insert duplicates from Feed1
INSERT INTO Duplicates (feed_name, duplicate_data, duplicate_count)
SELECT 'Feed1',
       CONCAT_WS(',', col1, col2, col3, col4, col5),
       COUNT(*)
FROM Feed1
GROUP BY col1, col2, col3, col4, col5
HAVING COUNT(*) > 1;

-- Step 4: Insert duplicates from Feed2
INSERT INTO Duplicates (feed_name, duplicate_data, duplicate_count)
SELECT 'Feed2',
       CONCAT_WS(',', col1, col2, col3, col4, col5, col6, col7),
       COUNT(*)
FROM Feed2
GROUP BY col1, col2, col3, col4, col5, col6, col7
HAVING COUNT(*) > 1;

-- Step 5: Insert duplicates from Feed3
INSERT INTO Duplicates (feed_name, duplicate_data, duplicate_count)
SELECT 'Feed3',
       CONCAT_WS(',', col1, col2, col3, col4, col5, col6, col7, col8, col9, col10),
       COUNT(*)
FROM Feed3
GROUP BY col1, col2, col3, col4, col5, col6, col7, col8, col9, col10
HAVING COUNT(*) > 1;

-- Step 6: View duplicates
SELECT * FROM Duplicates;
