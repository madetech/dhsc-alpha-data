CREATE PROCEDURE [ASCOF].[p_all_metrics_staging_to_final]
AS
BEGIN
    -- Drop the all_metrics table if it exists
    DROP TABLE IF EXISTS [ASCOF].[all_metrics];

    -- Create the new all_metrics table with snake case column names
    CREATE TABLE [ASCOF].[all_metrics] (
        [fiscal_year] INT,
        [geographical_code] NVARCHAR(50),
        [geographical_description] NVARCHAR(255),
        [geographical_level] NVARCHAR(50),
        [ons_code] NVARCHAR(50),
        [ascof_measure_code] NVARCHAR(50),
        [disaggregation_level] NVARCHAR(50),
        [measure_group] NVARCHAR(50),
        [measure_group_description] NVARCHAR(1000),
        [denominator] INT,
        [outcome] FLOAT,
        [base] INT,
        [margin_of_error] FLOAT,
        [numerator] INT
    );

    -- Insert data into the new all_metrics table from the pivoted all_metrics_staging table
    INSERT INTO [ASCOF].[all_metrics] (
        [fiscal_year],
        [geographical_code],
        [geographical_description],
        [geographical_level],
        [ons_code],
        [ascof_measure_code],
        [disaggregation_level],
        [measure_group],
        [measure_group_description],
        [denominator],
        [outcome],
        [base],
        [margin_of_error],
        [numerator]
    )
    SELECT
        [FiscalYear] AS [fiscal_year],
        [GeographicalCode] AS [geographical_code],
        [GeographicalDescription] AS [geographical_description],
        [GeographicalLevel] AS [geographical_level],
        [ONSCode] AS [ons_code],
        [ASCOFMeasureCode] AS [ascof_measure_code],
        [DisaggregationLevel] AS [disaggregation_level],
        [MeasureGroup] AS [measure_group],
        [MeasureGroupDescription] AS [measure_group_description],
        TRY_CAST([Denominator] AS INT) AS [denominator],
        TRY_CAST([Outcome] AS FLOAT) AS [outcome],
        TRY_CAST([Base] AS INT) AS [base],
        TRY_CAST([Margin of Error] AS FLOAT) AS [margin_of_error],
        TRY_CAST([Numerator] AS INT) AS [numerator]
    FROM (
        SELECT
            *
        FROM [ASCOF].[all_metrics_staging]
    ) AS SourceTable
    PIVOT (
        MAX([MeasureValue])
        FOR [MeasureType] IN ([Denominator], [Outcome], [Base], [Margin of Error], [Numerator])
    ) AS PivotTable;
END;
GO

