USE [master]
GO
/****** Object:  Database [zapateria]    Script Date: 25/01/2021 2:57:54 a.m. ******/
CREATE DATABASE [zapateria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'zapateria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\zapateria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'zapateria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\zapateria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [zapateria] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [zapateria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [zapateria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [zapateria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [zapateria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [zapateria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [zapateria] SET ARITHABORT OFF 
GO
ALTER DATABASE [zapateria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [zapateria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [zapateria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [zapateria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [zapateria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [zapateria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [zapateria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [zapateria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [zapateria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [zapateria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [zapateria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [zapateria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [zapateria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [zapateria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [zapateria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [zapateria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [zapateria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [zapateria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [zapateria] SET  MULTI_USER 
GO
ALTER DATABASE [zapateria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [zapateria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [zapateria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [zapateria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [zapateria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [zapateria] SET QUERY_STORE = OFF
GO
USE [zapateria]
GO
/****** Object:  Table [dbo].[zapatos]    Script Date: 25/01/2021 2:57:55 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zapatos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[marca] [varchar](20) NOT NULL,
	[tipo] [varchar](20) NOT NULL,
	[genero] [varchar](10) NOT NULL,
	[cantidad_disponible] [int] NOT NULL,
	[precio] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[actualizar_zapatos]    Script Date: 25/01/2021 2:57:55 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[actualizar_zapatos]
@id int,
@marca varchar (20),
@tipo varchar(20),
@genero varchar (10),
@cantidad_disponible int,
@precio money
as
update zapatos set marca = @marca, tipo=@tipo, genero = @genero, cantidad_disponible =@cantidad_disponible, precio = @precio where id =@id
GO
/****** Object:  StoredProcedure [dbo].[agregar_zapatos]    Script Date: 25/01/2021 2:57:55 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[agregar_zapatos]
@marca varchar (20),
@tipo varchar(20),
@genero varchar (10),
@cantidad_disponible int,
@precio money
as
insert into zapatos (marca, tipo, genero, cantidad_disponible, precio)
values (@marca, @tipo, @genero, @cantidad_disponible, @precio)
GO
/****** Object:  StoredProcedure [dbo].[buscar_zapatos]    Script Date: 25/01/2021 2:57:55 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[buscar_zapatos]
@id int
as
select * from zapatos where id = @id
GO
/****** Object:  StoredProcedure [dbo].[eliminar_zapatos]    Script Date: 25/01/2021 2:57:55 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[eliminar_zapatos]
@id int
as
delete from zapatos where id = @id
GO
/****** Object:  StoredProcedure [dbo].[listar_zapatos]    Script Date: 25/01/2021 2:57:55 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listar_zapatos]
as
select * from zapatos
GO
USE [master]
GO
ALTER DATABASE [zapateria] SET  READ_WRITE 
GO
