/****** Object:  View [Production].[vProductAndDescription]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE VIEW [Production].[vProductAndDescription] 
WITH SCHEMABINDING 
AS 
-- View (indexed or standard) to display products and product descriptions by language.
SELECT 
    p.[ProductID] 
    ,p.[Name] 
    ,pm.[Name] AS [ProductModel] 
    ,pmx.[CultureID] 
    ,pd.[Description] 
FROM [Production].[Product] p 
    INNER JOIN [Production].[ProductModel] pm 
    ON p.[ProductModelID] = pm.[ProductModelID] 
    INNER JOIN [Production].[ProductModelProductDescriptionCulture] pmx 
    ON pm.[ProductModelID] = pmx.[ProductModelID] 
    INNER JOIN [Production].[ProductDescription] pd 
    ON pmx.[ProductDescriptionID] = pd.[ProductDescriptionID];

CREATE UNIQUE CLUSTERED INDEX [IX_vProductAndDescription] ON [Production].[vProductAndDescription]
(
	[CultureID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
EXECUTE sys.sp_addextendedproperty @name = N'MS_Description', @value = N'Product names and descriptions. Product descriptions are provided in multiple languages.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'VIEW', @level1name = N'vProductAndDescription'
EXECUTE sys.sp_addextendedproperty @name = N'MS_Description', @value = N'Clustered index on the view vProductAndDescription.', @level0type = N'SCHEMA', @level0name = N'Production', @level1type = N'VIEW', @level1name = N'vProductAndDescription', @level2type = N'INDEX', @level2name = N'IX_vProductAndDescription'
