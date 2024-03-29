USE [DEPORTES_CRESPO_TP]
GO
/****** Object:  Table [dbo].[TiposSubscripcion]    Script Date: 12/06/2019 20:30:58 ******/
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
INSERT [dbo].[TiposSubscripcion] ([id_subscripcion], [descripcion]) VALUES (2, N'Administrador')
INSERT [dbo].[TiposSubscripcion] ([id_subscripcion], [descripcion]) VALUES (1, N'Vitalicio')
SET IDENTITY_INSERT [dbo].[TiposSubscripcion] OFF
/****** Object:  Table [dbo].[TiposActividad]    Script Date: 12/06/2019 20:30:58 ******/
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
INSERT [dbo].[TiposActividad] ([ID], [descripcion]) VALUES (8, N'Football infantil')
INSERT [dbo].[TiposActividad] ([ID], [descripcion]) VALUES (5, N'Natacion')
INSERT [dbo].[TiposActividad] ([ID], [descripcion]) VALUES (7, N'Rugby')
INSERT [dbo].[TiposActividad] ([ID], [descripcion]) VALUES (3, N'Tennis')
SET IDENTITY_INSERT [dbo].[TiposActividad] OFF
/****** Object:  Table [dbo].[SOCIOS]    Script Date: 12/06/2019 20:30:58 ******/
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
INSERT [dbo].[SOCIOS] ([id], [id_tiposSubscripcion], [dni], [nombre], [apellido], [telefono], [email], [pwd]) VALUES (1, 2, N'32036612', N'Francisco', N'Crespo', N'1531178288', N'gpacomail@gmail.com', N'Shinobu1')
INSERT [dbo].[SOCIOS] ([id], [id_tiposSubscripcion], [dni], [nombre], [apellido], [telefono], [email], [pwd]) VALUES (2, 1, N'32036621', N'Lucas', N'Vitale', N'1531172852', N'lucasvitale@gmail.com', N'Shinobu1')
INSERT [dbo].[SOCIOS] ([id], [id_tiposSubscripcion], [dni], [nombre], [apellido], [telefono], [email], [pwd]) VALUES (3, 1, N'5555555', N'Javier', N'Pereyra', N'152226366655', N'javier.pereyra183@gmail.com', N'12345')
INSERT [dbo].[SOCIOS] ([id], [id_tiposSubscripcion], [dni], [nombre], [apellido], [telefono], [email], [pwd]) VALUES (8, 1, N'156662366', N'Rago', N'Pablo', N'152236662', N'ragopablo@gmail.com', N'asdf')
INSERT [dbo].[SOCIOS] ([id], [id_tiposSubscripcion], [dni], [nombre], [apellido], [telefono], [email], [pwd]) VALUES (9, 1, N'32036612', N'Maxi', N'Lopez', N'66623662', N'maxman@gmail.com', N'1234')
INSERT [dbo].[SOCIOS] ([id], [id_tiposSubscripcion], [dni], [nombre], [apellido], [telefono], [email], [pwd]) VALUES (10, 1, N'22342', N'esteban', N'l', N'153226', N'estaban@gmail.com', N'1234')
INSERT [dbo].[SOCIOS] ([id], [id_tiposSubscripcion], [dni], [nombre], [apellido], [telefono], [email], [pwd]) VALUES (11, 1, N'3202252', N'raul', N'asdfasd', N'12345', N'maxi@gmail.com', N'1234')
SET IDENTITY_INSERT [dbo].[SOCIOS] OFF
/****** Object:  Table [dbo].[Profesor]    Script Date: 12/06/2019 20:30:58 ******/
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
INSERT [dbo].[Profesor] ([ID], [nombre], [dni], [telefono], [email], [ID_Actividad_Tipo]) VALUES (3, N'Raul', N'200036', N'4799666', N'raulexpresi@argetina.com', 7)
INSERT [dbo].[Profesor] ([ID], [nombre], [dni], [telefono], [email], [ID_Actividad_Tipo]) VALUES (4, N'Ricardo', N'15003236', N'1537782882', N'maariosalso@gmail.com', 3)
INSERT [dbo].[Profesor] ([ID], [nombre], [dni], [telefono], [email], [ID_Actividad_Tipo]) VALUES (6, N'Marcos', N'34522266', N'22036652', N'marcosmendoza@gmail.com', 5)
INSERT [dbo].[Profesor] ([ID], [nombre], [dni], [telefono], [email], [ID_Actividad_Tipo]) VALUES (7, N'Melina', N'15223662', N'153115266', N'mlagarta@gmail.com', 8)
SET IDENTITY_INSERT [dbo].[Profesor] OFF
/****** Object:  Table [dbo].[LOCACION]    Script Date: 12/06/2019 20:30:58 ******/
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
INSERT [dbo].[LOCACION] ([ID], [ID_Actividad_Tipo], [descripcion]) VALUES (14, 7, N'Cancha 2')
INSERT [dbo].[LOCACION] ([ID], [ID_Actividad_Tipo], [descripcion]) VALUES (13, 8, N'Cancha 2')
INSERT [dbo].[LOCACION] ([ID], [ID_Actividad_Tipo], [descripcion]) VALUES (11, 1, N'Cancha 3')
INSERT [dbo].[LOCACION] ([ID], [ID_Actividad_Tipo], [descripcion]) VALUES (12, 8, N'Cancha infantil 1')
INSERT [dbo].[LOCACION] ([ID], [ID_Actividad_Tipo], [descripcion]) VALUES (9, 5, N'Pileta Chica')
INSERT [dbo].[LOCACION] ([ID], [ID_Actividad_Tipo], [descripcion]) VALUES (10, 5, N'Pileta Grande')
SET IDENTITY_INSERT [dbo].[LOCACION] OFF
/****** Object:  Table [dbo].[HORARIO]    Script Date: 12/06/2019 20:30:58 ******/
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
INSERT [dbo].[HORARIO] ([id], [horaInicio], [horaFin], [fechaFinActividad], [fechaInicioActividad], [cupo], [cantInscriptos], [lunes], [martes], [miercoles], [jueves], [viernes], [sabado], [domingo], [locacion_id]) VALUES (4, CAST(0x0000AB0C0083D600 AS DateTime), CAST(0x0000AB0C00A4CB80 AS DateTime), CAST(0x0000AC6600000000 AS DateTime), CAST(0x0000AB3500000000 AS DateTime), 40, 0, 0, 1, 0, 1, 0, 0, 1, 1)
INSERT [dbo].[HORARIO] ([id], [horaInicio], [horaFin], [fechaFinActividad], [fechaInicioActividad], [cupo], [cantInscriptos], [lunes], [martes], [miercoles], [jueves], [viernes], [sabado], [domingo], [locacion_id]) VALUES (5, CAST(0x0000AB0D00A4CB80 AS DateTime), CAST(0x0000AB0D00C5C100 AS DateTime), CAST(0x0000AC6A00000000 AS DateTime), CAST(0x0000AAFA00000000 AS DateTime), 1, 0, 0, 1, 0, 1, 0, 0, 0, 2)
INSERT [dbo].[HORARIO] ([id], [horaInicio], [horaFin], [fechaFinActividad], [fechaInicioActividad], [cupo], [cantInscriptos], [lunes], [martes], [miercoles], [jueves], [viernes], [sabado], [domingo], [locacion_id]) VALUES (6, CAST(0x0000AB15009450C0 AS DateTime), CAST(0x0000AB150128A180 AS DateTime), CAST(0x0000AB3400000000 AS DateTime), CAST(0x0000AAF800000000 AS DateTime), 50, 0, 0, 1, 0, 1, 1, 1, 1, 9)
INSERT [dbo].[HORARIO] ([id], [horaInicio], [horaFin], [fechaFinActividad], [fechaInicioActividad], [cupo], [cantInscriptos], [lunes], [martes], [miercoles], [jueves], [viernes], [sabado], [domingo], [locacion_id]) VALUES (8, CAST(0x0000AB150083D600 AS DateTime), CAST(0x0000AB1500EEF3E0 AS DateTime), CAST(0x0000A99700000000 AS DateTime), CAST(0x00009CB600000000 AS DateTime), 25, 0, 1, 1, 1, 1, 1, 0, 1, 1)
INSERT [dbo].[HORARIO] ([id], [horaInicio], [horaFin], [fechaFinActividad], [fechaInicioActividad], [cupo], [cantInscriptos], [lunes], [martes], [miercoles], [jueves], [viernes], [sabado], [domingo], [locacion_id]) VALUES (12, CAST(0x0000AB160083D600 AS DateTime), CAST(0x0000AB1600A4CB80 AS DateTime), CAST(0x0000AB1B00000000 AS DateTime), CAST(0x0000AB1700000000 AS DateTime), 3, 2, 0, 1, 0, 0, 0, 0, 0, 4)
INSERT [dbo].[HORARIO] ([id], [horaInicio], [horaFin], [fechaFinActividad], [fechaInicioActividad], [cupo], [cantInscriptos], [lunes], [martes], [miercoles], [jueves], [viernes], [sabado], [domingo], [locacion_id]) VALUES (13, CAST(0x0000AB1B00C5C100 AS DateTime), CAST(0x0000AB1B00E6B680 AS DateTime), CAST(0x0000AB8F00000000 AS DateTime), CAST(0x0000AB3500000000 AS DateTime), 22, 0, 0, 0, 0, 0, 0, 1, 1, 11)
INSERT [dbo].[HORARIO] ([id], [horaInicio], [horaFin], [fechaFinActividad], [fechaInicioActividad], [cupo], [cantInscriptos], [lunes], [martes], [miercoles], [jueves], [viernes], [sabado], [domingo], [locacion_id]) VALUES (14, CAST(0x0000AB1B0083D600 AS DateTime), CAST(0x0000AB1B00C5C100 AS DateTime), CAST(0x0000AA2100000000 AS DateTime), CAST(0x0000AB1600000000 AS DateTime), 40, 1, 1, 1, 1, 1, 1, 0, 0, 12)
INSERT [dbo].[HORARIO] ([id], [horaInicio], [horaFin], [fechaFinActividad], [fechaInicioActividad], [cupo], [cantInscriptos], [lunes], [martes], [miercoles], [jueves], [viernes], [sabado], [domingo], [locacion_id]) VALUES (15, CAST(0x0000AB1B01499700 AS DateTime), CAST(0x0000AB1B01624F20 AS DateTime), CAST(0x0000ACA200000000 AS DateTime), CAST(0x0000AB3500000000 AS DateTime), 60, 0, 1, 0, 1, 0, 1, 0, 0, 1)
INSERT [dbo].[HORARIO] ([id], [horaInicio], [horaFin], [fechaFinActividad], [fechaInicioActividad], [cupo], [cantInscriptos], [lunes], [martes], [miercoles], [jueves], [viernes], [sabado], [domingo], [locacion_id]) VALUES (16, CAST(0x0000AB1B0128A180 AS DateTime), CAST(0x0000AB1B016A8C80 AS DateTime), CAST(0x0000AC8400000000 AS DateTime), CAST(0x0000AB3500000000 AS DateTime), 120, 0, 0, 0, 0, 0, 0, 1, 0, 14)
INSERT [dbo].[HORARIO] ([id], [horaInicio], [horaFin], [fechaFinActividad], [fechaInicioActividad], [cupo], [cantInscriptos], [lunes], [martes], [miercoles], [jueves], [viernes], [sabado], [domingo], [locacion_id]) VALUES (17, CAST(0x0000AB1B0083D600 AS DateTime), CAST(0x0000AB1B00C5C100 AS DateTime), CAST(0x0000ACA200000000 AS DateTime), CAST(0x0000AB3500000000 AS DateTime), 36, 0, 0, 0, 0, 0, 0, 1, 1, 12)
SET IDENTITY_INSERT [dbo].[HORARIO] OFF
/****** Object:  Table [dbo].[ACTIVIDAD]    Script Date: 12/06/2019 20:30:58 ******/
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
INSERT [dbo].[ACTIVIDAD] ([id], [id_profesor], [id_actividad_tipo], [id_horario], [id_locacion]) VALUES (4, 1, 1, 8, 1)
INSERT [dbo].[ACTIVIDAD] ([id], [id_profesor], [id_actividad_tipo], [id_horario], [id_locacion]) VALUES (5, 1, 1, 12, 4)
INSERT [dbo].[ACTIVIDAD] ([id], [id_profesor], [id_actividad_tipo], [id_horario], [id_locacion]) VALUES (6, 1, 1, 4, 1)
INSERT [dbo].[ACTIVIDAD] ([id], [id_profesor], [id_actividad_tipo], [id_horario], [id_locacion]) VALUES (7, 7, 8, 14, 12)
INSERT [dbo].[ACTIVIDAD] ([id], [id_profesor], [id_actividad_tipo], [id_horario], [id_locacion]) VALUES (8, 3, 7, 5, 2)
SET IDENTITY_INSERT [dbo].[ACTIVIDAD] OFF
/****** Object:  Table [dbo].[INSCRIPCIONES]    Script Date: 12/06/2019 20:30:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INSCRIPCIONES](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_socio] [int] NOT NULL,
	[id_actividad] [int] NOT NULL,
	[fecha_inscripcion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[id_socio] ASC,
	[id_actividad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[INSCRIPCIONES] ON
INSERT [dbo].[INSCRIPCIONES] ([id], [id_socio], [id_actividad], [fecha_inscripcion]) VALUES (17, 1, 5, CAST(0x0000AA6A0112AC04 AS DateTime))
INSERT [dbo].[INSCRIPCIONES] ([id], [id_socio], [id_actividad], [fecha_inscripcion]) VALUES (18, 3, 7, CAST(0x0000AA6A0113B284 AS DateTime))
INSERT [dbo].[INSCRIPCIONES] ([id], [id_socio], [id_actividad], [fecha_inscripcion]) VALUES (19, 11, 5, CAST(0x0000AA6A014D177C AS DateTime))
SET IDENTITY_INSERT [dbo].[INSCRIPCIONES] OFF
/****** Object:  ForeignKey [FK__ACTIVIDAD__id_ac__22AA2996]    Script Date: 12/06/2019 20:30:58 ******/
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD FOREIGN KEY([id_actividad_tipo])
REFERENCES [dbo].[TiposActividad] ([ID])
GO
/****** Object:  ForeignKey [FK__ACTIVIDAD__id_ho__239E4DCF]    Script Date: 12/06/2019 20:30:58 ******/
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD FOREIGN KEY([id_horario])
REFERENCES [dbo].[HORARIO] ([id])
GO
/****** Object:  ForeignKey [FK__ACTIVIDAD__id_lo__24927208]    Script Date: 12/06/2019 20:30:58 ******/
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD FOREIGN KEY([id_locacion])
REFERENCES [dbo].[LOCACION] ([ID])
GO
/****** Object:  ForeignKey [FK__ACTIVIDAD__id_pr__25869641]    Script Date: 12/06/2019 20:30:58 ******/
ALTER TABLE [dbo].[ACTIVIDAD]  WITH CHECK ADD FOREIGN KEY([id_profesor])
REFERENCES [dbo].[Profesor] ([ID])
GO
/****** Object:  ForeignKey [FK__HORARIO__locacio__36B12243]    Script Date: 12/06/2019 20:30:58 ******/
ALTER TABLE [dbo].[HORARIO]  WITH CHECK ADD FOREIGN KEY([locacion_id])
REFERENCES [dbo].[LOCACION] ([ID])
GO
/****** Object:  ForeignKey [FK__INSCRIPCI__id_ac__47DBAE45]    Script Date: 12/06/2019 20:30:58 ******/
ALTER TABLE [dbo].[INSCRIPCIONES]  WITH CHECK ADD FOREIGN KEY([id_actividad])
REFERENCES [dbo].[ACTIVIDAD] ([id])
GO
/****** Object:  ForeignKey [FK__INSCRIPCI__id_so__46E78A0C]    Script Date: 12/06/2019 20:30:58 ******/
ALTER TABLE [dbo].[INSCRIPCIONES]  WITH CHECK ADD FOREIGN KEY([id_socio])
REFERENCES [dbo].[SOCIOS] ([id])
GO
/****** Object:  ForeignKey [FK__LOCACION__ID_Act__267ABA7A]    Script Date: 12/06/2019 20:30:58 ******/
ALTER TABLE [dbo].[LOCACION]  WITH CHECK ADD FOREIGN KEY([ID_Actividad_Tipo])
REFERENCES [dbo].[TiposActividad] ([ID])
GO
/****** Object:  ForeignKey [FK__Profesor__ID_Act__276EDEB3]    Script Date: 12/06/2019 20:30:58 ******/
ALTER TABLE [dbo].[Profesor]  WITH CHECK ADD FOREIGN KEY([ID_Actividad_Tipo])
REFERENCES [dbo].[TiposActividad] ([ID])
GO
/****** Object:  ForeignKey [FK__SOCIOS__id_tipos__286302EC]    Script Date: 12/06/2019 20:30:58 ******/
ALTER TABLE [dbo].[SOCIOS]  WITH CHECK ADD FOREIGN KEY([id_tiposSubscripcion])
REFERENCES [dbo].[TiposSubscripcion] ([id_subscripcion])
GO
