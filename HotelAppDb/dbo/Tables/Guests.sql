CREATE TABLE [dbo].[Guests]
(
	[Id] INT NOT NULL PRIMARY KEY Identity,
	[FirstName] nvarchar(50) Not Null,
	[LastName] nvarchar(50) Not Null,
	[Phone Number] nvarchar(30) Not Null Unique
)
