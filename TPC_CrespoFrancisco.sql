USE [DEPORTES_CRESPO_TP]
GO
/****** Object:  Table [dbo].[TiposSubscripcion]    Script Date: 11/08/2019 21:09:46 ******/
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
/****** Object:  Table [dbo].[TiposActividad]    Script Date: 11/08/2019 21:09:46 ******/
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
/****** Object:  Table [dbo].[SOCIOS]    Script Date: 11/08/2019 21:09:46 ******/
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
INSERT [dbo].[SOCIOS] ([id], [id_tiposSubscripcion], [dni], [nombre], [apellido], [telefono], [email], [pwd]) VALUES (2, 1, N'41956008', N'Cristrian', N'Rodrigrues', N'1564436027', N'christiansrodriguez99@gmail.com', N'elgato2')
SET IDENTITY_INSERT [dbo].[SOCIOS] OFF
/****** Object:  Table [dbo].[Profesor]    Script Date: 11/08/2019 21:09:46 ******/
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
SET IDENTITY_INSERT [dbo].[Profesor] OFF
/****** Object:  Table [dbo].[LOCACION]    Script Date: 11/08/2019 21:09:46 ******/
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
UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[LOCACION] ON
INSERT [dbo].[LOCACION] ([ID], [ID_Actividad_Tipo], [descripcion]) VALUES (1, 1, N'Cancha 1')
SET IDENTITY_INSERT [dbo].[LOCACION] OFF
/****** Object:  ForeignKey [FK__LOCACION__ID_Act__1DE57479]    Script Date: 11/08/2019 21:09:46 ******/
ALTER TABLE [dbo].[LOCACION]  WITH CHECK ADD FOREIGN KEY([ID_Actividad_Tipo])
REFERENCES [dbo].[TiposActividad] ([ID])
GO
/****** Object:  ForeignKey [FK__Profesor__ID_Act__1ED998B2]    Script Date: 11/08/2019 21:09:46 ******/
ALTER TABLE [dbo].[Profesor]  WITH CHECK ADD FOREIGN KEY([ID_Actividad_Tipo])
REFERENCES [dbo].[TiposActividad] ([ID])
GO
/****** Object:  ForeignKey [FK__SOCIOS__id_tipos__1FCDBCEB]    Script Date: 11/08/2019 21:09:46 ******/
ALTER TABLE [dbo].[SOCIOS]  WITH CHECK ADD FOREIGN KEY([id_tiposSubscripcion])
REFERENCES [dbo].[TiposSubscripcion] ([id_subscripcion])
GO
