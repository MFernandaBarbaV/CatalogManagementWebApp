
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/11/2017 19:21:16
-- Generated from EDMX file: C:\Users\ferna\Desktop\CatalogManagementWebApp\CatalogManagementWebApp\CatalogManagement\DataBaseModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [WP.Toluca.UserDomainCore];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_dProfileOperations_mOperations]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[dProfileOperations] DROP CONSTRAINT [FK_dProfileOperations_mOperations];
GO
IF OBJECT_ID(N'[dbo].[FK_dProfileOperations_mProfiles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[dProfileOperations] DROP CONSTRAINT [FK_dProfileOperations_mProfiles];
GO
IF OBJECT_ID(N'[dbo].[FK_dUserProfiles_mAccessTemplates]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[dUserProfiles] DROP CONSTRAINT [FK_dUserProfiles_mAccessTemplates];
GO
IF OBJECT_ID(N'[dbo].[FK_dUserProfiles_mProfiles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[dUserProfiles] DROP CONSTRAINT [FK_dUserProfiles_mProfiles];
GO
IF OBJECT_ID(N'[dbo].[FK_dUserProfiles_mUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[dUserProfiles] DROP CONSTRAINT [FK_dUserProfiles_mUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_mAccessLog_mApplications]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[mAccessLog] DROP CONSTRAINT [FK_mAccessLog_mApplications];
GO
IF OBJECT_ID(N'[dbo].[FK_mAccessLog_mOperations]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[mAccessLog] DROP CONSTRAINT [FK_mAccessLog_mOperations];
GO
IF OBJECT_ID(N'[dbo].[FK_mAccessLog_mProfiles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[mAccessLog] DROP CONSTRAINT [FK_mAccessLog_mProfiles];
GO
IF OBJECT_ID(N'[dbo].[FK_mAccessLog_mUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[mAccessLog] DROP CONSTRAINT [FK_mAccessLog_mUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_mApplications_mStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[mApplications] DROP CONSTRAINT [FK_mApplications_mStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_mOperations_mApplications]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[mOperations] DROP CONSTRAINT [FK_mOperations_mApplications];
GO
IF OBJECT_ID(N'[dbo].[FK_mProfiles_mApplications]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[mProfiles] DROP CONSTRAINT [FK_mProfiles_mApplications];
GO
IF OBJECT_ID(N'[dbo].[FK_mProfiles_mStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[mProfiles] DROP CONSTRAINT [FK_mProfiles_mStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_mSmartCards_mSmartCardRoles]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[mSmartCards] DROP CONSTRAINT [FK_mSmartCards_mSmartCardRoles];
GO
IF OBJECT_ID(N'[dbo].[FK_mSmartCards_mStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[mSmartCards] DROP CONSTRAINT [FK_mSmartCards_mStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_mSmartCards_mUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[mSmartCards] DROP CONSTRAINT [FK_mSmartCards_mUsers];
GO
IF OBJECT_ID(N'[dbo].[FK_mStatus_mStatusTypes]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[mStatus] DROP CONSTRAINT [FK_mStatus_mStatusTypes];
GO
IF OBJECT_ID(N'[dbo].[FK_mUsers_mStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[mUsers] DROP CONSTRAINT [FK_mUsers_mStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioDelegacion_Delegacion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserDelegations] DROP CONSTRAINT [FK_UsuarioDelegacion_Delegacion];
GO
IF OBJECT_ID(N'[dbo].[FK_UsuarioDelegacion_mUsers]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserDelegations] DROP CONSTRAINT [FK_UsuarioDelegacion_mUsers];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Delegation]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Delegation];
GO
IF OBJECT_ID(N'[dbo].[dProfileOperations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[dProfileOperations];
GO
IF OBJECT_ID(N'[dbo].[dUserProfiles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[dUserProfiles];
GO
IF OBJECT_ID(N'[dbo].[mAccessLog]', 'U') IS NOT NULL
    DROP TABLE [dbo].[mAccessLog];
GO
IF OBJECT_ID(N'[dbo].[mAccessTemplates]', 'U') IS NOT NULL
    DROP TABLE [dbo].[mAccessTemplates];
GO
IF OBJECT_ID(N'[dbo].[mApplications]', 'U') IS NOT NULL
    DROP TABLE [dbo].[mApplications];
GO
IF OBJECT_ID(N'[dbo].[mOperations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[mOperations];
GO
IF OBJECT_ID(N'[dbo].[mProfiles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[mProfiles];
GO
IF OBJECT_ID(N'[dbo].[mSmartCardRoles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[mSmartCardRoles];
GO
IF OBJECT_ID(N'[dbo].[mSmartCards]', 'U') IS NOT NULL
    DROP TABLE [dbo].[mSmartCards];
GO
IF OBJECT_ID(N'[dbo].[mStatus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[mStatus];
GO
IF OBJECT_ID(N'[dbo].[mStatusTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[mStatusTypes];
GO
IF OBJECT_ID(N'[dbo].[mUsers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[mUsers];
GO
IF OBJECT_ID(N'[dbo].[UserDelegations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserDelegations];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Delegations'
CREATE TABLE [dbo].[Delegations] (
    [DelegationID] tinyint  NOT NULL,
    [Name] varchar(120)  NOT NULL
);
GO

-- Creating table 'dUserProfiles'
CREATE TABLE [dbo].[dUserProfiles] (
    [UserID] int  NOT NULL,
    [ProfileID] int  NOT NULL,
    [AccessTemplateID] int  NOT NULL
);
GO

-- Creating table 'mAccessLogs'
CREATE TABLE [dbo].[mAccessLogs] (
    [AccessLogID] int IDENTITY(1,1) NOT NULL,
    [UserID] int  NOT NULL,
    [UserName] varchar(127)  NULL,
    [ProfileID] int  NOT NULL,
    [ProfileName] varchar(50)  NULL,
    [OperationID] int  NOT NULL,
    [CreationDate] datetime  NOT NULL,
    [UserLogin] varchar(50)  NULL,
    [ApplicationID] int  NOT NULL
);
GO

-- Creating table 'mAccessTemplates'
CREATE TABLE [dbo].[mAccessTemplates] (
    [AccessTemplateID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [Monday] varchar(6)  NOT NULL,
    [Tuesday] varchar(6)  NOT NULL,
    [Wednesday] varchar(6)  NOT NULL,
    [Thursday] varchar(6)  NOT NULL,
    [Friday] varchar(6)  NOT NULL,
    [Saturday] varchar(6)  NOT NULL,
    [Sunday] varchar(6)  NOT NULL,
    [IsReadOnly] bit  NOT NULL
);
GO

-- Creating table 'mApplications'
CREATE TABLE [dbo].[mApplications] (
    [ApplicationID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [Type] varchar(25)  NOT NULL,
    [Origin] varchar(255)  NULL,
    [Version] varchar(30)  NULL,
    [ReleaseDate] datetime  NULL,
    [IsReadOnly] bit  NOT NULL,
    [ManagesDelagations] bit  NOT NULL,
    [StatusID] int  NOT NULL
);
GO

-- Creating table 'mOperations'
CREATE TABLE [dbo].[mOperations] (
    [OperationID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [ApplicationID] int  NOT NULL,
    [SysOperation] int  NOT NULL,
    [IsReadOnly] bit  NOT NULL
);
GO

-- Creating table 'mProfiles'
CREATE TABLE [dbo].[mProfiles] (
    [ProfileID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [ApplicationID] int  NOT NULL,
    [IsReadOnly] bit  NOT NULL,
    [StatusID] int  NOT NULL
);
GO

-- Creating table 'mSmartCardRoles'
CREATE TABLE [dbo].[mSmartCardRoles] (
    [RoleID] int IDENTITY(1,1) NOT NULL,
    [Role] varchar(50)  NOT NULL
);
GO

-- Creating table 'mSmartCards'
CREATE TABLE [dbo].[mSmartCards] (
    [SmartCardID] varchar(15)  NOT NULL,
    [Pin] varchar(4)  NOT NULL,
    [UserID] int  NOT NULL,
    [RoleID] int  NOT NULL,
    [CreationDate] datetime  NOT NULL,
    [Expiration] datetime  NOT NULL,
    [StatusID] int  NOT NULL
);
GO

-- Creating table 'mStatus'
CREATE TABLE [dbo].[mStatus] (
    [StatusID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(50)  NOT NULL,
    [Type] int  NULL
);
GO

-- Creating table 'mStatusTypes'
CREATE TABLE [dbo].[mStatusTypes] (
    [TypeID] int  NOT NULL,
    [Name] varchar(50)  NOT NULL
);
GO

-- Creating table 'mUsers'
CREATE TABLE [dbo].[mUsers] (
    [UserID] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(25)  NOT NULL,
    [LastName] varchar(50)  NOT NULL,
    [Surname] varchar(50)  NULL,
    [Address] varchar(100)  NULL,
    [ZipCode] int  NULL,
    [Email] varchar(120)  NOT NULL,
    [Organization] varchar(50)  NULL,
    [Position] varchar(50)  NULL,
    [ShortName] varchar(15)  NOT NULL,
    [Login] varchar(50)  NOT NULL,
    [Password] varchar(50)  NOT NULL,
    [Sex] int  NOT NULL,
    [StatusID] int  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [IsReadOnly] bit  NOT NULL,
    [IsFirstSession] bit  NOT NULL,
    [IsActiveSession] bit  NOT NULL,
    [LastLogin] datetime  NOT NULL
);
GO

-- Creating table 'dProfileOperations'
CREATE TABLE [dbo].[dProfileOperations] (
    [mOperations_OperationID] int  NOT NULL,
    [mProfiles_ProfileID] int  NOT NULL
);
GO

-- Creating table 'UserDelegations'
CREATE TABLE [dbo].[UserDelegations] (
    [Delegations_DelegationID] tinyint  NOT NULL,
    [mUsers_UserID] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [DelegationID] in table 'Delegations'
ALTER TABLE [dbo].[Delegations]
ADD CONSTRAINT [PK_Delegations]
    PRIMARY KEY CLUSTERED ([DelegationID] ASC);
GO

-- Creating primary key on [UserID], [ProfileID] in table 'dUserProfiles'
ALTER TABLE [dbo].[dUserProfiles]
ADD CONSTRAINT [PK_dUserProfiles]
    PRIMARY KEY CLUSTERED ([UserID], [ProfileID] ASC);
GO

-- Creating primary key on [AccessLogID] in table 'mAccessLogs'
ALTER TABLE [dbo].[mAccessLogs]
ADD CONSTRAINT [PK_mAccessLogs]
    PRIMARY KEY CLUSTERED ([AccessLogID] ASC);
GO

-- Creating primary key on [AccessTemplateID] in table 'mAccessTemplates'
ALTER TABLE [dbo].[mAccessTemplates]
ADD CONSTRAINT [PK_mAccessTemplates]
    PRIMARY KEY CLUSTERED ([AccessTemplateID] ASC);
GO

-- Creating primary key on [ApplicationID] in table 'mApplications'
ALTER TABLE [dbo].[mApplications]
ADD CONSTRAINT [PK_mApplications]
    PRIMARY KEY CLUSTERED ([ApplicationID] ASC);
GO

-- Creating primary key on [OperationID] in table 'mOperations'
ALTER TABLE [dbo].[mOperations]
ADD CONSTRAINT [PK_mOperations]
    PRIMARY KEY CLUSTERED ([OperationID] ASC);
GO

-- Creating primary key on [ProfileID] in table 'mProfiles'
ALTER TABLE [dbo].[mProfiles]
ADD CONSTRAINT [PK_mProfiles]
    PRIMARY KEY CLUSTERED ([ProfileID] ASC);
GO

-- Creating primary key on [RoleID] in table 'mSmartCardRoles'
ALTER TABLE [dbo].[mSmartCardRoles]
ADD CONSTRAINT [PK_mSmartCardRoles]
    PRIMARY KEY CLUSTERED ([RoleID] ASC);
GO

-- Creating primary key on [SmartCardID] in table 'mSmartCards'
ALTER TABLE [dbo].[mSmartCards]
ADD CONSTRAINT [PK_mSmartCards]
    PRIMARY KEY CLUSTERED ([SmartCardID] ASC);
GO

-- Creating primary key on [StatusID] in table 'mStatus'
ALTER TABLE [dbo].[mStatus]
ADD CONSTRAINT [PK_mStatus]
    PRIMARY KEY CLUSTERED ([StatusID] ASC);
GO

-- Creating primary key on [TypeID] in table 'mStatusTypes'
ALTER TABLE [dbo].[mStatusTypes]
ADD CONSTRAINT [PK_mStatusTypes]
    PRIMARY KEY CLUSTERED ([TypeID] ASC);
GO

-- Creating primary key on [UserID] in table 'mUsers'
ALTER TABLE [dbo].[mUsers]
ADD CONSTRAINT [PK_mUsers]
    PRIMARY KEY CLUSTERED ([UserID] ASC);
GO

-- Creating primary key on [mOperations_OperationID], [mProfiles_ProfileID] in table 'dProfileOperations'
ALTER TABLE [dbo].[dProfileOperations]
ADD CONSTRAINT [PK_dProfileOperations]
    PRIMARY KEY CLUSTERED ([mOperations_OperationID], [mProfiles_ProfileID] ASC);
GO

-- Creating primary key on [Delegations_DelegationID], [mUsers_UserID] in table 'UserDelegations'
ALTER TABLE [dbo].[UserDelegations]
ADD CONSTRAINT [PK_UserDelegations]
    PRIMARY KEY CLUSTERED ([Delegations_DelegationID], [mUsers_UserID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [AccessTemplateID] in table 'dUserProfiles'
ALTER TABLE [dbo].[dUserProfiles]
ADD CONSTRAINT [FK_dUserProfiles_mAccessTemplates]
    FOREIGN KEY ([AccessTemplateID])
    REFERENCES [dbo].[mAccessTemplates]
        ([AccessTemplateID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dUserProfiles_mAccessTemplates'
CREATE INDEX [IX_FK_dUserProfiles_mAccessTemplates]
ON [dbo].[dUserProfiles]
    ([AccessTemplateID]);
GO

-- Creating foreign key on [ProfileID] in table 'dUserProfiles'
ALTER TABLE [dbo].[dUserProfiles]
ADD CONSTRAINT [FK_dUserProfiles_mProfiles]
    FOREIGN KEY ([ProfileID])
    REFERENCES [dbo].[mProfiles]
        ([ProfileID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dUserProfiles_mProfiles'
CREATE INDEX [IX_FK_dUserProfiles_mProfiles]
ON [dbo].[dUserProfiles]
    ([ProfileID]);
GO

-- Creating foreign key on [UserID] in table 'dUserProfiles'
ALTER TABLE [dbo].[dUserProfiles]
ADD CONSTRAINT [FK_dUserProfiles_mUsers]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[mUsers]
        ([UserID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ApplicationID] in table 'mAccessLogs'
ALTER TABLE [dbo].[mAccessLogs]
ADD CONSTRAINT [FK_mAccessLog_mApplications]
    FOREIGN KEY ([ApplicationID])
    REFERENCES [dbo].[mApplications]
        ([ApplicationID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mAccessLog_mApplications'
CREATE INDEX [IX_FK_mAccessLog_mApplications]
ON [dbo].[mAccessLogs]
    ([ApplicationID]);
GO

-- Creating foreign key on [OperationID] in table 'mAccessLogs'
ALTER TABLE [dbo].[mAccessLogs]
ADD CONSTRAINT [FK_mAccessLog_mOperations]
    FOREIGN KEY ([OperationID])
    REFERENCES [dbo].[mOperations]
        ([OperationID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mAccessLog_mOperations'
CREATE INDEX [IX_FK_mAccessLog_mOperations]
ON [dbo].[mAccessLogs]
    ([OperationID]);
GO

-- Creating foreign key on [ProfileID] in table 'mAccessLogs'
ALTER TABLE [dbo].[mAccessLogs]
ADD CONSTRAINT [FK_mAccessLog_mProfiles]
    FOREIGN KEY ([ProfileID])
    REFERENCES [dbo].[mProfiles]
        ([ProfileID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mAccessLog_mProfiles'
CREATE INDEX [IX_FK_mAccessLog_mProfiles]
ON [dbo].[mAccessLogs]
    ([ProfileID]);
GO

-- Creating foreign key on [UserID] in table 'mAccessLogs'
ALTER TABLE [dbo].[mAccessLogs]
ADD CONSTRAINT [FK_mAccessLog_mUsers]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[mUsers]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mAccessLog_mUsers'
CREATE INDEX [IX_FK_mAccessLog_mUsers]
ON [dbo].[mAccessLogs]
    ([UserID]);
GO

-- Creating foreign key on [StatusID] in table 'mApplications'
ALTER TABLE [dbo].[mApplications]
ADD CONSTRAINT [FK_mApplications_mStatus]
    FOREIGN KEY ([StatusID])
    REFERENCES [dbo].[mStatus]
        ([StatusID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mApplications_mStatus'
CREATE INDEX [IX_FK_mApplications_mStatus]
ON [dbo].[mApplications]
    ([StatusID]);
GO

-- Creating foreign key on [ApplicationID] in table 'mOperations'
ALTER TABLE [dbo].[mOperations]
ADD CONSTRAINT [FK_mOperations_mApplications]
    FOREIGN KEY ([ApplicationID])
    REFERENCES [dbo].[mApplications]
        ([ApplicationID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mOperations_mApplications'
CREATE INDEX [IX_FK_mOperations_mApplications]
ON [dbo].[mOperations]
    ([ApplicationID]);
GO

-- Creating foreign key on [ApplicationID] in table 'mProfiles'
ALTER TABLE [dbo].[mProfiles]
ADD CONSTRAINT [FK_mProfiles_mApplications]
    FOREIGN KEY ([ApplicationID])
    REFERENCES [dbo].[mApplications]
        ([ApplicationID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mProfiles_mApplications'
CREATE INDEX [IX_FK_mProfiles_mApplications]
ON [dbo].[mProfiles]
    ([ApplicationID]);
GO

-- Creating foreign key on [StatusID] in table 'mProfiles'
ALTER TABLE [dbo].[mProfiles]
ADD CONSTRAINT [FK_mProfiles_mStatus]
    FOREIGN KEY ([StatusID])
    REFERENCES [dbo].[mStatus]
        ([StatusID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mProfiles_mStatus'
CREATE INDEX [IX_FK_mProfiles_mStatus]
ON [dbo].[mProfiles]
    ([StatusID]);
GO

-- Creating foreign key on [RoleID] in table 'mSmartCards'
ALTER TABLE [dbo].[mSmartCards]
ADD CONSTRAINT [FK_mSmartCards_mSmartCardRoles]
    FOREIGN KEY ([RoleID])
    REFERENCES [dbo].[mSmartCardRoles]
        ([RoleID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mSmartCards_mSmartCardRoles'
CREATE INDEX [IX_FK_mSmartCards_mSmartCardRoles]
ON [dbo].[mSmartCards]
    ([RoleID]);
GO

-- Creating foreign key on [StatusID] in table 'mSmartCards'
ALTER TABLE [dbo].[mSmartCards]
ADD CONSTRAINT [FK_mSmartCards_mStatus]
    FOREIGN KEY ([StatusID])
    REFERENCES [dbo].[mStatus]
        ([StatusID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mSmartCards_mStatus'
CREATE INDEX [IX_FK_mSmartCards_mStatus]
ON [dbo].[mSmartCards]
    ([StatusID]);
GO

-- Creating foreign key on [UserID] in table 'mSmartCards'
ALTER TABLE [dbo].[mSmartCards]
ADD CONSTRAINT [FK_mSmartCards_mUsers]
    FOREIGN KEY ([UserID])
    REFERENCES [dbo].[mUsers]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mSmartCards_mUsers'
CREATE INDEX [IX_FK_mSmartCards_mUsers]
ON [dbo].[mSmartCards]
    ([UserID]);
GO

-- Creating foreign key on [Type] in table 'mStatus'
ALTER TABLE [dbo].[mStatus]
ADD CONSTRAINT [FK_mStatus_mStatusTypes]
    FOREIGN KEY ([Type])
    REFERENCES [dbo].[mStatusTypes]
        ([TypeID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mStatus_mStatusTypes'
CREATE INDEX [IX_FK_mStatus_mStatusTypes]
ON [dbo].[mStatus]
    ([Type]);
GO

-- Creating foreign key on [StatusID] in table 'mUsers'
ALTER TABLE [dbo].[mUsers]
ADD CONSTRAINT [FK_mUsers_mStatus]
    FOREIGN KEY ([StatusID])
    REFERENCES [dbo].[mStatus]
        ([StatusID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_mUsers_mStatus'
CREATE INDEX [IX_FK_mUsers_mStatus]
ON [dbo].[mUsers]
    ([StatusID]);
GO

-- Creating foreign key on [mOperations_OperationID] in table 'dProfileOperations'
ALTER TABLE [dbo].[dProfileOperations]
ADD CONSTRAINT [FK_dProfileOperations_mOperations]
    FOREIGN KEY ([mOperations_OperationID])
    REFERENCES [dbo].[mOperations]
        ([OperationID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [mProfiles_ProfileID] in table 'dProfileOperations'
ALTER TABLE [dbo].[dProfileOperations]
ADD CONSTRAINT [FK_dProfileOperations_mProfiles]
    FOREIGN KEY ([mProfiles_ProfileID])
    REFERENCES [dbo].[mProfiles]
        ([ProfileID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_dProfileOperations_mProfiles'
CREATE INDEX [IX_FK_dProfileOperations_mProfiles]
ON [dbo].[dProfileOperations]
    ([mProfiles_ProfileID]);
GO

-- Creating foreign key on [Delegations_DelegationID] in table 'UserDelegations'
ALTER TABLE [dbo].[UserDelegations]
ADD CONSTRAINT [FK_UserDelegations_Delegation]
    FOREIGN KEY ([Delegations_DelegationID])
    REFERENCES [dbo].[Delegations]
        ([DelegationID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [mUsers_UserID] in table 'UserDelegations'
ALTER TABLE [dbo].[UserDelegations]
ADD CONSTRAINT [FK_UserDelegations_mUsers]
    FOREIGN KEY ([mUsers_UserID])
    REFERENCES [dbo].[mUsers]
        ([UserID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserDelegations_mUsers'
CREATE INDEX [IX_FK_UserDelegations_mUsers]
ON [dbo].[UserDelegations]
    ([mUsers_UserID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------