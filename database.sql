USE [DEPORTES_CRESPO_TP]
GO
/****** Object:  Table [dbo].[ACTIVIDAD]    Script Date: 11/15/2019 8:32:17 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HORARIO]    Script Date: 11/15/2019 8:32:17 AM ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOCACION]    Script Date: 11/15/2019 8:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOCACION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Actividad_Tipo] [int] NULL,
	[descripcion] [varchar](125) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 11/15/2019 8:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SOCIOS]    Script Date: 11/15/2019 8:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposActividad]    Script Date: 11/15/2019 8:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposActividad](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposSubscripcion]    Script Date: 11/15/2019 8:32:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposSubscripcion](
	[id_subscripcion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK__TiposSub__6B385FA0B680AE97] PRIMARY KEY CLUSTERED 
(
	[id_subscripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[HORARIO] ON 

INSERT [dbo].[HORARIO] ([id], [horaInicio], [horaFin], [fechaFinActividad], [fechaInicioActividad], [cupo], [cantInscriptos], [lunes], [martes], [miercoles], [jueves], [viernes], [sabado], [domingo]) VALUES (1, CAST(N'2019-11-09T08:00:00.000' AS DateTime), CAST(N'2019-11-09T10:00:00.000' AS DateTime), CAST(N'2019-11-19T00:00:00.000' AS DateTime), CAST(N'2019-06-11T00:00:00.000' AS DateTime), 6, 0, 1, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[HORARIO] ([id], [horaInicio], [horaFin], [fechaFinActividad], [fechaInicioActividad], [cupo], [cantInscriptos], [lunes], [martes], [miercoles], [jueves], [viernes], [sabado], [domingo]) VALUES (2, CAST(N'2019-11-09T08:00:00.000' AS DateTime), CAST(N'2019-11-09T09:00:00.000' AS DateTime), CAST(N'2019-11-15T00:00:00.000' AS DateTime), CAST(N'2019-11-04T00:00:00.000' AS DateTime), 6, 0, 1, 1, 1, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[HORARIO] OFF
SET IDENTITY_INSERT [dbo].[LOCACION] ON 

INSERT [dbo].[LOCACION] ([ID], [ID_Actividad_Tipo], [descripcion]) VALUES (1, 1, N'Cancha 1')
SET IDENTITY_INSERT [dbo].[LOCACION] OFF
SET IDENTITY_INSERT [dbo].[Profesor] ON 

INSERT [dbo].[Profesor] ([ID], [nombre], [dni], [telefono], [email], [ID_Actividad_Tipo]) VALUES (1, N'Jorge Diaz', N'36552262', N'1533225566', N'jorgedias@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Profesor] OFF
SET IDENTITY_INSERT [dbo].[SOCIOS] ON 

INSERT [dbo].[SOCIOS] ([id], [id_tiposSubscripcion], [dni], [nombre], [apellido], [telefono], [email], [pwd]) VALUES (1, 1, N'32036612', N'Francisco', N'Crespo', N'1531178288', N'gpacomail@gmail.com', N'Shinobu1')
SET IDENTITY_INSERT [dbo].[SOCIOS] OFF
SET IDENTITY_INSERT [dbo].[TiposActividad] ON 

INSERT [dbo].[TiposActividad] ([ID], [descripcion]) VALUES (1, N'Football')
INSERT [dbo].[TiposActividad] ([ID], [descripcion]) VALUES (5, N'Natacion')
INSERT [dbo].[TiposActividad] ([ID], [descripcion]) VALUES (7, N'Rugby')
INSERT [dbo].[TiposActividad] ([ID], [descripcion]) VALUES (3, N'Tennis')
SET IDENTITY_INSERT [dbo].[TiposActividad] OFF
SET IDENTITY_INSERT [dbo].[TiposSubscripcion] ON 

INSERT [dbo].[TiposSubscripcion] ([id_subscripcion], [descripcion]) VALUES (1, N'Vitalicio')
SET IDENTITY_INSERT [dbo].[TiposSubscripcion] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__LOCACION__298336B6BA7B7F73]    Script Date: 11/15/2019 8:32:18 AM ******/
ALTER TABLE [dbo].[LOCACION] ADD UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Profesor__72AFBCC63CFB2912]    Script Date: 11/15/2019 8:32:18 AM ******/
ALTER TABLE [dbo].[Profesor] ADD UNIQUE NONCLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Profesor__AB6E61640226C8E3]    Script Date: 11/15/2019 8:32:18 AM ******/
ALTER TABLE [dbo].[Profesor] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Profesor__D87608A780F85A03]    Script Date: 11/15/2019 8:32:18 AM ******/
ALTER TABLE [dbo].[Profesor] ADD UNIQUE NONCLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TiposAct__298336B6A151D159]    Script Date: 11/15/2019 8:32:18 AM ******/
ALTER TABLE [dbo].[TiposActividad] ADD UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TiposSub__298336B6D6DEB822]    Script Date: 11/15/2019 8:32:18 AM ******/
ALTER TABLE [dbo].[TiposSubscripcion] ADD  CONSTRAINT [UQ__TiposSub__298336B6D6DEB822] UNIQUE NONCLUSTERED 
(
	[descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD FOREIGN KEY([id_actividad_tipo])
REFERENCES [dbo].[TiposActividad] ([ID])
GO
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD FOREIGN KEY([id_horario])
REFERENCES [dbo].[HORARIO] ([id])
GO
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD FOREIGN KEY([id_locacion])
REFERENCES [dbo].[LOCACION] ([ID])
GO
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD FOREIGN KEY([id_profesor])
REFERENCES [dbo].[Profesor] ([ID])
GO
ALTER TABLE [dbo].[LOCACION]  WITH CHECK ADD FOREIGN KEY([ID_Actividad_Tipo])
REFERENCES [dbo].[TiposActividad] ([ID])
GO
ALTER TABLE [dbo].[Profesor]  WITH CHECK ADD FOREIGN KEY([ID_Actividad_Tipo])
REFERENCES [dbo].[TiposActividad] ([ID])
GO
ALTER TABLE [dbo].[SOCIOS]  WITH CHECK ADD FOREIGN KEY([id_tiposSubscripcion])
REFERENCES [dbo].[TiposSubscripcion] ([id_subscripcion])
GO
