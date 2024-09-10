CREATE PROCEDURE [NOMIS].[p_standardise_datasets]
@TableName NVARCHAR(128),
@MetricID NVARCHAR(128)
AS
BEGIN

DECLARE @SchemaName NVARCHAR(128) = 'NOMIS'

DECLARE @FullTableName NVARCHAR(256) = @SchemaName + '.' + @TableName
DECLARE @SQL NVARCHAR(MAX)
DECLARE @OldColumnName NVARCHAR(128)
DECLARE @NewColumnName NVARCHAR(128)

-- Cursor to iterate over all the relevant columns in the table
DECLARE column_cursor CURSOR FOR
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = @SchemaName
    AND TABLE_NAME = @TableName
    AND COLUMN_NAME LIKE 'C%'

OPEN column_cursor
FETCH NEXT FROM column_cursor INTO @OldColumnName

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Determine the new column name based on the pattern
    SET @NewColumnName = 
        CASE 
            WHEN @OldColumnName LIKE '%_TYPECODE' THEN 'VARIABLE_TYPECODE'
            WHEN @OldColumnName LIKE '%_NAME' THEN 'VARIABLE_NAME'
            WHEN @OldColumnName LIKE '%_CODE' THEN 'VARIABLE_CODE'
            WHEN @OldColumnName LIKE '%_TYPE' THEN 'VARIABLE_TYPE'
            WHEN @OldColumnName LIKE '%_SORTORDER' THEN 'VARIABLE_SORTORDER'
            ELSE 'VARIABLE'
        END

    -- Construct the sp_rename statement
    SET @SQL = 'EXEC sp_rename ''' + @FullTableName + '.' + @OldColumnName + ''', ''' + @NewColumnName + ''', ''COLUMN'';'
    
    --PRINT @SQL
    
    -- Execute the SQL statement to rename the column
    EXEC sp_executesql @SQL
    
    -- Fetch the next column
    FETCH NEXT FROM column_cursor INTO @OldColumnName
END

CLOSE column_cursor
DEALLOCATE column_cursor

SET @SQL = 'ALTER TABLE ' + @FullTableName + ' ADD METRIC_ID NVARCHAR(MAX) DEFAULT ''' + @MetricID + ''' WITH VALUES;'

EXEC sp_executesql @SQL

END
GO

