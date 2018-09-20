CREATE TABLE [dbo].[ORDER] (
    [orderId]   INT           IDENTITY (1, 1) NOT NULL,
    [houseId]   INT           NULL,
    [userId]    INT           NULL,
    [startTime] NVARCHAR (50) NULL,
    [endTime]   NVARCHAR (50) NULL,
    [rate]      FLOAT (53)    NULL,
    PRIMARY KEY CLUSTERED ([orderId] ASC),
    CONSTRAINT [FK_houseId] FOREIGN KEY ([houseId]) REFERENCES [dbo].[HOUSE] ([HouseId]) ON DELETE CASCADE,
    CONSTRAINT [FK_userId_2] FOREIGN KEY ([userId]) REFERENCES [dbo].[USERS] ([userId])
);

