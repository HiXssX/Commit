/****** Object:  Table [Sales].[SalesPersonQuotaHistory]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [Sales].[SalesPersonQuotaHistory](
	[BusinessEntityID] [int] NOT NULL,
	[QuotaDate] [datetime] NOT NULL,
	[SalesQuota] [money] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC,
	[QuotaDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE UNIQUE NONCLUSTERED INDEX [AK_SalesPersonQuotaHistory_rowguid] ON [Sales].[SalesPersonQuotaHistory]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [Sales].[SalesPersonQuotaHistory] ADD  CONSTRAINT [DF_SalesPersonQuotaHistory_rowguid]  DEFAULT (newid()) FOR [rowguid]
ALTER TABLE [Sales].[SalesPersonQuotaHistory] ADD  CONSTRAINT [DF_SalesPersonQuotaHistory_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
ALTER TABLE [Sales].[SalesPersonQuotaHistory]  WITH CHECK ADD  CONSTRAINT [FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID] FOREIGN KEY([BusinessEntityID])
REFERENCES [Sales].[SalesPerson] ([BusinessEntityID])
ALTER TABLE [Sales].[SalesPersonQuotaHistory] CHECK CONSTRAINT [FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID]
ALTER TABLE [Sales].[SalesPersonQuotaHistory]  WITH CHECK ADD  CONSTRAINT [CK_SalesPersonQuotaHistory_SalesQuota] CHECK  (([SalesQuota]>(0.00)))
ALTER TABLE [Sales].[SalesPersonQuotaHistory] CHECK CONSTRAINT [CK_SalesPersonQuotaHistory_SalesQuota]
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales person identification number. Foreign key to SalesPerson.BusinessEntityID.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SalesPersonQuotaHistory', @level2type=N'COLUMN',@level2name=N'BusinessEntityID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales quota date.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SalesPersonQuotaHistory', @level2type=N'COLUMN',@level2name=N'QuotaDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales quota amount.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SalesPersonQuotaHistory', @level2type=N'COLUMN',@level2name=N'SalesQuota'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SalesPersonQuotaHistory', @level2type=N'COLUMN',@level2name=N'rowguid'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of NEWID()' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SalesPersonQuotaHistory', @level2type=N'CONSTRAINT',@level2name=N'DF_SalesPersonQuotaHistory_rowguid'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SalesPersonQuotaHistory', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SalesPersonQuotaHistory', @level2type=N'CONSTRAINT',@level2name=N'DF_SalesPersonQuotaHistory_ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SalesPersonQuotaHistory', @level2type=N'CONSTRAINT',@level2name=N'PK_SalesPersonQuotaHistory_BusinessEntityID_QuotaDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique nonclustered index. Used to support replication samples.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SalesPersonQuotaHistory', @level2type=N'INDEX',@level2name=N'AK_SalesPersonQuotaHistory_rowguid'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sales performance tracking.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SalesPersonQuotaHistory'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key constraint referencing SalesPerson.SalesPersonID.' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SalesPersonQuotaHistory', @level2type=N'CONSTRAINT',@level2name=N'FK_SalesPersonQuotaHistory_SalesPerson_BusinessEntityID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [SalesQuota] > (0.00)' , @level0type=N'SCHEMA',@level0name=N'Sales', @level1type=N'TABLE',@level1name=N'SalesPersonQuotaHistory', @level2type=N'CONSTRAINT',@level2name=N'CK_SalesPersonQuotaHistory_SalesQuota'
