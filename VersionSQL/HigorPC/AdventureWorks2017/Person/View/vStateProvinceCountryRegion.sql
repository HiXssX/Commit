/****** Object:  View [Person].[vStateProvinceCountryRegion]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE VIEW [Person].[vStateProvinceCountryRegion] 
WITH SCHEMABINDING 
AS 
SELECT 
    sp.[StateProvinceID] 
    ,sp.[StateProvinceCode] 
    ,sp.[IsOnlyStateProvinceFlag] 
    ,sp.[Name] AS [StateProvinceName] 
    ,sp.[TerritoryID] 
    ,cr.[CountryRegionCode] 
    ,cr.[Name] AS [CountryRegionName]
FROM [Person].[StateProvince] sp 
    INNER JOIN [Person].[CountryRegion] cr 
    ON sp.[CountryRegionCode] = cr.[CountryRegionCode];

CREATE UNIQUE CLUSTERED INDEX [IX_vStateProvinceCountryRegion] ON [Person].[vStateProvinceCountryRegion]
(
	[StateProvinceID] ASC,
	[CountryRegionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
EXECUTE sys.sp_addextendedproperty @name = N'MS_Description', @value = N'Joins StateProvince table with CountryRegion table.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'VIEW', @level1name = N'vStateProvinceCountryRegion'
EXECUTE sys.sp_addextendedproperty @name = N'MS_Description', @value = N'Clustered index on the view vStateProvinceCountryRegion.', @level0type = N'SCHEMA', @level0name = N'Person', @level1type = N'VIEW', @level1name = N'vStateProvinceCountryRegion', @level2type = N'INDEX', @level2name = N'IX_vStateProvinceCountryRegion'
