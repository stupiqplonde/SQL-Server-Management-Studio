USE Data_Base_4
GO

CREATE TABLE [dbo].[products](
	[id] [int] Primary Key Identity(1, 1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [real] NULL,
	[create_date] [datetime] NOT NULL,
	[id_user] [int] NOT NULL,
	CONSTRAINT FK_idusers FOREIGN KEY (id_user)
		REFERENCES users(id) ON DELETE CASCADE
)
GO