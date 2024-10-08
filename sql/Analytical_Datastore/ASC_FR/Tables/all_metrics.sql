CREATE TABLE [ASC_FR].[all_metrics] (
    [geography_level]        NVARCHAR (30) NULL,
    [data_level]             NVARCHAR (30) NULL,
    [uuid]                   INT           NULL,
    [fiscal_year]            INT           NULL,
    [cassr]                  NVARCHAR (30) NULL,
    [geography_code]         NVARCHAR (30) NULL,
    [dh_geography_name]      NVARCHAR (30) NULL,
    [region_go_code]         NVARCHAR (30) NULL,
    [geography_name]         NVARCHAR (30) NULL,
    [dimension_group]        NVARCHAR (30) NULL,
    [care_type]              NVARCHAR (30) NULL,
    [finance_type]           NVARCHAR (30) NULL,
    [finance_description]    NVARCHAR (30) NULL,
    [age_band]               NVARCHAR (30) NULL,
    [primary_support_reason] NVARCHAR (30) NULL,
    [support_setting]        NVARCHAR (30) NULL,
    [purpose]                NVARCHAR (30) NULL,
    [carer_support_type]     NVARCHAR (30) NULL,
    [data_type]              NVARCHAR (30) NULL,
    [activity_provision]     NVARCHAR (30) NULL,
    [comparative_totals]     FLOAT (53)    NULL,
    [data_source]            NVARCHAR (30) NULL,
    [numerator]              FLOAT (53)    NULL,
    [denominator]            FLOAT (53)    NULL,
    [unit_cost]              FLOAT (53)    NULL,
    [value]                  FLOAT (53)    NULL
);
GO

