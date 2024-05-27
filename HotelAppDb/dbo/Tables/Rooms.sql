CREATE TABLE [dbo].[Rooms]
(
	[Id] INT NOT NULL PRIMARY KEY Identity,
	-- Room type can be 101A,100B
	[RoomNo] nvarchar(10) NOT NULL,
	[RoomTypeID] Int Not Null, 
    CONSTRAINT [FK_Rooms_RoomTypes] FOREIGN KEY (RoomTypeID) REFERENCES RoomTypes(ID),
	
)
