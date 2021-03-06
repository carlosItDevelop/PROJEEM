USE [newprojeem]
GO
/****** Object:  Table [dbo].[indice]    Script Date: 03/07/2012 11:28:56 ******/
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
INSERT [dbo].[indice] ([cod_resultado], [val_por_grupo], [referencia], [id_result_gp], [sb_atual], [status_processamento]) VALUES (CAST(1 AS Numeric(18, 0)), N'0,0001', N'201203', CAST(829 AS Numeric(18, 0)), 1, N'DEBITO')
/****** Object:  Table [dbo].[id_usuarios]    Script Date: 03/07/2012 11:28:56 ******/
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
/****** Object:  Table [dbo].[id_contabilidade]    Script Date: 03/07/2012 11:28:56 ******/
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
/****** Object:  Table [dbo].[grupos]    Script Date: 03/07/2012 11:28:56 ******/
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
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (1, 1, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (2, 2, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (3, 3, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (4, 4, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (5, 5, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (6, 6, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (7, 7, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (8, 8, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (9, 9, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (10, 10, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (11, 11, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (12, 12, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (13, 13, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (14, 14, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (15, 15, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (16, 16, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (17, 17, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (18, 18, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (19, 19, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (20, 20, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (21, 21, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (22, 22, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (23, 23, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (24, 24, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
INSERT [dbo].[grupos] ([id_grupo], [grupo], [debito_previsto], [deducao_por_mvtc], [credito], [deduzido]) VALUES (25, 25, CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), CAST(0.0000 AS Decimal(18, 4)), N'S')
/****** Object:  Table [dbo].[carencia]    Script Date: 03/07/2012 11:28:56 ******/
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
/****** Object:  Table [dbo].[bancas]    Script Date: 03/07/2012 11:28:56 ******/
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
/****** Object:  Table [dbo].[postos]    Script Date: 03/07/2012 11:28:56 ******/
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
/****** Object:  Table [dbo].[status_series]    Script Date: 03/07/2012 11:28:56 ******/
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
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 03/07/2012 11:28:56 ******/
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
/****** Object:  Table [dbo].[contabilidade]    Script Date: 03/07/2012 11:28:56 ******/
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
/****** Object:  Table [dbo].[series]    Script Date: 03/07/2012 11:28:56 ******/
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
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (1, 1, 2, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (2, 1, 3, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (3, 1, 4, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (4, 1, 5, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (5, 1, 6, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (6, 1, 7, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (7, 1, 8, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (8, 1, 9, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (9, 1, 10, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (10, 1, 11, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (11, 1, 12, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (12, 1, 13, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (13, 1, 14, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (14, 1, 15, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (15, 1, 16, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (16, 1, 17, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (17, 1, 18, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (18, 1, 19, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (19, 1, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (20, 1, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (21, 1, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (22, 1, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (23, 1, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (24, 1, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (25, 2, 3, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (26, 2, 4, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (27, 2, 5, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (28, 2, 6, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (29, 2, 7, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (30, 2, 8, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (31, 2, 9, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (32, 2, 10, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (33, 2, 11, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (34, 2, 12, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (35, 2, 13, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (36, 2, 14, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (37, 2, 15, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (38, 2, 16, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (39, 2, 17, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (40, 2, 18, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (41, 2, 19, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (42, 2, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (43, 2, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (44, 2, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (45, 2, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (46, 2, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (47, 2, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (48, 3, 4, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (49, 3, 5, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (50, 3, 6, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (51, 3, 7, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (52, 3, 8, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (53, 3, 9, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (54, 3, 10, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (55, 3, 11, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (56, 3, 12, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (57, 3, 13, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (58, 3, 14, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (59, 3, 15, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (60, 3, 16, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (61, 3, 17, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (62, 3, 18, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (63, 3, 19, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (64, 3, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (65, 3, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (66, 3, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (67, 3, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (68, 3, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (69, 3, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (70, 4, 5, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (71, 4, 6, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (72, 4, 7, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (73, 4, 8, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (74, 4, 9, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (75, 4, 10, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (76, 4, 11, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (77, 4, 12, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (78, 4, 13, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (79, 4, 14, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (80, 4, 15, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (81, 4, 16, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (82, 4, 17, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (83, 4, 18, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (84, 4, 19, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (85, 4, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (86, 4, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (87, 4, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (88, 4, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (89, 4, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (90, 4, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (91, 5, 6, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (92, 5, 7, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (93, 5, 8, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (94, 5, 9, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (95, 5, 10, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (96, 5, 11, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (97, 5, 12, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (98, 5, 13, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (99, 5, 14, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (100, 5, 15, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (101, 5, 16, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (102, 5, 17, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (103, 5, 18, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (104, 5, 19, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (105, 5, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (106, 5, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (107, 5, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (108, 5, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (109, 5, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (110, 5, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (111, 6, 7, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (112, 6, 8, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (113, 6, 9, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (114, 6, 10, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (115, 6, 11, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (116, 6, 12, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (117, 6, 13, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (118, 6, 14, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (119, 6, 15, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (120, 6, 16, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (121, 6, 17, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (122, 6, 18, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (123, 6, 19, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (124, 6, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (125, 6, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (126, 6, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (127, 6, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (128, 6, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (129, 6, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (130, 7, 8, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (131, 7, 9, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (132, 7, 10, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (133, 7, 11, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (134, 7, 12, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (135, 7, 13, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (136, 7, 14, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (137, 7, 15, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (138, 7, 16, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (139, 7, 17, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (140, 7, 18, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (141, 7, 19, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (142, 7, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (143, 7, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (144, 7, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (145, 7, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (146, 7, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (147, 7, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (148, 8, 9, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (149, 8, 10, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (150, 8, 11, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (151, 8, 12, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (152, 8, 13, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (153, 8, 14, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (154, 8, 15, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (155, 8, 16, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (156, 8, 17, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (157, 8, 18, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (158, 8, 19, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (159, 8, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (160, 8, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (161, 8, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (162, 8, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (163, 8, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (164, 8, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (165, 9, 10, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (166, 9, 11, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (167, 9, 12, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (168, 9, 13, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (169, 9, 14, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (170, 9, 15, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (171, 9, 16, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (172, 9, 17, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (173, 9, 18, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (174, 9, 19, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (175, 9, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (176, 9, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (177, 9, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (178, 9, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (179, 9, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (180, 9, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (181, 10, 11, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (182, 10, 12, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (183, 10, 13, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (184, 10, 14, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (185, 10, 15, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (186, 10, 16, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (187, 10, 17, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (188, 10, 18, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (189, 10, 19, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (190, 10, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (191, 10, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (192, 10, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (193, 10, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (194, 10, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (195, 10, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (196, 11, 12, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (197, 11, 13, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (198, 11, 14, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (199, 11, 15, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (200, 11, 16, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (201, 11, 17, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (202, 11, 18, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
GO
print 'Processed 200 total records'
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (203, 11, 19, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (204, 11, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (205, 11, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (206, 11, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (207, 11, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (208, 11, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (209, 11, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (210, 12, 13, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (211, 12, 14, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (212, 12, 15, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (213, 12, 16, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (214, 12, 17, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (215, 12, 18, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (216, 12, 19, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (217, 12, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (218, 12, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (219, 12, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (220, 12, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (221, 12, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (222, 12, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (223, 13, 14, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (224, 13, 15, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (225, 13, 16, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (226, 13, 17, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (227, 13, 18, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (228, 13, 19, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (229, 13, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (230, 13, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (231, 13, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (232, 13, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (233, 13, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (234, 13, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (235, 14, 15, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (236, 14, 16, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (237, 14, 17, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (238, 14, 18, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (239, 14, 19, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (240, 14, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (241, 14, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (242, 14, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (243, 14, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (244, 14, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (245, 14, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (246, 15, 16, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (247, 15, 17, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (248, 15, 18, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (249, 15, 19, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (250, 15, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (251, 15, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (252, 15, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (253, 15, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (254, 15, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (255, 15, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (256, 16, 17, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (257, 16, 18, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (258, 16, 19, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (259, 16, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (260, 16, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (261, 16, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (262, 16, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (263, 16, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (264, 16, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (265, 17, 18, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (266, 17, 19, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (267, 17, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (268, 17, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (269, 17, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (270, 17, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (271, 17, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (272, 17, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (273, 18, 19, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (274, 18, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (275, 18, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (276, 18, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (277, 18, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (278, 18, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (279, 18, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (280, 19, 20, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (281, 19, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (282, 19, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (283, 19, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (284, 19, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (285, 19, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (286, 20, 21, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (287, 20, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (288, 20, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (289, 20, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (290, 20, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (291, 21, 22, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (292, 21, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (293, 21, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (294, 21, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (295, 22, 23, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (296, 22, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (297, 22, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (298, 23, 24, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (299, 23, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
INSERT [dbo].[series] ([id_serie], [gr_01], [gr_02], [carencia], [qtde_premio], [mor_carencia], [pr_aplicacao], [status], [carencia_recap], [aux_carencia], [max_carencia]) VALUES (300, 24, 25, 0, 0, 0, 1, N'Processing_115', 0, 0, 0)
/****** Object:  Table [dbo].[resultados]    Script Date: 03/07/2012 11:28:56 ******/
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
/****** Object:  Table [dbo].[result_gp]    Script Date: 03/07/2012 11:28:56 ******/
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
/****** Object:  Table [dbo].[referencia]    Script Date: 03/07/2012 11:28:56 ******/
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
/****** Object:  Table [dbo].[recapitalizacao]    Script Date: 03/07/2012 11:28:56 ******/
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
/****** Object:  StoredProcedure [dbo].[Conta_Status]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Compara_Carencia]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Carrega_Series]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Carrega_Grupos]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  Table [dbo].[estatistica_premio]    Script Date: 03/07/2012 11:28:56 ******/
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
/****** Object:  Table [dbo].[estatistica_carencia]    Script Date: 03/07/2012 11:28:56 ******/
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
/****** Object:  StoredProcedure [dbo].[Add_Contabilidade]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[User_Contabilidade]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[StoredProcedure6]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[ZeraDebitosEDeducoes_Grupos]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Zera_Contadores]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Zera_Carencia_Recap]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Zera_Carencia]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[SomaDebito_Wait]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[SomaDebito_Proc]    Script Date: 03/07/2012 11:28:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SomaDebito_Proc]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SomaDebito_Proc]
AS
	BEGIN
		SELECT gr_01, gr_02, [status], carencia from series where status = ''Recap_Proc_01'' or status = ''Recap_Proc_02'' 
		or status = ''Recap_Proc_03'' or status = ''Recap_Proc_04'' or status = ''Recap_Proc_05'' or  status = ''Processing_115''		
	END
	RETURN
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Deleta_Contabilidade]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[ContaStatusEAgrupa]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Muda_Status]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Inserir_Registro_Series]    Script Date: 03/07/2012 11:28:42 ******/
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
		INSERT INTO SERIES (id_serie, gr_01, gr_02, carencia, qtde_premio, mor_carencia, 
							pr_aplicacao, status, carencia_recap, aux_carencia, max_carencia) VALUES 
						   (@id, @gr_01, @gr_02, @carencia, @qtde_premio, @mor_carencia, 
						    @pr_aplicacao, @status, @carencia_recap, @aux_carencia, @max_carencia)
	END
	RETURN' 
END
GO
/****** Object:  StoredProcedure [dbo].[Inicia_Status_Recap]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Aumenta_QtdePremio]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Aumenta_Carencia_Recap]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Aumenta_Carencia]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Exibe_Contabilidade]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Add_Estatistica_Premio]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Add_Estatistica_Carencia]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Deleta_Estatistica_Premio]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Deleta_Estatistica_Carencia]    Script Date: 03/07/2012 11:28:42 ******/
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
/****** Object:  Default [DF_banca_qtde_premio]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_banca_qtde_premio]') AND parent_object_id = OBJECT_ID(N'[dbo].[bancas]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_banca_qtde_premio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[bancas] ADD  CONSTRAINT [DF_banca_qtde_premio]  DEFAULT ((0)) FOR [qtde_premio]
END


End
GO
/****** Object:  Default [DF_banca_val_Total_premio]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_banca_val_Total_premio]') AND parent_object_id = OBJECT_ID(N'[dbo].[bancas]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_banca_val_Total_premio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[bancas] ADD  CONSTRAINT [DF_banca_val_Total_premio]  DEFAULT ((0)) FOR [val_Total_premio]
END


End
GO
/****** Object:  Default [DF_banca_carencia_aposta]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_banca_carencia_aposta]') AND parent_object_id = OBJECT_ID(N'[dbo].[bancas]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_banca_carencia_aposta]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[bancas] ADD  CONSTRAINT [DF_banca_carencia_aposta]  DEFAULT ((0)) FOR [carencia_aposta]
END


End
GO
/****** Object:  Default [DF_bancas_relacao_aposta_premio]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_bancas_relacao_aposta_premio]') AND parent_object_id = OBJECT_ID(N'[dbo].[bancas]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_bancas_relacao_aposta_premio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[bancas] ADD  CONSTRAINT [DF_bancas_relacao_aposta_premio]  DEFAULT ((0)) FOR [relacao_aposta_premio]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_debito_contabil]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_debito_contabil]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_debito_contabil]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_debito_contabil]  DEFAULT ((0)) FOR [debito_contabil]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_credito_contabil]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_credito_contabil]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_credito_contabil]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_credito_contabil]  DEFAULT ((0)) FOR [credito_contabil]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_credito_real]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_credito_real]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_credito_real]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_credito_real]  DEFAULT ((0)) FOR [credito_real]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_saldo_sb_contabil]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_saldo_sb_contabil]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_saldo_sb_contabil]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_saldo_sb_contabil]  DEFAULT ((0)) FOR [saldo_sb_contabil]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_saldo_sb_real]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_saldo_sb_real]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_saldo_sb_real]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_saldo_sb_real]  DEFAULT ((0)) FOR [saldo_sb_real]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_capital_subsidiario]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_capital_subsidiario]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_capital_subsidiario]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_capital_subsidiario]  DEFAULT ((0)) FOR [capital_subsidiario]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_saldo_contabil_acumulado]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_saldo_contabil_acumulado]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_saldo_contabil_acumulado]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_saldo_contabil_acumulado]  DEFAULT ((0)) FOR [saldo_contabil_acumulado]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_saldo_real_acumulado]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_saldo_real_acumulado]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_saldo_real_acumulado]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_saldo_real_acumulado]  DEFAULT ((0)) FOR [saldo_real_acumulado]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_QtdeSRAguardandoPremio]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_QtdeSRAguardandoPremio]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_QtdeSRAguardandoPremio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_QtdeSRAguardandoPremio]  DEFAULT ((0)) FOR [aguardandoPR]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_recapitalizando_01]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_recapitalizando_01]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_recapitalizando_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_recapitalizando_01]  DEFAULT ((0)) FOR [recapitalizando_01]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_recapitalizando_02]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_recapitalizando_02]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_recapitalizando_02]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_recapitalizando_02]  DEFAULT ((0)) FOR [recapitalizando_02]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_recapitalizando_03]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_recapitalizando_03]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_recapitalizando_03]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_recapitalizando_03]  DEFAULT ((0)) FOR [recapitalizando_03]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_recapitalizando_04]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_recapitalizando_04]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_recapitalizando_04]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_recapitalizando_04]  DEFAULT ((0)) FOR [recapitalizando_04]
END


End
GO
/****** Object:  Default [DF_controle_aplicacao_gp_subsidio]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_controle_aplicacao_gp_subsidio]') AND parent_object_id = OBJECT_ID(N'[dbo].[contabilidade]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_controle_aplicacao_gp_subsidio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[contabilidade] ADD  CONSTRAINT [DF_controle_aplicacao_gp_subsidio]  DEFAULT ((0)) FOR [subsidio]
END


End
GO
/****** Object:  Default [DF_estatistica_carencia_c13]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_estatistica_carencia_c13]') AND parent_object_id = OBJECT_ID(N'[dbo].[estatistica_carencia]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_estatistica_carencia_c13]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[estatistica_carencia] ADD  CONSTRAINT [DF_estatistica_carencia_c13]  DEFAULT ((0)) FOR [c13]
END


End
GO
/****** Object:  Default [DF_estatistica_carencia_c14]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_estatistica_carencia_c14]') AND parent_object_id = OBJECT_ID(N'[dbo].[estatistica_carencia]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_estatistica_carencia_c14]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[estatistica_carencia] ADD  CONSTRAINT [DF_estatistica_carencia_c14]  DEFAULT ((0)) FOR [c14]
END


End
GO
/****** Object:  Default [DF_estatistica_carencia_c15]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_estatistica_carencia_c15]') AND parent_object_id = OBJECT_ID(N'[dbo].[estatistica_carencia]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_estatistica_carencia_c15]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[estatistica_carencia] ADD  CONSTRAINT [DF_estatistica_carencia_c15]  DEFAULT ((0)) FOR [c15]
END


End
GO
/****** Object:  Default [DF_grupos_debito_previsto]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_grupos_debito_previsto]') AND parent_object_id = OBJECT_ID(N'[dbo].[grupos]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_grupos_debito_previsto]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[grupos] ADD  CONSTRAINT [DF_grupos_debito_previsto]  DEFAULT ((0)) FOR [debito_previsto]
END


End
GO
/****** Object:  Default [DF_grupos_deducao_por_mvtc]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_grupos_deducao_por_mvtc]') AND parent_object_id = OBJECT_ID(N'[dbo].[grupos]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_grupos_deducao_por_mvtc]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[grupos] ADD  CONSTRAINT [DF_grupos_deducao_por_mvtc]  DEFAULT ((0)) FOR [deducao_por_mvtc]
END


End
GO
/****** Object:  Default [DF_grupos_credito]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_grupos_credito]') AND parent_object_id = OBJECT_ID(N'[dbo].[grupos]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_grupos_credito]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[grupos] ADD  CONSTRAINT [DF_grupos_credito]  DEFAULT ((0)) FOR [credito]
END


End
GO
/****** Object:  Default [DF_grupos_deduzido_1]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_grupos_deduzido_1]') AND parent_object_id = OBJECT_ID(N'[dbo].[grupos]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_grupos_deduzido_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[grupos] ADD  CONSTRAINT [DF_grupos_deduzido_1]  DEFAULT ('N') FOR [deduzido]
END


End
GO
/****** Object:  Default [DF_indice_sb_atual]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_indice_sb_atual]') AND parent_object_id = OBJECT_ID(N'[dbo].[indice]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_indice_sb_atual]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[indice] ADD  CONSTRAINT [DF_indice_sb_atual]  DEFAULT ((1)) FOR [sb_atual]
END


End
GO
/****** Object:  Default [DF_postos_qtde_premio]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_postos_qtde_premio]') AND parent_object_id = OBJECT_ID(N'[dbo].[postos]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_postos_qtde_premio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[postos] ADD  CONSTRAINT [DF_postos_qtde_premio]  DEFAULT ((0)) FOR [qtde_premio]
END


End
GO
/****** Object:  Default [DF_postos_val_total_premio]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_postos_val_total_premio]') AND parent_object_id = OBJECT_ID(N'[dbo].[postos]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_postos_val_total_premio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[postos] ADD  CONSTRAINT [DF_postos_val_total_premio]  DEFAULT ((0)) FOR [val_total_premio]
END


End
GO
/****** Object:  Default [DF_postos_carencia_aposta]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_postos_carencia_aposta]') AND parent_object_id = OBJECT_ID(N'[dbo].[postos]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_postos_carencia_aposta]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[postos] ADD  CONSTRAINT [DF_postos_carencia_aposta]  DEFAULT ((0)) FOR [carencia_aposta]
END


End
GO
/****** Object:  Default [DF_postos_carencia_premio]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_postos_carencia_premio]') AND parent_object_id = OBJECT_ID(N'[dbo].[postos]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_postos_carencia_premio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[postos] ADD  CONSTRAINT [DF_postos_carencia_premio]  DEFAULT ((0)) FOR [carencia_premio]
END


End
GO
/****** Object:  Default [DF_postos_relacao_aposta_premio]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_postos_relacao_aposta_premio]') AND parent_object_id = OBJECT_ID(N'[dbo].[postos]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_postos_relacao_aposta_premio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[postos] ADD  CONSTRAINT [DF_postos_relacao_aposta_premio]  DEFAULT ((0)) FOR [relacao_aposta_premio]
END


End
GO
/****** Object:  Default [DF_series_carencia]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_series_carencia]') AND parent_object_id = OBJECT_ID(N'[dbo].[series]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_series_carencia]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[series] ADD  CONSTRAINT [DF_series_carencia]  DEFAULT ((0)) FOR [carencia]
END


End
GO
/****** Object:  Default [DF_series_qtde_premio]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_series_qtde_premio]') AND parent_object_id = OBJECT_ID(N'[dbo].[series]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_series_qtde_premio]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[series] ADD  CONSTRAINT [DF_series_qtde_premio]  DEFAULT ((0)) FOR [qtde_premio]
END


End
GO
/****** Object:  Default [DF_series_mor_carencia]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_series_mor_carencia]') AND parent_object_id = OBJECT_ID(N'[dbo].[series]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_series_mor_carencia]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[series] ADD  CONSTRAINT [DF_series_mor_carencia]  DEFAULT ((0)) FOR [mor_carencia]
END


End
GO
/****** Object:  Default [DF_series_pr_aplicacao]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_series_pr_aplicacao]') AND parent_object_id = OBJECT_ID(N'[dbo].[series]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_series_pr_aplicacao]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[series] ADD  CONSTRAINT [DF_series_pr_aplicacao]  DEFAULT ((1)) FOR [pr_aplicacao]
END


End
GO
/****** Object:  Default [DF_series_carencia_recap]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_series_carencia_recap]') AND parent_object_id = OBJECT_ID(N'[dbo].[series]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_series_carencia_recap]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[series] ADD  CONSTRAINT [DF_series_carencia_recap]  DEFAULT ((0)) FOR [carencia_recap]
END


End
GO
/****** Object:  Default [DF_series_aux_carencia]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_series_aux_carencia]') AND parent_object_id = OBJECT_ID(N'[dbo].[series]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_series_aux_carencia]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[series] ADD  CONSTRAINT [DF_series_aux_carencia]  DEFAULT ((0)) FOR [aux_carencia]
END


End
GO
/****** Object:  Default [DF_series_max_carencia]    Script Date: 03/07/2012 11:28:56 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_series_max_carencia]') AND parent_object_id = OBJECT_ID(N'[dbo].[series]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_series_max_carencia]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[series] ADD  CONSTRAINT [DF_series_max_carencia]  DEFAULT ((0)) FOR [max_carencia]
END


End
GO
/****** Object:  ForeignKey [FK_estatistica_carencia_contabilidade]    Script Date: 03/07/2012 11:28:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_estatistica_carencia_contabilidade]') AND parent_object_id = OBJECT_ID(N'[dbo].[estatistica_carencia]'))
ALTER TABLE [dbo].[estatistica_carencia]  WITH CHECK ADD  CONSTRAINT [FK_estatistica_carencia_contabilidade] FOREIGN KEY([id_estatistica_carencia])
REFERENCES [dbo].[contabilidade] ([id_aplicacao])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_estatistica_carencia_contabilidade]') AND parent_object_id = OBJECT_ID(N'[dbo].[estatistica_carencia]'))
ALTER TABLE [dbo].[estatistica_carencia] CHECK CONSTRAINT [FK_estatistica_carencia_contabilidade]
GO
/****** Object:  ForeignKey [FK_estatistica_premio_contabilidade]    Script Date: 03/07/2012 11:28:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_estatistica_premio_contabilidade]') AND parent_object_id = OBJECT_ID(N'[dbo].[estatistica_premio]'))
ALTER TABLE [dbo].[estatistica_premio]  WITH CHECK ADD  CONSTRAINT [FK_estatistica_premio_contabilidade] FOREIGN KEY([id_estatistica_premio])
REFERENCES [dbo].[contabilidade] ([id_aplicacao])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_estatistica_premio_contabilidade]') AND parent_object_id = OBJECT_ID(N'[dbo].[estatistica_premio]'))
ALTER TABLE [dbo].[estatistica_premio] CHECK CONSTRAINT [FK_estatistica_premio_contabilidade]
GO
/****** Object:  ForeignKey [FK_recapitalizacao_contabilidade]    Script Date: 03/07/2012 11:28:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_recapitalizacao_contabilidade]') AND parent_object_id = OBJECT_ID(N'[dbo].[recapitalizacao]'))
ALTER TABLE [dbo].[recapitalizacao]  WITH CHECK ADD  CONSTRAINT [FK_recapitalizacao_contabilidade] FOREIGN KEY([id_recapitalizacao])
REFERENCES [dbo].[contabilidade] ([id_aplicacao])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_recapitalizacao_contabilidade]') AND parent_object_id = OBJECT_ID(N'[dbo].[recapitalizacao]'))
ALTER TABLE [dbo].[recapitalizacao] CHECK CONSTRAINT [FK_recapitalizacao_contabilidade]
GO
