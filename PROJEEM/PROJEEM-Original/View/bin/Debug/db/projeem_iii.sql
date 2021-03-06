USE [master]
GO
/****** Object:  Database [Projeem_iii]    Script Date: 11/02/2011 02:56:32 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Projeem_iii')
BEGIN
CREATE DATABASE [Projeem_iii] ON  PRIMARY 
( NAME = N'Projeem_Data', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Projeem_iii.mdf' , SIZE = 20480KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Projeem_iii_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Projeem_iii_log.ldf' , SIZE = 504KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
END
GO
ALTER DATABASE [Projeem_iii] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Projeem_iii].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Projeem_iii] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Projeem_iii] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Projeem_iii] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Projeem_iii] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Projeem_iii] SET ARITHABORT OFF
GO
ALTER DATABASE [Projeem_iii] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Projeem_iii] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Projeem_iii] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Projeem_iii] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Projeem_iii] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Projeem_iii] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Projeem_iii] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Projeem_iii] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Projeem_iii] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Projeem_iii] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Projeem_iii] SET  DISABLE_BROKER
GO
ALTER DATABASE [Projeem_iii] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Projeem_iii] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Projeem_iii] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Projeem_iii] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Projeem_iii] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Projeem_iii] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Projeem_iii] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Projeem_iii] SET  READ_WRITE
GO
ALTER DATABASE [Projeem_iii] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Projeem_iii] SET  MULTI_USER
GO
ALTER DATABASE [Projeem_iii] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Projeem_iii] SET DB_CHAINING OFF
GO
USE [Projeem_iii]
GO
/****** Object:  User [Carlos]    Script Date: 11/02/2011 02:56:32 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Carlos')
CREATE USER [Carlos] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[indice]    Script Date: 11/02/2011 02:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[indice]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[indice](
	[cod_resultado] [numeric](18, 0) NOT NULL,
	[val_por_grupo] [varchar](6) NOT NULL,
	[referencia] [char](6) NOT NULL,
	[id_result_gp] [numeric](18, 0) NOT NULL,
	[sb_atual] [int] NOT NULL,
	[status_processamento] [nvarchar](7) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'indice', N'COLUMN',N'val_por_grupo'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor para aplicação por grupo em cada série' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'indice', @level2type=N'COLUMN',@level2name=N'val_por_grupo'
GO
INSERT [dbo].[indice] ([cod_resultado], [val_por_grupo], [referencia], [id_result_gp], [sb_atual], [status_processamento]) VALUES (CAST(1 AS Numeric(18, 0)), N'0,0001', N'201111', CAST(829 AS Numeric(18, 0)), 7, N'DEBITO')
/****** Object:  Table [dbo].[id_usuarios]    Script Date: 11/02/2011 02:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[id_usuarios]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[id_usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[inutil] [nchar](1) NOT NULL,
 CONSTRAINT [PK_id_usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[id_contabilidade]    Script Date: 11/02/2011 02:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[id_contabilidade]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[id_contabilidade](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[inutil] [nchar](1) NOT NULL,
 CONSTRAINT [PK_id_contabilidade] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[grupos]    Script Date: 11/02/2011 02:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[grupos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[grupos](
	[id_grupo] [int] NOT NULL,
	[grupo] [int] NOT NULL,
	[debito_previsto] [decimal](18, 4) NOT NULL,
	[deducao_por_mvtc] [decimal](18, 4) NOT NULL,
	[credito] [decimal](18, 4) NOT NULL,
	[deduzido] [char](1) NOT NULL,
 CONSTRAINT [PK_grupos] PRIMARY KEY CLUSTERED 
(
	[id_grupo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (1, 1, CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (2, 2, CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (3, 3, CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (4, 4, CAST(8.5008 AS Decimal(18, 4)), CAST(8.5008 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'N')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (5, 5, CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (6, 6, CAST(11.1274 AS Decimal(18, 4)), CAST(11.1274 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'N')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (7, 7, CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (8, 8, CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (9, 9, CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (10, 10, CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (11, 11, CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (12, 12, CAST(6.0816 AS Decimal(18, 4)), CAST(6.0816 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'N')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (13, 13, CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (14, 14, CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (15, 15, CAST(3.8640 AS Decimal(18, 4)), CAST(3.8640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'N')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (16, 16, CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (17, 17, CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (18, 18, CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (19, 19, CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (20, 20, CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (21, 21, CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (22, 22, CAST(1.8400 AS Decimal(18, 4)), CAST(1.8400 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'N')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (23, 23, CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (24, 24, CAST(13.9640 AS Decimal(18, 4)), CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'N')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (25, 25, CAST(13.9640 AS Decimal(18, 4)), CAST(13.9640 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'N')
/****** Object:  Table [dbo].[carencia]    Script Date: 11/02/2011 02:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[carencia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[carencia](
	[id_carencia] [int] NOT NULL,
	[carencia] [int] NOT NULL,
 CONSTRAINT [PK_carencia] PRIMARY KEY CLUSTERED 
(
	[id_carencia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (23, 22)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (31, 7)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (39, 7)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (41, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (60, 18)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (62, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (69, 6)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (81, 11)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (90, 8)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (91, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (92, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (94, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (103, 8)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (109, 5)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (113, 3)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (116, 2)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (118, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (121, 2)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (124, 2)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (126, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (127, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (129, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (142, 12)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (146, 3)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (149, 2)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (155, 5)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (165, 9)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (174, 8)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (179, 4)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (183, 3)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (190, 6)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (194, 3)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (196, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (198, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (209, 10)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (211, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (215, 3)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (218, 2)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (222, 3)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (224, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (225, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (236, 10)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (241, 4)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (242, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (243, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (256, 12)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (260, 3)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (273, 12)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (275, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (280, 4)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (281, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (289, 7)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (292, 2)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (300, 7)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (313, 12)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (320, 6)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (321, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (326, 4)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (335, 8)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (339, 3)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (355, 15)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (365, 9)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (367, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (369, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (383, 13)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (391, 7)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (401, 9)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (402, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (408, 5)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (424, 15)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (430, 5)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (431, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (433, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (443, 9)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (444, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (459, 14)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (462, 2)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (466, 3)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (477, 10)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (483, 5)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (485, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (486, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (487, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (489, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (490, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (496, 5)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (508, 11)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (514, 5)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (516, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (524, 7)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (530, 5)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (533, 2)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (536, 2)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (543, 6)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (546, 2)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (550, 3)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (553, 2)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (557, 3)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (569, 11)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (574, 4)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (575, 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (581, 5)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (583, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (584, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (586, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (588, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (592, 3)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (595, 2)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (597, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (599, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (603, 3)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (604, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (615, 10)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (621, 5)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (633, 11)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (635, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (638, 2)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (643, 4)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (646, 2)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (650, 3)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (652, 1)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (655, 2)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (658, 2)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (669, 10)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (685, 15)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (696, 10)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (703, 6)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (704, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (709, 4)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (718, 8)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (719, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (723, 3)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (742, 18)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (746, 3)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (758, 11)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (765, 6)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (782, 16)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (783, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (786, 2)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (787, 0)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (800, 12)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (809, 8)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (818, 8)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (825, 6)
INSERT [dbo].[carencia] ([id_carencia], [carencia]) VALUES (829, 3)
/****** Object:  Table [dbo].[bancas]    Script Date: 11/02/2011 02:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[bancas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[bancas](
	[id_banca] [numeric](18, 0) NOT NULL,
	[descricao] [nvarchar](50) NOT NULL,
	[qtde_premio] [numeric](18, 0) NOT NULL,
	[val_Total_premio] [money] NOT NULL,
	[carencia_aposta] [numeric](18, 0) NOT NULL,
	[carencia_premio] [numeric](18, 0) NOT NULL,
	[relacao_aposta_premio] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_bancas] PRIMARY KEY CLUSTERED 
(
	[id_banca] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[postos]    Script Date: 11/02/2011 02:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[postos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[postos](
	[id_ponto] [numeric](18, 0) NOT NULL,
	[id_banca] [numeric](18, 0) NOT NULL,
	[descricao] [nvarchar](50) NOT NULL,
	[qtde_premio] [numeric](18, 0) NOT NULL,
	[val_total_premio] [money] NOT NULL,
	[carencia_aposta] [numeric](18, 0) NOT NULL,
	[carencia_premio] [numeric](18, 0) NOT NULL,
	[relacao_aposta_premio] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_pontos] PRIMARY KEY CLUSTERED 
(
	[id_ponto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[status_series]    Script Date: 11/02/2011 02:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[status_series]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[status_series](
	[id] [int] NOT NULL,
	[descricao] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_status_series] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[status_series] ([id], [descricao]) VALUES (1, N'PROCESSING_115')
INSERT [dbo].[status_series] ([id], [descricao]) VALUES (2, N'RECAP_01_WAIT')
INSERT [dbo].[status_series] ([id], [descricao]) VALUES (3, N'RECAP_01_PROCESSING')
INSERT [dbo].[status_series] ([id], [descricao]) VALUES (4, N'RECAP_02_WAIT')
INSERT [dbo].[status_series] ([id], [descricao]) VALUES (5, N'RECAP_02_PROCESSING')
INSERT [dbo].[status_series] ([id], [descricao]) VALUES (6, N'RECAP_03_WAIT')
INSERT [dbo].[status_series] ([id], [descricao]) VALUES (7, N'RECAP_03_PROCESSING')
INSERT [dbo].[status_series] ([id], [descricao]) VALUES (8, N'RECAP_04_WAIT')
INSERT [dbo].[status_series] ([id], [descricao]) VALUES (9, N'RECAP_04_PROCESSING')
INSERT [dbo].[status_series] ([id], [descricao]) VALUES (10, N'RECAP_05_WAIT')
INSERT [dbo].[status_series] ([id], [descricao]) VALUES (11, N'RECAP_05_PROCESSING')
INSERT [dbo].[status_series] ([id], [descricao]) VALUES (12, N'SUBSIDIAR')
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 11/02/2011 02:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[USUARIOS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[USUARIOS](
	[Codigo] [int] NOT NULL,
	[Nome] [nvarchar](80) NOT NULL,
	[Login] [nvarchar](15) NOT NULL,
	[Senha] [nvarchar](8) NOT NULL,
	[Acesso] [nvarchar](10) NULL,
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[USUARIOS] ([Codigo], [Nome], [Login], [Senha], [Acesso]) VALUES (3, N'Carlos Aberto dos Santos', N'CAS', N']_]o=ue=', N'111111111')
INSERT [dbo].[USUARIOS] ([Codigo], [Nome], [Login], [Senha], [Acesso]) VALUES (9, N'Administrador', N'ADMIN', N'========', N'111111111')
/****** Object:  Table [dbo].[contabilidade]    Script Date: 11/02/2011 02:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[contabilidade]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[contabilidade](
	[id_aplicacao] [int] NOT NULL,
	[num_gp] [int] NOT NULL,
	[subperiodo] [int] NOT NULL,
	[debito_contabil] [decimal](18, 4) NOT NULL,
	[debito_real] [decimal](18, 4) NOT NULL,
	[credito_contabil] [decimal](18, 4) NOT NULL,
	[credito_real] [decimal](18, 4) NOT NULL,
	[saldo_sb_contabil] [decimal](18, 4) NOT NULL,
	[saldo_sb_real] [decimal](18, 4) NOT NULL,
	[capital_subsidiario] [decimal](18, 4) NOT NULL,
	[mvtc] [decimal](18, 4) NOT NULL,
	[premio_real] [nchar](3) NOT NULL,
	[saldo_contabil_acumulado] [decimal](18, 4) NOT NULL,
	[saldo_real_acumulado] [decimal](18, 4) NOT NULL,
	[aguardandoPR] [int] NOT NULL,
	[recapitalizando_01] [int] NOT NULL,
	[recapitalizando_02] [int] NOT NULL,
	[recapitalizando_03] [int] NOT NULL,
	[recapitalizando_04] [int] NOT NULL,
	[subsidio] [int] NOT NULL,
 CONSTRAINT [PK_aplicacao] PRIMARY KEY CLUSTERED 
(
	[id_aplicacao] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[contabilidade] ([id_aplicacao], [num_gp], [subperiodo], [debito_contabil], [debito_real], [credito_contabil], [credito_real], [saldo_sb_contabil], [saldo_sb_real], [capital_subsidiario], [mvtc], [premio_real], [saldo_contabil_acumulado], [saldo_real_acumulado], [aguardandoPR], [recapitalizando_01], [recapitalizando_02], [recapitalizando_03], [recapitalizando_04], [subsidio]) VALUES (594, 6, 1, CAST(46.0000 AS Decimal(18, 4)), CAST(12.8800 AS Decimal(18, 4)), CAST(33.1200 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(-12.8800 AS Decimal(18, 4)), CAST(-12.8800 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(1.8400 AS Decimal(18, 4)), N'Não', CAST(-12.8800 AS Decimal(18, 4)), CAST(-12.8800 AS Decimal(18, 4)), 0, 0, 0, 0, 0, 0)
INSERT [dbo].[contabilidade] ([id_aplicacao], [num_gp], [subperiodo], [debito_contabil], [debito_real], [credito_contabil], [credito_real], [saldo_sb_contabil], [saldo_sb_real], [capital_subsidiario], [mvtc], [premio_real], [saldo_contabil_acumulado], [saldo_real_acumulado], [aguardandoPR], [recapitalizando_01], [recapitalizando_02], [recapitalizando_03], [recapitalizando_04], [subsidio]) VALUES (595, 4, 2, CAST(94.5760 AS Decimal(18, 4)), CAST(25.0240 AS Decimal(18, 4)), CAST(69.5520 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(-25.0240 AS Decimal(18, 4)), CAST(-25.0240 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(3.8640 AS Decimal(18, 4)), N'Não', CAST(-37.9040 AS Decimal(18, 4)), CAST(-37.9040 AS Decimal(18, 4)), 0, 0, 0, 0, 0, 0)
INSERT [dbo].[contabilidade] ([id_aplicacao], [num_gp], [subperiodo], [debito_contabil], [debito_real], [credito_contabil], [credito_real], [saldo_sb_contabil], [saldo_sb_real], [capital_subsidiario], [mvtc], [premio_real], [saldo_contabil_acumulado], [saldo_real_acumulado], [aguardandoPR], [recapitalizando_01], [recapitalizando_02], [recapitalizando_03], [recapitalizando_04], [subsidio]) VALUES (596, 12, 3, CAST(145.5808 AS Decimal(18, 4)), CAST(36.1120 AS Decimal(18, 4)), CAST(109.4688 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(-36.1120 AS Decimal(18, 4)), CAST(-36.1120 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(6.0820 AS Decimal(18, 4)), N'Não', CAST(-74.0160 AS Decimal(18, 4)), CAST(-74.0160 AS Decimal(18, 4)), 0, 0, 0, 0, 0, 0)
INSERT [dbo].[contabilidade] ([id_aplicacao], [num_gp], [subperiodo], [debito_contabil], [debito_real], [credito_contabil], [credito_real], [saldo_sb_contabil], [saldo_sb_real], [capital_subsidiario], [mvtc], [premio_real], [saldo_contabil_acumulado], [saldo_real_acumulado], [aguardandoPR], [recapitalizando_01], [recapitalizando_02], [recapitalizando_03], [recapitalizando_04], [subsidio]) VALUES (597, 15, 4, CAST(198.8032 AS Decimal(18, 4)), CAST(45.7888 AS Decimal(18, 4)), CAST(153.0144 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(-45.7888 AS Decimal(18, 4)), CAST(-45.7888 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(8.5010 AS Decimal(18, 4)), N'Não', CAST(-119.8048 AS Decimal(18, 4)), CAST(-119.8048 AS Decimal(18, 4)), 0, 0, 0, 0, 0, 0)
INSERT [dbo].[contabilidade] ([id_aplicacao], [num_gp], [subperiodo], [debito_contabil], [debito_real], [credito_contabil], [credito_real], [saldo_sb_contabil], [saldo_sb_real], [capital_subsidiario], [mvtc], [premio_real], [saldo_contabil_acumulado], [saldo_real_acumulado], [aguardandoPR], [recapitalizando_01], [recapitalizando_02], [recapitalizando_03], [recapitalizando_04], [subsidio]) VALUES (598, 22, 5, CAST(253.9610 AS Decimal(18, 4)), CAST(53.6686 AS Decimal(18, 4)), CAST(200.2925 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(-53.6685 AS Decimal(18, 4)), CAST(-53.6686 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(11.1270 AS Decimal(18, 4)), N'Não', CAST(-173.4733 AS Decimal(18, 4)), CAST(-173.4734 AS Decimal(18, 4)), 0, 0, 0, 0, 0, 0)
INSERT [dbo].[contabilidade] ([id_aplicacao], [num_gp], [subperiodo], [debito_contabil], [debito_real], [credito_contabil], [credito_real], [saldo_sb_contabil], [saldo_sb_real], [capital_subsidiario], [mvtc], [premio_real], [saldo_contabil_acumulado], [saldo_real_acumulado], [aguardandoPR], [recapitalizando_01], [recapitalizando_02], [recapitalizando_03], [recapitalizando_04], [subsidio]) VALUES (599, 20, 6, CAST(310.6947 AS Decimal(18, 4)), CAST(59.3418 AS Decimal(18, 4)), CAST(251.3528 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(-59.3418 AS Decimal(18, 4)), CAST(-59.3418 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(13.9640 AS Decimal(18, 4)), N'Não', CAST(-232.8148 AS Decimal(18, 4)), CAST(-232.8148 AS Decimal(18, 4)), 0, 0, 0, 0, 0, 0)
/****** Object:  Table [dbo].[series]    Script Date: 11/02/2011 02:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[series]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[series](
	[id_serie] [int] NOT NULL,
	[gr_01] [int] NOT NULL,
	[gr_02] [int] NOT NULL,
	[gr_03] [int] NOT NULL,
	[carencia] [int] NOT NULL,
	[qtde_premio] [int] NOT NULL,
	[mor_carencia] [int] NOT NULL,
	[pr_aplicacao] [int] NOT NULL,
	[status] [nvarchar](35) NOT NULL,
	[carencia_recap] [int] NOT NULL,
	[aux_carencia] [int] NOT NULL,
	[max_carencia] [int] NOT NULL,
 CONSTRAINT [PK_series] PRIMARY KEY CLUSTERED 
(
	[id_serie] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1, 1, 2, 3, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2, 1, 2, 4, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (3, 1, 2, 5, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (4, 1, 2, 6, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (5, 1, 2, 7, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (6, 1, 2, 8, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (7, 1, 2, 9, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (8, 1, 2, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (9, 1, 2, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (10, 1, 2, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (11, 1, 2, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (12, 1, 2, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (13, 1, 2, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (14, 1, 2, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (15, 1, 2, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (16, 1, 2, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (17, 1, 2, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (18, 1, 2, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (19, 1, 2, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (20, 1, 2, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (21, 1, 2, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (22, 1, 2, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (23, 1, 2, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (24, 1, 3, 4, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (25, 1, 3, 5, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (26, 1, 3, 6, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (27, 1, 3, 7, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (28, 1, 3, 8, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (29, 1, 3, 9, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (30, 1, 3, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (31, 1, 3, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (32, 1, 3, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (33, 1, 3, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (34, 1, 3, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (35, 1, 3, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (36, 1, 3, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (37, 1, 3, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (38, 1, 3, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (39, 1, 3, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (40, 1, 3, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (41, 1, 3, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (42, 1, 3, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (43, 1, 3, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (44, 1, 3, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (45, 1, 3, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (46, 1, 4, 5, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (47, 1, 4, 6, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (48, 1, 4, 7, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (49, 1, 4, 8, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (50, 1, 4, 9, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (51, 1, 4, 10, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (52, 1, 4, 11, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (53, 1, 4, 12, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (54, 1, 4, 13, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (55, 1, 4, 14, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (56, 1, 4, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (57, 1, 4, 16, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (58, 1, 4, 17, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (59, 1, 4, 18, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (60, 1, 4, 19, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (61, 1, 4, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (62, 1, 4, 21, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (63, 1, 4, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (64, 1, 4, 23, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (65, 1, 4, 24, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (66, 1, 4, 25, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (67, 1, 5, 6, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (68, 1, 5, 7, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (69, 1, 5, 8, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (70, 1, 5, 9, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (71, 1, 5, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (72, 1, 5, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (73, 1, 5, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (74, 1, 5, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (75, 1, 5, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (76, 1, 5, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (77, 1, 5, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (78, 1, 5, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (79, 1, 5, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (80, 1, 5, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (81, 1, 5, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (82, 1, 5, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (83, 1, 5, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (84, 1, 5, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (85, 1, 5, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (86, 1, 5, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (87, 1, 6, 7, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (88, 1, 6, 8, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (89, 1, 6, 9, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (90, 1, 6, 10, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (91, 1, 6, 11, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (92, 1, 6, 12, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (93, 1, 6, 13, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (94, 1, 6, 14, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (95, 1, 6, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (96, 1, 6, 16, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (97, 1, 6, 17, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (98, 1, 6, 18, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (99, 1, 6, 19, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (100, 1, 6, 20, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (101, 1, 6, 21, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (102, 1, 6, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (103, 1, 6, 23, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (104, 1, 6, 24, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (105, 1, 6, 25, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (106, 1, 7, 8, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (107, 1, 7, 9, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (108, 1, 7, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (109, 1, 7, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (110, 1, 7, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (111, 1, 7, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (112, 1, 7, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (113, 1, 7, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (114, 1, 7, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (115, 1, 7, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (116, 1, 7, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (117, 1, 7, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (118, 1, 7, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (119, 1, 7, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (120, 1, 7, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (121, 1, 7, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (122, 1, 7, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (123, 1, 7, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (124, 1, 8, 9, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (125, 1, 8, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (126, 1, 8, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (127, 1, 8, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (128, 1, 8, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (129, 1, 8, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (130, 1, 8, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (131, 1, 8, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (132, 1, 8, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (133, 1, 8, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (134, 1, 8, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (135, 1, 8, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (136, 1, 8, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (137, 1, 8, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (138, 1, 8, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (139, 1, 8, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (140, 1, 8, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (141, 1, 9, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (142, 1, 9, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (143, 1, 9, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (144, 1, 9, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (145, 1, 9, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (146, 1, 9, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (147, 1, 9, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (148, 1, 9, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (149, 1, 9, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (150, 1, 9, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (151, 1, 9, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (152, 1, 9, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (153, 1, 9, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (154, 1, 9, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (155, 1, 9, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (156, 1, 9, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (157, 1, 10, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (158, 1, 10, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (159, 1, 10, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (160, 1, 10, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (161, 1, 10, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (162, 1, 10, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (163, 1, 10, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (164, 1, 10, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (165, 1, 10, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (166, 1, 10, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (167, 1, 10, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (168, 1, 10, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (169, 1, 10, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (170, 1, 10, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (171, 1, 10, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (172, 1, 11, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (173, 1, 11, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (174, 1, 11, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (175, 1, 11, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (176, 1, 11, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (177, 1, 11, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (178, 1, 11, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (179, 1, 11, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (180, 1, 11, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (181, 1, 11, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (182, 1, 11, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (183, 1, 11, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (184, 1, 11, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (185, 1, 11, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (186, 1, 12, 13, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (187, 1, 12, 14, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (188, 1, 12, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (189, 1, 12, 16, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (190, 1, 12, 17, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (191, 1, 12, 18, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (192, 1, 12, 19, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (193, 1, 12, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (194, 1, 12, 21, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (195, 1, 12, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (196, 1, 12, 23, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (197, 1, 12, 24, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (198, 1, 12, 25, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (199, 1, 13, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (200, 1, 13, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (201, 1, 13, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (202, 1, 13, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 200 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (203, 1, 13, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (204, 1, 13, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (205, 1, 13, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (206, 1, 13, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (207, 1, 13, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (208, 1, 13, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (209, 1, 13, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (210, 1, 13, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (211, 1, 14, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (212, 1, 14, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (213, 1, 14, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (214, 1, 14, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (215, 1, 14, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (216, 1, 14, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (217, 1, 14, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (218, 1, 14, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (219, 1, 14, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (220, 1, 14, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (221, 1, 14, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (222, 1, 15, 16, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (223, 1, 15, 17, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (224, 1, 15, 18, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (225, 1, 15, 19, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (226, 1, 15, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (227, 1, 15, 21, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (228, 1, 15, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (229, 1, 15, 23, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (230, 1, 15, 24, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (231, 1, 15, 25, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (232, 1, 16, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (233, 1, 16, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (234, 1, 16, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (235, 1, 16, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (236, 1, 16, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (237, 1, 16, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (238, 1, 16, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (239, 1, 16, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (240, 1, 16, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (241, 1, 17, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (242, 1, 17, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (243, 1, 17, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (244, 1, 17, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (245, 1, 17, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (246, 1, 17, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (247, 1, 17, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (248, 1, 17, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (249, 1, 18, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (250, 1, 18, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (251, 1, 18, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (252, 1, 18, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (253, 1, 18, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (254, 1, 18, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (255, 1, 18, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (256, 1, 19, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (257, 1, 19, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (258, 1, 19, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (259, 1, 19, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (260, 1, 19, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (261, 1, 19, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (262, 1, 20, 21, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (263, 1, 20, 22, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (264, 1, 20, 23, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (265, 1, 20, 24, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (266, 1, 20, 25, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (267, 1, 21, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (268, 1, 21, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (269, 1, 21, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (270, 1, 21, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (271, 1, 22, 23, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (272, 1, 22, 24, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (273, 1, 22, 25, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (274, 1, 23, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (275, 1, 23, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (276, 1, 24, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (277, 2, 3, 4, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (278, 2, 3, 5, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (279, 2, 3, 6, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (280, 2, 3, 7, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (281, 2, 3, 8, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (282, 2, 3, 9, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (283, 2, 3, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (284, 2, 3, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (285, 2, 3, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (286, 2, 3, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (287, 2, 3, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (288, 2, 3, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (289, 2, 3, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (290, 2, 3, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (291, 2, 3, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (292, 2, 3, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (293, 2, 3, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (294, 2, 3, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (295, 2, 3, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (296, 2, 3, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (297, 2, 3, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (298, 2, 3, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (299, 2, 4, 5, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (300, 2, 4, 6, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (301, 2, 4, 7, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (302, 2, 4, 8, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (303, 2, 4, 9, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 300 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (304, 2, 4, 10, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (305, 2, 4, 11, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (306, 2, 4, 12, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (307, 2, 4, 13, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (308, 2, 4, 14, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (309, 2, 4, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (310, 2, 4, 16, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (311, 2, 4, 17, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (312, 2, 4, 18, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (313, 2, 4, 19, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (314, 2, 4, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (315, 2, 4, 21, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (316, 2, 4, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (317, 2, 4, 23, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (318, 2, 4, 24, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (319, 2, 4, 25, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (320, 2, 5, 6, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (321, 2, 5, 7, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (322, 2, 5, 8, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (323, 2, 5, 9, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (324, 2, 5, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (325, 2, 5, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (326, 2, 5, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (327, 2, 5, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (328, 2, 5, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (329, 2, 5, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (330, 2, 5, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (331, 2, 5, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (332, 2, 5, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (333, 2, 5, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (334, 2, 5, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (335, 2, 5, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (336, 2, 5, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (337, 2, 5, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (338, 2, 5, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (339, 2, 5, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (340, 2, 6, 7, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (341, 2, 6, 8, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (342, 2, 6, 9, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (343, 2, 6, 10, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (344, 2, 6, 11, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (345, 2, 6, 12, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (346, 2, 6, 13, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (347, 2, 6, 14, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (348, 2, 6, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (349, 2, 6, 16, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (350, 2, 6, 17, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (351, 2, 6, 18, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (352, 2, 6, 19, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (353, 2, 6, 20, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (354, 2, 6, 21, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (355, 2, 6, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (356, 2, 6, 23, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (357, 2, 6, 24, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (358, 2, 6, 25, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (359, 2, 7, 8, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (360, 2, 7, 9, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (361, 2, 7, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (362, 2, 7, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (363, 2, 7, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (364, 2, 7, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (365, 2, 7, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (366, 2, 7, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (367, 2, 7, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (368, 2, 7, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (369, 2, 7, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (370, 2, 7, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (371, 2, 7, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (372, 2, 7, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (373, 2, 7, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (374, 2, 7, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (375, 2, 7, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (376, 2, 7, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (377, 2, 8, 9, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (378, 2, 8, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (379, 2, 8, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (380, 2, 8, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (381, 2, 8, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (382, 2, 8, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (383, 2, 8, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (384, 2, 8, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (385, 2, 8, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (386, 2, 8, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (387, 2, 8, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (388, 2, 8, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (389, 2, 8, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (390, 2, 8, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (391, 2, 8, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (392, 2, 8, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (393, 2, 8, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (394, 2, 9, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (395, 2, 9, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (396, 2, 9, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (397, 2, 9, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (398, 2, 9, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (399, 2, 9, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (400, 2, 9, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (401, 2, 9, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (402, 2, 9, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (403, 2, 9, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (404, 2, 9, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 400 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (405, 2, 9, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (406, 2, 9, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (407, 2, 9, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (408, 2, 9, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (409, 2, 9, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (410, 2, 10, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (411, 2, 10, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (412, 2, 10, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (413, 2, 10, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (414, 2, 10, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (415, 2, 10, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (416, 2, 10, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (417, 2, 10, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (418, 2, 10, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (419, 2, 10, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (420, 2, 10, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (421, 2, 10, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (422, 2, 10, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (423, 2, 10, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (424, 2, 10, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (425, 2, 11, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (426, 2, 11, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (427, 2, 11, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (428, 2, 11, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (429, 2, 11, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (430, 2, 11, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (431, 2, 11, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (432, 2, 11, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (433, 2, 11, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (434, 2, 11, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (435, 2, 11, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (436, 2, 11, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (437, 2, 11, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (438, 2, 11, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (439, 2, 12, 13, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (440, 2, 12, 14, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (441, 2, 12, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (442, 2, 12, 16, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (443, 2, 12, 17, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (444, 2, 12, 18, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (445, 2, 12, 19, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (446, 2, 12, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (447, 2, 12, 21, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (448, 2, 12, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (449, 2, 12, 23, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (450, 2, 12, 24, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (451, 2, 12, 25, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (452, 2, 13, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (453, 2, 13, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (454, 2, 13, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (455, 2, 13, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (456, 2, 13, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (457, 2, 13, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (458, 2, 13, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (459, 2, 13, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (460, 2, 13, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (461, 2, 13, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (462, 2, 13, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (463, 2, 13, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (464, 2, 14, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (465, 2, 14, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (466, 2, 14, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (467, 2, 14, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (468, 2, 14, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (469, 2, 14, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (470, 2, 14, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (471, 2, 14, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (472, 2, 14, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (473, 2, 14, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (474, 2, 14, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (475, 2, 15, 16, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (476, 2, 15, 17, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (477, 2, 15, 18, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (478, 2, 15, 19, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (479, 2, 15, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (480, 2, 15, 21, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (481, 2, 15, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (482, 2, 15, 23, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (483, 2, 15, 24, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (484, 2, 15, 25, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (485, 2, 16, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (486, 2, 16, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (487, 2, 16, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (488, 2, 16, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (489, 2, 16, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (490, 2, 16, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (491, 2, 16, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (492, 2, 16, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (493, 2, 16, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (494, 2, 17, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (495, 2, 17, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (496, 2, 17, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (497, 2, 17, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (498, 2, 17, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (499, 2, 17, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (500, 2, 17, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (501, 2, 17, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (502, 2, 18, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (503, 2, 18, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (504, 2, 18, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (505, 2, 18, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 500 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (506, 2, 18, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (507, 2, 18, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (508, 2, 18, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (509, 2, 19, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (510, 2, 19, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (511, 2, 19, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (512, 2, 19, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (513, 2, 19, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (514, 2, 19, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (515, 2, 20, 21, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (516, 2, 20, 22, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (517, 2, 20, 23, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (518, 2, 20, 24, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (519, 2, 20, 25, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (520, 2, 21, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (521, 2, 21, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (522, 2, 21, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (523, 2, 21, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (524, 2, 22, 23, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (525, 2, 22, 24, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (526, 2, 22, 25, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (527, 2, 23, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (528, 2, 23, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (529, 2, 24, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (530, 3, 4, 5, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (531, 3, 4, 6, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (532, 3, 4, 7, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (533, 3, 4, 8, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (534, 3, 4, 9, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (535, 3, 4, 10, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (536, 3, 4, 11, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (537, 3, 4, 12, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (538, 3, 4, 13, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (539, 3, 4, 14, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (540, 3, 4, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (541, 3, 4, 16, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (542, 3, 4, 17, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (543, 3, 4, 18, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (544, 3, 4, 19, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (545, 3, 4, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (546, 3, 4, 21, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (547, 3, 4, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (548, 3, 4, 23, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (549, 3, 4, 24, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (550, 3, 4, 25, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (551, 3, 5, 6, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (552, 3, 5, 7, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (553, 3, 5, 8, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (554, 3, 5, 9, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (555, 3, 5, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (556, 3, 5, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (557, 3, 5, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (558, 3, 5, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (559, 3, 5, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (560, 3, 5, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (561, 3, 5, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (562, 3, 5, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (563, 3, 5, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (564, 3, 5, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (565, 3, 5, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (566, 3, 5, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (567, 3, 5, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (568, 3, 5, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (569, 3, 5, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (570, 3, 5, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (571, 3, 6, 7, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (572, 3, 6, 8, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (573, 3, 6, 9, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (574, 3, 6, 10, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (575, 3, 6, 11, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (576, 3, 6, 12, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (577, 3, 6, 13, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (578, 3, 6, 14, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (579, 3, 6, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (580, 3, 6, 16, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (581, 3, 6, 17, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (582, 3, 6, 18, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (583, 3, 6, 19, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (584, 3, 6, 20, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (585, 3, 6, 21, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (586, 3, 6, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (587, 3, 6, 23, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (588, 3, 6, 24, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (589, 3, 6, 25, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (590, 3, 7, 8, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (591, 3, 7, 9, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (592, 3, 7, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (593, 3, 7, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (594, 3, 7, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (595, 3, 7, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (596, 3, 7, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (597, 3, 7, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (598, 3, 7, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (599, 3, 7, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (600, 3, 7, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (601, 3, 7, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (602, 3, 7, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (603, 3, 7, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (604, 3, 7, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (605, 3, 7, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (606, 3, 7, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 600 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (607, 3, 7, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (608, 3, 8, 9, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (609, 3, 8, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (610, 3, 8, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (611, 3, 8, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (612, 3, 8, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (613, 3, 8, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (614, 3, 8, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (615, 3, 8, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (616, 3, 8, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (617, 3, 8, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (618, 3, 8, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (619, 3, 8, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (620, 3, 8, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (621, 3, 8, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (622, 3, 8, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (623, 3, 8, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (624, 3, 8, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (625, 3, 9, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (626, 3, 9, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (627, 3, 9, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (628, 3, 9, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (629, 3, 9, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (630, 3, 9, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (631, 3, 9, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (632, 3, 9, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (633, 3, 9, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (634, 3, 9, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (635, 3, 9, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (636, 3, 9, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (637, 3, 9, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (638, 3, 9, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (639, 3, 9, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (640, 3, 9, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (641, 3, 10, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (642, 3, 10, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (643, 3, 10, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (644, 3, 10, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (645, 3, 10, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (646, 3, 10, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (647, 3, 10, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (648, 3, 10, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (649, 3, 10, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (650, 3, 10, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (651, 3, 10, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (652, 3, 10, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (653, 3, 10, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (654, 3, 10, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (655, 3, 10, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (656, 3, 11, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (657, 3, 11, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (658, 3, 11, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (659, 3, 11, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (660, 3, 11, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (661, 3, 11, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (662, 3, 11, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (663, 3, 11, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (664, 3, 11, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (665, 3, 11, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (666, 3, 11, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (667, 3, 11, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (668, 3, 11, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (669, 3, 11, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (670, 3, 12, 13, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (671, 3, 12, 14, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (672, 3, 12, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (673, 3, 12, 16, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (674, 3, 12, 17, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (675, 3, 12, 18, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (676, 3, 12, 19, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (677, 3, 12, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (678, 3, 12, 21, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (679, 3, 12, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (680, 3, 12, 23, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (681, 3, 12, 24, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (682, 3, 12, 25, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (683, 3, 13, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (684, 3, 13, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (685, 3, 13, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (686, 3, 13, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (687, 3, 13, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (688, 3, 13, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (689, 3, 13, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (690, 3, 13, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (691, 3, 13, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (692, 3, 13, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (693, 3, 13, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (694, 3, 13, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (695, 3, 14, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (696, 3, 14, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (697, 3, 14, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (698, 3, 14, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (699, 3, 14, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (700, 3, 14, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (701, 3, 14, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (702, 3, 14, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (703, 3, 14, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (704, 3, 14, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (705, 3, 14, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (706, 3, 15, 16, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (707, 3, 15, 17, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 700 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (708, 3, 15, 18, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (709, 3, 15, 19, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (710, 3, 15, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (711, 3, 15, 21, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (712, 3, 15, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (713, 3, 15, 23, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (714, 3, 15, 24, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (715, 3, 15, 25, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (716, 3, 16, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (717, 3, 16, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (718, 3, 16, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (719, 3, 16, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (720, 3, 16, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (721, 3, 16, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (722, 3, 16, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (723, 3, 16, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (724, 3, 16, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (725, 3, 17, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (726, 3, 17, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (727, 3, 17, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (728, 3, 17, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (729, 3, 17, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (730, 3, 17, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (731, 3, 17, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (732, 3, 17, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (733, 3, 18, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (734, 3, 18, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (735, 3, 18, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (736, 3, 18, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (737, 3, 18, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (738, 3, 18, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (739, 3, 18, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (740, 3, 19, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (741, 3, 19, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (742, 3, 19, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (743, 3, 19, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (744, 3, 19, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (745, 3, 19, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (746, 3, 20, 21, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (747, 3, 20, 22, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (748, 3, 20, 23, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (749, 3, 20, 24, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (750, 3, 20, 25, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (751, 3, 21, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (752, 3, 21, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (753, 3, 21, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (754, 3, 21, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (755, 3, 22, 23, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (756, 3, 22, 24, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (757, 3, 22, 25, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (758, 3, 23, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (759, 3, 23, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (760, 3, 24, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (761, 4, 5, 6, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (762, 4, 5, 7, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (763, 4, 5, 8, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (764, 4, 5, 9, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (765, 4, 5, 10, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (766, 4, 5, 11, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (767, 4, 5, 12, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (768, 4, 5, 13, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (769, 4, 5, 14, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (770, 4, 5, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (771, 4, 5, 16, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (772, 4, 5, 17, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (773, 4, 5, 18, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (774, 4, 5, 19, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (775, 4, 5, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (776, 4, 5, 21, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (777, 4, 5, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (778, 4, 5, 23, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (779, 4, 5, 24, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (780, 4, 5, 25, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (781, 4, 6, 7, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (782, 4, 6, 8, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (783, 4, 6, 9, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (784, 4, 6, 10, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (785, 4, 6, 11, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (786, 4, 6, 12, 3, 3, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (787, 4, 6, 13, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (788, 4, 6, 14, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (789, 4, 6, 15, 2, 3, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (790, 4, 6, 16, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (791, 4, 6, 17, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (792, 4, 6, 18, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (793, 4, 6, 19, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (794, 4, 6, 20, 0, 3, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (795, 4, 6, 21, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (796, 4, 6, 22, 1, 3, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (797, 4, 6, 23, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (798, 4, 6, 24, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (799, 4, 6, 25, 4, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (800, 4, 7, 8, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (801, 4, 7, 9, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (802, 4, 7, 10, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (803, 4, 7, 11, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (804, 4, 7, 12, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (805, 4, 7, 13, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (806, 4, 7, 14, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (807, 4, 7, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (808, 4, 7, 16, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 800 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (809, 4, 7, 17, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (810, 4, 7, 18, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (811, 4, 7, 19, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (812, 4, 7, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (813, 4, 7, 21, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (814, 4, 7, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (815, 4, 7, 23, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (816, 4, 7, 24, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (817, 4, 7, 25, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (818, 4, 8, 9, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (819, 4, 8, 10, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (820, 4, 8, 11, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (821, 4, 8, 12, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (822, 4, 8, 13, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (823, 4, 8, 14, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (824, 4, 8, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (825, 4, 8, 16, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (826, 4, 8, 17, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (827, 4, 8, 18, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (828, 4, 8, 19, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (829, 4, 8, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (830, 4, 8, 21, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (831, 4, 8, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (832, 4, 8, 23, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (833, 4, 8, 24, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (834, 4, 8, 25, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (835, 4, 9, 10, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (836, 4, 9, 11, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (837, 4, 9, 12, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (838, 4, 9, 13, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (839, 4, 9, 14, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (840, 4, 9, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (841, 4, 9, 16, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (842, 4, 9, 17, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (843, 4, 9, 18, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (844, 4, 9, 19, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (845, 4, 9, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (846, 4, 9, 21, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (847, 4, 9, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (848, 4, 9, 23, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (849, 4, 9, 24, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (850, 4, 9, 25, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (851, 4, 10, 11, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (852, 4, 10, 12, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (853, 4, 10, 13, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (854, 4, 10, 14, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (855, 4, 10, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (856, 4, 10, 16, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (857, 4, 10, 17, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (858, 4, 10, 18, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (859, 4, 10, 19, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (860, 4, 10, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (861, 4, 10, 21, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (862, 4, 10, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (863, 4, 10, 23, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (864, 4, 10, 24, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (865, 4, 10, 25, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (866, 4, 11, 12, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (867, 4, 11, 13, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (868, 4, 11, 14, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (869, 4, 11, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (870, 4, 11, 16, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (871, 4, 11, 17, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (872, 4, 11, 18, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (873, 4, 11, 19, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (874, 4, 11, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (875, 4, 11, 21, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (876, 4, 11, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (877, 4, 11, 23, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (878, 4, 11, 24, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (879, 4, 11, 25, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (880, 4, 12, 13, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (881, 4, 12, 14, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (882, 4, 12, 15, 2, 3, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (883, 4, 12, 16, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (884, 4, 12, 17, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (885, 4, 12, 18, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (886, 4, 12, 19, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (887, 4, 12, 20, 0, 3, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (888, 4, 12, 21, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (889, 4, 12, 22, 1, 3, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (890, 4, 12, 23, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (891, 4, 12, 24, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (892, 4, 12, 25, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (893, 4, 13, 14, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (894, 4, 13, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (895, 4, 13, 16, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (896, 4, 13, 17, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (897, 4, 13, 18, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (898, 4, 13, 19, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (899, 4, 13, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (900, 4, 13, 21, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (901, 4, 13, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (902, 4, 13, 23, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (903, 4, 13, 24, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (904, 4, 13, 25, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (905, 4, 14, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (906, 4, 14, 16, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (907, 4, 14, 17, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (908, 4, 14, 18, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (909, 4, 14, 19, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 900 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (910, 4, 14, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (911, 4, 14, 21, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (912, 4, 14, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (913, 4, 14, 23, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (914, 4, 14, 24, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (915, 4, 14, 25, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (916, 4, 15, 16, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (917, 4, 15, 17, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (918, 4, 15, 18, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (919, 4, 15, 19, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (920, 4, 15, 20, 0, 3, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (921, 4, 15, 21, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (922, 4, 15, 22, 1, 3, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (923, 4, 15, 23, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (924, 4, 15, 24, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (925, 4, 15, 25, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (926, 4, 16, 17, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (927, 4, 16, 18, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (928, 4, 16, 19, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (929, 4, 16, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (930, 4, 16, 21, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (931, 4, 16, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (932, 4, 16, 23, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (933, 4, 16, 24, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (934, 4, 16, 25, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (935, 4, 17, 18, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (936, 4, 17, 19, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (937, 4, 17, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (938, 4, 17, 21, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (939, 4, 17, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (940, 4, 17, 23, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (941, 4, 17, 24, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (942, 4, 17, 25, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (943, 4, 18, 19, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (944, 4, 18, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (945, 4, 18, 21, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (946, 4, 18, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (947, 4, 18, 23, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (948, 4, 18, 24, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (949, 4, 18, 25, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (950, 4, 19, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (951, 4, 19, 21, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (952, 4, 19, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (953, 4, 19, 23, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (954, 4, 19, 24, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (955, 4, 19, 25, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (956, 4, 20, 21, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (957, 4, 20, 22, 0, 3, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (958, 4, 20, 23, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (959, 4, 20, 24, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (960, 4, 20, 25, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (961, 4, 21, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (962, 4, 21, 23, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (963, 4, 21, 24, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (964, 4, 21, 25, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (965, 4, 22, 23, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (966, 4, 22, 24, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (967, 4, 22, 25, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (968, 4, 23, 24, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (969, 4, 23, 25, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (970, 4, 24, 25, 4, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (971, 5, 6, 7, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (972, 5, 6, 8, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (973, 5, 6, 9, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (974, 5, 6, 10, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (975, 5, 6, 11, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (976, 5, 6, 12, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (977, 5, 6, 13, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (978, 5, 6, 14, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (979, 5, 6, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (980, 5, 6, 16, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (981, 5, 6, 17, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (982, 5, 6, 18, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (983, 5, 6, 19, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (984, 5, 6, 20, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (985, 5, 6, 21, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (986, 5, 6, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (987, 5, 6, 23, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (988, 5, 6, 24, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (989, 5, 6, 25, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (990, 5, 7, 8, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (991, 5, 7, 9, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (992, 5, 7, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (993, 5, 7, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (994, 5, 7, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (995, 5, 7, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (996, 5, 7, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (997, 5, 7, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (998, 5, 7, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (999, 5, 7, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1000, 5, 7, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1001, 5, 7, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1002, 5, 7, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1003, 5, 7, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1004, 5, 7, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1005, 5, 7, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1006, 5, 7, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1007, 5, 7, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1008, 5, 8, 9, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1009, 5, 8, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1010, 5, 8, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 1000 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1011, 5, 8, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1012, 5, 8, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1013, 5, 8, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1014, 5, 8, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1015, 5, 8, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1016, 5, 8, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1017, 5, 8, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1018, 5, 8, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1019, 5, 8, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1020, 5, 8, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1021, 5, 8, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1022, 5, 8, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1023, 5, 8, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1024, 5, 8, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1025, 5, 9, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1026, 5, 9, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1027, 5, 9, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1028, 5, 9, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1029, 5, 9, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1030, 5, 9, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1031, 5, 9, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1032, 5, 9, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1033, 5, 9, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1034, 5, 9, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1035, 5, 9, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1036, 5, 9, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1037, 5, 9, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1038, 5, 9, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1039, 5, 9, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1040, 5, 9, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1041, 5, 10, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1042, 5, 10, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1043, 5, 10, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1044, 5, 10, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1045, 5, 10, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1046, 5, 10, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1047, 5, 10, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1048, 5, 10, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1049, 5, 10, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1050, 5, 10, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1051, 5, 10, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1052, 5, 10, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1053, 5, 10, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1054, 5, 10, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1055, 5, 10, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1056, 5, 11, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1057, 5, 11, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1058, 5, 11, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1059, 5, 11, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1060, 5, 11, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1061, 5, 11, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1062, 5, 11, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1063, 5, 11, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1064, 5, 11, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1065, 5, 11, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1066, 5, 11, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1067, 5, 11, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1068, 5, 11, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1069, 5, 11, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1070, 5, 12, 13, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1071, 5, 12, 14, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1072, 5, 12, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1073, 5, 12, 16, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1074, 5, 12, 17, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1075, 5, 12, 18, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1076, 5, 12, 19, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1077, 5, 12, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1078, 5, 12, 21, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1079, 5, 12, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1080, 5, 12, 23, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1081, 5, 12, 24, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1082, 5, 12, 25, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1083, 5, 13, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1084, 5, 13, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1085, 5, 13, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1086, 5, 13, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1087, 5, 13, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1088, 5, 13, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1089, 5, 13, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1090, 5, 13, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1091, 5, 13, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1092, 5, 13, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1093, 5, 13, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1094, 5, 13, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1095, 5, 14, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1096, 5, 14, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1097, 5, 14, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1098, 5, 14, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1099, 5, 14, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1100, 5, 14, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1101, 5, 14, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1102, 5, 14, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1103, 5, 14, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1104, 5, 14, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1105, 5, 14, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1106, 5, 15, 16, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1107, 5, 15, 17, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1108, 5, 15, 18, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1109, 5, 15, 19, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1110, 5, 15, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1111, 5, 15, 21, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 1100 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1112, 5, 15, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1113, 5, 15, 23, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1114, 5, 15, 24, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1115, 5, 15, 25, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1116, 5, 16, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1117, 5, 16, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1118, 5, 16, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1119, 5, 16, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1120, 5, 16, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1121, 5, 16, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1122, 5, 16, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1123, 5, 16, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1124, 5, 16, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1125, 5, 17, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1126, 5, 17, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1127, 5, 17, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1128, 5, 17, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1129, 5, 17, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1130, 5, 17, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1131, 5, 17, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1132, 5, 17, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1133, 5, 18, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1134, 5, 18, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1135, 5, 18, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1136, 5, 18, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1137, 5, 18, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1138, 5, 18, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1139, 5, 18, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1140, 5, 19, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1141, 5, 19, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1142, 5, 19, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1143, 5, 19, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1144, 5, 19, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1145, 5, 19, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1146, 5, 20, 21, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1147, 5, 20, 22, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1148, 5, 20, 23, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1149, 5, 20, 24, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1150, 5, 20, 25, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1151, 5, 21, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1152, 5, 21, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1153, 5, 21, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1154, 5, 21, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1155, 5, 22, 23, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1156, 5, 22, 24, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1157, 5, 22, 25, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1158, 5, 23, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1159, 5, 23, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1160, 5, 24, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1161, 6, 7, 8, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1162, 6, 7, 9, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1163, 6, 7, 10, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1164, 6, 7, 11, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1165, 6, 7, 12, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1166, 6, 7, 13, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1167, 6, 7, 14, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1168, 6, 7, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1169, 6, 7, 16, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1170, 6, 7, 17, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1171, 6, 7, 18, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1172, 6, 7, 19, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1173, 6, 7, 20, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1174, 6, 7, 21, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1175, 6, 7, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1176, 6, 7, 23, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1177, 6, 7, 24, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1178, 6, 7, 25, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1179, 6, 8, 9, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1180, 6, 8, 10, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1181, 6, 8, 11, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1182, 6, 8, 12, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1183, 6, 8, 13, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1184, 6, 8, 14, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1185, 6, 8, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1186, 6, 8, 16, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1187, 6, 8, 17, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1188, 6, 8, 18, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1189, 6, 8, 19, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1190, 6, 8, 20, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1191, 6, 8, 21, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1192, 6, 8, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1193, 6, 8, 23, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1194, 6, 8, 24, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1195, 6, 8, 25, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1196, 6, 9, 10, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1197, 6, 9, 11, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1198, 6, 9, 12, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1199, 6, 9, 13, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1200, 6, 9, 14, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1201, 6, 9, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1202, 6, 9, 16, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1203, 6, 9, 17, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1204, 6, 9, 18, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1205, 6, 9, 19, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1206, 6, 9, 20, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1207, 6, 9, 21, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1208, 6, 9, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1209, 6, 9, 23, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1210, 6, 9, 24, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1211, 6, 9, 25, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1212, 6, 10, 11, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 1200 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1213, 6, 10, 12, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1214, 6, 10, 13, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1215, 6, 10, 14, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1216, 6, 10, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1217, 6, 10, 16, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1218, 6, 10, 17, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1219, 6, 10, 18, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1220, 6, 10, 19, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1221, 6, 10, 20, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1222, 6, 10, 21, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1223, 6, 10, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1224, 6, 10, 23, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1225, 6, 10, 24, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1226, 6, 10, 25, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1227, 6, 11, 12, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1228, 6, 11, 13, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1229, 6, 11, 14, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1230, 6, 11, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1231, 6, 11, 16, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1232, 6, 11, 17, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1233, 6, 11, 18, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1234, 6, 11, 19, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1235, 6, 11, 20, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1236, 6, 11, 21, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1237, 6, 11, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1238, 6, 11, 23, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1239, 6, 11, 24, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1240, 6, 11, 25, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1241, 6, 12, 13, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1242, 6, 12, 14, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1243, 6, 12, 15, 2, 3, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1244, 6, 12, 16, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1245, 6, 12, 17, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1246, 6, 12, 18, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1247, 6, 12, 19, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1248, 6, 12, 20, 0, 3, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1249, 6, 12, 21, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1250, 6, 12, 22, 1, 3, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1251, 6, 12, 23, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1252, 6, 12, 24, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1253, 6, 12, 25, 3, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1254, 6, 13, 14, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1255, 6, 13, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1256, 6, 13, 16, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1257, 6, 13, 17, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1258, 6, 13, 18, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1259, 6, 13, 19, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1260, 6, 13, 20, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1261, 6, 13, 21, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1262, 6, 13, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1263, 6, 13, 23, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1264, 6, 13, 24, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1265, 6, 13, 25, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1266, 6, 14, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1267, 6, 14, 16, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1268, 6, 14, 17, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1269, 6, 14, 18, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1270, 6, 14, 19, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1271, 6, 14, 20, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1272, 6, 14, 21, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1273, 6, 14, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1274, 6, 14, 23, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1275, 6, 14, 24, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1276, 6, 14, 25, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1277, 6, 15, 16, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1278, 6, 15, 17, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1279, 6, 15, 18, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1280, 6, 15, 19, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1281, 6, 15, 20, 0, 3, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1282, 6, 15, 21, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1283, 6, 15, 22, 1, 3, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1284, 6, 15, 23, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1285, 6, 15, 24, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1286, 6, 15, 25, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1287, 6, 16, 17, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1288, 6, 16, 18, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1289, 6, 16, 19, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1290, 6, 16, 20, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1291, 6, 16, 21, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1292, 6, 16, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1293, 6, 16, 23, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1294, 6, 16, 24, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1295, 6, 16, 25, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1296, 6, 17, 18, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1297, 6, 17, 19, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1298, 6, 17, 20, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1299, 6, 17, 21, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1300, 6, 17, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1301, 6, 17, 23, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1302, 6, 17, 24, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1303, 6, 17, 25, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1304, 6, 18, 19, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1305, 6, 18, 20, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1306, 6, 18, 21, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1307, 6, 18, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1308, 6, 18, 23, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1309, 6, 18, 24, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1310, 6, 18, 25, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1311, 6, 19, 20, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1312, 6, 19, 21, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1313, 6, 19, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 1300 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1314, 6, 19, 23, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1315, 6, 19, 24, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1316, 6, 19, 25, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1317, 6, 20, 21, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1318, 6, 20, 22, 0, 3, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1319, 6, 20, 23, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1320, 6, 20, 24, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1321, 6, 20, 25, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1322, 6, 21, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1323, 6, 21, 23, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1324, 6, 21, 24, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1325, 6, 21, 25, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1326, 6, 22, 23, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1327, 6, 22, 24, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1328, 6, 22, 25, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1329, 6, 23, 24, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1330, 6, 23, 25, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1331, 6, 24, 25, 5, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1332, 7, 8, 9, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1333, 7, 8, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1334, 7, 8, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1335, 7, 8, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1336, 7, 8, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1337, 7, 8, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1338, 7, 8, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1339, 7, 8, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1340, 7, 8, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1341, 7, 8, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1342, 7, 8, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1343, 7, 8, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1344, 7, 8, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1345, 7, 8, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1346, 7, 8, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1347, 7, 8, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1348, 7, 8, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1349, 7, 9, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1350, 7, 9, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1351, 7, 9, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1352, 7, 9, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1353, 7, 9, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1354, 7, 9, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1355, 7, 9, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1356, 7, 9, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1357, 7, 9, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1358, 7, 9, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1359, 7, 9, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1360, 7, 9, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1361, 7, 9, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1362, 7, 9, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1363, 7, 9, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1364, 7, 9, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1365, 7, 10, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1366, 7, 10, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1367, 7, 10, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1368, 7, 10, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1369, 7, 10, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1370, 7, 10, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1371, 7, 10, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1372, 7, 10, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1373, 7, 10, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1374, 7, 10, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1375, 7, 10, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1376, 7, 10, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1377, 7, 10, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1378, 7, 10, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1379, 7, 10, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1380, 7, 11, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1381, 7, 11, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1382, 7, 11, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1383, 7, 11, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1384, 7, 11, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1385, 7, 11, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1386, 7, 11, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1387, 7, 11, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1388, 7, 11, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1389, 7, 11, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1390, 7, 11, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1391, 7, 11, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1392, 7, 11, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1393, 7, 11, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1394, 7, 12, 13, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1395, 7, 12, 14, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1396, 7, 12, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1397, 7, 12, 16, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1398, 7, 12, 17, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1399, 7, 12, 18, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1400, 7, 12, 19, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1401, 7, 12, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1402, 7, 12, 21, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1403, 7, 12, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1404, 7, 12, 23, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1405, 7, 12, 24, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1406, 7, 12, 25, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1407, 7, 13, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1408, 7, 13, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1409, 7, 13, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1410, 7, 13, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1411, 7, 13, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1412, 7, 13, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1413, 7, 13, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1414, 7, 13, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 1400 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1415, 7, 13, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1416, 7, 13, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1417, 7, 13, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1418, 7, 13, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1419, 7, 14, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1420, 7, 14, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1421, 7, 14, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1422, 7, 14, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1423, 7, 14, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1424, 7, 14, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1425, 7, 14, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1426, 7, 14, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1427, 7, 14, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1428, 7, 14, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1429, 7, 14, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1430, 7, 15, 16, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1431, 7, 15, 17, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1432, 7, 15, 18, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1433, 7, 15, 19, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1434, 7, 15, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1435, 7, 15, 21, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1436, 7, 15, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1437, 7, 15, 23, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1438, 7, 15, 24, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1439, 7, 15, 25, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1440, 7, 16, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1441, 7, 16, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1442, 7, 16, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1443, 7, 16, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1444, 7, 16, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1445, 7, 16, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1446, 7, 16, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1447, 7, 16, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1448, 7, 16, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1449, 7, 17, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1450, 7, 17, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1451, 7, 17, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1452, 7, 17, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1453, 7, 17, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1454, 7, 17, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1455, 7, 17, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1456, 7, 17, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1457, 7, 18, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1458, 7, 18, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1459, 7, 18, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1460, 7, 18, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1461, 7, 18, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1462, 7, 18, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1463, 7, 18, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1464, 7, 19, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1465, 7, 19, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1466, 7, 19, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1467, 7, 19, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1468, 7, 19, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1469, 7, 19, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1470, 7, 20, 21, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1471, 7, 20, 22, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1472, 7, 20, 23, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1473, 7, 20, 24, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1474, 7, 20, 25, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1475, 7, 21, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1476, 7, 21, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1477, 7, 21, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1478, 7, 21, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1479, 7, 22, 23, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1480, 7, 22, 24, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1481, 7, 22, 25, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1482, 7, 23, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1483, 7, 23, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1484, 7, 24, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1485, 8, 9, 10, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1486, 8, 9, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1487, 8, 9, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1488, 8, 9, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1489, 8, 9, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1490, 8, 9, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1491, 8, 9, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1492, 8, 9, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1493, 8, 9, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1494, 8, 9, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1495, 8, 9, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1496, 8, 9, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1497, 8, 9, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1498, 8, 9, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1499, 8, 9, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1500, 8, 9, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1501, 8, 10, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1502, 8, 10, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1503, 8, 10, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1504, 8, 10, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1505, 8, 10, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1506, 8, 10, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1507, 8, 10, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1508, 8, 10, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1509, 8, 10, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1510, 8, 10, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1511, 8, 10, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1512, 8, 10, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1513, 8, 10, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1514, 8, 10, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1515, 8, 10, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 1500 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1516, 8, 11, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1517, 8, 11, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1518, 8, 11, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1519, 8, 11, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1520, 8, 11, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1521, 8, 11, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1522, 8, 11, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1523, 8, 11, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1524, 8, 11, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1525, 8, 11, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1526, 8, 11, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1527, 8, 11, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1528, 8, 11, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1529, 8, 11, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1530, 8, 12, 13, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1531, 8, 12, 14, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1532, 8, 12, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1533, 8, 12, 16, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1534, 8, 12, 17, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1535, 8, 12, 18, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1536, 8, 12, 19, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1537, 8, 12, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1538, 8, 12, 21, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1539, 8, 12, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1540, 8, 12, 23, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1541, 8, 12, 24, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1542, 8, 12, 25, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1543, 8, 13, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1544, 8, 13, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1545, 8, 13, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1546, 8, 13, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1547, 8, 13, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1548, 8, 13, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1549, 8, 13, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1550, 8, 13, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1551, 8, 13, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1552, 8, 13, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1553, 8, 13, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1554, 8, 13, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1555, 8, 14, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1556, 8, 14, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1557, 8, 14, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1558, 8, 14, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1559, 8, 14, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1560, 8, 14, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1561, 8, 14, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1562, 8, 14, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1563, 8, 14, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1564, 8, 14, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1565, 8, 14, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1566, 8, 15, 16, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1567, 8, 15, 17, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1568, 8, 15, 18, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1569, 8, 15, 19, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1570, 8, 15, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1571, 8, 15, 21, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1572, 8, 15, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1573, 8, 15, 23, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1574, 8, 15, 24, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1575, 8, 15, 25, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1576, 8, 16, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1577, 8, 16, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1578, 8, 16, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1579, 8, 16, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1580, 8, 16, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1581, 8, 16, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1582, 8, 16, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1583, 8, 16, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1584, 8, 16, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1585, 8, 17, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1586, 8, 17, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1587, 8, 17, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1588, 8, 17, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1589, 8, 17, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1590, 8, 17, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1591, 8, 17, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1592, 8, 17, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1593, 8, 18, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1594, 8, 18, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1595, 8, 18, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1596, 8, 18, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1597, 8, 18, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1598, 8, 18, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1599, 8, 18, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1600, 8, 19, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1601, 8, 19, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1602, 8, 19, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1603, 8, 19, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1604, 8, 19, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1605, 8, 19, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1606, 8, 20, 21, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1607, 8, 20, 22, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1608, 8, 20, 23, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1609, 8, 20, 24, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1610, 8, 20, 25, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1611, 8, 21, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1612, 8, 21, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1613, 8, 21, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1614, 8, 21, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1615, 8, 22, 23, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1616, 8, 22, 24, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 1600 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1617, 8, 22, 25, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1618, 8, 23, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1619, 8, 23, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1620, 8, 24, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1621, 9, 10, 11, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1622, 9, 10, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1623, 9, 10, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1624, 9, 10, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1625, 9, 10, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1626, 9, 10, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1627, 9, 10, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1628, 9, 10, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1629, 9, 10, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1630, 9, 10, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1631, 9, 10, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1632, 9, 10, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1633, 9, 10, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1634, 9, 10, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1635, 9, 10, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1636, 9, 11, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1637, 9, 11, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1638, 9, 11, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1639, 9, 11, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1640, 9, 11, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1641, 9, 11, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1642, 9, 11, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1643, 9, 11, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1644, 9, 11, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1645, 9, 11, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1646, 9, 11, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1647, 9, 11, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1648, 9, 11, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1649, 9, 11, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1650, 9, 12, 13, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1651, 9, 12, 14, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1652, 9, 12, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1653, 9, 12, 16, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1654, 9, 12, 17, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1655, 9, 12, 18, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1656, 9, 12, 19, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1657, 9, 12, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1658, 9, 12, 21, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1659, 9, 12, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1660, 9, 12, 23, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1661, 9, 12, 24, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1662, 9, 12, 25, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1663, 9, 13, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1664, 9, 13, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1665, 9, 13, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1666, 9, 13, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1667, 9, 13, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1668, 9, 13, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1669, 9, 13, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1670, 9, 13, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1671, 9, 13, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1672, 9, 13, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1673, 9, 13, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1674, 9, 13, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1675, 9, 14, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1676, 9, 14, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1677, 9, 14, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1678, 9, 14, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1679, 9, 14, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1680, 9, 14, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1681, 9, 14, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1682, 9, 14, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1683, 9, 14, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1684, 9, 14, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1685, 9, 14, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1686, 9, 15, 16, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1687, 9, 15, 17, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1688, 9, 15, 18, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1689, 9, 15, 19, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1690, 9, 15, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1691, 9, 15, 21, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1692, 9, 15, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1693, 9, 15, 23, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1694, 9, 15, 24, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1695, 9, 15, 25, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1696, 9, 16, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1697, 9, 16, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1698, 9, 16, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1699, 9, 16, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1700, 9, 16, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1701, 9, 16, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1702, 9, 16, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1703, 9, 16, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1704, 9, 16, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1705, 9, 17, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1706, 9, 17, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1707, 9, 17, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1708, 9, 17, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1709, 9, 17, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1710, 9, 17, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1711, 9, 17, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1712, 9, 17, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1713, 9, 18, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1714, 9, 18, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1715, 9, 18, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1716, 9, 18, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1717, 9, 18, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 1700 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1718, 9, 18, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1719, 9, 18, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1720, 9, 19, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1721, 9, 19, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1722, 9, 19, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1723, 9, 19, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1724, 9, 19, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1725, 9, 19, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1726, 9, 20, 21, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1727, 9, 20, 22, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1728, 9, 20, 23, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1729, 9, 20, 24, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1730, 9, 20, 25, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1731, 9, 21, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1732, 9, 21, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1733, 9, 21, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1734, 9, 21, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1735, 9, 22, 23, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1736, 9, 22, 24, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1737, 9, 22, 25, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1738, 9, 23, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1739, 9, 23, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1740, 9, 24, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1741, 10, 11, 12, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1742, 10, 11, 13, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1743, 10, 11, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1744, 10, 11, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1745, 10, 11, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1746, 10, 11, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1747, 10, 11, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1748, 10, 11, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1749, 10, 11, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1750, 10, 11, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1751, 10, 11, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1752, 10, 11, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1753, 10, 11, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1754, 10, 11, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1755, 10, 12, 13, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1756, 10, 12, 14, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1757, 10, 12, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1758, 10, 12, 16, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1759, 10, 12, 17, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1760, 10, 12, 18, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1761, 10, 12, 19, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1762, 10, 12, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1763, 10, 12, 21, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1764, 10, 12, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1765, 10, 12, 23, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1766, 10, 12, 24, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1767, 10, 12, 25, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1768, 10, 13, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1769, 10, 13, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1770, 10, 13, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1771, 10, 13, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1772, 10, 13, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1773, 10, 13, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1774, 10, 13, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1775, 10, 13, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1776, 10, 13, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1777, 10, 13, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1778, 10, 13, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1779, 10, 13, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1780, 10, 14, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1781, 10, 14, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1782, 10, 14, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1783, 10, 14, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1784, 10, 14, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1785, 10, 14, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1786, 10, 14, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1787, 10, 14, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1788, 10, 14, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1789, 10, 14, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1790, 10, 14, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1791, 10, 15, 16, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1792, 10, 15, 17, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1793, 10, 15, 18, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1794, 10, 15, 19, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1795, 10, 15, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1796, 10, 15, 21, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1797, 10, 15, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1798, 10, 15, 23, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1799, 10, 15, 24, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1800, 10, 15, 25, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1801, 10, 16, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1802, 10, 16, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1803, 10, 16, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1804, 10, 16, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1805, 10, 16, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1806, 10, 16, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1807, 10, 16, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1808, 10, 16, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1809, 10, 16, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1810, 10, 17, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1811, 10, 17, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1812, 10, 17, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1813, 10, 17, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1814, 10, 17, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1815, 10, 17, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1816, 10, 17, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1817, 10, 17, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1818, 10, 18, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 1800 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1819, 10, 18, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1820, 10, 18, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1821, 10, 18, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1822, 10, 18, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1823, 10, 18, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1824, 10, 18, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1825, 10, 19, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1826, 10, 19, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1827, 10, 19, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1828, 10, 19, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1829, 10, 19, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1830, 10, 19, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1831, 10, 20, 21, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1832, 10, 20, 22, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1833, 10, 20, 23, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1834, 10, 20, 24, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1835, 10, 20, 25, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1836, 10, 21, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1837, 10, 21, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1838, 10, 21, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1839, 10, 21, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1840, 10, 22, 23, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1841, 10, 22, 24, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1842, 10, 22, 25, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1843, 10, 23, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1844, 10, 23, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1845, 10, 24, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1846, 11, 12, 13, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1847, 11, 12, 14, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1848, 11, 12, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1849, 11, 12, 16, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1850, 11, 12, 17, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1851, 11, 12, 18, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1852, 11, 12, 19, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1853, 11, 12, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1854, 11, 12, 21, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1855, 11, 12, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1856, 11, 12, 23, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1857, 11, 12, 24, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1858, 11, 12, 25, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1859, 11, 13, 14, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1860, 11, 13, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1861, 11, 13, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1862, 11, 13, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1863, 11, 13, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1864, 11, 13, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1865, 11, 13, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1866, 11, 13, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1867, 11, 13, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1868, 11, 13, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1869, 11, 13, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1870, 11, 13, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1871, 11, 14, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1872, 11, 14, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1873, 11, 14, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1874, 11, 14, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1875, 11, 14, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1876, 11, 14, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1877, 11, 14, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1878, 11, 14, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1879, 11, 14, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1880, 11, 14, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1881, 11, 14, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1882, 11, 15, 16, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1883, 11, 15, 17, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1884, 11, 15, 18, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1885, 11, 15, 19, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1886, 11, 15, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1887, 11, 15, 21, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1888, 11, 15, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1889, 11, 15, 23, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1890, 11, 15, 24, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1891, 11, 15, 25, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1892, 11, 16, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1893, 11, 16, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1894, 11, 16, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1895, 11, 16, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1896, 11, 16, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1897, 11, 16, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1898, 11, 16, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1899, 11, 16, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1900, 11, 16, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1901, 11, 17, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1902, 11, 17, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1903, 11, 17, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1904, 11, 17, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1905, 11, 17, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1906, 11, 17, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1907, 11, 17, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1908, 11, 17, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1909, 11, 18, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1910, 11, 18, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1911, 11, 18, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1912, 11, 18, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1913, 11, 18, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1914, 11, 18, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1915, 11, 18, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1916, 11, 19, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1917, 11, 19, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1918, 11, 19, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1919, 11, 19, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 1900 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1920, 11, 19, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1921, 11, 19, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1922, 11, 20, 21, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1923, 11, 20, 22, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1924, 11, 20, 23, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1925, 11, 20, 24, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1926, 11, 20, 25, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1927, 11, 21, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1928, 11, 21, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1929, 11, 21, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1930, 11, 21, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1931, 11, 22, 23, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1932, 11, 22, 24, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1933, 11, 22, 25, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1934, 11, 23, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1935, 11, 23, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1936, 11, 24, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1937, 12, 13, 14, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1938, 12, 13, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1939, 12, 13, 16, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1940, 12, 13, 17, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1941, 12, 13, 18, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1942, 12, 13, 19, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1943, 12, 13, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1944, 12, 13, 21, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1945, 12, 13, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1946, 12, 13, 23, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1947, 12, 13, 24, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1948, 12, 13, 25, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1949, 12, 14, 15, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1950, 12, 14, 16, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1951, 12, 14, 17, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1952, 12, 14, 18, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1953, 12, 14, 19, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1954, 12, 14, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1955, 12, 14, 21, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1956, 12, 14, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1957, 12, 14, 23, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1958, 12, 14, 24, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1959, 12, 14, 25, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1960, 12, 15, 16, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1961, 12, 15, 17, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1962, 12, 15, 18, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1963, 12, 15, 19, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1964, 12, 15, 20, 0, 3, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1965, 12, 15, 21, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1966, 12, 15, 22, 1, 3, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1967, 12, 15, 23, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1968, 12, 15, 24, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1969, 12, 15, 25, 2, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1970, 12, 16, 17, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1971, 12, 16, 18, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1972, 12, 16, 19, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1973, 12, 16, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1974, 12, 16, 21, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1975, 12, 16, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1976, 12, 16, 23, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1977, 12, 16, 24, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1978, 12, 16, 25, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1979, 12, 17, 18, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1980, 12, 17, 19, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1981, 12, 17, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1982, 12, 17, 21, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1983, 12, 17, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1984, 12, 17, 23, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1985, 12, 17, 24, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1986, 12, 17, 25, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1987, 12, 18, 19, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1988, 12, 18, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1989, 12, 18, 21, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1990, 12, 18, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1991, 12, 18, 23, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1992, 12, 18, 24, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1993, 12, 18, 25, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1994, 12, 19, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1995, 12, 19, 21, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1996, 12, 19, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1997, 12, 19, 23, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1998, 12, 19, 24, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1999, 12, 19, 25, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2000, 12, 20, 21, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2001, 12, 20, 22, 0, 3, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2002, 12, 20, 23, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2003, 12, 20, 24, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2004, 12, 20, 25, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2005, 12, 21, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2006, 12, 21, 23, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2007, 12, 21, 24, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2008, 12, 21, 25, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2009, 12, 22, 23, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2010, 12, 22, 24, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2011, 12, 22, 25, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2012, 12, 23, 24, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2013, 12, 23, 25, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2014, 12, 24, 25, 3, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2015, 13, 14, 15, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2016, 13, 14, 16, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2017, 13, 14, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2018, 13, 14, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2019, 13, 14, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2020, 13, 14, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 2000 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2021, 13, 14, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2022, 13, 14, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2023, 13, 14, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2024, 13, 14, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2025, 13, 14, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2026, 13, 15, 16, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2027, 13, 15, 17, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2028, 13, 15, 18, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2029, 13, 15, 19, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2030, 13, 15, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2031, 13, 15, 21, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2032, 13, 15, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2033, 13, 15, 23, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2034, 13, 15, 24, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2035, 13, 15, 25, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2036, 13, 16, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2037, 13, 16, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2038, 13, 16, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2039, 13, 16, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2040, 13, 16, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2041, 13, 16, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2042, 13, 16, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2043, 13, 16, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2044, 13, 16, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2045, 13, 17, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2046, 13, 17, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2047, 13, 17, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2048, 13, 17, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2049, 13, 17, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2050, 13, 17, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2051, 13, 17, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2052, 13, 17, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2053, 13, 18, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2054, 13, 18, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2055, 13, 18, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2056, 13, 18, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2057, 13, 18, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2058, 13, 18, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2059, 13, 18, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2060, 13, 19, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2061, 13, 19, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2062, 13, 19, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2063, 13, 19, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2064, 13, 19, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2065, 13, 19, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2066, 13, 20, 21, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2067, 13, 20, 22, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2068, 13, 20, 23, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2069, 13, 20, 24, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2070, 13, 20, 25, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2071, 13, 21, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2072, 13, 21, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2073, 13, 21, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2074, 13, 21, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2075, 13, 22, 23, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2076, 13, 22, 24, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2077, 13, 22, 25, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2078, 13, 23, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2079, 13, 23, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2080, 13, 24, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2081, 14, 15, 16, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2082, 14, 15, 17, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2083, 14, 15, 18, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2084, 14, 15, 19, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2085, 14, 15, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2086, 14, 15, 21, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2087, 14, 15, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2088, 14, 15, 23, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2089, 14, 15, 24, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2090, 14, 15, 25, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2091, 14, 16, 17, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2092, 14, 16, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2093, 14, 16, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2094, 14, 16, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2095, 14, 16, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2096, 14, 16, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2097, 14, 16, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2098, 14, 16, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2099, 14, 16, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2100, 14, 17, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2101, 14, 17, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2102, 14, 17, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2103, 14, 17, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2104, 14, 17, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2105, 14, 17, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2106, 14, 17, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2107, 14, 17, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2108, 14, 18, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2109, 14, 18, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2110, 14, 18, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2111, 14, 18, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2112, 14, 18, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2113, 14, 18, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2114, 14, 18, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2115, 14, 19, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2116, 14, 19, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2117, 14, 19, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2118, 14, 19, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2119, 14, 19, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2120, 14, 19, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2121, 14, 20, 21, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 2100 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2122, 14, 20, 22, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2123, 14, 20, 23, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2124, 14, 20, 24, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2125, 14, 20, 25, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2126, 14, 21, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2127, 14, 21, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2128, 14, 21, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2129, 14, 21, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2130, 14, 22, 23, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2131, 14, 22, 24, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2132, 14, 22, 25, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2133, 14, 23, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2134, 14, 23, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2135, 14, 24, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2136, 15, 16, 17, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2137, 15, 16, 18, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2138, 15, 16, 19, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2139, 15, 16, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2140, 15, 16, 21, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2141, 15, 16, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2142, 15, 16, 23, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2143, 15, 16, 24, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2144, 15, 16, 25, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2145, 15, 17, 18, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2146, 15, 17, 19, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2147, 15, 17, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2148, 15, 17, 21, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2149, 15, 17, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2150, 15, 17, 23, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2151, 15, 17, 24, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2152, 15, 17, 25, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2153, 15, 18, 19, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2154, 15, 18, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2155, 15, 18, 21, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2156, 15, 18, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2157, 15, 18, 23, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2158, 15, 18, 24, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2159, 15, 18, 25, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2160, 15, 19, 20, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2161, 15, 19, 21, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2162, 15, 19, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2163, 15, 19, 23, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2164, 15, 19, 24, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2165, 15, 19, 25, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2166, 15, 20, 21, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2167, 15, 20, 22, 0, 3, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2168, 15, 20, 23, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2169, 15, 20, 24, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2170, 15, 20, 25, 0, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2171, 15, 21, 22, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2172, 15, 21, 23, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2173, 15, 21, 24, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2174, 15, 21, 25, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2175, 15, 22, 23, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2176, 15, 22, 24, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2177, 15, 22, 25, 1, 2, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2178, 15, 23, 24, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2179, 15, 23, 25, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2180, 15, 24, 25, 2, 1, 2, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2181, 16, 17, 18, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2182, 16, 17, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2183, 16, 17, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2184, 16, 17, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2185, 16, 17, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2186, 16, 17, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2187, 16, 17, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2188, 16, 17, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2189, 16, 18, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2190, 16, 18, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2191, 16, 18, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2192, 16, 18, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2193, 16, 18, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2194, 16, 18, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2195, 16, 18, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2196, 16, 19, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2197, 16, 19, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2198, 16, 19, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2199, 16, 19, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2200, 16, 19, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2201, 16, 19, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2202, 16, 20, 21, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2203, 16, 20, 22, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2204, 16, 20, 23, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2205, 16, 20, 24, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2206, 16, 20, 25, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2207, 16, 21, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2208, 16, 21, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2209, 16, 21, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2210, 16, 21, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2211, 16, 22, 23, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2212, 16, 22, 24, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2213, 16, 22, 25, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2214, 16, 23, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2215, 16, 23, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2216, 16, 24, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2217, 17, 18, 19, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2218, 17, 18, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2219, 17, 18, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2220, 17, 18, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2221, 17, 18, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2222, 17, 18, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 2200 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2223, 17, 18, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2224, 17, 19, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2225, 17, 19, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2226, 17, 19, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2227, 17, 19, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2228, 17, 19, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2229, 17, 19, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2230, 17, 20, 21, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2231, 17, 20, 22, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2232, 17, 20, 23, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2233, 17, 20, 24, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2234, 17, 20, 25, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2235, 17, 21, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2236, 17, 21, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2237, 17, 21, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2238, 17, 21, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2239, 17, 22, 23, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2240, 17, 22, 24, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2241, 17, 22, 25, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2242, 17, 23, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2243, 17, 23, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2244, 17, 24, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2245, 18, 19, 20, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2246, 18, 19, 21, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2247, 18, 19, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2248, 18, 19, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2249, 18, 19, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2250, 18, 19, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2251, 18, 20, 21, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2252, 18, 20, 22, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2253, 18, 20, 23, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2254, 18, 20, 24, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2255, 18, 20, 25, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2256, 18, 21, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2257, 18, 21, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2258, 18, 21, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2259, 18, 21, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2260, 18, 22, 23, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2261, 18, 22, 24, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2262, 18, 22, 25, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2263, 18, 23, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2264, 18, 23, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2265, 18, 24, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2266, 19, 20, 21, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2267, 19, 20, 22, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2268, 19, 20, 23, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2269, 19, 20, 24, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2270, 19, 20, 25, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2271, 19, 21, 22, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2272, 19, 21, 23, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2273, 19, 21, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2274, 19, 21, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2275, 19, 22, 23, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2276, 19, 22, 24, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2277, 19, 22, 25, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2278, 19, 23, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2279, 19, 23, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2280, 19, 24, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2281, 20, 21, 22, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2282, 20, 21, 23, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2283, 20, 21, 24, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2284, 20, 21, 25, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2285, 20, 22, 23, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2286, 20, 22, 24, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2287, 20, 22, 25, 0, 2, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2288, 20, 23, 24, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2289, 20, 23, 25, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2290, 20, 24, 25, 0, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2291, 21, 22, 23, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2292, 21, 22, 24, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2293, 21, 22, 25, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2294, 21, 23, 24, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2295, 21, 23, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2296, 21, 24, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2297, 22, 23, 24, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2298, 22, 23, 25, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2299, 22, 24, 25, 1, 1, 4, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [gr_03], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2300, 23, 24, 25, 6, 0, 6, 1, N'Processing_115', 0, 0, 0)
/****** Object:  Table [dbo].[resultados]    Script Date: 11/02/2011 02:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[resultados]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[resultados](
	[id_resultado] [numeric](18, 0) NOT NULL,
	[premio_1] [int] NOT NULL,
	[premio_2] [int] NOT NULL,
	[premio_3] [int] NOT NULL,
	[premio_4] [int] NOT NULL,
	[premio_5] [int] NOT NULL,
	[premio_6] [int] NOT NULL,
	[premio_7] [int] NOT NULL,
	[premio_8] [int] NOT NULL,
	[dt_resultado] [datetime] NOT NULL,
	[pr_resultado] [char](1) NOT NULL,
 CONSTRAINT [PK_resultados] PRIMARY KEY CLUSTERED 
(
	[id_resultado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[result_gp]    Script Date: 11/02/2011 02:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[result_gp]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[result_gp](
	[id_result_gp] [int] NOT NULL,
	[gp] [int] NOT NULL,
	[dz] [int] NOT NULL,
 CONSTRAINT [PK_result_gp] PRIMARY KEY CLUSTERED 
(
	[id_result_gp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (1, 6, 22)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (2, 9, 34)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (3, 24, 95)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (4, 19, 73)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (5, 22, 85)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (6, 3, 10)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (7, 2, 7)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (8, 9, 33)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (9, 10, 38)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (10, 2, 8)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (11, 5, 18)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (12, 25, 97)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (13, 22, 88)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (14, 17, 65)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (15, 14, 54)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (16, 24, 95)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (17, 17, 65)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (18, 22, 86)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (19, 15, 58)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (20, 21, 81)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (21, 9, 35)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (22, 19, 74)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (23, 13, 51)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (24, 8, 29)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (25, 8, 30)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (26, 2, 7)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (27, 9, 36)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (28, 18, 70)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (29, 10, 39)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (30, 6, 23)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (31, 13, 51)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (32, 21, 83)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (33, 18, 70)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (34, 2, 6)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (35, 22, 86)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (36, 18, 70)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (37, 10, 40)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (38, 17, 68)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (39, 13, 50)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (40, 17, 66)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (41, 13, 50)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (42, 6, 21)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (43, 7, 26)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (44, 15, 59)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (45, 4, 16)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (46, 12, 46)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (47, 12, 46)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (48, 21, 83)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (49, 2, 7)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (50, 19, 75)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (51, 15, 58)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (52, 9, 36)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (53, 18, 71)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (54, 12, 45)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (55, 4, 13)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (56, 2, 6)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (57, 24, 93)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (58, 17, 68)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (59, 18, 69)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (60, 16, 61)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (61, 18, 70)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (62, 13, 52)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (63, 25, 97)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (64, 24, 94)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (65, 25, 0)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (66, 19, 76)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (67, 2, 5)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (68, 8, 31)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (69, 20, 78)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (70, 12, 45)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (71, 24, 95)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (72, 7, 26)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (73, 18, 72)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (74, 3, 12)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (75, 4, 14)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (76, 15, 57)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (77, 8, 32)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (78, 24, 96)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (79, 6, 24)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (80, 7, 26)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (81, 13, 52)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (82, 25, 99)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (83, 12, 45)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (84, 4, 13)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (85, 17, 66)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (86, 17, 67)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (87, 8, 30)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (88, 1, 4)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (89, 18, 72)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (90, 11, 43)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (91, 16, 62)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (92, 20, 77)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (93, 10, 38)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (94, 13, 49)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (95, 21, 82)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (96, 18, 72)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (97, 18, 71)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (98, 18, 70)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (99, 9, 36)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (100, 4, 15)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (101, 12, 46)
GO
print 'Processed 100 total records'
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (102, 22, 85)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (103, 16, 63)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (104, 12, 47)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (105, 4, 14)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (106, 17, 66)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (107, 3, 11)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (108, 1, 1)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (109, 16, 61)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (110, 19, 76)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (111, 3, 10)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (112, 22, 85)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (113, 11, 43)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (114, 12, 48)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (115, 12, 48)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (116, 13, 52)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (117, 7, 26)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (118, 16, 61)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (119, 5, 18)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (120, 2, 6)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (121, 23, 91)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (122, 21, 84)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (123, 6, 24)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (124, 20, 79)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (125, 4, 15)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (126, 16, 64)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (127, 20, 79)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (128, 2, 8)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (129, 11, 42)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (130, 4, 14)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (131, 10, 37)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (132, 10, 39)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (133, 24, 95)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (134, 22, 87)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (135, 1, 3)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (136, 15, 60)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (137, 6, 23)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (138, 9, 33)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (139, 21, 81)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (140, 10, 39)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (141, 5, 19)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (142, 23, 92)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (143, 17, 67)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (144, 25, 98)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (145, 4, 14)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (146, 23, 89)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (147, 25, 98)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (148, 3, 9)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (149, 11, 44)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (150, 9, 35)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (151, 8, 32)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (152, 10, 40)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (153, 15, 58)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (154, 14, 54)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (155, 20, 77)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (156, 12, 47)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (157, 10, 37)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (158, 15, 58)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (159, 25, 98)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (160, 14, 53)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (161, 3, 10)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (162, 24, 93)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (163, 7, 27)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (164, 8, 31)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (165, 23, 91)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (166, 6, 21)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (167, 2, 7)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (168, 2, 6)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (169, 22, 88)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (170, 14, 56)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (171, 24, 94)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (172, 15, 59)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (173, 4, 15)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (174, 20, 80)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (175, 18, 71)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (176, 14, 53)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (177, 14, 56)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (178, 25, 99)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (179, 23, 90)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (180, 25, 98)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (181, 25, 97)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (182, 6, 22)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (183, 11, 42)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (184, 25, 97)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (185, 4, 15)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (186, 14, 54)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (187, 3, 12)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (188, 19, 76)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (189, 6, 21)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (190, 11, 42)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (191, 9, 35)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (192, 25, 0)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (193, 3, 10)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (194, 20, 80)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (195, 17, 65)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (196, 13, 51)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (197, 18, 70)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (198, 16, 64)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (199, 19, 73)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (200, 18, 72)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (201, 21, 83)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (202, 17, 68)
GO
print 'Processed 200 total records'
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (203, 24, 93)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (204, 12, 45)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (205, 14, 53)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (206, 6, 23)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (207, 24, 96)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (208, 12, 46)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (209, 23, 91)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (210, 22, 87)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (211, 20, 78)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (212, 21, 83)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (213, 19, 74)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (214, 24, 94)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (215, 16, 61)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (216, 15, 57)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (217, 15, 60)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (218, 23, 91)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (219, 9, 36)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (220, 24, 94)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (221, 10, 37)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (222, 23, 89)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (223, 9, 35)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (224, 13, 52)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (225, 23, 92)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (226, 25, 98)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (227, 25, 97)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (228, 8, 29)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (229, 2, 7)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (230, 12, 48)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (231, 22, 88)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (232, 22, 88)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (233, 25, 99)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (234, 4, 14)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (235, 5, 17)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (236, 20, 79)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (237, 18, 71)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (238, 21, 84)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (239, 14, 53)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (240, 4, 14)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (241, 23, 92)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (242, 16, 64)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (243, 16, 63)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (244, 12, 46)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (245, 4, 15)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (246, 19, 75)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (247, 2, 8)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (248, 15, 58)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (249, 1, 2)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (250, 3, 9)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (251, 12, 46)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (252, 5, 19)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (253, 24, 94)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (254, 22, 85)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (255, 9, 35)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (256, 23, 89)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (257, 2, 6)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (258, 9, 35)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (259, 18, 69)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (260, 16, 64)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (261, 17, 67)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (262, 24, 95)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (263, 15, 59)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (264, 2, 8)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (265, 18, 72)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (266, 5, 20)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (267, 4, 16)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (268, 17, 66)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (269, 6, 23)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (270, 10, 38)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (271, 9, 35)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (272, 7, 27)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (273, 11, 41)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (274, 4, 16)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (275, 23, 92)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (276, 15, 60)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (277, 24, 94)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (278, 7, 26)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (279, 1, 3)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (280, 23, 91)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (281, 11, 43)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (282, 14, 55)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (283, 24, 93)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (284, 12, 46)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (285, 19, 75)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (286, 6, 22)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (287, 17, 68)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (288, 17, 66)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (289, 16, 63)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (290, 5, 20)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (291, 8, 31)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (292, 11, 43)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (293, 2, 7)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (294, 3, 9)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (295, 25, 99)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (296, 17, 65)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (297, 24, 94)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (298, 17, 68)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (299, 7, 25)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (300, 16, 61)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (301, 19, 76)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (302, 18, 70)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (303, 2, 7)
GO
print 'Processed 300 total records'
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (304, 24, 93)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (305, 24, 94)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (306, 24, 96)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (307, 2, 8)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (308, 12, 45)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (309, 2, 5)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (310, 21, 81)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (311, 2, 8)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (312, 8, 31)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (313, 20, 77)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (314, 1, 2)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (315, 6, 23)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (316, 12, 46)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (317, 7, 28)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (318, 18, 72)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (319, 15, 60)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (320, 13, 50)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (321, 13, 51)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (322, 9, 35)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (323, 25, 99)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (324, 24, 95)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (325, 17, 65)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (326, 23, 91)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (327, 8, 31)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (328, 17, 67)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (329, 21, 81)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (330, 18, 70)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (331, 10, 40)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (332, 12, 47)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (333, 12, 45)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (334, 22, 88)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (335, 20, 79)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (336, 25, 0)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (337, 25, 98)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (338, 24, 95)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (339, 11, 41)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (340, 10, 37)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (341, 17, 68)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (342, 10, 39)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (343, 14, 54)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (344, 14, 56)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (345, 7, 28)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (346, 7, 27)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (347, 1, 3)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (348, 3, 12)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (349, 10, 37)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (350, 10, 38)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (351, 17, 67)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (352, 17, 68)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (353, 17, 65)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (354, 10, 38)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (355, 20, 79)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (356, 1, 1)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (357, 24, 93)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (358, 17, 68)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (359, 25, 0)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (360, 19, 76)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (361, 24, 95)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (362, 6, 23)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (363, 12, 47)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (364, 15, 57)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (365, 16, 61)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (366, 14, 55)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (367, 11, 44)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (368, 9, 35)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (369, 23, 92)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (370, 15, 57)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (371, 15, 57)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (372, 24, 94)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (373, 15, 59)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (374, 10, 40)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (375, 9, 35)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (376, 21, 83)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (377, 6, 23)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (378, 21, 84)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (379, 14, 55)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (380, 2, 7)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (381, 7, 27)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (382, 25, 97)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (383, 11, 42)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (384, 15, 60)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (385, 19, 74)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (386, 21, 81)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (387, 14, 53)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (388, 3, 11)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (389, 8, 29)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (390, 18, 70)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (391, 11, 42)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (392, 17, 67)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (393, 17, 65)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (394, 24, 94)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (395, 15, 59)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (396, 24, 94)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (397, 9, 33)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (398, 1, 3)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (399, 10, 40)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (400, 12, 47)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (401, 13, 49)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (402, 11, 41)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (403, 4, 15)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (404, 17, 66)
GO
print 'Processed 400 total records'
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (405, 15, 58)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (406, 5, 19)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (407, 9, 34)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (408, 20, 78)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (409, 8, 31)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (410, 6, 23)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (411, 22, 87)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (412, 25, 0)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (413, 10, 40)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (414, 7, 27)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (415, 6, 24)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (416, 15, 58)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (417, 22, 87)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (418, 12, 46)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (419, 4, 14)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (420, 15, 57)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (421, 24, 96)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (422, 5, 18)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (423, 22, 86)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (424, 23, 91)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (425, 12, 45)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (426, 22, 88)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (427, 4, 16)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (428, 14, 55)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (429, 18, 70)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (430, 23, 89)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (431, 16, 64)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (432, 25, 97)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (433, 11, 42)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (434, 10, 40)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (435, 24, 95)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (436, 18, 69)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (437, 1, 3)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (438, 19, 74)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (439, 3, 12)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (440, 21, 82)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (441, 10, 40)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (442, 3, 12)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (443, 11, 43)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (444, 20, 79)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (445, 21, 82)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (446, 15, 57)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (447, 4, 16)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (448, 6, 23)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (449, 5, 18)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (450, 8, 30)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (451, 3, 11)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (452, 24, 93)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (453, 24, 95)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (454, 7, 25)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (455, 4, 14)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (456, 19, 73)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (457, 17, 65)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (458, 17, 66)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (459, 13, 50)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (460, 21, 81)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (461, 9, 33)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (462, 20, 77)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (463, 15, 60)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (464, 5, 19)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (465, 25, 98)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (466, 20, 78)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (467, 15, 60)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (468, 22, 88)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (469, 6, 23)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (470, 17, 66)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (471, 19, 74)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (472, 17, 66)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (473, 2, 5)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (474, 12, 45)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (475, 25, 98)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (476, 4, 15)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (477, 16, 63)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (478, 1, 4)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (479, 10, 40)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (480, 25, 99)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (481, 17, 68)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (482, 14, 53)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (483, 20, 80)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (484, 7, 28)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (485, 11, 42)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (486, 13, 51)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (487, 20, 79)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (488, 17, 65)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (489, 11, 43)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (490, 11, 43)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (491, 17, 67)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (492, 18, 70)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (493, 5, 18)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (494, 1, 4)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (495, 17, 66)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (496, 11, 43)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (497, 12, 47)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (498, 1, 2)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (499, 19, 74)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (500, 9, 33)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (501, 15, 60)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (502, 14, 56)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (503, 8, 32)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (504, 4, 13)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (505, 12, 46)
GO
print 'Processed 500 total records'
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (506, 12, 47)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (507, 22, 86)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (508, 16, 64)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (509, 4, 13)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (510, 4, 15)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (511, 7, 25)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (512, 24, 96)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (513, 9, 36)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (514, 23, 92)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (515, 7, 25)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (516, 16, 61)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (517, 14, 56)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (518, 21, 82)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (519, 19, 73)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (520, 2, 7)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (521, 25, 0)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (522, 8, 30)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (523, 25, 98)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (524, 13, 52)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (525, 9, 35)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (526, 10, 40)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (527, 4, 14)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (528, 1, 4)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (529, 5, 19)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (530, 11, 44)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (531, 15, 60)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (532, 18, 72)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (533, 11, 44)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (534, 1, 3)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (535, 9, 36)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (536, 23, 91)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (537, 8, 32)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (538, 14, 56)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (539, 18, 71)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (540, 1, 3)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (541, 19, 73)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (542, 9, 36)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (543, 16, 62)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (544, 24, 94)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (545, 6, 24)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (546, 13, 51)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (547, 21, 81)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (548, 22, 88)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (549, 10, 39)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (550, 23, 91)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (551, 9, 36)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (552, 19, 76)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (553, 20, 80)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (554, 15, 57)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (555, 5, 18)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (556, 18, 71)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (557, 13, 52)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (558, 3, 12)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (559, 18, 69)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (560, 18, 69)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (561, 19, 75)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (562, 18, 72)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (563, 19, 75)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (564, 9, 35)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (565, 3, 12)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (566, 15, 60)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (567, 15, 60)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (568, 18, 69)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (569, 20, 77)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (570, 9, 36)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (571, 14, 56)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (572, 5, 20)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (573, 21, 83)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (574, 16, 63)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (575, 11, 43)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (576, 17, 65)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (577, 22, 88)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (578, 14, 53)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (579, 1, 2)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (580, 25, 0)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (581, 13, 49)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (582, 3, 11)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (583, 11, 43)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (584, 16, 62)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (585, 15, 60)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (586, 11, 43)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (587, 17, 68)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (588, 16, 64)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (589, 7, 28)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (590, 1, 4)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (591, 2, 5)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (592, 23, 91)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (593, 24, 95)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (594, 1, 4)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (595, 20, 79)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (596, 19, 73)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (597, 20, 77)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (598, 1, 2)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (599, 11, 44)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (600, 9, 36)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (601, 25, 98)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (602, 21, 84)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (603, 16, 64)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (604, 20, 77)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (605, 4, 16)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (606, 24, 93)
GO
print 'Processed 600 total records'
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (607, 1, 2)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (608, 5, 20)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (609, 1, 4)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (610, 2, 7)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (611, 24, 95)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (612, 25, 98)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (613, 22, 87)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (614, 3, 12)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (615, 20, 79)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (616, 7, 25)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (617, 1, 2)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (618, 6, 23)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (619, 10, 39)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (620, 4, 14)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (621, 23, 92)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (622, 9, 33)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (623, 24, 94)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (624, 5, 20)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (625, 18, 72)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (626, 4, 14)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (627, 21, 84)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (628, 21, 82)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (629, 4, 16)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (630, 25, 98)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (631, 19, 73)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (632, 14, 55)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (633, 11, 43)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (634, 3, 12)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (635, 23, 90)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (636, 21, 84)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (637, 2, 7)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (638, 20, 78)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (639, 25, 98)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (640, 9, 36)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (641, 24, 93)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (642, 22, 88)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (643, 20, 77)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (644, 9, 34)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (645, 15, 59)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (646, 11, 43)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (647, 18, 72)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (648, 10, 38)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (649, 4, 16)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (650, 11, 41)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (651, 8, 31)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (652, 11, 44)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (653, 21, 81)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (654, 25, 0)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (655, 16, 62)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (656, 10, 37)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (657, 21, 82)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (658, 23, 90)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (659, 21, 83)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (660, 15, 59)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (661, 24, 93)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (662, 4, 14)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (663, 5, 20)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (664, 15, 59)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (665, 9, 35)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (666, 2, 5)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (667, 19, 75)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (668, 21, 83)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (669, 16, 61)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (670, 10, 40)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (671, 15, 58)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (672, 19, 73)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (673, 8, 29)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (674, 12, 47)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (675, 22, 87)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (676, 21, 83)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (677, 2, 8)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (678, 5, 20)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (679, 22, 87)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (680, 18, 69)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (681, 14, 53)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (682, 18, 70)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (683, 19, 74)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (684, 4, 13)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (685, 16, 61)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (686, 1, 1)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (687, 8, 31)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (688, 18, 69)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (689, 24, 93)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (690, 25, 98)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (691, 19, 74)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (692, 17, 68)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (693, 21, 82)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (694, 12, 47)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (695, 17, 65)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (696, 13, 52)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (697, 14, 54)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (698, 17, 66)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (699, 10, 38)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (700, 2, 5)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (701, 12, 45)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (702, 21, 83)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (703, 13, 51)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (704, 13, 49)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (705, 1, 2)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (706, 10, 39)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (707, 10, 40)
GO
print 'Processed 700 total records'
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (708, 5, 17)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (709, 11, 43)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (710, 1, 3)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (711, 22, 86)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (712, 12, 46)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (713, 4, 13)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (714, 1, 1)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (715, 1, 4)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (716, 15, 60)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (717, 25, 99)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (718, 13, 51)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (719, 13, 52)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (720, 21, 84)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (721, 25, 97)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (722, 9, 36)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (723, 23, 91)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (724, 9, 34)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (725, 14, 56)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (726, 17, 66)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (727, 24, 93)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (728, 10, 37)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (729, 12, 46)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (730, 19, 75)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (731, 3, 10)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (732, 5, 19)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (733, 9, 36)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (734, 12, 46)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (735, 24, 93)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (736, 5, 19)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (737, 2, 6)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (738, 12, 47)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (739, 7, 25)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (740, 6, 22)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (741, 15, 57)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (742, 23, 92)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (743, 15, 60)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (744, 17, 68)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (745, 25, 97)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (746, 11, 42)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (747, 9, 35)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (748, 12, 46)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (749, 15, 59)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (750, 6, 22)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (751, 6, 21)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (752, 5, 18)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (753, 24, 94)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (754, 3, 10)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (755, 21, 81)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (756, 18, 70)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (757, 10, 40)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (758, 13, 51)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (759, 10, 40)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (760, 25, 98)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (761, 5, 18)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (762, 22, 88)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (763, 15, 60)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (764, 9, 35)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (765, 23, 89)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (766, 8, 32)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (767, 10, 39)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (768, 4, 14)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (769, 24, 94)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (770, 22, 88)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (771, 7, 26)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (772, 10, 39)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (773, 14, 55)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (774, 5, 20)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (775, 24, 94)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (776, 6, 24)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (777, 5, 20)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (778, 6, 21)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (779, 22, 87)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (780, 19, 74)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (781, 19, 76)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (782, 16, 63)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (783, 23, 92)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (784, 22, 85)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (785, 21, 84)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (786, 13, 52)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (787, 11, 43)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (788, 15, 59)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (789, 2, 7)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (790, 4, 13)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (791, 2, 8)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (792, 15, 59)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (793, 14, 54)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (794, 12, 47)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (795, 8, 32)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (796, 18, 71)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (797, 15, 57)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (798, 17, 68)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (799, 2, 7)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (800, 13, 52)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (801, 8, 29)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (802, 10, 39)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (803, 6, 21)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (804, 21, 83)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (805, 12, 45)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (806, 1, 4)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (807, 9, 33)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (808, 14, 54)
GO
print 'Processed 800 total records'
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (809, 13, 51)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (810, 17, 65)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (811, 4, 13)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (812, 4, 16)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (813, 10, 38)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (814, 21, 82)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (815, 17, 68)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (816, 6, 21)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (817, 22, 86)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (818, 20, 77)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (819, 17, 65)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (820, 9, 33)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (821, 4, 16)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (822, 5, 20)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (823, 7, 26)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (824, 7, 26)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (825, 16, 61)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (826, 3, 9)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (827, 4, 13)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (828, 7, 25)
INSERT [dbo].[result_gp] ([id_result_gp], [gp], [dz]) VALUES (829, 11, 43)
/****** Object:  Table [dbo].[referencia]    Script Date: 11/02/2011 02:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[referencia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[referencia](
	[id_referencia] [int] NOT NULL,
	[descricao] [char](6) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[recapitalizacao]    Script Date: 11/02/2011 02:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[recapitalizacao]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[recapitalizacao](
	[id_recapitalizacao] [int] NOT NULL,
	[recap01_wait] [int] NOT NULL,
	[recap01_processing] [int] NOT NULL,
	[recap01_Wvalor] [decimal](18, 4) NOT NULL,
	[recap01_Pvalor] [decimal](18, 4) NOT NULL,
	[recap02_wait] [int] NOT NULL,
	[recap02_processing] [int] NOT NULL,
	[recap02_Wvalor] [decimal](18, 4) NOT NULL,
	[recap02_Pvalor] [decimal](18, 4) NOT NULL,
	[recap03_wait] [int] NOT NULL,
	[recap03_processing] [int] NOT NULL,
	[recap03_Wvalor] [decimal](18, 4) NOT NULL,
	[recap03_Pvalor] [decimal](18, 4) NOT NULL,
	[recap04_wait] [int] NOT NULL,
	[recap04_processing] [int] NOT NULL,
	[recap04_Wvalor] [decimal](18, 4) NOT NULL,
	[recap04_Pvalor] [decimal](18, 4) NOT NULL,
	[recap05_wait] [int] NOT NULL,
	[recap05_processing] [int] NOT NULL,
	[recap05_Wvalor] [decimal](18, 4) NOT NULL,
	[recap05_Pvalor] [decimal](18, 4) NOT NULL,
	[subsidio_wait] [int] NOT NULL,
	[subsidio_ready] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  StoredProcedure [dbo].[Conta_Status]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Conta_Status]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Conta_Status]

	@status varchar(15)

AS
	BEGIN
		select count(*) as total from series where status = @status
	END
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Compara_Carencia]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Compara_Carencia]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Compara_Carencia]
	@id int
AS
	BEGIN
		update series set mor_carencia = carencia where id_serie = @id
	END
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Carrega_Series]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Carrega_Series]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Carrega_Series]
AS
	BEGIN
		select * from series
	END
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Carrega_Grupos]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Carrega_Grupos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Carrega_Grupos]

AS
	BEGIN
		Select * from grupos
	END
	RETURN
' 
END
GO
/****** Object:  Table [dbo].[estatistica_premio]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[estatistica_premio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[estatistica_premio](
	[id_estatistica_premio] [int] NOT NULL,
	[p1] [int] NOT NULL,
	[p2] [int] NOT NULL,
	[p3] [int] NOT NULL,
	[p4] [int] NOT NULL,
	[p5] [int] NOT NULL,
	[p6] [int] NOT NULL,
	[p7] [int] NOT NULL,
	[p8] [int] NOT NULL,
	[p9] [int] NOT NULL,
	[p10] [int] NOT NULL,
	[p11] [int] NOT NULL,
	[p12] [int] NOT NULL,
	[p13] [int] NOT NULL,
	[p14] [int] NOT NULL,
	[p15] [int] NOT NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[estatistica_premio] ([id_estatistica_premio], [p1], [p2], [p3], [p4], [p5], [p6], [p7], [p8], [p9], [p10], [p11], [p12], [p13], [p14], [p15]) VALUES (594, 276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[estatistica_premio] ([id_estatistica_premio], [p1], [p2], [p3], [p4], [p5], [p6], [p7], [p8], [p9], [p10], [p11], [p12], [p13], [p14], [p15]) VALUES (595, 23, 253, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[estatistica_premio] ([id_estatistica_premio], [p1], [p2], [p3], [p4], [p5], [p6], [p7], [p8], [p9], [p10], [p11], [p12], [p13], [p14], [p15]) VALUES (596, 23, 22, 231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[estatistica_premio] ([id_estatistica_premio], [p1], [p2], [p3], [p4], [p5], [p6], [p7], [p8], [p9], [p10], [p11], [p12], [p13], [p14], [p15]) VALUES (597, 23, 22, 21, 210, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[estatistica_premio] ([id_estatistica_premio], [p1], [p2], [p3], [p4], [p5], [p6], [p7], [p8], [p9], [p10], [p11], [p12], [p13], [p14], [p15]) VALUES (598, 23, 22, 21, 20, 190, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[estatistica_premio] ([id_estatistica_premio], [p1], [p2], [p3], [p4], [p5], [p6], [p7], [p8], [p9], [p10], [p11], [p12], [p13], [p14], [p15]) VALUES (599, 23, 22, 21, 20, 19, 171, 0, 0, 0, 0, 0, 0, 0, 0, 0)
/****** Object:  Table [dbo].[estatistica_carencia]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[estatistica_carencia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[estatistica_carencia](
	[id_estatistica_carencia] [int] NOT NULL,
	[c1] [int] NOT NULL,
	[c2] [int] NOT NULL,
	[c3] [int] NOT NULL,
	[c4] [int] NOT NULL,
	[c5] [int] NOT NULL,
	[c6] [int] NOT NULL,
	[c7] [int] NOT NULL,
	[c8] [int] NOT NULL,
	[c9] [int] NOT NULL,
	[c10] [int] NOT NULL,
	[c11] [int] NOT NULL,
	[c12] [int] NOT NULL,
	[c13] [int] NOT NULL,
	[c14] [int] NOT NULL,
	[c15] [int] NOT NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[estatistica_carencia] ([id_estatistica_carencia], [c1], [c2], [c3], [c4], [c5], [c6], [c7], [c8], [c9], [c10], [c11], [c12], [c13], [c14], [c15]) VALUES (594, 2300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[estatistica_carencia] ([id_estatistica_carencia], [c1], [c2], [c3], [c4], [c5], [c6], [c7], [c8], [c9], [c10], [c11], [c12], [c13], [c14], [c15]) VALUES (595, 276, 2024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[estatistica_carencia] ([id_estatistica_carencia], [c1], [c2], [c3], [c4], [c5], [c6], [c7], [c8], [c9], [c10], [c11], [c12], [c13], [c14], [c15]) VALUES (596, 276, 253, 1771, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[estatistica_carencia] ([id_estatistica_carencia], [c1], [c2], [c3], [c4], [c5], [c6], [c7], [c8], [c9], [c10], [c11], [c12], [c13], [c14], [c15]) VALUES (597, 276, 253, 231, 1540, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[estatistica_carencia] ([id_estatistica_carencia], [c1], [c2], [c3], [c4], [c5], [c6], [c7], [c8], [c9], [c10], [c11], [c12], [c13], [c14], [c15]) VALUES (598, 276, 253, 231, 210, 1330, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[estatistica_carencia] ([id_estatistica_carencia], [c1], [c2], [c3], [c4], [c5], [c6], [c7], [c8], [c9], [c10], [c11], [c12], [c13], [c14], [c15]) VALUES (599, 276, 253, 231, 210, 190, 1140, 0, 0, 0, 0, 0, 0, 0, 0, 0)
/****** Object:  StoredProcedure [dbo].[Add_Contabilidade]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Add_Contabilidade]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Add_Contabilidade]

	@id int, 
	@gp int, 
	@sb int, 
	@dbt_ctbil decimal(18,4), 
    @dbt_real decimal(18,4), 
    @cto_ctbil decimal(18,4), 
    @cto_real decimal(18,4), 
    @sdo_sb_ctbil decimal(18,4), 
    @sdo_sb_real decimal(18,4), 
    @cg_subsidiario decimal(18,4), 
    @mvct decimal(18,4), 
    @premio_real varchar(3), 
    @sdo_ctbl_acum decimal(18,4), 
    @sdo_real_acum decimal(18,4)
                        
AS
	/* SET NOCOUNT ON */
	BEGIN
       insert into contabilidade (id_aplicacao, 
									num_gp, 
									subperiodo, 
									debito_contabil, 
									debito_real, 
									credito_contabil, 
									credito_real, 
									saldo_sb_contabil, 
									saldo_sb_real, 
									capital_subsidiario, 
									mvtc, 
									premio_real, 
									saldo_contabil_acumulado, 
									saldo_real_acumulado 
									) values (
									@id, 
									@gp, 
									@sb, 
									@dbt_ctbil,
									@dbt_real,
									@cto_ctbil,
									@cto_real,
									@sdo_sb_ctbil,
									@sdo_sb_real,
									@cg_subsidiario,
									@mvct,
									@premio_real,
									@sdo_ctbl_acum,
									@sdo_real_acum)
	
	END
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[User_Contabilidade]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User_Contabilidade]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[User_Contabilidade]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */
	Select * from Contabilidade
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[StoredProcedure6]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StoredProcedure6]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[StoredProcedure6]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
		begin
		delete from series
	end

	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ZeraDebitosEDeducoes_Grupos]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ZeraDebitosEDeducoes_Grupos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ZeraDebitosEDeducoes_Grupos]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	BEGIN
		update grupos set credito = 0, debito_previsto = 0, deducao_por_mvtc = 0
	END
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Zera_Contadores]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Zera_Contadores]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Zera_Contadores]

	@new_status varchar(15)

