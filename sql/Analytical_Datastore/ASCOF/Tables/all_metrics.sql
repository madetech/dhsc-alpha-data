CREATE TABLE [ASCOF].[all_metrics] (
    [fiscal_year]               INT           NULL,
    [geographical_code]         NVARCHAR (30) NULL,
    [geographical_description]  NVARCHAR (30) NULL,
    [geographical_level]        NVARCHAR (30) NULL,
    [ons_code]                  NVARCHAR (30) NULL,
    [ascof_measure_code]        NVARCHAR (30) NULL,
    [disaggregation_level]      NVARCHAR (30) NULL,
    [measure_group]             NVARCHAR (30) NULL,
    [measure_group_description] NVARCHAR (30) NULL,
    [denominator]               INT           NULL,
    [outcome]                   FLOAT (53)    NULL,
    [base]                      INT           NULL,
    [margin_of_error]           FLOAT (53)    NULL,
    [numerator]                 INT           NULL
);
GO

