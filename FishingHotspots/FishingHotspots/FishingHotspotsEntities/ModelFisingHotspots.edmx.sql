
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/29/2015 15:42:18
-- Generated from EDMX file: C:\Users\Seamus Dillon\Desktop\WebProg3Project\FishingHotspots\FishingHotspots\FishingHotspotsEntities\ModelFisingHotspots.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [FishingHotspotsDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_FishCaughtTbl_FishSpeciesTbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FishCaughtTbl] DROP CONSTRAINT [FK_FishCaughtTbl_FishSpeciesTbl];
GO
IF OBJECT_ID(N'[dbo].[FK_FishCaughtTbl_ReviewsTbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FishCaughtTbl] DROP CONSTRAINT [FK_FishCaughtTbl_ReviewsTbl];
GO
IF OBJECT_ID(N'[dbo].[FK_FishSpeciesTbl_FishTypeTbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FishSpeciesTbl] DROP CONSTRAINT [FK_FishSpeciesTbl_FishTypeTbl];
GO
IF OBJECT_ID(N'[dbo].[FK_ReviewsTbl_FishTypeTbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReviewsTbl] DROP CONSTRAINT [FK_ReviewsTbl_FishTypeTbl];
GO
IF OBJECT_ID(N'[dbo].[FK_LakesTbl_RegionsTbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LakesTbl] DROP CONSTRAINT [FK_LakesTbl_RegionsTbl];
GO
IF OBJECT_ID(N'[dbo].[FK_NewsTbl_UsersTbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NewsTbl] DROP CONSTRAINT [FK_NewsTbl_UsersTbl];
GO
IF OBJECT_ID(N'[dbo].[FK_RatingsTbl_UsersTbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RatingsTbl] DROP CONSTRAINT [FK_RatingsTbl_UsersTbl];
GO
IF OBJECT_ID(N'[dbo].[FK_ReviewsTbl_RatingsTbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReviewsTbl] DROP CONSTRAINT [FK_ReviewsTbl_RatingsTbl];
GO
IF OBJECT_ID(N'[dbo].[FK_ReviewsTbl_RegionsTbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReviewsTbl] DROP CONSTRAINT [FK_ReviewsTbl_RegionsTbl];
GO
IF OBJECT_ID(N'[dbo].[FK_RiversTbl_RegionsTbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RiversTbl] DROP CONSTRAINT [FK_RiversTbl_RegionsTbl];
GO
IF OBJECT_ID(N'[dbo].[FK_ReviewsTbl_UsersTbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReviewsTbl] DROP CONSTRAINT [FK_ReviewsTbl_UsersTbl];
GO
IF OBJECT_ID(N'[dbo].[FK_UserRolesTbl_UsersTbl]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserRolesTbl] DROP CONSTRAINT [FK_UserRolesTbl_UsersTbl];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FishCaughtTbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FishCaughtTbl];
GO
IF OBJECT_ID(N'[dbo].[FishSpeciesTbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FishSpeciesTbl];
GO
IF OBJECT_ID(N'[dbo].[FishTypeTbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FishTypeTbl];
GO
IF OBJECT_ID(N'[dbo].[LakesTbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LakesTbl];
GO
IF OBJECT_ID(N'[dbo].[NewsTbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NewsTbl];
GO
IF OBJECT_ID(N'[dbo].[RatingsTbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RatingsTbl];
GO
IF OBJECT_ID(N'[dbo].[RegionsTbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RegionsTbl];
GO
IF OBJECT_ID(N'[dbo].[ReviewsTbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ReviewsTbl];
GO
IF OBJECT_ID(N'[dbo].[RiversTbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RiversTbl];
GO
IF OBJECT_ID(N'[dbo].[UserRolesTbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserRolesTbl];
GO
IF OBJECT_ID(N'[dbo].[UsersTbl]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UsersTbl];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'FishCaughtTbl'
CREATE TABLE [dbo].[FishCaughtTbl] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Weight] float  NULL,
    [Method] nvarchar(35)  NOT NULL,
    [FishSpecies] tinyint  NOT NULL,
    [Review] int  NOT NULL
);
GO

-- Creating table 'FishSpeciesTbl'
CREATE TABLE [dbo].[FishSpeciesTbl] (
    [Id] tinyint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(20)  NOT NULL,
    [Type] tinyint  NOT NULL
);
GO

-- Creating table 'FishTypeTbl'
CREATE TABLE [dbo].[FishTypeTbl] (
    [id] tinyint IDENTITY(1,1) NOT NULL,
    [FishingTypeName] nvarchar(20)  NOT NULL
);
GO

-- Creating table 'LakesTbl'
CREATE TABLE [dbo].[LakesTbl] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [LakeName] nvarchar(35)  NOT NULL,
    [Region] int  NOT NULL
);
GO

-- Creating table 'NewsTbl'
CREATE TABLE [dbo].[NewsTbl] (
    [Id] int  NOT NULL,
    [Title] nvarchar(50)  NOT NULL,
    [Text] nchar(10)  NOT NULL,
    [PublishDate] datetime  NOT NULL,
    [Image] varbinary(max)  NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'RatingsTbl'
CREATE TABLE [dbo].[RatingsTbl] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Ratings] tinyint  NULL,
    [Review] int  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'RegionsTbl'
CREATE TABLE [dbo].[RegionsTbl] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [County] nvarchar(35)  NOT NULL
);
GO

-- Creating table 'ReviewsTbl'
CREATE TABLE [dbo].[ReviewsTbl] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(50)  NOT NULL,
    [ReviewDate] datetime  NOT NULL,
    [ReviewText] varchar(max)  NOT NULL,
    [Photo] varbinary(max)  NULL,
    [FishingType] tinyint  NOT NULL,
    [Region] int  NOT NULL,
    [Rating] int  NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'RiversTbl'
CREATE TABLE [dbo].[RiversTbl] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RiverName] nvarchar(35)  NOT NULL,
    [Region] int  NOT NULL
);
GO

-- Creating table 'UserRolesTbl'
CREATE TABLE [dbo].[UserRolesTbl] (
    [UserId] int  NOT NULL,
    [RoleId] int  NOT NULL
);
GO

-- Creating table 'UsersTbl'
CREATE TABLE [dbo].[UsersTbl] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(35)  NOT NULL,
    [LastName] nvarchar(35)  NOT NULL,
    [Username] nvarchar(35)  NULL,
    [Email] nvarchar(70)  NOT NULL,
    [PasswordHash] nvarchar(20)  NOT NULL,
    [Country] nvarchar(30)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'FishCaughtTbl'
ALTER TABLE [dbo].[FishCaughtTbl]
ADD CONSTRAINT [PK_FishCaughtTbl]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FishSpeciesTbl'
ALTER TABLE [dbo].[FishSpeciesTbl]
ADD CONSTRAINT [PK_FishSpeciesTbl]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [id] in table 'FishTypeTbl'
ALTER TABLE [dbo].[FishTypeTbl]
ADD CONSTRAINT [PK_FishTypeTbl]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [Id] in table 'LakesTbl'
ALTER TABLE [dbo].[LakesTbl]
ADD CONSTRAINT [PK_LakesTbl]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'NewsTbl'
ALTER TABLE [dbo].[NewsTbl]
ADD CONSTRAINT [PK_NewsTbl]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RatingsTbl'
ALTER TABLE [dbo].[RatingsTbl]
ADD CONSTRAINT [PK_RatingsTbl]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RegionsTbl'
ALTER TABLE [dbo].[RegionsTbl]
ADD CONSTRAINT [PK_RegionsTbl]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ReviewsTbl'
ALTER TABLE [dbo].[ReviewsTbl]
ADD CONSTRAINT [PK_ReviewsTbl]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RiversTbl'
ALTER TABLE [dbo].[RiversTbl]
ADD CONSTRAINT [PK_RiversTbl]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [UserId], [RoleId] in table 'UserRolesTbl'
ALTER TABLE [dbo].[UserRolesTbl]
ADD CONSTRAINT [PK_UserRolesTbl]
    PRIMARY KEY CLUSTERED ([UserId], [RoleId] ASC);
GO

-- Creating primary key on [UserId] in table 'UsersTbl'
ALTER TABLE [dbo].[UsersTbl]
ADD CONSTRAINT [PK_UsersTbl]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [FishSpecies] in table 'FishCaughtTbl'
ALTER TABLE [dbo].[FishCaughtTbl]
ADD CONSTRAINT [FK_FishCaughtTbl_FishSpeciesTbl]
    FOREIGN KEY ([FishSpecies])
    REFERENCES [dbo].[FishSpeciesTbl]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FishCaughtTbl_FishSpeciesTbl'
CREATE INDEX [IX_FK_FishCaughtTbl_FishSpeciesTbl]
ON [dbo].[FishCaughtTbl]
    ([FishSpecies]);
GO

-- Creating foreign key on [Review] in table 'FishCaughtTbl'
ALTER TABLE [dbo].[FishCaughtTbl]
ADD CONSTRAINT [FK_FishCaughtTbl_ReviewsTbl]
    FOREIGN KEY ([Review])
    REFERENCES [dbo].[ReviewsTbl]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FishCaughtTbl_ReviewsTbl'
CREATE INDEX [IX_FK_FishCaughtTbl_ReviewsTbl]
ON [dbo].[FishCaughtTbl]
    ([Review]);
GO

-- Creating foreign key on [Type] in table 'FishSpeciesTbl'
ALTER TABLE [dbo].[FishSpeciesTbl]
ADD CONSTRAINT [FK_FishSpeciesTbl_FishTypeTbl]
    FOREIGN KEY ([Type])
    REFERENCES [dbo].[FishTypeTbl]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FishSpeciesTbl_FishTypeTbl'
CREATE INDEX [IX_FK_FishSpeciesTbl_FishTypeTbl]
ON [dbo].[FishSpeciesTbl]
    ([Type]);
GO

-- Creating foreign key on [FishingType] in table 'ReviewsTbl'
ALTER TABLE [dbo].[ReviewsTbl]
ADD CONSTRAINT [FK_ReviewsTbl_FishTypeTbl]
    FOREIGN KEY ([FishingType])
    REFERENCES [dbo].[FishTypeTbl]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReviewsTbl_FishTypeTbl'
CREATE INDEX [IX_FK_ReviewsTbl_FishTypeTbl]
ON [dbo].[ReviewsTbl]
    ([FishingType]);
GO

-- Creating foreign key on [Region] in table 'LakesTbl'
ALTER TABLE [dbo].[LakesTbl]
ADD CONSTRAINT [FK_LakesTbl_RegionsTbl]
    FOREIGN KEY ([Region])
    REFERENCES [dbo].[RegionsTbl]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LakesTbl_RegionsTbl'
CREATE INDEX [IX_FK_LakesTbl_RegionsTbl]
ON [dbo].[LakesTbl]
    ([Region]);
GO

-- Creating foreign key on [UserId] in table 'NewsTbl'
ALTER TABLE [dbo].[NewsTbl]
ADD CONSTRAINT [FK_NewsTbl_UsersTbl]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UsersTbl]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NewsTbl_UsersTbl'
CREATE INDEX [IX_FK_NewsTbl_UsersTbl]
ON [dbo].[NewsTbl]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'RatingsTbl'
ALTER TABLE [dbo].[RatingsTbl]
ADD CONSTRAINT [FK_RatingsTbl_UsersTbl]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UsersTbl]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RatingsTbl_UsersTbl'
CREATE INDEX [IX_FK_RatingsTbl_UsersTbl]
ON [dbo].[RatingsTbl]
    ([UserId]);
GO

-- Creating foreign key on [Rating] in table 'ReviewsTbl'
ALTER TABLE [dbo].[ReviewsTbl]
ADD CONSTRAINT [FK_ReviewsTbl_RatingsTbl]
    FOREIGN KEY ([Rating])
    REFERENCES [dbo].[RatingsTbl]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReviewsTbl_RatingsTbl'
CREATE INDEX [IX_FK_ReviewsTbl_RatingsTbl]
ON [dbo].[ReviewsTbl]
    ([Rating]);
GO

-- Creating foreign key on [Region] in table 'ReviewsTbl'
ALTER TABLE [dbo].[ReviewsTbl]
ADD CONSTRAINT [FK_ReviewsTbl_RegionsTbl]
    FOREIGN KEY ([Region])
    REFERENCES [dbo].[RegionsTbl]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReviewsTbl_RegionsTbl'
CREATE INDEX [IX_FK_ReviewsTbl_RegionsTbl]
ON [dbo].[ReviewsTbl]
    ([Region]);
GO

-- Creating foreign key on [Region] in table 'RiversTbl'
ALTER TABLE [dbo].[RiversTbl]
ADD CONSTRAINT [FK_RiversTbl_RegionsTbl]
    FOREIGN KEY ([Region])
    REFERENCES [dbo].[RegionsTbl]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RiversTbl_RegionsTbl'
CREATE INDEX [IX_FK_RiversTbl_RegionsTbl]
ON [dbo].[RiversTbl]
    ([Region]);
GO

-- Creating foreign key on [UserId] in table 'ReviewsTbl'
ALTER TABLE [dbo].[ReviewsTbl]
ADD CONSTRAINT [FK_ReviewsTbl_UsersTbl]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UsersTbl]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReviewsTbl_UsersTbl'
CREATE INDEX [IX_FK_ReviewsTbl_UsersTbl]
ON [dbo].[ReviewsTbl]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'UserRolesTbl'
ALTER TABLE [dbo].[UserRolesTbl]
ADD CONSTRAINT [FK_UserRolesTbl_UsersTbl]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UsersTbl]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------