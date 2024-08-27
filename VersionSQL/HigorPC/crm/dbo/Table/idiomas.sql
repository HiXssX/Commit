/****** Object:  Table [dbo].[idiomas]    Committed by VersionSQL https://www.versionsql.com ******/

CREATE TABLE [dbo].[idiomas](
	[id_cliente] [int] NOT NULL,
	[idioma] [varchar](50) NULL
) ON [PRIMARY]

ALTER TABLE [dbo].[idiomas]  WITH CHECK ADD FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
