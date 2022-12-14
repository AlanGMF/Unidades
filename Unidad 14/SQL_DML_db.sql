USE [master]
GO
/****** Object:  Database [SQL_DML]    Script Date: 11/20/2022 5:23:00 AM ******/
CREATE DATABASE [SQL_DML]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SQL_DML', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SQL_DML.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SQL_DML_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SQL_DML_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SQL_DML] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SQL_DML].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SQL_DML] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SQL_DML] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SQL_DML] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SQL_DML] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SQL_DML] SET ARITHABORT OFF 
GO
ALTER DATABASE [SQL_DML] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SQL_DML] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SQL_DML] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SQL_DML] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SQL_DML] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SQL_DML] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SQL_DML] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SQL_DML] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SQL_DML] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SQL_DML] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SQL_DML] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SQL_DML] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SQL_DML] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SQL_DML] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SQL_DML] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SQL_DML] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SQL_DML] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SQL_DML] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SQL_DML] SET  MULTI_USER 
GO
ALTER DATABASE [SQL_DML] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SQL_DML] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SQL_DML] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SQL_DML] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SQL_DML] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SQL_DML] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SQL_DML] SET QUERY_STORE = OFF
GO
USE [SQL_DML]
GO
/****** Object:  Table [dbo].[Compuesto_Por]    Script Date: 11/20/2022 5:23:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compuesto_Por](
	[CodArt] [int] NULL,
	[CodMat] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_articulos_con_mas_de_dos_materiales]    Script Date: 11/20/2022 5:23:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_articulos_con_mas_de_dos_materiales] as
select cp.CodArt, count(*) as cantidad
from Compuesto_Por cp
GROUP BY cp.CodArt
HAVING count(*)>2
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 11/20/2022 5:23:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[CodArt] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[Precio] [decimal](12, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodArt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 11/20/2022 5:23:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[CodMat] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CodMat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_articulos_y_materiales_sin_articulos]    Script Date: 11/20/2022 5:23:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Se pide, Listar todos los artículos y materiales por los cuales están
--compuestos. Mostrar artículos sin materiales y Materiales que no
--componen ningún artículo

CREATE VIEW [dbo].[v_articulos_y_materiales_sin_articulos] AS 
select a.CodArt as codigo_articulo, a.Descripcion as descripcion_articulo, m.CodMat as material_compuesto, m.Descripcion
from articulo a full outer join Compuesto_Por cp on
a.CodArt=cp.CodArt
FULL outer join Material m on m.CodMat=cp.CodMat;

GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 11/20/2022 5:23:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[CodProv] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Domicilio] [varchar](50) NULL,
	[Ciudad] [varchar](50) NULL,
	[fecha_alta] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[CodProv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provisto_Por]    Script Date: 11/20/2022 5:23:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provisto_Por](
	[CodMat] [int] NULL,
	[CodProv] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[v_proveedores_de_cuatro_materiales_o_mas]    Script Date: 11/20/2022 5:23:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_proveedores_de_cuatro_materiales_o_mas] AS
SELECT p.*
FROM Proveedor p
WHERE EXISTS(
			SELECT 1
			FROM Provisto_Por pp
			WHERE pp.CodProv = p.CodProv
			HAVING COUNT(pp.CodMat) > 4
			);
GO
/****** Object:  Table [dbo].[Almacen]    Script Date: 11/20/2022 5:23:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Almacen](
	[Nro] [int] NOT NULL,
	[Responsable] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Nro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tiene]    Script Date: 11/20/2022 5:23:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiene](
	[NroAlmacen] [int] NULL,
	[CodArt] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Almacen] ([Nro], [Responsable]) VALUES (1, N'Juan Perez')
INSERT [dbo].[Almacen] ([Nro], [Responsable]) VALUES (2, N'Jose Basualdo')
INSERT [dbo].[Almacen] ([Nro], [Responsable]) VALUES (3, N'Pablo Mancineli')
INSERT [dbo].[Almacen] ([Nro], [Responsable]) VALUES (4, N'Rogelio Funes Mori')
INSERT [dbo].[Almacen] ([Nro], [Responsable]) VALUES (5, N'Jonathan Maidana')
INSERT [dbo].[Almacen] ([Nro], [Responsable]) VALUES (6, N'Anita Martinez')
INSERT [dbo].[Almacen] ([Nro], [Responsable]) VALUES (7, N'Patricio Gonzalez')
INSERT [dbo].[Almacen] ([Nro], [Responsable]) VALUES (8, N'Diego Salaberry')
GO
INSERT [dbo].[Articulo] ([CodArt], [Descripcion], [Precio]) VALUES (1, N'Articulo Uno', CAST(60.000 AS Decimal(12, 3)))
INSERT [dbo].[Articulo] ([CodArt], [Descripcion], [Precio]) VALUES (2, N'Articulo Dos', CAST(60.000 AS Decimal(12, 3)))
INSERT [dbo].[Articulo] ([CodArt], [Descripcion], [Precio]) VALUES (3, N'Articulo Tres', CAST(180.000 AS Decimal(12, 3)))
INSERT [dbo].[Articulo] ([CodArt], [Descripcion], [Precio]) VALUES (4, N'Articulo Cuatro', CAST(250.000 AS Decimal(12, 3)))
INSERT [dbo].[Articulo] ([CodArt], [Descripcion], [Precio]) VALUES (5, N'Articulo Cinco', CAST(350.000 AS Decimal(12, 3)))
INSERT [dbo].[Articulo] ([CodArt], [Descripcion], [Precio]) VALUES (6, N'Articulo Seis', CAST(450.000 AS Decimal(12, 3)))
INSERT [dbo].[Articulo] ([CodArt], [Descripcion], [Precio]) VALUES (7, N'Articulo Siete', CAST(650.000 AS Decimal(12, 3)))
INSERT [dbo].[Articulo] ([CodArt], [Descripcion], [Precio]) VALUES (8, N'Articulo Ocho', CAST(850.000 AS Decimal(12, 3)))
INSERT [dbo].[Articulo] ([CodArt], [Descripcion], [Precio]) VALUES (9, N'Articulo Nueve', CAST(1250.000 AS Decimal(12, 3)))
GO
INSERT [dbo].[Compuesto_Por] ([CodArt], [CodMat]) VALUES (1, 1)
INSERT [dbo].[Compuesto_Por] ([CodArt], [CodMat]) VALUES (1, 2)
INSERT [dbo].[Compuesto_Por] ([CodArt], [CodMat]) VALUES (1, 3)
INSERT [dbo].[Compuesto_Por] ([CodArt], [CodMat]) VALUES (2, 4)
INSERT [dbo].[Compuesto_Por] ([CodArt], [CodMat]) VALUES (2, 5)
INSERT [dbo].[Compuesto_Por] ([CodArt], [CodMat]) VALUES (3, 1)
INSERT [dbo].[Compuesto_Por] ([CodArt], [CodMat]) VALUES (3, 6)
INSERT [dbo].[Compuesto_Por] ([CodArt], [CodMat]) VALUES (4, 1)
INSERT [dbo].[Compuesto_Por] ([CodArt], [CodMat]) VALUES (4, 6)
INSERT [dbo].[Compuesto_Por] ([CodArt], [CodMat]) VALUES (4, 7)
INSERT [dbo].[Compuesto_Por] ([CodArt], [CodMat]) VALUES (4, 8)
INSERT [dbo].[Compuesto_Por] ([CodArt], [CodMat]) VALUES (9, 12)
GO
INSERT [dbo].[Material] ([CodMat], [Descripcion]) VALUES (1, N'Material A')
INSERT [dbo].[Material] ([CodMat], [Descripcion]) VALUES (2, N'Material B')
INSERT [dbo].[Material] ([CodMat], [Descripcion]) VALUES (3, N'Material
C')
INSERT [dbo].[Material] ([CodMat], [Descripcion]) VALUES (4, N'Material D')
INSERT [dbo].[Material] ([CodMat], [Descripcion]) VALUES (5, N'Material E')
INSERT [dbo].[Material] ([CodMat], [Descripcion]) VALUES (6, N'Material F')
INSERT [dbo].[Material] ([CodMat], [Descripcion]) VALUES (7, N'Material G')
INSERT [dbo].[Material] ([CodMat], [Descripcion]) VALUES (8, N'Material H')
INSERT [dbo].[Material] ([CodMat], [Descripcion]) VALUES (9, N'Material I')
INSERT [dbo].[Material] ([CodMat], [Descripcion]) VALUES (10, N'Material J')
INSERT [dbo].[Material] ([CodMat], [Descripcion]) VALUES (11, N'Material K')
INSERT [dbo].[Material] ([CodMat], [Descripcion]) VALUES (12, N'Material L')
INSERT [dbo].[Material] ([CodMat], [Descripcion]) VALUES (13, N'Material M')
INSERT [dbo].[Material] ([CodMat], [Descripcion]) VALUES (14, N'Material P')
GO
INSERT [dbo].[Proveedor] ([CodProv], [Nombre], [Domicilio], [Ciudad], [fecha_alta]) VALUES (1, N'Proveedor Uno', N'Carlos Calvo 1212', N'CABA', CAST(N'1990-01-01' AS Date))
INSERT [dbo].[Proveedor] ([CodProv], [Nombre], [Domicilio], [Ciudad], [fecha_alta]) VALUES (2, N'Proveedor Dos', N'San Martin 121', N'Pergamino', CAST(N'1990-01-01' AS Date))
INSERT [dbo].[Proveedor] ([CodProv], [Nombre], [Domicilio], [Ciudad], [fecha_alta]) VALUES (3, N'Proveedor Tres', N'San Pedrito 1244', N'CABA', CAST(N'1992-01-01' AS Date))
INSERT [dbo].[Proveedor] ([CodProv], [Nombre], [Domicilio], [Ciudad], [fecha_alta]) VALUES (4, N'Proveedor Cuatro', N'Av. Boedo 3232', N'CABA', CAST(N'1993-01-01' AS Date))
INSERT [dbo].[Proveedor] ([CodProv], [Nombre], [Domicilio], [Ciudad], [fecha_alta]) VALUES (5, N'Proveedor Cinco', N'5 3232', N'La Plata', CAST(N'1994-01-01' AS Date))
INSERT [dbo].[Proveedor] ([CodProv], [Nombre], [Domicilio], [Ciudad], [fecha_alta]) VALUES (6, N'Proveedor Seis', N'Av 7 287', N'La Plata', CAST(N'1995-01-01' AS Date))
INSERT [dbo].[Proveedor] ([CodProv], [Nombre], [Domicilio], [Ciudad], [fecha_alta]) VALUES (7, N'Proveedor Siete', N'Italia 954', N'San Fernando', CAST(N'1996-01-01' AS Date))
INSERT [dbo].[Proveedor] ([CodProv], [Nombre], [Domicilio], [Ciudad], [fecha_alta]) VALUES (8, N'Proveedor Ocho', N'María de Carmen 765', N'San Fernando del Valle
de Catamarca', CAST(N'1997-01-01' AS Date))
INSERT [dbo].[Proveedor] ([CodProv], [Nombre], [Domicilio], [Ciudad], [fecha_alta]) VALUES (9, N'Proveedor Nueve', N'Av Corrientes 1200', N'Corrientes
Capital', CAST(N'1998-01-01' AS Date))
INSERT [dbo].[Proveedor] ([CodProv], [Nombre], [Domicilio], [Ciudad], [fecha_alta]) VALUES (10, N'Proveedor Diez', N'Av Juan Manuel de Rosas', N'San
Justo', CAST(N'1999-01-01' AS Date))
INSERT [dbo].[Proveedor] ([CodProv], [Nombre], [Domicilio], [Ciudad], [fecha_alta]) VALUES (11, N'Proveedor Once', N'Av Marite García 220', N'Ramos
Mejía', CAST(N'1990-01-01' AS Date))
INSERT [dbo].[Proveedor] ([CodProv], [Nombre], [Domicilio], [Ciudad], [fecha_alta]) VALUES (12, N'Proveedor Doce', N'La Plata 343', N'Ciudadela', CAST(N'2007-01-01' AS Date))
INSERT [dbo].[Proveedor] ([CodProv], [Nombre], [Domicilio], [Ciudad], [fecha_alta]) VALUES (13, N'Proveedor Trece', N'Independencia 1343', N'Mar del
Plata', CAST(N'2008-01-01' AS Date))
INSERT [dbo].[Proveedor] ([CodProv], [Nombre], [Domicilio], [Ciudad], [fecha_alta]) VALUES (14, N'Proveedor Catorce', N'Varela 343', N'San Justo', CAST(N'2009-01-01' AS Date))
INSERT [dbo].[Proveedor] ([CodProv], [Nombre], [Domicilio], [Ciudad], [fecha_alta]) VALUES (15, N'Proveedor Quince', N'Santander 943', N'Ituzaingó', CAST(N'2010-01-01' AS Date))
GO
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (1, 1)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (1, 3)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (1, 6)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (2, 2)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (2, 3)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (2, 4)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (2, 6)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (3, 2)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (3, 3)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (3, 6)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (4, 3)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (4, 4)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (4, 6)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (5, 1)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (5, 3)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (5, 6)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (6, 3)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (6, 4)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (6, 6)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (7, 3)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (7, 5)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (7, 6)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (8, 3)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (8, 5)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (8, 6)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (8, 10)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (8, 15)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (9, 6)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (10, 6)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (11, 6)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (12, 6)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (13, 6)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (13, 10)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (14, 10)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (14, 6)
INSERT [dbo].[Provisto_Por] ([CodMat], [CodProv]) VALUES (14, 15)
GO
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (1, 1)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (1, 2)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (2, 1)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (2, 2)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (2, 3)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (2, 4)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (3, 1)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (3, 2)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (3, 3)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (3, 4)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (4, 1)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (4, 3)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (4, 5)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (4, 8)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (5, 2)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (5, 7)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (5, 8)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (5, 9)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (8, 1)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (8, 2)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (8, 3)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (8, 4)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (8, 5)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (8, 6)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (8, 7)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (8, 8)
INSERT [dbo].[Tiene] ([NroAlmacen], [CodArt]) VALUES (8, 9)
GO
ALTER TABLE [dbo].[Compuesto_Por]  WITH CHECK ADD FOREIGN KEY([CodArt])
REFERENCES [dbo].[Articulo] ([CodArt])
GO
ALTER TABLE [dbo].[Compuesto_Por]  WITH CHECK ADD FOREIGN KEY([CodMat])
REFERENCES [dbo].[Material] ([CodMat])
GO
ALTER TABLE [dbo].[Provisto_Por]  WITH CHECK ADD FOREIGN KEY([CodMat])
REFERENCES [dbo].[Material] ([CodMat])
GO
ALTER TABLE [dbo].[Provisto_Por]  WITH CHECK ADD FOREIGN KEY([CodProv])
REFERENCES [dbo].[Proveedor] ([CodProv])
GO
ALTER TABLE [dbo].[Tiene]  WITH CHECK ADD FOREIGN KEY([CodArt])
REFERENCES [dbo].[Articulo] ([CodArt])
GO
ALTER TABLE [dbo].[Tiene]  WITH CHECK ADD FOREIGN KEY([NroAlmacen])
REFERENCES [dbo].[Almacen] ([Nro])
GO
USE [master]
GO
ALTER DATABASE [SQL_DML] SET  READ_WRITE 
GO
