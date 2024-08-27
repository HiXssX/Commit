/****** Object:  Table [Sales].[CurrencyRate]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [Sales].[CurrencyRate](
	[CurrencyRateID] [int] IDENTITY(1,1) NOT NULL,
	[CurrencyRateDate] [datetime] NOT NULL,
	[FromCurrencyCode] [nchar](3) NOT NULL,
	[ToCurrencyCode] [nchar](3) NOT NULL,
	[AverageRate] [money] NOT NULL,
	[EndOfDayRate] [money] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CurrencyRate_CurrencyRateID] PRIMARY KEY CLUSTERED 
(
	[CurrencyRateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

CREATE UNIQUE NONCLUSTERED INDEX [AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode] ON [Sales].[CurrencyRate]
(
	[CurrencyRateDate] ASC,
	[FromCurrencyCode] ASC,
	[ToCurrencyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [Sales].[CurrencyRate] ADD  CONSTRAINT [DF_CurrencyRate_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
ALTER TABLE [Sales].[CurrencyRate]  WITH CHECK ADD  CONSTRAINT [FK_CurrencyRate_Currency_FromCurrencyCode] FOREIGN KEY([FromCurrencyCode])
REFERENCES [Sales].[Currency] ([CurrencyCode])
ALTER TABLE [Sales].[CurrencyRate] CHECK CONSTRAINT [FK_CurrencyRate_Currency_FromCurrencyCode]
ALTER TABLE [Sales].[CurrencyRate]  WITH CHECK ADD  CONSTRAINT [FK_CurrencyRate_Currency_ToCurrencyCode] FOREIGN KEY([ToCurrencyCode])
REFERENCES [Sales].[Currency] ([CurrencyCode])
ALTER TABLE [Sales].[CurrencyRate] CHECK CONSTRAINT [FK_CurrencyRate_Currency_ToCurrencyCode]
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for CurrencyRate records.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CurrencyRate', @level2type=N'COLUMN',@level2name=N'CurrencyRateID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the exchange rate was obtained.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CurrencyRate', @level2type=N'COLUMN',@level2name=N'CurrencyRateDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Exchange rate was converted from this currency code.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CurrencyRate', @level2type=N'COLUMN',@level2name=N'FromCurrencyCode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Exchange rate was converted to this currency code.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CurrencyRate', @level2type=N'COLUMN',@level2name=N'ToCurrencyCode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Average exchange rate for the day.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CurrencyRate', @level2type=N'COLUMN',@level2name=N'AverageRate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Final exchange rate for the day.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CurrencyRate', @level2type=N'COLUMN',@level2name=N'EndOfDayRate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CurrencyRate', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CurrencyRate', @level2type=N'CONSTRAINT',@level2name=N'DF_CurrencyRate_ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CurrencyRate', @level2type=N'CONSTRAINT',@level2name=N'PK_CurrencyRate_CurrencyRateID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique nonclustered index.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CurrencyRate', @level2type=N'INDEX',@level2name=N'AK_CurrencyRate_CurrencyRateDate_FromCurrencyCode_ToCurrencyCode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Currency exchange rates.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CurrencyRate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key constraint referencing Currency.FromCurrencyCode.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CurrencyRate', @level2type=N'CONSTRAINT',@level2name=N'FK_CurrencyRate_Currency_FromCurrencyCode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key constraint referencing Currency.ToCurrencyCode.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'CurrencyRate', @level2type=N'CONSTRAINT',@level2name=N'FK_CurrencyRate_Currency_ToCurrencyCode'