AS
	BEGIN
		update series set carencia = 0, mor_carencia = 0, carencia_recap = 0, qtde_premio = 0, status = @new_status
		--update series set carencia = 0, mor_carencia = 0, qtde_premio = 0
		--update series set carencia = 0, mor_carencia = 0, carencia_recap = 0, qtde_premio = 0, status = ''Processing_115''		
	END
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Zera_Carencia_Recap]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Zera_Carencia_Recap]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Zera_Carencia_Recap]

	@id int

AS
	BEGIN
		update series set carencia_recap = 0 where id_serie = @id
	END
	RETURN

' 
END
GO
/****** Object:  StoredProcedure [dbo].[Zera_Carencia]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Zera_Carencia]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Zera_Carencia]

	@id int

AS
	BEGIN
		update series set carencia = 0 where id_serie = @id
	END
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[SomaDebito_Wait]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SomaDebito_Wait]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SomaDebito_Wait]
AS
	BEGIN
		SELECT status, carencia from series where status = ''Recap_wait_01'' or status = ''Recap_wait_02'' 
		or status = ''Recap_wait_03'' or status = ''Recap_wait_04'' or status = ''Recap_wait_05''		
	END
	RETURN' 
END
GO
/****** Object:  StoredProcedure [dbo].[SomaDebito_Proc]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SomaDebito_Proc]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SomaDebito_Proc]
AS
	BEGIN
		SELECT gr_01, gr_02, gr_03, status, carencia from series where status = ''Recap_Proc_01'' or status = ''Recap_Proc_02'' 
		or status = ''Recap_Proc_03'' or status = ''Recap_Proc_04'' or status = ''Recap_Proc_05'' or  status = ''Processing_115''		
	END
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Deleta_Contabilidade]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Deleta_Contabilidade]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Deleta_Contabilidade]

AS
	BEGIN
		delete from contabilidade
	END
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[ContaStatusEAgrupa]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContaStatusEAgrupa]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ContaStatusEAgrupa]
AS
	begin
		select status, count(status) as qtde_status from series group by status
	end
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Muda_Status]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Muda_Status]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Muda_Status]
	@id int,
	@new_status varchar(15)
AS
	BEGIN
		update series set status = @new_status where id_serie = @id
	END
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Inserir_Registro_Series]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inserir_Registro_Series]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Inserir_Registro_Series]

            @id int,
            @gr_01 int,
            @gr_02 int,
            @gr_03 int,
            @carencia int,
            @qtde_premio int,
            @mor_carencia int, 
            @pr_aplicacao int,
            @status nvarchar(25),
            @carencia_recap int,
            @aux_carencia int,
            @max_carencia int                        

AS
	BEGIN
		INSERT INTO SERIES (id_serie, gr_01, gr_02, gr_03, carencia, qtde_premio, mor_carencia, 
							pr_aplicacao, status, carencia_recap, aux_carencia, max_carencia) VALUES 
						   (@id, @gr_01, @gr_02, @gr_03, @carencia, @qtde_premio, @mor_carencia, 
						    @pr_aplicacao, @status, @carencia_recap, @aux_carencia, @max_carencia)
	END
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Inicia_Status_Recap]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inicia_Status_Recap]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Inicia_Status_Recap]
	@id int,
	@new_status varchar(15)
AS
	BEGIN
		update series set status = @new_status, carencia_recap = 1 where id_serie = @id
	END
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Aumenta_QtdePremio]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Aumenta_QtdePremio]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Aumenta_QtdePremio]
	@id int
AS
	BEGIN
		update series set qtde_premio = (qtde_premio + 1) where id_serie = @id
	END
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Aumenta_Carencia_Recap]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Aumenta_Carencia_Recap]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Aumenta_Carencia_Recap]

	@id int

AS
	BEGIN
       update series set carencia_Recap = (carencia_Recap + 1) where id_serie = @id
	END
	RETURN' 
END
GO
/****** Object:  StoredProcedure [dbo].[Aumenta_Carencia]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Aumenta_Carencia]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Aumenta_Carencia]

	@id int

AS
	BEGIN
       update series set carencia = (carencia + 1) where id_serie = @id
	END
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Exibe_Contabilidade]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Exibe_Contabilidade]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Exibe_Contabilidade]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */
	SELECT c.*, ec.*, ep.* from contabilidade c, 
								estatistica_carencia ec,
                                estatistica_premio ep 
                                WHERE c.id_aplicacao = ec.id_estatistica_carencia 
                                AND c.id_aplicacao = ep.id_estatistica_premio
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Add_Estatistica_Premio]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Add_Estatistica_Premio]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Add_Estatistica_Premio]

	@id int,
	@pre1 int,
	@pre2 int,
	@pre3 int,
	@pre4 int,
	@pre5 int,
	@pre6 int,
	@pre7 int,
	@pre8 int,
	@pre9 int,
	@pre10 int,
	@pre11 int,
	@pre12 int,
	@pre13 int,
	@pre14 int,
	@pre15 int

