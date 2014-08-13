
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 08/06/2014 12:43:55
-- Generated from EDMX file: E:\georgian stuff\sem 4\Enterprise Computing\Assignments\Project - with slider - Azure -dont touch\project\project\GeorgianBookSale.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [GeorgianBookSale];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_BookDepartment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Books] DROP CONSTRAINT [FK_BookDepartment];
GO
IF OBJECT_ID(N'[dbo].[FK_BuySaleRegistration]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Books] DROP CONSTRAINT [FK_BuySaleRegistration];
GO
IF OBJECT_ID(N'[dbo].[FK_Negotiations_Books]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Negotiations] DROP CONSTRAINT [FK_Negotiations_Books];
GO
IF OBJECT_ID(N'[dbo].[FK_Negotiations_Users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Negotiations] DROP CONSTRAINT [FK_Negotiations_Users];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Books]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Books];
GO
IF OBJECT_ID(N'[dbo].[Departments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Departments];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Negotiations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Negotiations];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Books'
CREATE TABLE [dbo].[Books] (
    [BookName] varchar(30)  NOT NULL,
    [Cost] int  NOT NULL,
    [NegotiatingCost] int  NULL,
    [id] bigint IDENTITY(1,1) NOT NULL,
    [Owner_id] int  NOT NULL,
    [Department_id] bigint  NOT NULL,
    [Negotiator_id] int  NULL
);
GO

-- Creating table 'Departments'
CREATE TABLE [dbo].[Departments] (
    [id] bigint IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [username] varchar(30)  NOT NULL,
    [password] varchar(max)  NOT NULL,
    [email_id] varchar(30)  NULL,
    [phone_number] nvarchar(max)  NULL,
    [id] int IDENTITY(1,1) NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [id] in table 'Books'
ALTER TABLE [dbo].[Books]
ADD CONSTRAINT [PK_Books]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Departments'
ALTER TABLE [dbo].[Departments]
ADD CONSTRAINT [PK_Departments]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Department_id] in table 'Books'
ALTER TABLE [dbo].[Books]
ADD CONSTRAINT [FK_BookDepartment]
    FOREIGN KEY ([Department_id])
    REFERENCES [dbo].[Departments]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BookDepartment'
CREATE INDEX [IX_FK_BookDepartment]
ON [dbo].[Books]
    ([Department_id]);
GO

-- Creating foreign key on [Owner_id] in table 'Books'
ALTER TABLE [dbo].[Books]
ADD CONSTRAINT [FK_BuySaleRegistration]
    FOREIGN KEY ([Owner_id])
    REFERENCES [dbo].[Users]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_BuySaleRegistration'
CREATE INDEX [IX_FK_BuySaleRegistration]
ON [dbo].[Books]
    ([Owner_id]);
GO

-- Creating foreign key on [Negotiator_id] in table 'Books'
ALTER TABLE [dbo].[Books]
ADD CONSTRAINT [FK_Negotiations]
    FOREIGN KEY ([Negotiator_id])
    REFERENCES [dbo].[Users]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_Negotiations'
CREATE INDEX [IX_FK_Negotiations]
ON [dbo].[Books]
    ([Negotiator_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------