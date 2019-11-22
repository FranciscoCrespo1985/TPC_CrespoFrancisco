USE [master]
GO
/****** Object:  Database [DEPORTES_CRESPO_TP]    Script Date: 11/22/2019 16:57:19 ******/
CREATE DATABASE [DEPORTES_CRESPO_TP] ON  PRIMARY 
( NAME = N'DEPORTES_CRESPO_TP', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\DEPORTES_CRESPO_TP.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DEPORTES_CRESPO_TP_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\DEPORTES_CRESPO_TP_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DEPORTES_CRESPO_TP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET ANSI_NULLS OFF
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET ANSI_PADDING OFF
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET ARITHABORT OFF
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET AUTO_CLOSE ON
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET  ENABLE_BROKER
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET  READ_WRITE
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET RECOVERY SIMPLE
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET  MULTI_USER
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [DEPORTES_CRESPO_TP] SET DB_CHAINING OFF
GO
USE [DEPORTES_CRESPO_TP]
GO
/****** Object:  Table [dbo].[TiposSubscripcion]    Script Date: 11/22/2019 16:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposSubscripcion](
	[id_subscripcion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK__TiposSub__6B385FA0B680AE97] PRIMARY KEY CLUSTERED 
(
	[id_subscripcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ__TiposSub__298336B6D6DEB822] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TiposSubscripcion] ON
INSERT [dbo].[TiposSubscripcion] ([id_subscripcion], [descripcion]) VALUES (1, N'Vitalicio')
SET IDENTITY_INSERT [dbo].[TiposSubscripcion] OFF
/****** Object:  Table [dbo].[TiposActividad]    Script Date: 11/22/2019 16:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposActividad](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TiposActividad] ON
INSERT [dbo].[TiposActividad] ([ID], [descripcion]) VALUES (1, N'Football')
INSERT [dbo].[TiposActividad] ([ID], [descripcion]) VALUES (5, N'Natacion')
INSERT [dbo].[TiposActividad] ([ID], [descripcion]) VALUES (7, N'Rugby')
INSERT [dbo].[TiposActividad] ([ID], [descripcion]) VALUES (3, N'Tennis')
SET IDENTITY_INSERT [dbo].[TiposActividad] OFF
/****** Object:  Table [dbo].[SOCIOS]    Script Date: 11/22/2019 16:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SOCIOS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_tiposSubscripcion] [int] NULL,
	[dni] [varchar](15) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[apellido] [varchar](255) NOT NULL,
	[telefono] [varchar](70) NULL,
	[email] [varchar](255) NOT NULL,
	[pwd] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[SOCIOS] ON
INSERT [dbo].[SOCIOS] ([id], [id_tiposSubscripcion], [dni], [nombre], [apellido], [telefono], [email], [pwd]) VALUES (1, 1, N'32036612', N'Francisco', N'Crespo', N'1531178288', N'gpacomail@gmail.com', N'Shinobu1')
SET IDENTITY_INSERT [dbo].[SOCIOS] OFF
/****** Object:  Table [dbo].[Profesor]    Script Date: 11/22/2019 16:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Profesor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[dni] [varchar](15) NOT NULL,
	[telefono] [varchar](70) NULL,
	[email] [varchar](255) NOT NULL,
	[ID_Actividad_Tipo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Profesor] ON
INSERT [dbo].[Profesor] ([ID], [nombre], [dni], [telefono], [email], [ID_Actividad_Tipo]) VALUES (1, N'Jorge Diaz', N'36552262', N'1533225566', N'jorgedias@gmail.com', 1)
INSERT [dbo].[Profesor] ([ID], [nombre], [dni], [telefono], [email], [ID_Actividad_Tipo]) VALUES (2, N'Bernardo', N'15222222223', N'1531448552', N'bernardobenbene@gmailo.com', 5)
INSERT [dbo].[Profesor] ([ID], [nombre], [dni], [telefono], [email], [ID_Actividad_Tipo]) VALUES (3, N'Raul', N'200036', N'4799666', N'raulexpresi@argetina.com', 7)
SET IDENTITY_INSERT [dbo].[Profesor] OFF
/****** Object:  Table [dbo].[LOCACION]    Script Date: 11/22/2019 16:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOCACION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Actividad_Tipo] [int] NULL,
	[descripcion] [varchar](125) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [cancha_unica] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC,
	[ID_Actividad_Tipo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[LOCACION] ON
INSERT [dbo].[LOCACION] ([ID], [ID_Actividad_Tipo], [descripcion]) VALUES (1, 1, N'Cancha 1')
INSERT [dbo].[LOCACION] ([ID], [ID_Actividad_Tipo], [descripcion]) VALUES (5, 3, N'Cancha 1')
INSERT [dbo].[LOCACION] ([ID], [ID_Actividad_Tipo], [descripcion]) VALUES (2, 7, N'Cancha 1')
INSERT [dbo].[LOCACION] ([ID], [ID_Actividad_Tipo], [descripcion]) VALUES (4, 1, N'Cancha 2')
INSERT [dbo].[LOCACION] ([ID], [ID_Actividad_Tipo], [descripcion]) VALUES (6, 3, N'Cancha 2')
INSERT [dbo].[LOCACION] ([ID], [ID_Actividad_Tipo], [descripcion]) VALUES (7, 3, N'Cancha 3')
INSERT [dbo].[LOCACION] ([ID], [ID_Actividad_Tipo], [descripcion]) VALUES (9, 5, N'Pileta Chica')
INSERT [dbo].[LOCACION] ([ID], [ID_Actividad_Tipo], [descripcion]) VALUES (8, 5, N'Pileta Grande')
SET IDENTITY_INSERT [dbo].[LOCACION] OFF
/****** Object:  Table [dbo].[HORARIO]    Script Date: 11/22/2019 16:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HORARIO](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[horaInicio] [datetime] NOT NULL,
	[horaFin] [datetime] NOT NULL,
	[fechaFinActividad] [datetime] NOT NULL,
	[fechaInicioActividad] [datetime] NOT NULL,
	[cupo] [int] NOT NULL,
	[cantInscriptos] [int] NOT NULL,
	[lunes] [bit] NOT NULL,
	[martes] [bit] NOT NULL,
	[miercoles] [bit] NOT NULL,
	[jueves] [bit] NOT NULL,
	[viernes] [bit] NOT NULL,
	[sabado] [bit] NOT NULL,
	[domingo] [bit] NOT NULL,
	[locacion_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HORARIO] ON
INSERT [dbo].[HORARIO] ([id], [horaInicio], [horaFin], [fechaFinActividad], [fechaInicioActividad], [cupo], [cantInscriptos], [lunes], [martes], [miercoles], [jueves], [viernes], [sabado], [domingo], [locacion_id]) VALUES (4, CAST(0x0000AB0C0083D600 AS DateTime), CAST(0x0000AB0C00A4CB80 AS DateTime), CAST(0x0000AC6600000000 AS DateTime), CAST(0x0000AB3500000000 AS DateTime), 40, 0, 0, 1, 0, 1, 0, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[HORARIO] OFF
/****** Object:  Table [dbo].[ACTIVIDAD]    Script Date: 11/22/2019 16:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACTIVIDAD](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_profesor] [int] NULL,
	[id_actividad_tipo] [int] NOT NULL,
	[id_horario] [bigint] NOT NULL,
	[id_locacion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ACTIVIDAD] ON
INSERT [dbo].[ACTIVIDAD] ([id], [id_profesor], [id_actividad_tipo], [id_horario], [id_locacion]) VALUES (1, 1, 1, 4, 1)
SET IDENTITY_INSERT [dbo].[ACTIVIDAD] OFF
/****** Object:  ForeignKey [FK__SOCIOS__id_tipos__286302EC]    Script Date: 11/22/2019 16:57:20 ******/
ALTER TABLE [dbo].[SOCIOS]  WITH CHECK ADD FOREIGN KEY([id_tiposSubscripcion])
REFERENCES [dbo].[TiposSubscripcion] ([id_subscripcion])
GO
/****** Object:  ForeignKey [FK__Profesor__ID_Act__276EDEB3]    Script Date: 11/22/2019 16:57:20 ******/
ALTER TABLE [dbo].[Profesor]  WITH CHECK ADD FOREIGN KEY([ID_Actividad_Tipo])
REFERENCES [dbo].[TiposActividad] ([ID])
GO
/****** Object:  ForeignKey [FK__LOCACION__ID_Act__267ABA7A]    Script Date: 11/22/2019 16:57:20 ******/
ALTER TABLE [dbo].[LOCACION]  WITH CHECK ADD FOREIGN KEY([ID_Actividad_Tipo])
REFERENCES [dbo].[TiposActividad] ([ID])
GO
/****** Object:  ForeignKey [FK__HORARIO__locacio__36B12243]    Script Date: 11/22/2019 16:57:20 ******/
ALTER TABLE [dbo].[HORARIO]  WITH CHECK ADD FOREIGN KEY([locacion_id])
REFERENCES [dbo].[LOCACION] ([ID])
GO
/****** Object:  ForeignKey [FK__ACTIVIDAD__id_ac__22AA2996]    Script Date: 11/22/2019 16:57:20 ******/
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD FOREIGN KEY([id_actividad_tipo])
REFERENCES [dbo].[TiposActividad] ([ID])
GO
/****** Object:  ForeignKey [FK__ACTIVIDAD__id_ho__239E4DCF]    Script Date: 11/22/2019 16:57:20 ******/
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD FOREIGN KEY([id_horario])
REFERENCES [dbo].[HORARIO] ([id])
GO
/****** Object:  ForeignKey [FK__ACTIVIDAD__id_lo__24927208]    Script Date: 11/22/2019 16:57:20 ******/
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD FOREIGN KEY([id_locacion])
REFERENCES [dbo].[LOCACION] ([ID])
GO
/****** Object:  ForeignKey [FK__ACTIVIDAD__id_pr__25869641]    Script Date: 11/22/2019 16:57:20 ******/
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD FOREIGN KEY([id_profesor])
REFERENCES [dbo].[Profesor] ([ID])
GO
