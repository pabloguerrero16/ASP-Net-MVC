USE [master]
GO
/****** Object:  Database [ProyectoG7]    Script Date: 12/12/2023 16:27:20 ******/
CREATE DATABASE [ProyectoG7]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoG7', FILENAME = N'E:\SQL Server 2022\MSSQL16.SQLEXPRESS\MSSQL\DATA\ProyectoG7.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoG7_log', FILENAME = N'E:\SQL Server 2022\MSSQL16.SQLEXPRESS\MSSQL\DATA\ProyectoG7_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ProyectoG7] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoG7].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoG7] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoG7] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoG7] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoG7] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoG7] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoG7] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProyectoG7] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoG7] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoG7] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoG7] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoG7] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoG7] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoG7] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoG7] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoG7] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProyectoG7] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoG7] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoG7] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoG7] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoG7] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoG7] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoG7] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoG7] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProyectoG7] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoG7] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoG7] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoG7] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoG7] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoG7] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProyectoG7] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ProyectoG7] SET QUERY_STORE = ON
GO
ALTER DATABASE [ProyectoG7] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ProyectoG7]
GO
/****** Object:  Table [dbo].[CANTON]    Script Date: 12/12/2023 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CANTON](
	[ConCanton] [bigint] NOT NULL,
	[Nombre] [varchar](35) NOT NULL,
	[IdProvincia] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[ConCanton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CARRITO]    Script Date: 12/12/2023 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARRITO](
	[ConCarrito] [bigint] IDENTITY(1,1) NOT NULL,
	[ConUsuario] [bigint] NOT NULL,
	[ConProducto] [bigint] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[FechaCarrito] [datetime] NOT NULL,
 CONSTRAINT [PK_CARRITO] PRIMARY KEY CLUSTERED 
(
	[ConCarrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 12/12/2023 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[ConCategoria] [bigint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ConCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLE]    Script Date: 12/12/2023 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE](
	[ConDetalle] [bigint] IDENTITY(1,1) NOT NULL,
	[ConMaestro] [bigint] NOT NULL,
	[ConProducto] [bigint] NOT NULL,
	[CantidadCompra] [int] NOT NULL,
	[PrecioCompra] [decimal](18, 2) NOT NULL,
	[Impuesto] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_DETALLE] PRIMARY KEY CLUSTERED 
(
	[ConDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MAESTRO]    Script Date: 12/12/2023 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAESTRO](
	[ConMaestro] [bigint] IDENTITY(1,1) NOT NULL,
	[ConUsuario] [bigint] NOT NULL,
	[TotalFactura] [decimal](18, 2) NOT NULL,
	[FechaCompra] [datetime] NOT NULL,
 CONSTRAINT [PK_MAESTRO] PRIMARY KEY CLUSTERED 
(
	[ConMaestro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCA]    Script Date: 12/12/2023 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCA](
	[ConMarca] [bigint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ConMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MODELO]    Script Date: 12/12/2023 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MODELO](
	[ConModelo] [bigint] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ConModelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 12/12/2023 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[ConProducto] [bigint] IDENTITY(1,1) NOT NULL,
	[ConModelo] [bigint] NULL,
	[ConMarca] [bigint] NULL,
	[ConCategoria] [bigint] NULL,
	[Precio] [decimal](18, 2) NOT NULL,
	[Stock] [bigint] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Imagen] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ConProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVINCIA]    Script Date: 12/12/2023 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVINCIA](
	[ConProvincia] [bigint] NOT NULL,
	[Nombre] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ConProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 12/12/2023 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[ConRol] [bigint] NOT NULL,
	[Descripcion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ConRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 12/12/2023 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[ConUsuario] [bigint] IDENTITY(1,1) NOT NULL,
	[Identificacion] [varchar](20) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Correo] [varchar](100) NOT NULL,
	[Contrasenna] [varchar](150) NOT NULL,
	[ConRol] [bigint] NULL,
	[ConProvincia] [bigint] NULL,
	[ConCanton] [bigint] NULL,
	[Imagen] [varchar](250) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ConUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  CONSTRAINT [DF__PRODUCTO__Imagen__5AEE82B9]  DEFAULT ('~/Images/Productos/default.jpg') FOR [Imagen]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT ('~/Images/Users/default.jpg') FOR [Imagen]
GO
ALTER TABLE [dbo].[CANTON]  WITH CHECK ADD FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[PROVINCIA] ([ConProvincia])
GO
ALTER TABLE [dbo].[MAESTRO]  WITH CHECK ADD  CONSTRAINT [FK_MAESTRO_USUARIO] FOREIGN KEY([ConUsuario])
REFERENCES [dbo].[USUARIO] ([ConUsuario])
GO
ALTER TABLE [dbo].[MAESTRO] CHECK CONSTRAINT [FK_MAESTRO_USUARIO]
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([ConCategoria])
REFERENCES [dbo].[CATEGORIA] ([ConCategoria])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([ConMarca])
REFERENCES [dbo].[MARCA] ([ConMarca])
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD FOREIGN KEY([ConModelo])
REFERENCES [dbo].[MODELO] ([ConModelo])
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD FOREIGN KEY([ConCanton])
REFERENCES [dbo].[CANTON] ([ConCanton])
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD FOREIGN KEY([ConProvincia])
REFERENCES [dbo].[PROVINCIA] ([ConProvincia])
GO
ALTER TABLE [dbo].[USUARIO]  WITH CHECK ADD FOREIGN KEY([ConRol])
REFERENCES [dbo].[Rol] ([ConRol])
GO
/****** Object:  StoredProcedure [dbo].[ConsultarProductos]    Script Date: 12/12/2023 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarProductos]
AS
BEGIN
	SELECT ConProducto, Nombre, m.Descripcion 'DescripcionModelo', a.Descripcion 'DescripcionMarca', c.Descripcion 'DescripcionCategoria', Precio, Stock, Imagen
	FROM PRODUCTO P
	INNER JOIN MODELO m ON P.ConModelo = m.ConModelo
	INNER JOIN MARCA a ON P.ConMarca = a.ConMarca
	INNER JOIN CATEGORIA c ON P.ConCategoria = c.ConCategoria
END
GO
/****** Object:  StoredProcedure [dbo].[IniciarSesion]    Script Date: 12/12/2023 16:27:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IniciarSesion]
	@Correo varchar(100),
	@Contrasenna varchar(20)
AS
BEGIN
	SELECT ConUsuario, Identificacion, U.Nombre, Correo, Contrasenna, U.Imagen, R.Descripcion 'DescripcionRol', P.Nombre 'DescripcionProvincia', C.Nombre 'DescripcionCanton'
	FROM USUARIO U
	INNER JOIN Rol R ON U.ConRol = R.ConRol
	INNER JOIN PROVINCIA P ON U.ConProvincia = P.ConProvincia
	INNER JOIN CANTON C ON U.ConCanton = C.ConCanton
	WHERE Correo = @Correo
	AND Contrasenna = @Contrasenna
END
GO
/****** Object:  StoredProcedure [dbo].[PagarCarrito_SP]    Script Date: 12/12/2023 16:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PagarCarrito_SP]
    @ConUsuario BIGINT
AS
BEGIN
    DECLARE @TotalFactura AS DECIMAL(18, 2);
    DECLARE @CodigoMaestro AS BIGINT;

    SELECT @TotalFactura = SUM(P.Precio * C.Cantidad) + SUM(P.Precio * C.Cantidad) * 0.13
    FROM CARRITO C
    INNER JOIN PRODUCTO P ON C.ConProducto = P.ConProducto
    WHERE ConUsuario = @ConUsuario;

    INSERT INTO dbo.MAESTRO(ConUsuario, TotalFactura, FechaCompra)
    VALUES(@ConUsuario, @TotalFactura, GETDATE());

    SET @CodigoMaestro = @@IDENTITY;

    INSERT INTO dbo.DETALLE(ConMaestro, ConProducto, CantidadCompra, PrecioCompra, Impuesto)
    SELECT @CodigoMaestro, C.ConProducto, C.Cantidad, P.Precio, (C.Cantidad * P.Precio) * 0.13
    FROM CARRITO C
    INNER JOIN PRODUCTO P ON C.ConProducto = P.ConProducto
    WHERE @ConUsuario = @ConUsuario;

    UPDATE P
    SET P.Stock -= C.Cantidad
    FROM PRODUCTO P
    INNER JOIN CARRITO C ON C.ConProducto = P.ConProducto
    WHERE ConUsuario = @ConUsuario;

    DELETE FROM dbo.CARRITO
    WHERE ConUsuario = @ConUsuario;
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarCuenta]    Script Date: 12/12/2023 16:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RegistrarCuenta]
    @Cedula VARCHAR(20),
    @Nombre VARCHAR(100),
    @Correo VARCHAR(100),
    @Contrasenna VARCHAR(150)
AS
BEGIN
    INSERT INTO USUARIO (Identificacion, Nombre, Correo, Contrasenna, ConRol, ConProvincia, ConCanton)
    VALUES (@Cedula, @Nombre, @Correo, @Contrasenna, 1, 8, 800);
END;
GO
USE [master]
GO
ALTER DATABASE [ProyectoG7] SET  READ_WRITE 
GO

INSERT INTO Rol (ConRol, Descripcion) VALUES (1, 'USUARIO');
INSERT INTO Rol (ConRol, Descripcion) VALUES (2, 'ADMIN');

INSERT INTO Provincia (ConProvincia, Nombre) VALUES (1, 'San José');
INSERT INTO Provincia (ConProvincia, Nombre) VALUES (2, 'Alajuela');
INSERT INTO Provincia (ConProvincia, Nombre) VALUES (3, 'Cartago');
INSERT INTO Provincia (ConProvincia, Nombre) VALUES (4, 'Heredia');
INSERT INTO Provincia (ConProvincia, Nombre) VALUES (5, 'Guanacaste');
INSERT INTO Provincia (ConProvincia, Nombre) VALUES (6, 'Puntarenas');
INSERT INTO Provincia (ConProvincia, Nombre) VALUES (7, 'Limón');
INSERT INTO Provincia (ConProvincia, Nombre) VALUES (8, 'Seleccione');



INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (100, 'San José', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (101, 'Escazú', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (102, 'Desamparados', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (103, 'Puriscal', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (104, 'Tarrazú', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (105, 'Aserrí', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (106, 'Mora', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (107, 'Goicoechea', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (108, 'Santa Ana', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (109, 'Alajuelita', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (110, 'Vázquez de Coronado', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (111, 'Acosta', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (112, 'Tibás', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (113, 'Moravia', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (114, 'Montes de Oca', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (115, 'Turrubares', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (116, 'Dota', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (117, 'Curridabat', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (118, 'Pérez Zeledón', 1);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (119, 'León Cortés Castro', 1);


INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (200, 'Alajuela', 2);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (201, 'San Ramón', 2);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (202, 'Grecia', 2);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (203, 'San Mateo', 2);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (204, 'Atenas', 2);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (205, 'Naranjo', 2);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (206, 'Palmares', 2);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (207, 'Poás', 2);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (208, 'Orotina', 2);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (209, 'San Carlos', 2);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (210, 'Zarcero', 2);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (211, 'Sarchí', 2);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (212, 'Upala', 2);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (213, 'Los Chiles', 2);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (214, 'Guatuso', 2);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (215, 'Río Cuarto', 2);



INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (300, 'Cartago', 3);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (301, 'Paraíso', 3);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (302, 'La Unión', 3);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (303, 'Jiménez', 3);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (304, 'Turrialba', 3);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (305, 'Alvarado', 3);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (306, 'Oreamuno', 3);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (307, 'El Guarco', 3);



INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (400, 'Heredia', 4);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (401, 'Barva', 4);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (402, 'Santo Domingo', 4);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (403, 'Santa Bárbara', 4);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (404, 'San Rafael', 4);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (405, 'San Isidro', 4);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (406, 'Belén', 4);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (407, 'Flores', 4);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (408, 'San Pablo', 4);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (409, 'Sarapiquí', 4);



INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (500, 'Liberia', 5);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (501, 'Nicoya', 5);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (502, 'Santa Cruz', 5);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (503, 'Bagaces', 5);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (504, 'Carillo', 5);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (505, 'Cañas', 5);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (506, 'Abangares', 5);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (507, 'Tilarán', 5);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (508, 'Nandayure', 5);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (509, 'La Cruz', 5);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (510, 'Hojancha', 5);



INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (600, 'Puntarenas', 6);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (601, 'Esparza', 6);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (602, 'Buenos Aires', 6);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (603, 'Montes de Oro', 6);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (604, 'Osa', 6);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (605, 'Quepos', 6);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (606, 'Golfito', 6);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (607, 'Coto Brus', 6);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (608, 'Parrita', 6);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (609, 'Corredores', 6);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (610, 'Garabito', 6);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (611, 'Monteverde', 6);



INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (700, 'Limón', 7);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (701, 'Pococí', 7);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (702, 'Siquirres', 7);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (703, 'Talamanca', 7);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (704, 'Matina', 7);
INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (705, 'Guácimo', 7);


INSERT INTO Canton (ConCanton, Nombre, IdProvincia) VALUES (800, 'Seleccione', 8);

INSERT INTO MARCA (Descripcion) VALUES
('Volkswagen'),
('Audi'),
('Lamborghini');

INSERT INTO CATEGORIA (Descripcion) VALUES
('Compacto'),
('Deportivo'),
('Sedán'),
('SUV'),
('Type 1');

INSERT INTO MODELO (Descripcion) VALUES
('Golf GTI'),
('Jetta'),
('A3'),
('A4'),
('Huracan'),
('Aventador'),
('Type 1');

-- Volkswagen
INSERT INTO PRODUCTO (ConModelo, ConMarca, ConCategoria, Precio, Nombre, Imagen, Stock)
VALUES
(7, 1, 5, 12000.00, '1965', '~/Images/Productos/16.jpg', 30),
(7, 1, 5, 15000.00, '1970', '~/Images/Productos/17.jpg', 20),
(1, 1, 1, 30000.00, '2010', '~/Images/Productos/1.jpg', 50),
(2, 1, 3, 25000.00, '2015', '~/Images/Productos/2.jpg', 50),
(1, 1, 2, 35000.00, '2012', '~/Images/Productos/3.jpg', 50),
-- Audi
(3, 2, 1, 40000.00, '2018', '~/Images/Productos/4.jpg', 50),
(4, 2, 3, 32000.00, '2016', '~/Images/Productos/5.jpg', 50),
-- Lamborghini
(5, 3, 2, 50000.00, '2020', '~/Images/Productos/6.jpg', 50),
(6, 3, 1, 60000.00, '2019', '~/Images/Productos/7.jpg', 50),
-- Otros
(2, 1, 4, 28000.00, '2014', '~/Images/Productos/8.jpg', 50),
(3, 2, 2, 45000.00, '2017', '~/Images/Productos/9.jpg', 50),
(6, 3, 3, 55000.00, '2022', '~/Images/Productos/10.jpg', 50),
(4, 2, 4, 34000.00, '2013', '~/Images/Productos/11.jpg', 50),
(5, 3, 1, 48000.00, '2016', '~/Images/Productos/12.jpg', 50),
(1, 1, 3, 32000.00, '2011', '~/Images/Productos/13.jpg', 50),
(2, 1, 2, 38000.00, '2013', '~/Images/Productos/14.jpg', 50),
(3, 2, 1, 42000.00, '2015', '~/Images/Productos/15.jpg', 50);


INSERT INTO USUARIO (Identificacion, Nombre, Correo, Contrasenna, ConRol, ConProvincia, ConCanton)
VALUES ('123', 'admin', 'admin@admin.com', '123', 2, 3, 302);
