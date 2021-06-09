
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/09/2021 10:22:09
-- Generated from EDMX file: C:\Users\admin\source\repos\VillaOy\VillaOy\Models\TilausDB.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [VillatOyDatabase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Tilaukset_Asiakkaat]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tilaukset] DROP CONSTRAINT [FK_Tilaukset_Asiakkaat];
GO
IF OBJECT_ID(N'[dbo].[FK_Tilaukset_Postitoimipaikat]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tilaukset] DROP CONSTRAINT [FK_Tilaukset_Postitoimipaikat];
GO
IF OBJECT_ID(N'[dbo].[FK_Tilausrivit_Tilaukset]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tilausrivit] DROP CONSTRAINT [FK_Tilausrivit_Tilaukset];
GO
IF OBJECT_ID(N'[dbo].[FK_Tilausrivit_Tuotteet]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Tilausrivit] DROP CONSTRAINT [FK_Tilausrivit_Tuotteet];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Asiakkaat]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Asiakkaat];
GO
IF OBJECT_ID(N'[dbo].[Henkilot]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Henkilot];
GO
IF OBJECT_ID(N'[dbo].[Logins]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Logins];
GO
IF OBJECT_ID(N'[dbo].[Post]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Post];
GO
IF OBJECT_ID(N'[dbo].[Postitoimipaikat]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Postitoimipaikat];
GO
IF OBJECT_ID(N'[dbo].[Tilaukset]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tilaukset];
GO
IF OBJECT_ID(N'[dbo].[Tilausrivit]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tilausrivit];
GO
IF OBJECT_ID(N'[dbo].[Tuotteet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Tuotteet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Asiakkaat'
CREATE TABLE [dbo].[Asiakkaat] (
    [AsiakasID] int IDENTITY(1,1) NOT NULL,
    [Nimi] varchar(50)  NULL,
    [Osoite] varchar(50)  NULL,
    [Postinumero] nchar(5)  NULL
);
GO

-- Creating table 'Henkilot'
CREATE TABLE [dbo].[Henkilot] (
    [Henkilo_id] int IDENTITY(1,1) NOT NULL,
    [Etunimi] nvarchar(50)  NULL,
    [Sukunimi] nvarchar(50)  NULL,
    [Osoite] nvarchar(100)  NULL,
    [Esimies] int  NULL,
    [Postinumero] varchar(5)  NULL,
    [Sahkoposti] nvarchar(100)  NULL
);
GO

-- Creating table 'Logins'
CREATE TABLE [dbo].[Logins] (
    [LoginId] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(50)  NOT NULL,
    [PassWord] nvarchar(50)  NOT NULL,
    [ErrorMessage] nvarchar(50)  NULL
);
GO

-- Creating table 'Postitoimipaikat'
CREATE TABLE [dbo].[Postitoimipaikat] (
    [Postinumero] nchar(5)  NOT NULL,
    [Postitoimipaikka] varchar(50)  NULL
);
GO

-- Creating table 'Tilaukset'
CREATE TABLE [dbo].[Tilaukset] (
    [TilausID] int IDENTITY(1,1) NOT NULL,
    [AsiakasID] int  NULL,
    [Toimitusosoite] varchar(100)  NULL,
    [Postinumero] nchar(5)  NULL,
    [Tilauspvm] datetime  NULL,
    [Toimituspvm] datetime  NULL
);
GO

-- Creating table 'Tilausrivit'
CREATE TABLE [dbo].[Tilausrivit] (
    [TilausriviID] int IDENTITY(1,1) NOT NULL,
    [TilausID] int  NULL,
    [TuoteID] int  NULL,
    [Maara] int  NULL,
    [Ahinta] decimal(5,2)  NULL
);
GO

-- Creating table 'Tuotteet'
CREATE TABLE [dbo].[Tuotteet] (
    [TuoteID] int IDENTITY(1,1) NOT NULL,
    [Nimi] varchar(50)  NULL,
    [Ahinta] decimal(7,2)  NULL,
    [Kuva] varbinary(max)  NULL,
    [Kuvalinkki] nvarchar(200)  NULL
);
GO

-- Creating table 'Post'
CREATE TABLE [dbo].[Post] (
    [Postnro] nchar(5)  NOT NULL,
    [Postplace] nvarchar(50)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AsiakasID] in table 'Asiakkaat'
ALTER TABLE [dbo].[Asiakkaat]
ADD CONSTRAINT [PK_Asiakkaat]
    PRIMARY KEY CLUSTERED ([AsiakasID] ASC);
GO

-- Creating primary key on [Henkilo_id] in table 'Henkilot'
ALTER TABLE [dbo].[Henkilot]
ADD CONSTRAINT [PK_Henkilot]
    PRIMARY KEY CLUSTERED ([Henkilo_id] ASC);
GO

-- Creating primary key on [LoginId] in table 'Logins'
ALTER TABLE [dbo].[Logins]
ADD CONSTRAINT [PK_Logins]
    PRIMARY KEY CLUSTERED ([LoginId] ASC);
GO

-- Creating primary key on [Postinumero] in table 'Postitoimipaikat'
ALTER TABLE [dbo].[Postitoimipaikat]
ADD CONSTRAINT [PK_Postitoimipaikat]
    PRIMARY KEY CLUSTERED ([Postinumero] ASC);
GO

-- Creating primary key on [TilausID] in table 'Tilaukset'
ALTER TABLE [dbo].[Tilaukset]
ADD CONSTRAINT [PK_Tilaukset]
    PRIMARY KEY CLUSTERED ([TilausID] ASC);
GO

-- Creating primary key on [TilausriviID] in table 'Tilausrivit'
ALTER TABLE [dbo].[Tilausrivit]
ADD CONSTRAINT [PK_Tilausrivit]
    PRIMARY KEY CLUSTERED ([TilausriviID] ASC);
GO

-- Creating primary key on [TuoteID] in table 'Tuotteet'
ALTER TABLE [dbo].[Tuotteet]
ADD CONSTRAINT [PK_Tuotteet]
    PRIMARY KEY CLUSTERED ([TuoteID] ASC);
GO

-- Creating primary key on [Postnro] in table 'Post'
ALTER TABLE [dbo].[Post]
ADD CONSTRAINT [PK_Post]
    PRIMARY KEY CLUSTERED ([Postnro] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Postinumero] in table 'Asiakkaat'
ALTER TABLE [dbo].[Asiakkaat]
ADD CONSTRAINT [FK_Asiakkaat_Postitoimipaikat]
    FOREIGN KEY ([Postinumero])
    REFERENCES [dbo].[Postitoimipaikat]
        ([Postinumero])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Asiakkaat_Postitoimipaikat'
CREATE INDEX [IX_FK_Asiakkaat_Postitoimipaikat]
ON [dbo].[Asiakkaat]
    ([Postinumero]);
GO

-- Creating foreign key on [AsiakasID] in table 'Tilaukset'
ALTER TABLE [dbo].[Tilaukset]
ADD CONSTRAINT [FK_Tilaukset_Asiakkaat]
    FOREIGN KEY ([AsiakasID])
    REFERENCES [dbo].[Asiakkaat]
        ([AsiakasID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Tilaukset_Asiakkaat'
CREATE INDEX [IX_FK_Tilaukset_Asiakkaat]
ON [dbo].[Tilaukset]
    ([AsiakasID]);
GO

-- Creating foreign key on [Postinumero] in table 'Tilaukset'
ALTER TABLE [dbo].[Tilaukset]
ADD CONSTRAINT [FK_Tilaukset_Postitoimipaikat]
    FOREIGN KEY ([Postinumero])
    REFERENCES [dbo].[Postitoimipaikat]
        ([Postinumero])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Tilaukset_Postitoimipaikat'
CREATE INDEX [IX_FK_Tilaukset_Postitoimipaikat]
ON [dbo].[Tilaukset]
    ([Postinumero]);
GO

-- Creating foreign key on [TilausID] in table 'Tilausrivit'
ALTER TABLE [dbo].[Tilausrivit]
ADD CONSTRAINT [FK_Tilausrivit_Tilaukset]
    FOREIGN KEY ([TilausID])
    REFERENCES [dbo].[Tilaukset]
        ([TilausID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Tilausrivit_Tilaukset'
CREATE INDEX [IX_FK_Tilausrivit_Tilaukset]
ON [dbo].[Tilausrivit]
    ([TilausID]);
GO

-- Creating foreign key on [TuoteID] in table 'Tilausrivit'
ALTER TABLE [dbo].[Tilausrivit]
ADD CONSTRAINT [FK_Tilausrivit_Tuotteet]
    FOREIGN KEY ([TuoteID])
    REFERENCES [dbo].[Tuotteet]
        ([TuoteID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Tilausrivit_Tuotteet'
CREATE INDEX [IX_FK_Tilausrivit_Tuotteet]
ON [dbo].[Tilausrivit]
    ([TuoteID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------