AS
	BEGIN
		insert into estatistica_premio (id_estatistica_premio, 
										  p1, 
										  p2, 
										  p3, 
										  p4, 
										  p5, 
										  p6, 
										  p7, 
										  p8, 
										  p9, 
										  p10, 
										  p11, 
										  p12, 
										  p13, 
										  p14, 
										  p15
										  ) values ( 										  
										  @id,  
										  @pre1, 
										  @pre2,  
										  @pre3, 
										  @pre4, 
										  @pre5, 
										  @pre6, 
										  @pre7, 
										  @pre8, 
										  @pre9, 
										  @pre10, 
										  @pre11, 
										  @pre12, 
										  @pre13, 
										  @pre14, 
										  @pre15)	
	END
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Add_Estatistica_Carencia]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Add_Estatistica_Carencia]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Add_Estatistica_Carencia]

	@id int,
	@car1 int,
	@car2 int,
	@car3 int,
	@car4 int,
	@car5 int,
	@car6 int,
	@car7 int,
	@car8 int,
	@car9 int,
	@car10 int,
	@car11 int,
	@car12 int,
	@car13 int,
	@car14 int,
	@car15 int

AS
	BEGIN
		insert into estatistica_carencia (id_estatistica_carencia, 
										  c1, 
										  c2, 
										  c3, 
										  c4, 
										  c5, 
										  c6, 
										  c7, 
										  c8, 
										  c9, 
										  c10, 
										  c11, 
										  c12, 
										  c13, 
										  c14, 
										  c15
										  ) values ( 
										  @id,  
										  @car1, 
										  @car2,  
										  @car3, 
										  @car4, 
										  @car5, 
										  @car6, 
										  @car7, 
										  @car8, 
										  @car9, 
										  @car10, 
										  @car11, 
										  @car12, 
										  @car13, 
										  @car14, 
										  @car15)
	
	END
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Deleta_Estatistica_Premio]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Deleta_Estatistica_Premio]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Deleta_Estatistica_Premio]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */
	BEGIN
		delete from estatistica_premio
	END
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Deleta_Estatistica_Carencia]    Script Date: 11/02/2011 02:56:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Deleta_Estatistica_Carencia]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Deleta_Estatistica_Carencia]
	/*
	(
	@parameter1 int = 5,
	@parameter2 datatype OUTPUT
	)
	*/
