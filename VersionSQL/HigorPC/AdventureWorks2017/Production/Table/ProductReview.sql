/****** Object:  Table [Production].[ProductReview]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [Production].[ProductReview](
	[ProductReviewID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ReviewerName] [dbo].[Name] NOT NULL,
	[ReviewDate] [datetime] NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
	[Rating] [int] NOT NULL,
	[Comments] [nvarchar](3850) NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductReview_ProductReviewID] PRIMARY KEY CLUSTERED 
(
	[ProductReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [IX_ProductReview_ProductID_Name] ON [Production].[ProductReview]
(
	[ProductID] ASC,
	[ReviewerName] ASC
)
INCLUDE([Comments]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
CREATE FULLTEXT INDEX ON [Production].[ProductReview]
KEY INDEX [PK_ProductReview_ProductReviewID]ON ([AW2016FullTextCatalog], FILEGROUP [PRIMARY])
WITH (CHANGE_TRACKING = AUTO, STOPLIST = SYSTEM)


ALTER TABLE [Production].[ProductReview] ADD  CONSTRAINT [DF_ProductReview_ReviewDate]  DEFAULT (getdate()) FOR [ReviewDate]
ALTER TABLE [Production].[ProductReview] ADD  CONSTRAINT [DF_ProductReview_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
ALTER TABLE [Production].[ProductReview]  WITH CHECK ADD  CONSTRAINT [FK_ProductReview_Product_ProductID] FOREIGN KEY([ProductID])
REFERENCES [Production].[Product] ([ProductID])
ALTER TABLE [Production].[ProductReview] CHECK CONSTRAINT [FK_ProductReview_Product_ProductID]
ALTER TABLE [Production].[ProductReview]  WITH CHECK ADD  CONSTRAINT [CK_ProductReview_Rating] CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
ALTER TABLE [Production].[ProductReview] CHECK CONSTRAINT [CK_ProductReview_Rating]
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for ProductReview records.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'ProductReview', @level2type=N'COLUMN',@level2name=N'ProductReviewID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product identification number. Foreign key to Product.ProductID.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'ProductReview', @level2type=N'COLUMN',@level2name=N'ProductID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of the reviewer.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'ProductReview', @level2type=N'COLUMN',@level2name=N'ReviewerName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date review was submitted.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'ProductReview', @level2type=N'COLUMN',@level2name=N'ReviewDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'ProductReview', @level2type=N'CONSTRAINT',@level2name=N'DF_ProductReview_ReviewDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reviewer''s e-mail address.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'ProductReview', @level2type=N'COLUMN',@level2name=N'EmailAddress'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product rating given by the reviewer. Scale is 1 to 5 with 5 as the highest rating.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'ProductReview', @level2type=N'COLUMN',@level2name=N'Rating'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Reviewer''s comments' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'ProductReview', @level2type=N'COLUMN',@level2name=N'Comments'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'ProductReview', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'ProductReview', @level2type=N'CONSTRAINT',@level2name=N'DF_ProductReview_ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'ProductReview', @level2type=N'CONSTRAINT',@level2name=N'PK_ProductReview_ProductReviewID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nonclustered index.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'ProductReview', @level2type=N'INDEX',@level2name=N'IX_ProductReview_ProductID_Name'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer reviews of products they have purchased.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'ProductReview'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key constraint referencing Product.ProductID.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'ProductReview', @level2type=N'CONSTRAINT',@level2name=N'FK_ProductReview_Product_ProductID'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [Rating] BETWEEN (1) AND (5)' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'ProductReview', @level2type=N'CONSTRAINT',@level2name=N'CK_ProductReview_Rating'
