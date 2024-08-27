/****** Object:  Table [Production].[TransactionHistoryArchive]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [Production].[TransactionHistoryArchive](
	[TransactionID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ReferenceOrderID] [int] NOT NULL,
	[ReferenceOrderLineID] [int] NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[TransactionType] [nchar](1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ActualCost] [money] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TransactionHistoryArchive_TransactionID] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_TransactionHistoryArchive_ProductID] ON [Production].[TransactionHistoryArchive]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID] ON [Production].[TransactionHistoryArchive]
(
	[ReferenceOrderID] ASC,
	[ReferenceOrderLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [Production].[TransactionHistoryArchive] ADD  CONSTRAINT [DF_TransactionHistoryArchive_ReferenceOrderLineID]  DEFAULT ((0)) FOR [ReferenceOrderLineID]
ALTER TABLE [Production].[TransactionHistoryArchive] ADD  CONSTRAINT [DF_TransactionHistoryArchive_TransactionDate]  DEFAULT (getdate()) FOR [TransactionDate]
ALTER TABLE [Production].[TransactionHistoryArchive] ADD  CONSTRAINT [DF_TransactionHistoryArchive_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
ALTER TABLE [Production].[TransactionHistoryArchive]  WITH CHECK ADD  CONSTRAINT [CK_TransactionHistoryArchive_TransactionType] CHECK  ((upper([TransactionType])='P' OR upper([TransactionType])='S' OR upper([TransactionType])='W'))
ALTER TABLE [Production].[TransactionHistoryArchive] CHECK CONSTRAINT [CK_TransactionHistoryArchive_TransactionType]
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for TransactionHistoryArchive records.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'TransactionHistoryArchive', @level2type=N'COLUMN',@level2name=N'TransactionID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product identification number. Foreign key to Product.ProductID.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'TransactionHistoryArchive', @level2type=N'COLUMN',@level2name=N'ProductID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Purchase order, sales order, or work order identification number.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'TransactionHistoryArchive', @level2type=N'COLUMN',@level2name=N'ReferenceOrderID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Line number associated with the purchase order, sales order, or work order.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'TransactionHistoryArchive', @level2type=N'COLUMN',@level2name=N'ReferenceOrderLineID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of 0' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'TransactionHistoryArchive', @level2type=N'CONSTRAINT',@level2name=N'DF_TransactionHistoryArchive_ReferenceOrderLineID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time of the transaction.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'TransactionHistoryArchive', @level2type=N'COLUMN',@level2name=N'TransactionDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'TransactionHistoryArchive', @level2type=N'CONSTRAINT',@level2name=N'DF_TransactionHistoryArchive_TransactionDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'W = Work Order, S = Sales Order, P = Purchase Order' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'TransactionHistoryArchive', @level2type=N'COLUMN',@level2name=N'TransactionType'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product quantity.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'TransactionHistoryArchive', @level2type=N'COLUMN',@level2name=N'Quantity'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product cost.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'TransactionHistoryArchive', @level2type=N'COLUMN',@level2name=N'ActualCost'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'TransactionHistoryArchive', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'TransactionHistoryArchive', @level2type=N'CONSTRAINT',@level2name=N'DF_TransactionHistoryArchive_ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'TransactionHistoryArchive', @level2type=N'CONSTRAINT',@level2name=N'PK_TransactionHistoryArchive_TransactionID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nonclustered index.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'TransactionHistoryArchive', @level2type=N'INDEX',@level2name=N'IX_TransactionHistoryArchive_ProductID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nonclustered index.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'TransactionHistoryArchive', @level2type=N'INDEX',@level2name=N'IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Transactions for previous years.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'TransactionHistoryArchive'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [TransactionType]=''p'' OR [TransactionType]=''s'' OR [TransactionType]=''w'' OR [TransactionType]=''P'' OR [TransactionType]=''S'' OR [TransactionType]=''W''' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'TransactionHistoryArchive', @level2type=N'CONSTRAINT',@level2name=N'CK_TransactionHistoryArchive_TransactionType'
