CREATE TABLE [dbo].[Bookings]
(
	[Id] INT NOT NULL PRIMARY KEY Identity,
	[RoomId] INT NOT NULL, 
	[GuestId] INT NOT NULL,
	[StartDate] DateTime2 Not Null,
	[EndDate] DateTime2 Not Null,
	[CheckedIn] bit Not Null Default 0,
	[TotalCost] Money Not Null,
    CONSTRAINT [FK_Bookings_Rooms] FOREIGN KEY (RoomId) REFERENCES Rooms(Id), 
    CONSTRAINT [FK_Bookings_Guests] FOREIGN KEY (GuestId) REFERENCES Guests(Id),
)
