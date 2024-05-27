/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

if not exists (select 1 from dbo.RoomTypes)
begin
    insert into RoomTypes(Title,Description, Price)
    values 
    ('Deluxe Double or Twin Room','151 sq.ft | City View | 1 full bed / 2 twin beds, Air Conditioning, Iron/Ironing Board, Wi-Fi, Electric Kettle, Daily Housekeeping,Bathroom',6000),
    ('Super Deluxe Double/Twin Room','247 sq.ft | FullBed, Air Conditioning, Iron/Ironing Board, Wi-Fi, Electric Kettle, Daily Housekeeping,Bathroom',8000),
    ('Junior Suite','323 sq.ft | City View | 1 queen bed, Air Conditioning, Iron/Ironing Board, Wi-Fi, Room Service, Electric Kettle,Daily Housekeeping',11000),
    ('Standard Suite (Annapurna III)','FullBed, Air Conditioning, Iron/Ironing Board, Electric Kettle, Daily Housekeeping, Bathroom, Work Desk',12000),
    ('Delux Suite (Annapurna II)','FullBed, Air Conditioning, Iron/Ironing Board, Electric Kettle, Daily Housekeeping, Bathroom, Work Desk',15000),
    ('Luxury Suite (Annapurna I)','FullBed, Air Conditioning, Iron/Ironing Board, Electric Kettle, Daily Housekeeping, Bathroom, Work Desk',17000);
end

if not exists (select 1 from dbo.Rooms)
begin
    declare @roomId1 int;
    declare @roomId2 int;
    declare @roomId3 int;
    declare @roomId4 int;
    declare @roomId5 int;
    declare @roomId6 int;

    select @roomId1 = Id from dbo.RoomTypes where Title='Deluxe Double or Twin Room';
    select @roomId2 = Id from dbo.RoomTypes where Title='Super Deluxe Double/Twin Room';
    select @roomId3 = Id from dbo.RoomTypes where Title='Junior Suite';
    select @roomId4 = Id from dbo.RoomTypes where Title='Standard Suite (Annapurna III)';
    select @roomId5 = Id from dbo.RoomTypes where Title='Delux Suite (Annapurna II)';
    select @roomId6 = Id from dbo.RoomTypes where Title='Luxury Suite (Annapurna I)';

    insert into Rooms(RoomNo,RoomTypeId)
    values('101A',@roomId1),('201A',@roomId1),
    ('101B',@roomId2),('201B',@roomId2),
    ('101C',@roomId3),('201C',@roomId3),
    ('101D',@roomId4),('301D',@roomId4),
    ('101E',@roomId5),('301F',@roomId6);
end