USE Data_Base_4
GO

CREATE TABLE [dbo].[person](
	[id] [int] Primary Key IDENTITY(1, 1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[balance] [real] NULL,
	[create_date] [datetime] NOT NULL
)
GO



INSERT INTO person (name, balance, create_date)
SELECT name, balance, create_date
FROM users