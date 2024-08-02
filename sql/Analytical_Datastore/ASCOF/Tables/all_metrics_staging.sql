CREATE TABLE [ASCOF].[all_metrics_staging] (
    [FiscalYear]              VARCHAR (4)    NULL,
    [GeographicalCode]        VARCHAR (50)   NULL,
    [GeographicalDescription] VARCHAR (100)  NULL,
    [GeographicalLevel]       VARCHAR (50)   NULL,
    [ONSCode]                 VARCHAR (50)   NULL,
    [ASCOFMeasureCode]        VARCHAR (50)   NULL,
    [DisaggregationLevel]     VARCHAR (50)   NULL,
    [MeasureType]             VARCHAR (50)   NULL,
    [MeasureValue]            VARCHAR (50)   NULL,
    [MeasureGroup]            VARCHAR (50)   NULL,
    [MeasureGroupDescription] VARCHAR (1000) NULL
);
GO

