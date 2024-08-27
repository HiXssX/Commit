/****** Object:  Table [Production].[BillOfMaterials]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [Production].[BillOfMaterials](
	[BillOfMaterialsID] [int] IDENTITY(1,1) NOT NULL,
	[ProductAssemblyID] [int] NULL,
	[ComponentID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[UnitMeasureCode] [nchar](3) NOT NULL,
	[BOMLevel] [smallint] NOT NULL,
	[PerAssemblyQty] [decimal](8, 2) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BillOfMaterials_BillOfMaterialsID] PRIMARY KEY NONCLUSTERED 
(
	[BillOfMaterialsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE UNIQUE CLUSTERED INDEX [AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate] ON [Production].[BillOfMaterials]
(
	[ProductAssemblyID] ASC,
	[ComponentID] ASC,
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [IX_BillOfMaterials_UnitMeasureCode] ON [Production].[BillOfMaterials]
(
	[UnitMeasureCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [Production].[BillOfMaterials] ADD  CONSTRAINT [DF_BillOfMaterials_StartDate]  DEFAULT (getdate()) FOR [StartDate]
ALTER TABLE [Production].[BillOfMaterials] ADD  CONSTRAINT [DF_BillOfMaterials_PerAssemblyQty]  DEFAULT ((1.00)) FOR [PerAssemblyQty]
ALTER TABLE [Production].[BillOfMaterials] ADD  CONSTRAINT [DF_BillOfMaterials_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
ALTER TABLE [Production].[BillOfMaterials]  WITH CHECK ADD  CONSTRAINT [FK_BillOfMaterials_Product_ComponentID] FOREIGN KEY([ComponentID])
REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[BillOfMaterials] CHECK CONSTRAINT [FK_BillOfMaterials_Product_ComponentID]
ALTER TABLE [Production].[BillOfMaterials]  WITH CHECK ADD  CONSTRAINT [FK_BillOfMaterials_Product_ProductAssemblyID] FOREIGN KEY([ProductAssemblyID])
REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[BillOfMaterials] CHECK CONSTRAINT [FK_BillOfMaterials_Product_ProductAssemblyID]
ALTER TABLE [Production].[BillOfMaterials]  WITH CHECK ADD  CONSTRAINT [FK_BillOfMaterials_UnitMeasure_UnitMeasureCode] FOREIGN KEY([UnitMeasureCode])
REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode])
ALTER TABLE [Production].[BillOfMaterials] CHECK CONSTRAINT [FK_BillOfMaterials_UnitMeasure_UnitMeasureCode]
ALTER TABLE [Production].[BillOfMaterials]  WITH CHECK ADD  CONSTRAINT [CK_BillOfMaterials_BOMLevel] CHECK  (([ProductAssemblyID] IS NULL AND [BOMLevel]=(0) AND [PerAssemblyQty]=(1.00) OR [ProductAssemblyID] IS NOT NULL AND [BOMLevel]>=(1)))
ALTER TABLE [Production].[BillOfMaterials] CHECK CONSTRAINT [CK_BillOfMaterials_BOMLevel]
ALTER TABLE [Production].[BillOfMaterials]  WITH CHECK ADD  CONSTRAINT [CK_BillOfMaterials_EndDate] CHECK  (([EndDate]>[StartDate] OR [EndDate] IS NULL))
ALTER TABLE [Production].[BillOfMaterials] CHECK CONSTRAINT [CK_BillOfMaterials_EndDate]
ALTER TABLE [Production].[BillOfMaterials]  WITH CHECK ADD  CONSTRAINT [CK_BillOfMaterials_PerAssemblyQty] CHECK  (([PerAssemblyQty]>=(1.00)))
ALTER TABLE [Production].[BillOfMaterials] CHECK CONSTRAINT [CK_BillOfMaterials_PerAssemblyQty]
ALTER TABLE [Production].[BillOfMaterials]  WITH CHECK ADD  CONSTRAINT [CK_BillOfMaterials_ProductAssemblyID] CHECK  (([ProductAssemblyID]<>[ComponentID]))
ALTER TABLE [Production].[BillOfMaterials] CHECK CONSTRAINT [CK_BillOfMaterials_ProductAssemblyID]
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for BillOfMaterials records.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'COLUMN',@level2name=N'BillOfMaterialsID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent product identification number. Foreign key to Product.ProductID.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'COLUMN',@level2name=N'ProductAssemblyID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Component identification number. Foreign key to Product.ProductID.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'COLUMN',@level2name=N'ComponentID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date the component started being used in the assembly item.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'COLUMN',@level2name=N'StartDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'CONSTRAINT',@level2name=N'DF_BillOfMaterials_StartDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date the component stopped being used in the assembly item.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'COLUMN',@level2name=N'EndDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Standard code identifying the unit of measure for the quantity.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'COLUMN',@level2name=N'UnitMeasureCode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indicates the depth the component is from its parent (AssemblyID).' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'COLUMN',@level2name=N'BOMLevel'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantity of the component needed to create the assembly.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'COLUMN',@level2name=N'PerAssemblyQty'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of 1.0' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'CONSTRAINT',@level2name=N'DF_BillOfMaterials_PerAssemblyQty'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'CONSTRAINT',@level2name=N'DF_BillOfMaterials_ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'CONSTRAINT',@level2name=N'PK_BillOfMaterials_BillOfMaterialsID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Clustered index.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'INDEX',@level2name=N'AK_BillOfMaterials_ProductAssemblyID_ComponentID_StartDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nonclustered index.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'INDEX',@level2name=N'IX_BillOfMaterials_UnitMeasureCode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Items required to make bicycles and bicycle subassemblies. It identifies the heirarchical relationship between a parent product and its components.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key constraint referencing Product.ComponentID.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'CONSTRAINT',@level2name=N'FK_BillOfMaterials_Product_ComponentID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key constraint referencing Product.ProductAssemblyID.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'CONSTRAINT',@level2name=N'FK_BillOfMaterials_Product_ProductAssemblyID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key constraint referencing UnitMeasure.UnitMeasureCode.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'CONSTRAINT',@level2name=N'FK_BillOfMaterials_UnitMeasure_UnitMeasureCode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [ProductAssemblyID] IS NULL AND [BOMLevel] = (0) AND [PerAssemblyQty] = (1) OR [ProductAssemblyID] IS NOT NULL AND [BOMLevel] >= (1)' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'CONSTRAINT',@level2name=N'CK_BillOfMaterials_BOMLevel'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint EndDate] > [StartDate] OR [EndDate] IS NULL' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'CONSTRAINT',@level2name=N'CK_BillOfMaterials_EndDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [PerAssemblyQty] >= (1.00)' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'CONSTRAINT',@level2name=N'CK_BillOfMaterials_PerAssemblyQty'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [ProductAssemblyID] <> [ComponentID]' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'BillOfMaterials', @level2type=N'CONSTRAINT',@level2name=N'CK_BillOfMaterials_ProductAssemblyID'
