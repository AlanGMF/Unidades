USE [practica1]
GO
/****** Object:  Database [Practica]    Script Date: 11/3/2022 2:42:44 PM ******/
CREATE DATABASE [Practica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Practica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Practica.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Practica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Practica_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Practica] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Practica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Practica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Practica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Practica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Practica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Practica] SET ARITHABORT OFF 
GO
ALTER DATABASE [Practica] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Practica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Practica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Practica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Practica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Practica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Practica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Practica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Practica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Practica] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Practica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Practica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Practica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Practica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Practica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Practica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Practica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Practica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Practica] SET  MULTI_USER 
GO
ALTER DATABASE [Practica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Practica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Practica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Practica] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Practica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Practica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Practica] SET QUERY_STORE = OFF
GO
USE [Practica]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 11/3/2022 2:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[legajo] [int] NOT NULL,
	[nombre] [varchar](45) NOT NULL,
	[apellido] [varchar](45) NULL,
	[fecha_de_nacimiento] [varchar](45) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[legajo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursada]    Script Date: 11/3/2022 2:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursada](
	[codigo_de_materia] [int] NULL,
	[legajo] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 11/3/2022 2:42:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materia](
	[codigo] [int] NOT NULL,
	[descripcion] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Alumno] ([legajo], [nombre], [apellido], [fecha_de_nacimiento]) VALUES (0, N'pepe1', N'1gonzalez', N'1/1/1951')
INSERT [dbo].[Alumno] ([legajo], [nombre], [apellido], [fecha_de_nacimiento]) VALUES (2, N'pepe2', N'2gonzalez', N'1/1/1952')
INSERT [dbo].[Alumno] ([legajo], [nombre], [apellido], [fecha_de_nacimiento]) VALUES (3, N'pepe3', N'3gonzalez', N'1/1/1953')
INSERT [dbo].[Alumno] ([legajo], [nombre], [apellido], [fecha_de_nacimiento]) VALUES (4, N'pepe4', N'4gonzalez', N'1/1/1954')
INSERT [dbo].[Alumno] ([legajo], [nombre], [apellido], [fecha_de_nacimiento]) VALUES (5, N'pepe5', N'5gonzalez', N'1/1/1955')
GO
INSERT [dbo].[Cursada] ([codigo_de_materia], [legajo]) VALUES (1, 5)
INSERT [dbo].[Cursada] ([codigo_de_materia], [legajo]) VALUES (2, 4)
INSERT [dbo].[Cursada] ([codigo_de_materia], [legajo]) VALUES (3, 3)
INSERT [dbo].[Cursada] ([codigo_de_materia], [legajo]) VALUES (4, 2)
INSERT [dbo].[Cursada] ([codigo_de_materia], [legajo]) VALUES (5, 0)
GO
INSERT [dbo].[Materia] ([codigo], [descripcion]) VALUES (1, N'descrip 1')
INSERT [dbo].[Materia] ([codigo], [descripcion]) VALUES (2, N'descrip 2')
INSERT [dbo].[Materia] ([codigo], [descripcion]) VALUES (3, N'descrip 3')
INSERT [dbo].[Materia] ([codigo], [descripcion]) VALUES (4, N'descrip 4')
INSERT [dbo].[Materia] ([codigo], [descripcion]) VALUES (5, N'descrip 5')
GO
ALTER TABLE [dbo].[Cursada]  WITH CHECK ADD FOREIGN KEY([codigo_de_materia])
REFERENCES [dbo].[Materia] ([codigo])
GO
ALTER TABLE [dbo].[Cursada]  WITH CHECK ADD FOREIGN KEY([legajo])
REFERENCES [dbo].[Alumno] ([legajo])
GO
USE [master]
GO
ALTER DATABASE [Practica] SET  READ_WRITE 
GO