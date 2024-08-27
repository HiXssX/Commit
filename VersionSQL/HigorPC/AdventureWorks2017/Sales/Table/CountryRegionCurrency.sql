/****** Object:  Table [Sales].[CountryRegionCurrency]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [Sales].[CountryRegionCurrency](
	[CountryRegionCode] [nvarchar](3) NOT NULL,
	[CurrencyCode] [nchar](3) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode] PRIMARY KEY CLUSTERED 
(
	[CountryRegionCode] ASC,
	[CurrencyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [IX_CountryRegionCurrency_CurrencyCode] ON [Sales].[CountryRegionCurrency]
(
	[CurrencyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [Sales].[CountryRegionCurrency] ADD  CONSTRAINT [DF_CountryRegionCurrency_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
ALTER TABLE [Sales].[CountryRegionCurrency]  WITH CHECK ADD  CONSTRAINT [FK_CountryRegionCurrency_CountryRegion_CountryRegionCode] FOREIGN KEY([CountryRegionCode])
REFERENCES [Person].[CountryRegion] ([CountryRegionCode])
ALTER TABLE [Sales].[CountryRegionCurrency] CHECK CONSTRAINT [FK_CountryRegionCurrency_CountryRegion_CountryRegionCode]
ALTER TABLE [Sales].[CountryRegionCurrency]  WITH CHECK ADD  CONSTRAINT [FK_CountryRegionCurrency_Currency_CurrencyCode] FOREIGN KEY([CurrencyCode])
REFERENCES [Sales].[Currency] ([CurrencyCode])
ALTER TABLE [Sales].[CountryRegionCurrency] CHECK CONSTRAINT [FK_CountryRegionCurrency_Currency_CurrencyCode]
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ISO code for countries and regions. Foreign key to CountryRegion.CountryRegionCode.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CountryRegionCurrency', @level2type=N'COLUMN',@level2name=N'CountryRegionCode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ISO standard currency code. Foreign key to Currency.CurrencyCode.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CountryRegionCurrency', @level2type=N'COLUMN',@level2name=N'CurrencyCode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CountryRegionCurrency', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CountryRegionCurrency', @level2type=N'CONSTRAINT',@level2name=N'DF_CountryRegionCurrency_ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CountryRegionCurrency', @level2type=N'CONSTRAINT',@level2name=N'PK_CountryRegionCurrency_CountryRegionCode_CurrencyCode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nonclustered index.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CountryRegionCurrency', @level2type=N'INDEX',@level2name=N'IX_CountryRegionCurrency_CurrencyCode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cross-reference table mapping ISO currency codes to a country or region.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CountryRegionCurrency'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key constraint referencing CountryRegion.CountryRegionCode.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CountryRegionCurrency', @level2type=N'CONSTRAINT',@level2name=N'FK_CountryRegionCurrency_CountryRegion_CountryRegionCode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key constraint referencing Currency.CurrencyCode.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CountryRegionCurrency', @level2type=N'CONSTRAINT',@level2name=N'FK_CountryRegionCurrency_Currency_CurrencyCode'
