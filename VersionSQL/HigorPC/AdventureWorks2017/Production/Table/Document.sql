﻿/****** Object:  Table [Production].[Document]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [Production].[Document](
	[DocumentNode] [hierarchyid] NOT NULL,
	[DocumentLevel]  AS ([DocumentNode].[GetLevel]()),
	[Title] [nvarchar](50) NOT NULL,
	[Owner] [int] NOT NULL,
	[FolderFlag] [bit] NOT NULL,
	[FileName] [nvarchar](400) NOT NULL,
	[FileExtension] [nvarchar](8) NOT NULL,
	[Revision] [nchar](5) NOT NULL,
	[ChangeNumber] [int] NOT NULL,
	[Status] [tinyint] NOT NULL,
	[DocumentSummary] [nvarchar](max) NULL,
	[Document] [varbinary](max) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Document_DocumentNode] PRIMARY KEY CLUSTERED 
(
	[DocumentNode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

CREATE UNIQUE NONCLUSTERED INDEX [AK_Document_DocumentLevel_DocumentNode] ON [Production].[Document]
(
	[DocumentLevel] ASC,
	[DocumentNode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
CREATE UNIQUE NONCLUSTERED INDEX [AK_Document_rowguid] ON [Production].[Document]
(
	[rowguid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
SET ANSI_PADDING ON

CREATE NONCLUSTERED INDEX [IX_Document_FileName_Revision] ON [Production].[Document]
(
	[FileName] ASC,
	[Revision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
CREATE FULLTEXT INDEX ON [Production].[Document]
KEY INDEX [PK_Document_DocumentNode]ON ([AW2016FullTextCatalog], FILEGROUP [PRIMARY])
WITH (CHANGE_TRACKING = AUTO, STOPLIST = SYSTEM)


ALTER TABLE [Production].[Document] ADD  CONSTRAINT [DF_Document_FolderFlag]  DEFAULT ((0)) FOR [FolderFlag]
ALTER TABLE [Production].[Document] ADD  CONSTRAINT [DF_Document_ChangeNumber]  DEFAULT ((0)) FOR [ChangeNumber]
ALTER TABLE [Production].[Document] ADD  CONSTRAINT [DF_Document_rowguid]  DEFAULT (newid()) FOR [rowguid]
ALTER TABLE [Production].[Document] ADD  CONSTRAINT [DF_Document_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
ALTER TABLE [Production].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_Employee_Owner] FOREIGN KEY([Owner])
REFERENCES [HumanResources].[Employee] ([BusinessEntityID])
ALTER TABLE [Production].[Document] CHECK CONSTRAINT [FK_Document_Employee_Owner]
ALTER TABLE [Production].[Document]  WITH CHECK ADD  CONSTRAINT [CK_Document_Status] CHECK  (([Status]>=(1) AND [Status]<=(3)))
ALTER TABLE [Production].[Document] CHECK CONSTRAINT [CK_Document_Status]
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for Document records.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'COLUMN',@level2name=N'DocumentNode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Depth in the document hierarchy.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'COLUMN',@level2name=N'DocumentLevel'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Title of the document.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'COLUMN',@level2name=N'Title'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Employee who controls the document.  Foreign key to Employee.BusinessEntityID' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'COLUMN',@level2name=N'Owner'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 = This is a folder, 1 = This is a document.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'COLUMN',@level2name=N'FolderFlag'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'File name of the document' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'COLUMN',@level2name=N'FileName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'File extension indicating the document type. For example, .doc or .txt.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'COLUMN',@level2name=N'FileExtension'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Revision number of the document. ' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'COLUMN',@level2name=N'Revision'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Engineering change approval number.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'COLUMN',@level2name=N'ChangeNumber'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of 0' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'CONSTRAINT',@level2name=N'DF_Document_ChangeNumber'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 = Pending approval, 2 = Approved, 3 = Obsolete' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Document abstract.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'COLUMN',@level2name=N'DocumentSummary'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Complete document.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'COLUMN',@level2name=N'Document'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ROWGUIDCOL number uniquely identifying the record. Required for FileStream.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'COLUMN',@level2name=N'rowguid'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of NEWID()' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'CONSTRAINT',@level2name=N'DF_Document_rowguid'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'CONSTRAINT',@level2name=N'DF_Document_ModifiedDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'CONSTRAINT',@level2name=N'PK_Document_DocumentNode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique nonclustered index.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'INDEX',@level2name=N'AK_Document_DocumentLevel_DocumentNode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique nonclustered index. Used to support FileStream.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'INDEX',@level2name=N'AK_Document_rowguid'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Unique nonclustered index.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'INDEX',@level2name=N'IX_Document_FileName_Revision'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product maintenance documents.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key constraint referencing Employee.BusinessEntityID.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'CONSTRAINT',@level2name=N'FK_Document_Employee_Owner'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Check constraint [Status] BETWEEN (1) AND (3)' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'TABLE',@level1name=N'Document', @level2type=N'CONSTRAINT',@level2name=N'CK_Document_Status'
