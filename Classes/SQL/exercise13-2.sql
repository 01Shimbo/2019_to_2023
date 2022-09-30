-- Conditionally drop the procedure.
DROP PROCEDURE IF EXISTS dropIndexIfExists;
 
-- Change the default semicolon delimiter to write a PSM
-- (Persistent Stored Module) or stored procedure.
DELIMITER $$
 
-- Create the procedure.
CREATE PROCEDURE dropIndexIfExists
( pv_table_name  VARCHAR(64)
, pv_index_name  VARCHAR(64))
BEGIN
 
  /* Declare a local variable for the SQL statement. */
  DECLARE stmt VARCHAR(1024);
 
  /* Set a session variable with two parameter markers. */
  SET @SQL := CONCAT('ALTER TABLE ',pv_table_name,'DROP INDEX ',pv_index_name);
 
  /* Check if the constraint exists. */
  IF EXISTS (SELECT NULL
             FROM   information_schema.statistics s
             WHERE  s.index_schema = database()
             AND    s.table_name = pv_table_name
             AND    s.index_name = pv_index_name)
  THEN
 
    /* Dynamically allocated and run statement. */
    PREPARE stmt FROM @SQL;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
  END IF;
 
END;
$$
 
-- Reset the default semicolon delimiter.
DELIMITER ;
CALL dropIndexIfExists('payment' , 'idx_payment01');
-- create multicolmn index 
CREATE INDEX idxpaymet01
ON payment(paymet_date, amount)