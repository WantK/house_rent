CREATE TABLE [dbo].[USERS] (
    [userId]   INT           IDENTITY (1, 1) NOT NULL,
    [userName] NVARCHAR (50) NOT NULL,
    [Phone]    NVARCHAR (50) NULL,
    [Address]  NVARCHAR (50) NULL,
    [LoginPwd] NVARCHAR (50) NOT NULL,
    [email]    NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([userId] ASC)
);

