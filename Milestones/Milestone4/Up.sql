-- Highlight then ctrl+k, ctrl+c to uncomment / recomment

--CREATE DATABASE [SteamInfo];
--CREATE DATABASE [SteamInfoAuth];

USE [SteamInfo];

CREATE TABLE [User]
(
	[Id]				INT				NOT NULL IDENTITY(1,1) PRIMARY KEY
	,[SteamId]			INT
	,[SteamName]		NVARCHAR(50)
	,[ProfileUrl]		NVARCHAR(100)
	,[AvatarUrl]		NVARCHAR(100)
	,[PersonaState]		INT
	,[PlayerLevel]		INT
);

CREATE TABLE [Friend]
(
	[Id]				INT				NOT NULL IDENTITY(1,1) PRIMARY KEY
	,[RootId]			INT				NOT NULL
	,[SteamId]			INT				NOT NULL
	,[SteamName]		NVARCHAR(50)	NOT NULL
	,[PersonaState]		INT				NOT NULL
	,[AvatarUrl]		NVARCHAR(100)	NOT NULL
	,[LastLogOff]		INT				NOT NULL
	,[GameExtraInfo]	NVARCHAR(100)
	,[GameId]			INT
);

CREATE TABLE [Game]
(
	[Id]				INT				NOT NULL IDENTITY(1,1) PRIMARY KEY
	,[OwnerId]			INT				NOT NULL
	,[AppId]			INT				NOT NULL
	,[Name]				NVARCHAR(50)	NOT NULL
	,[PlayTime]			INT				NOT NULL
	,[IconUrl]			NVARCHAR(100)	NOT NULL
	,[LastPlayed]		INT				NOT NULL
	,[Hidden]			BIT				NOT NULL
);

CREATE TABLE [GameAchievement]
(
	[Id]				INT				NOT NULL IDENTITY(1,1) PRIMARY KEY
	,[GameId]			INT				NOT NULL
	,[ApiName]			NVARCHAR(100)	NOT NULL
	,[DisplayName]		NVARCHAR(50)	NOT NULL
	,[IconAchievedUrl]	NVARCHAR(100)	NOT NULL
	,[IconHiddenUrl]	NVARCHAR(100)	NOT NULL
	,[HiddenFromUsers]	BIT				NOT NULL
);

CREATE TABLE [UserAchievement]
(
	[Id]				INT				NOT NULL IDENTITY(1,1) PRIMARY KEY
	,[SteamId]			INT				NOT NULL
	,[GameId]			INT				NOT NULL
	,[ApiName]			NVARCHAR(100)	NOT NULL
	,[DisplayName]		NVARCHAR(50)	NOT NULL
	,[Achieved]			BIT				NOT NULL
	,[UnlockTime]		INT				
);

ALTER TABLE [Friend] ADD CONSTRAINT [Friend_Fk_User] FOREIGN KEY ([RootId]) REFERENCES [User] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE [Game] ADD CONSTRAINT [Game_Fk_User] FOREIGN KEY ([OwnerId]) REFERENCES [User] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE [GameAchievement] ADD CONSTRAINT [GameAchievement_Fk_Game] FOREIGN KEY ([GameId]) REFERENCES [Game] ([AppId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE [UserAchievement] ADD CONSTRAINT [UserAchievement_Fk_Game] FOREIGN KEY ([GameId]) REFERENCES [Game] ([AppId]) ON DELETE NO ACTION ON UPDATE NO ACTION;

