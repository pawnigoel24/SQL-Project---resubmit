
USE ProjectDB;


DROP PROCEDURE IF EXISTS create_feed_simple;

DELIMITER $$

CREATE PROCEDURE create_feed_simple(
    IN feedName VARCHAR(50),  
    IN colCount INT,           
    IN rowCount INT            
)
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE sqlStmt TEXT;
    

    -- Step 1: Drop table if already exists
    SET @drop_sql = CONCAT('DROP TABLE IF EXISTS ', feedName);
    PREPARE stmt FROM @drop_sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- Step 2: Create table dynamically
    SET sqlStmt = CONCAT('CREATE TABLE ', feedName, ' (');
    SET i = 1;
    WHILE i <= colCount DO
        SET sqlStmt = CONCAT(sqlStmt, 'col', i, ' VARCHAR(255)');
        IF i < colCount THEN
            SET sqlStmt = CONCAT(sqlStmt, ', ');
        END IF;
        SET i = i + 1;
    END WHILE;
    SET sqlStmt = CONCAT(sqlStmt, ')');

    SET @s = sqlStmt;
    PREPARE stmt FROM @s;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

    -- Step 3: Insert random rows
    SET i = 1;
    WHILE i <= rowCount DO
        SET @s = CONCAT('INSERT INTO ', feedName, ' SELECT ',
                        REPEAT('SUBSTRING(SHA2(RAND(),256),1,8), ', colCount-1),
                        'SUBSTRING(SHA2(RAND(),256),1,8)');
        PREPARE stmt FROM @s;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;
