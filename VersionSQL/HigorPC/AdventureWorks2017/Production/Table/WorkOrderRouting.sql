/****** Object:  Table [Production].[WorkOrderRouting]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [Production].[WorkOrderRouting](
	[WorkOrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[OperationSequence] [smallint] NOT NULL,
	[LocationID] [smallint] NOT NULL,
	[ScheduledStartDate] [datetime] NOT NULL,
	[ScheduledEndDate] [datetime] NOT NULL,
	[ActualStartDate] [datetime] NULL,
	[ActualEndDate] [datetime] NULL,
	[ActualResourceHrs] [decimal](9, 4) NULL,
	[PlannedCost] [money] NOT NULL,
	[ActualCost] [money] NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence] PRIMARY KEY CLUSTERED 
(
	[WorkOrderID] ASC,
	[ProductID] ASC,
	[OperationSequence] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

CREATE NONCLUSTERED INDEX [IX_WorkOrderRouting_ProductID] ON [Production].[WorkOrderRouting]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [Production].[WorkOrderRouting] ADD  CONSTRAINT [DF_WorkOrderRouting_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
ALTER TABLE [Production].[WorkOrderRouting]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrderRouting_Location_LocationID] FOREIGN KEY([LocationID])
REFERENCES [Production].[Location] ([LocationID])
ALTER TABLE [Production].[WorkOrderRouting] CHECK CONSTRAINT [FK_WorkOrderRouting_Location_LocationID]
ALTER TABLE [Production].[WorkOrderRouting]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrderRouting_WorkOrder_WorkOrderID] FOREIGN KEY([WorkOrderID])
REFERENCES [Production].[WorkOrder] ([WorkOrderID])
ALTER TABLE [Production].[WorkOrderRouting] CHECK CONSTRAINT [FK_WorkOrderRouting_WorkOrder_WorkOrderID]
ALTER TABLE [Production].[WorkOrderRouting]  WITH CHECK ADD  CONSTRAINT [CK_WorkOrderRouting_ActualCost] CHECK  (([ActualCost]>(0.00)))
ALTER TABLE [Production].[WorkOrderRouting] CHECK CONSTRAINT [CK_WorkOrderRouting_ActualCost]
ALTER TABLE [Production].[WorkOrderRouting]  WITH CHECK ADD  CONSTRAINT [CK_WorkOrderRouting_ActualEndDate] CHECK  (([ActualEndDate]>=[ActualStartDate] OR [ActualEndDate] IS NULL OR [ActualStartDate] IS NULL))
ALTER TABLE [Production].[WorkOrderRouting] CHECK CONSTRAINT [CK_WorkOrderRouting_ActualEndDate]
ALTER TABLE [Production].[WorkOrderRouting]  WITH CHECK ADD  CONSTRAINT [CK_WorkOrderRouting_ActualResourceHrs] CHECK  (([ActualResourceHrs]>=(0.0000)))
ALTER TABLE [Production].[WorkOrderRouting] CHECK CONSTRAINT [CK_WorkOrderRouting_ActualResourceHrs]
ALTER TABLE [Production].[WorkOrderRouting]  WITH CHECK ADD  CONSTRAINT [CK_WorkOrderRouting_PlannedCost] CHECK  (([PlannedCost]>(0.00)))
ALTER TABLE [Production].[WorkOrderRouting] CHECK CONSTRAINT [CK_WorkOrderRouting_PlannedCost]
ALTER TABLE [Production].[WorkOrderRouting]  WITH CHECK ADD  CONSTRAINT [CK_WorkOrderRouting_ScheduledEndDate] CHECK  (([ScheduledEndDate]>=[ScheduledStartDate]))
ALTER TABLE [Production].[WorkOrderRouting] CHECK CONSTRAINT [CK_WorkOrderRouting_ScheduledEndDate]
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key. Foreign key to WorkOrder.WorkOrderID.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'COLUMN',@level2name=N'WorkOrderID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key. Foreign key to Product.ProductID.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'COLUMN',@level2name=N'ProductID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key. Indicates the manufacturing process sequence.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'COLUMN',@level2name=N'OperationSequence'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Manufacturing location where the part is processed. Foreign key to Location.LocationID.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'COLUMN',@level2name=N'LocationID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Planned manufacturing start date.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'COLUMN',@level2name=N'ScheduledStartDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Planned manufacturing end date.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'COLUMN',@level2name=N'ScheduledEndDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Actual start date.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'COLUMN',@level2name=N'ActualStartDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Actual end date.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'COLUMN',@level2name=N'ActualEndDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number of manufacturing hours used.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'COLUMN',@level2name=N'ActualResourceHrs'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estimated manufacturing cost.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'COLUMN',@level2name=N'PlannedCost'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Actual manufacturing cost.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'COLUMN',@level2name=N'ActualCost'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'CONSTRAINT',@level2name=N'DF_WorkOrderRouting_ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'CONSTRAINT',@level2name=N'PK_WorkOrderRouting_WorkOrderID_ProductID_OperationSequence'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nonclustered index.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'INDEX',@level2name=N'IX_WorkOrderRouting_ProductID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Work order details.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key constraint referencing Location.LocationID.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'CONSTRAINT',@level2name=N'FK_WorkOrderRouting_Location_LocationID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key constraint referencing WorkOrder.WorkOrderID.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'CONSTRAINT',@level2name=N'FK_WorkOrderRouting_WorkOrder_WorkOrderID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [ActualCost] > (0.00)' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'CONSTRAINT',@level2name=N'CK_WorkOrderRouting_ActualCost'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [ActualEndDate] >= [ActualStartDate] OR [ActualEndDate] IS NULL OR [ActualStartDate] IS NULL' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'CONSTRAINT',@level2name=N'CK_WorkOrderRouting_ActualEndDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [ActualResourceHrs] >= (0.0000)' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'CONSTRAINT',@level2name=N'CK_WorkOrderRouting_ActualResourceHrs'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [PlannedCost] > (0.00)' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'CONSTRAINT',@level2name=N'CK_WorkOrderRouting_PlannedCost'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [ScheduledEndDate] >= [ScheduledStartDate]' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'WorkOrderRouting', @level2type=N'CONSTRAINT',@level2name=N'CK_WorkOrderRouting_ScheduledEndDate'
