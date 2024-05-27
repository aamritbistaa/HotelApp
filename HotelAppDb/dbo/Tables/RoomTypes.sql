CREATE TABLE [dbo].[RoomTypes]
(
	[Id] INT NOT NULL PRIMARY KEY Identity,
	[Title] nvarchar(50) NOT NULL,
	[Description] nvarchar(200) NOT NULL,
	[Price] Money NOT NULL
)
