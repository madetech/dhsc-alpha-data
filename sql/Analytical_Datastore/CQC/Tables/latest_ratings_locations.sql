CREATE TABLE [CQC].[latest_ratings_locations] (
    [location_id]                          VARCHAR (255) NULL,
    [location_ods_code]                    VARCHAR (255) NULL,
    [location_name]                        VARCHAR (255) NULL,
    [care_home]                            INT           NOT NULL,
    [location_type]                        VARCHAR (255) NULL,
    [location_primary_inspection_category] VARCHAR (255) NULL,
    [location_street_address]              VARCHAR (255) NULL,
    [location_address_line_2]              VARCHAR (255) NULL,
    [location_city]                        VARCHAR (255) NULL,
    [location_post_code]                   VARCHAR (255) NULL,
    [location_local_authority]             VARCHAR (255) NULL,
    [location_region]                      VARCHAR (255) NULL,
    [location_nhs_region]                  VARCHAR (255) NULL,
    [location_onspd_ccg_code]              VARCHAR (255) NULL,
    [location_onspd_ccg]                   VARCHAR (255) NULL,
    [location_commissioning_ccg_code]      VARCHAR (255) NULL,
    [location_commissioning_ccg_name]      VARCHAR (255) NULL,
    [service_population_group]             VARCHAR (255) NULL,
    [domain]                               VARCHAR (255) NULL,
    [latest_rating]                        VARCHAR (255) NULL,
    [publication_date]                     DATE          NULL,
    [report_type]                          VARCHAR (255) NULL,
    [inherited_rating]                     INT           NOT NULL,
    [url]                                  VARCHAR (255) NULL,
    [provider_id]                          VARCHAR (255) NULL,
    [provider_name]                        VARCHAR (255) NULL,
    [brand_id]                             VARCHAR (255) NULL,
    [brand_name]                           VARCHAR (255) NULL
);
GO
