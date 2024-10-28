USE [Coderhouse]
GO

CREATE TABLE [dbo].[Personas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Contraseña] [varchar](100) NULL,
	[FechaNacimiento] [datetime2](0) NOT NULL,
 CONSTRAINT [Personas_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

 
SET IDENTITY_INSERT [dbo].[Personas] ON 
INSERT [dbo].[Personas] ([Id], [Nombre], [Contraseña], [FechaNacimiento]) VALUES (1, N'Usuario Prueba', N'1234', CAST(N'1990-07-20T02:42:15.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Personas] OFF 

CREATE TABLE [dbo].[Usuarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonaId] [int] NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Contraseña] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([PersonaId])
REFERENCES [dbo].[Personas] ([Id])
GO

SET IDENTITY_INSERT [dbo].[Usuarios] ON
INSERT [dbo].[Usuarios] ([Id], [PersonaId], [Nombre], [Email], [Contraseña]) VALUES (1, 1, N'Usuario Prueba', N'test@correo.com', N'1234' )
SET IDENTITY_INSERT [dbo].[Usuarios] OFF

CREATE TABLE [dbo].[Productos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Costo] [decimal](38, 0) NOT NULL,
	[PrecioVenta] [decimal](38, 0) NOT NULL,
	[Categoria] [varchar](100) NULL,
	[Stock] [int] NULL,
 CONSTRAINT [Productos_PK] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Ventas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[UsuarioId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[ProductosVendidos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VentaId] [int] NOT NULL,
	[ProductoId] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioVenta] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ProductosVendidos]  WITH CHECK ADD FOREIGN KEY([ProductoId])
REFERENCES [dbo].[Productos] ([Id])
GO

ALTER TABLE [dbo].[ProductosVendidos]  WITH CHECK ADD FOREIGN KEY([VentaId])
REFERENCES [dbo].[Ventas] ([Id])
GO
