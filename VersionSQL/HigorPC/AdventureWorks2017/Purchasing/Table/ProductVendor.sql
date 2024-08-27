/****** Object:  Table [Purchasing].[ProductVendor]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [Purchasing].[ProductVendor](
	[ProductID] [int] NOT NULL,
	[BusinessEntityID] [int] NOT NULL,
	[AverageLeadTime] [int] NOT NULL,
	[StandardPrice] [money] NOT NULL,
	[LastReceiptCost] [money] NULL,
	[LastReceiptDate] [datetime] NULL,
	[MinOrderQty] [int] NOT NULL,
	[MaxOrderQty] [int] NOT NULL,
	[OnOrderQty] [int] NULL,
	[UnitMeasureCode] [nchar](3) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductVendor_ProductID_BusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_ProductVendor_BusinessEntityID] ON [Purchasing].[ProductVendor]
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [IX_ProductVendor_UnitMeasureCode] ON [Purchasing].[ProductVendor]
(
	[UnitMeasureCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [Purchasing].[ProductVendor] ADD  CONSTRAINT [DF_ProductVendor_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
ALTER TABLE [Purchasing].[ProductVendor]  WITH CHECK ADD  CONSTRAINT [FK_ProductVendor_Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Purchasing].[ProductVendor] CHECK CONSTRAINT [FK_ProductVendor_Product_ProductID]
ALTER TABLE [Purchasing].[ProductVendor]  WITH CHECK ADD  CONSTRAINT [FK_ProductVendor_UnitMeasure_UnitMeasureCode] FOREIGN KEY([UnitMeasureCode])
REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode])
ALTER TABLE [Purchasing].[ProductVendor] CHECK CONSTRAINT [FK_ProductVendor_UnitMeasure_UnitMeasureCode]
ALTER TABLE [Purchasing].[ProductVendor]  WITH CHECK ADD  CONSTRAINT [FK_ProductVendor_Vendor_BusinessEntityID] FOREIGN KEY([BusinessEntityID])
REFERENCES [Purchasing].[Vendor] ([BusinessEntityID])
ALTER TABLE [Purchasing].[ProductVendor] CHECK CONSTRAINT [FK_ProductVendor_Vendor_BusinessEntityID]
ALTER TABLE [Purchasing].[ProductVendor]  WITH CHECK ADD  CONSTRAINT [CK_ProductVendor_AverageLeadTime] CHECK  (([AverageLeadTime]>=(1)))
ALTER TABLE [Purchasing].[ProductVendor] CHECK CONSTRAINT [CK_ProductVendor_AverageLeadTime]
ALTER TABLE [Purchasing].[ProductVendor]  WITH CHECK ADD  CONSTRAINT [CK_ProductVendor_LastReceiptCost] CHECK  (([LastReceiptCost]>(0.00)))
ALTER TABLE [Purchasing].[ProductVendor] CHECK CONSTRAINT [CK_ProductVendor_LastReceiptCost]
ALTER TABLE [Purchasing].[ProductVendor]  WITH CHECK ADD  CONSTRAINT [CK_ProductVendor_MaxOrderQty] CHECK  (([MaxOrderQty]>=(1)))
ALTER TABLE [Purchasing].[ProductVendor] CHECK CONSTRAINT [CK_ProductVendor_MaxOrderQty]
ALTER TABLE [Purchasing].[ProductVendor]  WITH CHECK ADD  CONSTRAINT [CK_ProductVendor_MinOrderQty] CHECK  (([MinOrderQty]>=(1)))
ALTER TABLE [Purchasing].[ProductVendor] CHECK CONSTRAINT [CK_ProductVendor_MinOrderQty]
ALTER TABLE [Purchasing].[ProductVendor]  WITH CHECK ADD  CONSTRAINT [CK_ProductVendor_OnOrderQty] CHECK  (([OnOrderQty]>=(0)))
ALTER TABLE [Purchasing].[ProductVendor] CHECK CONSTRAINT [CK_ProductVendor_OnOrderQty]
ALTER TABLE [Purchasing].[ProductVendor]  WITH CHECK ADD  CONSTRAINT [CK_ProductVendor_StandardPrice] CHECK  (([StandardPrice]>(0.00)))
ALTER TABLE [Purchasing].[ProductVendor] CHECK CONSTRAINT [CK_ProductVendor_StandardPrice]
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key. Foreign key to Product.ProductID.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'COLUMN',@level2name=N'ProductID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key. Foreign key to Vendor.BusinessEntityID.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'COLUMN',@level2name=N'BusinessEntityID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The average span of time (in days) between placing an order with the vendor and receiving the purchased product.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'COLUMN',@level2name=N'AverageLeadTime'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The vendor''s usual selling price.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'COLUMN',@level2name=N'StandardPrice'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The selling price when last purchased.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'COLUMN',@level2name=N'LastReceiptCost'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date the product was last received by the vendor.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'COLUMN',@level2name=N'LastReceiptDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The maximum quantity that should be ordered.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'COLUMN',@level2name=N'MinOrderQty'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The minimum quantity that should be ordered.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'COLUMN',@level2name=N'MaxOrderQty'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The quantity currently on order.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'COLUMN',@level2name=N'OnOrderQty'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The product''s unit of measure.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'COLUMN',@level2name=N'UnitMeasureCode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'CONSTRAINT',@level2name=N'DF_ProductVendor_ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'CONSTRAINT',@level2name=N'PK_ProductVendor_ProductID_BusinessEntityID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nonclustered index.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'INDEX',@level2name=N'IX_ProductVendor_BusinessEntityID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nonclustered index.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'INDEX',@level2name=N'IX_ProductVendor_UnitMeasureCode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cross-reference table mapping vendors with the products they supply.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key constraint referencing Product.ProductID.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'CONSTRAINT',@level2name=N'FK_ProductVendor_Product_ProductID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key constraint referencing UnitMeasure.UnitMeasureCode.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'CONSTRAINT',@level2name=N'FK_ProductVendor_UnitMeasure_UnitMeasureCode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key constraint referencing Vendor.BusinessEntityID.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'CONSTRAINT',@level2name=N'FK_ProductVendor_Vendor_BusinessEntityID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [AverageLeadTime] >= (1)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'CONSTRAINT',@level2name=N'CK_ProductVendor_AverageLeadTime'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [LastReceiptCost] > (0.00)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'CONSTRAINT',@level2name=N'CK_ProductVendor_LastReceiptCost'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [MaxOrderQty] >= (1)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'CONSTRAINT',@level2name=N'CK_ProductVendor_MaxOrderQty'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [MinOrderQty] >= (1)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'CONSTRAINT',@level2name=N'CK_ProductVendor_MinOrderQty'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [OnOrderQty] >= (0)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'CONSTRAINT',@level2name=N'CK_ProductVendor_OnOrderQty'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [StandardPrice] > (0.00)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'ProductVendor', @level2type=N'CONSTRAINT',@level2name=N'CK_ProductVendor_StandardPrice'