AS
	/* SET NOCOUNT ON */
	BEGIN
		delete from estatistica_carencia 
	END
' 
END
GO
/****** Object:  Default [DF_indice_sb_atual]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_indice_sb_atual]') AND parent_object_id = OBJECT_ID(N'[dbo].[indice]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_indice_sb_atual]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[indice] ADD  CONSTRAINT [DF_indice_sb_atual]  DEFAULT ((1)) FOR [sb_atual]
END


End
GO
/****** Object:  Default [DF_grupos_debito_previsto]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_grupos_debito_previsto]') AND parent_object_id = OBJECT_ID(N'[dbo].[grupos]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_grupos_debito_previsto]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[grupos] ADD  CONSTRAINT [DF_grupos_debito_previsto]  DEFAULT ((0)) FOR [debito_previsto]
END


End
GO
/****** Object:  Default [DF_grupos_deducao_por_mvtc]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_grupos_deducao_por_mvtc]') AND parent_object_id = OBJECT_ID(N'[dbo].[grupos]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_grupos_deducao_por_mvtc]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[grupos] ADD  CONSTRAINT [DF_grupos_deducao_por_mvtc]  DEFAULT ((0)) FOR [deducao_por_mvtc]
END


End
GO
/****** Object:  Default [DF_grupos_credito]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_grupos_credito]') AND parent_object_id = OBJECT_ID(N'[dbo].[grupos]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_grupos_credito]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[grupos] ADD  CONSTRAINT [DF_grupos_credito]  DEFAULT ((0)) FOR [credito]
END


End
GO
/****** Object:  Default [DF_grupos_deduzido_1]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_grupos_deduzido_1]') AND parent_object_id = OBJECT_ID(N'[dbo].[grupos]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_grupos_deduzido_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[grupos] ADD  CONSTRAINT [DF_grupos_deduzido_1]  DEFAULT ('N') FOR [deduzido]
END


End
GO
/****** Object:  Default [DF_banca_qtde_premio]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_banca_qtde_premio]') AND parent_object_id = OBJECT_ID(N'[dbo].[bancas]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_banca_qtde_premio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[bancas] ADD  CONSTRAINT [DF_banca_qtde_premio]  DEFAULT (0) FOR [qtde_premio]
END


End
GO
/****** Object:  Default [DF_banca_val_Total_premio]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_banca_val_Total_premio]') AND parent_object_id = OBJECT_ID(N'[dbo].[bancas]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_banca_val_Total_premio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[bancas] ADD  CONSTRAINT [DF_banca_val_Total_premio]  DEFAULT (0) FOR [val_Total_premio]
END


End
GO
/****** Object:  Default [DF_banca_carencia_aposta]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_banca_carencia_aposta]') AND parent_object_id = OBJECT_ID(N'[dbo].[bancas]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_banca_carencia_aposta]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[bancas] ADD  CONSTRAINT [DF_banca_carencia_aposta]  DEFAULT (0) FOR [carencia_aposta]
END


End
GO
/****** Object:  Default [DF_bancas_relacao_aposta_premio]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_bancas_relacao_aposta_premio]') AND parent_object_id = OBJECT_ID(N'[dbo].[bancas]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_bancas_relacao_aposta_premio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[bancas] ADD  CONSTRAINT [DF_bancas_relacao_aposta_premio]  DEFAULT (0) FOR [relacao_aposta_premio]
END


End
GO
/****** Object:  Default [DF_postos_qtde_premio]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_postos_qtde_premio]') AND parent_object_id = OBJECT_ID(N'[dbo].[postos]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_postos_qtde_premio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[postos] ADD  CONSTRAINT [DF_postos_qtde_premio]  DEFAULT (0) FOR [qtde_premio]
END


End
GO
/****** Object:  Default [DF_postos_val_total_premio]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_postos_val_total_premio]') AND parent_object_id = OBJECT_ID(N'[dbo].[postos]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_postos_val_total_premio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[postos] ADD  CONSTRAINT [DF_postos_val_total_premio]  DEFAULT (0) FOR [val_total_premio]
END


End
GO
/****** Object:  Default [DF_postos_carencia_aposta]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_postos_carencia_aposta]') AND parent_object_id = OBJECT_ID(N'[dbo].[postos]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_postos_carencia_aposta]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[postos] ADD  CONSTRAINT [DF_postos_carencia_aposta]  DEFAULT (0) FOR [carencia_aposta]
END


End
GO
/****** Object:  Default [DF_postos_carencia_premio]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_postos_carencia_premio]') AND parent_object_id = OBJECT_ID(N'[dbo].[postos]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_postos_carencia_premio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[postos] ADD  CONSTRAINT [DF_postos_carencia_premio]  DEFAULT (0) FOR [carencia_premio]
END


End
GO
/****** Object:  Default [DF_postos_relacao_aposta_premio]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_postos_relacao_aposta_premio]') AND parent_object_id = OBJECT_ID(N'[dbo].[postos]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_postos_relacao_aposta_premio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[postos] ADD  CONSTRAINT [DF_postos_relacao_aposta_premio]  DEFAULT (0) FOR [relacao_aposta_premio]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_debito_contabil]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_debito_contabil]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_debito_contabil]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_debito_contabil]  DEFAULT ((0)) FOR [debito_contabil]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_credito_contabil]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_credito_contabil]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_credito_contabil]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_credito_contabil]  DEFAULT ((0)) FOR [credito_contabil]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_credito_real]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_credito_real]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_credito_real]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_credito_real]  DEFAULT ((0)) FOR [credito_real]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_saldo_sb_contabil]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_saldo_sb_contabil]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_saldo_sb_contabil]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_saldo_sb_contabil]  DEFAULT ((0)) FOR [saldo_sb_contabil]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_saldo_sb_real]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_saldo_sb_real]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_saldo_sb_real]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_saldo_sb_real]  DEFAULT ((0)) FOR [saldo_sb_real]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_capital_subsidiario]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_capital_subsidiario]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_capital_subsidiario]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_capital_subsidiario]  DEFAULT ((0)) FOR [capital_subsidiario]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_saldo_contabil_acumulado]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_saldo_contabil_acumulado]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_saldo_contabil_acumulado]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_saldo_contabil_acumulado]  DEFAULT ((0)) FOR [saldo_contabil_acumulado]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_saldo_real_acumulado]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_saldo_real_acumulado]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_saldo_real_acumulado]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_saldo_real_acumulado]  DEFAULT ((0)) FOR [saldo_real_acumulado]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_QtdeSRAguardandoPremio]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_QtdeSRAguardandoPremio]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_QtdeSRAguardandoPremio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_QtdeSRAguardandoPremio]  DEFAULT ((0)) FOR [aguardandoPR]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_recapitalizando_01]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_recapitalizando_01]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_recapitalizando_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_recapitalizando_01]  DEFAULT ((0)) FOR [recapitalizando_01]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_recapitalizando_02]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_recapitalizando_02]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_recapitalizando_02]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_recapitalizando_02]  DEFAULT ((0)) FOR [recapitalizando_02]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_recapitalizando_03]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_recapitalizando_03]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_recapitalizando_03]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_recapitalizando_03]  DEFAULT ((0)) FOR [recapitalizando_03]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_recapitalizando_04]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_recapitalizando_04]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_recapitalizando_04]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_recapitalizando_04]  DEFAULT ((0)) FOR [recapitalizando_04]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_subsidio]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_subsidio]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_subsidio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_subsidio]  DEFAULT ((0)) FOR [subsidio]
END


End
GO
/****** Object:  Default [DF_series_carencia]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_series_carencia]') AND parent_object_id = OBJECT_ID(N'[dbo].[series]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_series_carencia]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[series] ADD  CONSTRAINT [DF_series_carencia]  DEFAULT ((0)) FOR [carencia]
END


End
GO
/****** Object:  Default [DF_series_qtde_premio]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_series_qtde_premio]') AND parent_object_id = OBJECT_ID(N'[dbo].[series]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_series_qtde_premio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[series] ADD  CONSTRAINT [DF_series_qtde_premio]  DEFAULT ((0)) FOR [qtde_premio]
END


End
GO
/****** Object:  Default [DF_series_mor_carencia]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_series_mor_carencia]') AND parent_object_id = OBJECT_ID(N'[dbo].[series]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_series_mor_carencia]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[series] ADD  CONSTRAINT [DF_series_mor_carencia]  DEFAULT ((0)) FOR [mor_carencia]
END


End
GO
/****** Object:  Default [DF_series_pr_aplicacao]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_series_pr_aplicacao]') AND parent_object_id = OBJECT_ID(N'[dbo].[series]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_series_pr_aplicacao]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[series] ADD  CONSTRAINT [DF_series_pr_aplicacao]  DEFAULT ((1)) FOR [pr_aplicacao]
END


End
GO
/****** Object:  Default [DF_series_carencia_recap]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_series_carencia_recap]') AND parent_object_id = OBJECT_ID(N'[dbo].[series]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_series_carencia_recap]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[series] ADD  CONSTRAINT [DF_series_carencia_recap]  DEFAULT ((0)) FOR [carencia_recap]
END


End
GO
/****** Object:  Default [DF_series_aux_carencia]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_series_aux_carencia]') AND parent_object_id = OBJECT_ID(N'[dbo].[series]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_series_aux_carencia]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[series] ADD  CONSTRAINT [DF_series_aux_carencia]  DEFAULT ((0)) FOR [aux_carencia]
END


End
GO
/****** Object:  Default [DF_series_max_carencia]    Script Date: 11/02/2011 02:56:35 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_series_max_carencia]') AND parent_object_id = OBJECT_ID(N'[dbo].[series]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_series_max_carencia]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[series] ADD  CONSTRAINT [DF_series_max_carencia]  DEFAULT ((0)) FOR [max_carencia]
END


End
GO
/****** Object:  Default [DF_estatistica_carencia_c13]    Script Date: 11/02/2011 02:56:47 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_estatistica_carencia_c13]') AND parent_object_id = OBJECT_ID(N'[dbo].[estatistica_carencia]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_estatistica_carencia_c13]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[estatistica_carencia] ADD  CONSTRAINT [DF_estatistica_carencia_c13]  DEFAULT ((0)) FOR [c13]
END


End
GO
/****** Object:  Default [DF_estatistica_carencia_c14]    Script Date: 11/02/2011 02:56:47 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_estatistica_carencia_c14]') AND parent_object_id = OBJECT_ID(N'[dbo].[estatistica_carencia]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_estatistica_carencia_c14]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[estatistica_carencia] ADD  CONSTRAINT [DF_estatistica_carencia_c14]  DEFAULT ((0)) FOR [c14]
END


End
GO
/****** Object:  Default [DF_estatistica_carencia_c15]    Script Date: 11/02/2011 02:56:47 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_estatistica_carencia_c15]') AND parent_object_id = OBJECT_ID(N'[dbo].[estatistica_carencia]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_estatistica_carencia_c15]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[estatistica_carencia] ADD  CONSTRAINT [DF_estatistica_carencia_c15]  DEFAULT ((0)) FOR [c15]
END


End
GO
/****** Object:  ForeignKey [FK_recapitalizacao_contabilidade]    Script Date: 11/02/2011 02:56:35 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_recapitalizacao_contabilidade]') AND parent_object_id = OBJECT_ID(N'[dbo].[recapitalizacao]'))
ALTER TABLE [dbo].[recapitalizacao]  WITH CHECK ADD  CONSTRAINT [FK_recapitalizacao_contabilidade] FOREIGN KEY([id_recapitalizacao])
REFERENCES [dbo].[contabilidade] ([id_aplicacao])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_recapitalizacao_contabilidade]') AND parent_object_id = OBJECT_ID(N'[dbo].[recapitalizacao]'))
ALTER TABLE [dbo].[recapitalizacao] CHECK CONSTRAINT [FK_recapitalizacao_contabilidade]
GO
/****** Object:  ForeignKey [FK_estatistica_premio_contabilidade]    Script Date: 11/02/2011 02:56:47 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_estatistica_premio_contabilidade]') AND parent_object_id = OBJECT_ID(N'[dbo].[estatistica_premio]'))
ALTER TABLE [dbo].[estatistica_premio]  WITH CHECK ADD  CONSTRAINT [FK_estatistica_premio_contabilidade] FOREIGN KEY([id_estatistica_premio])
REFERENCES [dbo].[contabilidade] ([id_aplicacao])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_estatistica_premio_contabilidade]') AND parent_object_id = OBJECT_ID(N'[dbo].[estatistica_premio]'))
ALTER TABLE [dbo].[estatistica_premio] CHECK CONSTRAINT [FK_estatistica_premio_contabilidade]
GO
/****** Object:  ForeignKey [FK_estatistica_carencia_contabilidade]    Script Date: 11/02/2011 02:56:47 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_estatistica_carencia_contabilidade]') AND parent_object_id = OBJECT_ID(N'[dbo].[estatistica_carencia]'))
ALTER TABLE [dbo].[estatistica_carencia]  WITH CHECK ADD  CONSTRAINT [FK_estatistica_carencia_contabilidade] FOREIGN KEY([id_estatistica_carencia])
REFERENCES [dbo].[contabilidade] ([id_aplicacao])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_estatistica_carencia_contabilidade]') AND parent_object_id = OBJECT_ID(N'[dbo].[estatistica_carencia]'))
ALTER TABLE [dbo].[estatistica_carencia] CHECK CONSTRAINT [FK_estatistica_carencia_contabilidade]
GO
