CREATE TABLE [dbo].[HOUSE] (
    [HouseId]     INT           IDENTITY (1, 1) NOT NULL,
    [Province]    NVARCHAR (50) NULL,
    [City]        NVARCHAR (50) NULL,
    [Street]      NVARCHAR (50) NULL,
    [Price]       MONEY         NULL,
    [userId]      INT           NULL,
    [state]       BIT           NULL,
    [description] TEXT          NULL,
    PRIMARY KEY CLUSTERED ([HouseId] ASC),
    CONSTRAINT [FK_userId] FOREIGN KEY ([userId]) REFERENCES [dbo].[USERS] ([userId]) ON DELETE CASCADE
);

