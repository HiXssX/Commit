/****** Object:  Table [Purchasing].[Vendor]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [Purchasing].[Vendor](
	[BusinessEntityID] [int] NOT NULL,
	[AccountNumber] [dbo].[AccountNumber] NOT NULL,
	[Name] [dbo].[Name] NOT NULL,
	[CreditRating] [tinyint] NOT NULL,
	[PreferredVendorStatus] [dbo].[Flag] NOT NULL,
	[ActiveFlag] [dbo].[Flag] NOT NULL,
	[PurchasingWebServiceURL] [nvarchar](1024) NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Vendor_BusinessEntityID] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

CREATE UNIQUE NONCLUSTERED INDEX [AK_Vendor_AccountNumber] ON [Purchasing].[Vendor]
(
	[AccountNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
ALTER TABLE [Purchasing].[Vendor] ADD  CONSTRAINT [DF_Vendor_PreferredVendorStatus]  DEFAULT ((1)) FOR [PreferredVendorStatus]
ALTER TABLE [Purchasing].[Vendor] ADD  CONSTRAINT [DF_Vendor_ActiveFlag]  DEFAULT ((1)) FOR [ActiveFlag]
ALTER TABLE [Purchasing].[Vendor] ADD  CONSTRAINT [DF_Vendor_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
ALTER TABLE [Purchasing].[Vendor]  WITH CHECK ADD  CONSTRAINT [FK_Vendor_BusinessEntity_BusinessEntityID] FOREIGN KEY([BusinessEntityID])
REFERENCES [Person].[BusinessEntity] ([BusinessEntityID])
ALTER TABLE [Purchasing].[Vendor] CHECK CONSTRAINT [FK_Vendor_BusinessEntity_BusinessEntityID]
ALTER TABLE [Purchasing].[Vendor]  WITH CHECK ADD  CONSTRAINT [CK_Vendor_CreditRating] CHECK  (([CreditRating]>=(1) AND [CreditRating]<=(5)))
ALTER TABLE [Purchasing].[Vendor] CHECK CONSTRAINT [CK_Vendor_CreditRating]
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for Vendor records.  Foreign key to BusinessEntity.BusinessEntityID' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'BusinessEntityID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendor account (identification) number.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'AccountNumber'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Company name.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'Name'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 = Superior, 2 = Excellent, 3 = Above average, 4 = Average, 5 = Below average' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'CreditRating'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 = Do not use if another vendor is available. 1 = Preferred over other vendors supplying the same product.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'PreferredVendorStatus'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of 1 (TRUE)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'CONSTRAINT',@level2name=N'DF_Vendor_PreferredVendorStatus'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 = Vendor no longer used. 1 = Vendor is actively used.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'ActiveFlag'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of 1 (TRUE)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'CONSTRAINT',@level2name=N'DF_Vendor_ActiveFlag'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Vendor URL.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'PurchasingWebServiceURL'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'CONSTRAINT',@level2name=N'DF_Vendor_ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'CONSTRAINT',@level2name=N'PK_Vendor_BusinessEntityID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique nonclustered index.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'INDEX',@level2name=N'AK_Vendor_AccountNumber'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Companies from whom Adventure Works Cycles purchases parts or other goods.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Vendor'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key constraint referencing BusinessEntity.BusinessEntityID' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'CONSTRAINT',@level2name=N'FK_Vendor_BusinessEntity_BusinessEntityID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [CreditRating] BETWEEN (1) AND (5)' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'CONSTRAINT',@level2name=N'CK_Vendor_CreditRating'

CREATE TRIGGER [Purchasing].[dVendor] ON [Purchasing].[Vendor] 
INSTEAD OF DELETE NOT FOR REPLICATION AS 
BEGIN
    DECLARE @Count int;

    SET @Count = @@ROWCOUNT;
    IF @Count = 0 
        RETURN;

    SET NOCOUNT ON;

    BEGIN TRY
        DECLARE @DeleteCount int;

        SELECT @DeleteCount = COUNT(*) FROM deleted;
        IF @DeleteCount > 0 
        BEGIN
            RAISERROR
                (N'Vendors cannot be deleted. They can only be marked as not active.', -- Message
                10, -- Severity.
                1); -- State.

        -- Rollback any active or uncommittable transactions
            IF @@TRANCOUNT > 0
            BEGIN
                ROLLBACK TRANSACTION;
            END
        END;
    END TRY
    BEGIN CATCH
        EXECUTE [dbo].[uspPrintError];

        -- Rollback any active or uncommittable transactions before
        -- inserting information in the ErrorLog
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END

        EXECUTE [dbo].[uspLogError];
    END CATCH;
END;

ALTER TABLE [Purchasing].[Vendor] ENABLE TRIGGER [dVendor]
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'INSTEAD OF DELETE trigger which keeps Vendors from being deleted.' , @level0type=N'SCHEMA',@level0name=N'Purchasing', @level1type=N'TABLE',@level1name=N'Vendor', @level2type=N'TRIGGER',@level2name=N'dVendor'
