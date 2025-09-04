CREATE TABLE IF NOT EXISTS duplicates (
    table_name_source VARCHAR(255),
    duplicate_data TEXT,  -- ya JSON agar aap chahein
    count_of_duplicates INT
);

DELIMITER $$

-- Duplicate check
CREATE PROCEDURE find_and_store_duplicates(IN source_table VARCHAR(255))
BEGIN
   -- code as given
END$$

-- Remove duplicates
CREATE PROCEDURE replace_duplicates_with_unique(IN target_table VARCHAR(255))
BEGIN
   -- code as given
END$$

-- Verify no duplicates
CREATE PROCEDURE verify_no_duplicates(IN table_name VARCHAR(255))
BEGIN
   -- code as given
END$$

-- Compare feeds
CREATE PROCEDURE compare_feeds(IN source_feed VARCHAR(255), IN target_feed VARCHAR(255))
BEGIN
   -- code as given
END$$

DELIMITER ;

DROP PROCEDURE IF EXISTS find_and_store_duplicates;
DELIMITER $$
CREATE PROCEDURE find_and_store_duplicates(IN source_table_name VARCHAR(255))
BEGIN
    -- full code from your previous copy for this procedure
END$$
DELIMITER ;

CREATE TABLE IF NOT EXISTS duplicates (...);
CREATE TABLE IF NOT EXISTS FeedComparisonResults (...);

DROP PROCEDURE IF EXISTS run_automated_tests;

CALL run_automated_tests();


