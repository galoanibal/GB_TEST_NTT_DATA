/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2019 (15.0.4153)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2019
    Target Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Target Database Engine Type : Standalone SQL Server
*/

USE [master]
GO
/****** Object:  Database [Prueba_NTTDATA_Galo_Baque]    Script Date: 5/4/2022 10:55:25 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Prueba_NTTDATA_Galo_Baque')
BEGIN
CREATE DATABASE [Prueba_NTTDATA_Galo_Baque]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prueba_NTTDATA_Galo_Baque', FILENAME = N'/var/opt/mssql/data/Prueba_NTTDATA_Galo_Baque.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Prueba_NTTDATA_Galo_Baque_log', FILENAME = N'/var/opt/mssql/data/Prueba_NTTDATA_Galo_Baque_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE SQL_Latin1_General_CP1_CI_AS
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
END
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prueba_NTTDATA_Galo_Baque].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET ARITHABORT OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET RECOVERY FULL 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET  MULTI_USER 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Prueba_NTTDATA_Galo_Baque', N'ON'
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET QUERY_STORE = OFF
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 5/4/2022 10:55:25 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\SYSTEM')
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\NETWORK SERVICE]    Script Date: 5/4/2022 10:55:25 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\NETWORK SERVICE')
CREATE LOGIN [NT AUTHORITY\NETWORK SERVICE] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [BUILTIN\Administrators]    Script Date: 5/4/2022 10:55:25 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'BUILTIN\Administrators')
CREATE LOGIN [BUILTIN\Administrators] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 5/4/2022 10:55:25 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'cxXBqAXZLMZpLVngWC6+s2H1HnUj3mG7bHQpGwT2xbk=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 5/4/2022 10:55:25 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'VHM3r3EEpViBlxXanC7Nj8YzKbSzsxMHtY1QFcAHTXg=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER AUTHORIZATION ON DATABASE::[Prueba_NTTDATA_Galo_Baque] TO [sa]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT AUTHORITY\NETWORK SERVICE]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [BUILTIN\Administrators]
GO
USE [Prueba_NTTDATA_Galo_Baque]
GO
GRANT VIEW ANY COLUMN ENCRYPTION KEY DEFINITION TO [public] AS [dbo]
GO
GRANT VIEW ANY COLUMN MASTER KEY DEFINITION TO [public] AS [dbo]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 5/4/2022 10:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cliente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [int] NOT NULL,
	[Contraseña] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [Cliente_IdCliente_PK] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Cliente] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Cuentas]    Script Date: 5/4/2022 10:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cuentas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cuentas](
	[IdCuenta] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[NumeroCuenta] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TipoCuenta] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SaldoInicial] [decimal](18, 2) NOT NULL,
	[ValorTope] [decimal](8, 2) NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [Cuentas_IdCuenta_PK] PRIMARY KEY CLUSTERED 
(
	[IdCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Cuentas] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Movimientos]    Script Date: 5/4/2022 10:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Movimientos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Movimientos](
	[IdMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[IdCuenta] [int] NOT NULL,
	[Fecha] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TipoMovimiento] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Valor] [decimal](18, 2) NOT NULL,
	[Saldo] [decimal](8, 2) NOT NULL,
 CONSTRAINT [Movimientos_IdMovimiento_PK] PRIMARY KEY CLUSTERED 
(
	[IdMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Movimientos] TO  SCHEMA OWNER 
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 5/4/2022 10:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Persona]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Persona](
	[IdPersona] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Genero] [varchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Identificacion] [varchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Direccion] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Telefono] [varchar](13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [Persona_IdPersona_PK] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
ALTER AUTHORIZATION ON [dbo].[Persona] TO  SCHEMA OWNER 
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cliente_Persona]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cliente]'))
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Persona] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cliente_Persona]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cliente]'))
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Persona]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cuentas_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cuentas]'))
ALTER TABLE [dbo].[Cuentas]  WITH CHECK ADD  CONSTRAINT [FK_Cuentas_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Cuentas_Cliente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Cuentas]'))
ALTER TABLE [dbo].[Cuentas] CHECK CONSTRAINT [FK_Cuentas_Cliente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Movimientos_Cuentas]') AND parent_object_id = OBJECT_ID(N'[dbo].[Movimientos]'))
ALTER TABLE [dbo].[Movimientos]  WITH CHECK ADD  CONSTRAINT [FK_Movimientos_Cuentas] FOREIGN KEY([IdCuenta])
REFERENCES [dbo].[Cuentas] ([IdCuenta])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Movimientos_Cuentas]') AND parent_object_id = OBJECT_ID(N'[dbo].[Movimientos]'))
ALTER TABLE [dbo].[Movimientos] CHECK CONSTRAINT [FK_Movimientos_Cuentas]
GO
/****** Object:  StoredProcedure [dbo].[ps_clientes]    Script Date: 5/4/2022 10:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ps_clientes]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ps_clientes] AS' 
END
GO
ALTER PROCEDURE [dbo].[ps_clientes]
	@id_persona [int] = null,
	@accion [char](1),
	@id_cliente [int] = null,
	@contrasena [varchar](100) = null,
	@estado [bit] = null,
	@offset [int] = null,
	@limit [int] = null
WITH EXECUTE AS CALLER
AS
IF @accion = 'I'
BEGIN
	BEGIN TRANSACTION  
		INSERT	INTO [dbo].[Cliente]
			   ([IdPersona]
			   ,[Contraseña]			  
			   ,[Estado])
		VALUES (
				@id_persona	,
				@contrasena ,				
				@estado)
	IF(@@ERROR > 0)  
		BEGIN  
			ROLLBACK TRANSACTION  
		END  
		ELSE  
		BEGIN  
		   COMMIT TRANSACTION  
		END
	select IdCliente= SCOPE_IDENTITY()

	RETURN 0
END

IF @accion = 'M'
BEGIN
	BEGIN TRANSACTION  
		UPDATE [dbo].[Cliente]
			   SET [IdPersona] = @id_persona,
				   [Contraseña] = @contrasena,
				   [Estado]=@estado
				WHERE IdCliente=@id_cliente

		IF(@@ERROR > 0)  
		BEGIN  
			ROLLBACK TRANSACTION  
		END  
		ELSE  
		BEGIN  
		   COMMIT TRANSACTION  
		END 
	select IdCliente=@id_cliente
	RETURN 0
END

IF @accion = 'E'
BEGIN
	BEGIN TRANSACTION  
		UPDATE [dbo].[Cliente]
			   SET [Estado]=@estado
				WHERE IdCliente=@id_cliente

		IF(@@ERROR > 0)  
		BEGIN  
			ROLLBACK TRANSACTION  
		END  
		ELSE  
		BEGIN  
		   COMMIT TRANSACTION  
		END 
	select IdCliente=@id_cliente
	RETURN 0
END

IF @accion = 'L'
BEGIN
	SELECT	total_registros			= COUNT(1)
		FROM	[dbo].[Cliente] c
		WHERE c.Estado=1
	
	SELECT	*
		FROM	[dbo].[Cliente] c WITH(NOLOCK)
		WHERE c.Estado=1
		ORDER	BY c.IdCliente
		OFFSET	(@offset - 1) ROWS
		FETCH	NEXT @limit ROWS ONLY
	
	RETURN 0
END

RAISERROR ('El código de la acción es incorrecto.',16,1)

GO
ALTER AUTHORIZATION ON [dbo].[ps_clientes] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[ps_clientes] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[ps_cuentas]    Script Date: 5/4/2022 10:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ps_cuentas]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ps_cuentas] AS' 
END
GO
ALTER PROCEDURE [dbo].[ps_cuentas]
	@accion [char](1),
	@id_cuenta [int] = null,
	@id_cliente [int] = null,
	@tipo_cuenta [varchar](10) = null,
	@numero_cuenta [varchar](10) = null,
	@saldo_inicial [decimal](18, 2) = null,
	@valor_tope [decimal](18, 2) = null,
	@estado [bit] = null,
	@offset [int] = null,
	@limit [int] = null
WITH EXECUTE AS CALLER
AS
IF @accion = 'I'
BEGIN
	BEGIN TRANSACTION  
		INSERT	INTO [dbo].[Cuentas]
			   ([IdCliente]
			   ,[NumeroCuenta]
			   ,[TipoCuenta]
			   ,[SaldoInicial]
			   ,[ValorTope]
			   ,[Estado])
		VALUES (
				@id_cliente	,
				@numero_cuenta ,
				@tipo_cuenta,
				@saldo_inicial,
				@valor_tope,
				@estado)
	IF(@@ERROR > 0)  
		BEGIN  
			ROLLBACK TRANSACTION  
		END  
		ELSE  
		BEGIN  
		   COMMIT TRANSACTION  
		END
	select IdCuenta= SCOPE_IDENTITY()

	RETURN 0
END

IF @accion = 'M'
BEGIN
	BEGIN TRANSACTION  
		UPDATE [dbo].[Cuentas]
			   SET [IdCliente]=@id_cliente
				   ,[NumeroCuenta]=@numero_cuenta
				   ,[TipoCuenta]=@tipo_cuenta
				   ,[SaldoInicial]=@saldo_inicial
				   ,[ValorTope]=@valor_tope
				WHERE IdCuenta=@id_cuenta

		IF(@@ERROR > 0)  
		BEGIN  
			ROLLBACK TRANSACTION  
		END  
		ELSE  
		BEGIN  
		   COMMIT TRANSACTION  
		END 
	select IdCuenta=@id_cuenta
	RETURN 0
END

IF @accion = 'E'
BEGIN
	BEGIN TRANSACTION  
		UPDATE [dbo].[Cuentas]
			   SET [Estado]=@estado
				WHERE IdCuenta=@id_cuenta

		IF(@@ERROR > 0)  
		BEGIN  
			ROLLBACK TRANSACTION  
		END  
		ELSE  
		BEGIN  
		   COMMIT TRANSACTION  
		END 
	select IdCuenta=@id_cuenta
	RETURN 0
END

IF @accion = 'L'
BEGIN
	SELECT	total_registros			= COUNT(1)
		FROM	[dbo].[Cuentas] c
		WHERE c.Estado=1
	
	SELECT	*
		FROM	[dbo].[Cuentas] c WITH(NOLOCK)
		WHERE c.Estado=1
		ORDER	BY c.IdCuenta
		OFFSET	(@offset - 1) ROWS
		FETCH	NEXT @limit ROWS ONLY
	
	RETURN 0
END

RAISERROR ('El código de la acción es incorrecto.',16,1)

GO
ALTER AUTHORIZATION ON [dbo].[ps_cuentas] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[ps_cuentas] TO  SCHEMA OWNER 
GO
/****** Object:  StoredProcedure [dbo].[ps_persona]    Script Date: 5/4/2022 10:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ps_persona]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ps_persona] AS' 
END
GO
ALTER PROCEDURE [dbo].[ps_persona]
	@id_persona [int] = null,
	@accion [char](1),
	@nombre [varchar](100) = null,
	@genero [varchar](10) = null,
	@identificacion [varchar](13) = null,
	@direccion [varchar](200) = null,
	@telefono [varchar](13) = null,
	@estado [bit] = null,
	@offset [int] = null,
	@limit [int] = null
WITH EXECUTE AS CALLER
AS
IF @accion = 'I'
BEGIN
	BEGIN TRANSACTION  
		INSERT	INTO [dbo].[Persona]
				 ([Nombre]
			   ,[Genero]
			   ,[Identificacion]
			   ,[Direccion]
			   ,[Telefono]
			   ,[Estado])
		VALUES (
				@nombre	,
				@genero	,
				@identificacion,
				@direccion,
				@telefono,
				@estado)
	IF(@@ERROR > 0)  
		BEGIN  
			ROLLBACK TRANSACTION  
		END  
		ELSE  
		BEGIN  
		   COMMIT TRANSACTION  
		END
	select IdPersona= SCOPE_IDENTITY()

	RETURN 0
END

IF @accion = 'M'
BEGIN
	BEGIN TRANSACTION  
		UPDATE [dbo].[Persona]
			   SET [Nombre] = @nombre	,
				  [Genero] = @genero	,
				  [Identificacion] = @identificacion,
				  [Direccion] = @direccion,
				  [Telefono] = @telefono,
				  [Estado] = @estado
				WHERE IdPersona=@id_persona
		IF(@@ERROR > 0)  
		BEGIN  
			ROLLBACK TRANSACTION  
		END  
		ELSE  
		BEGIN  
		   COMMIT TRANSACTION  
		END 
	RETURN 0
END

IF @accion = 'L'
BEGIN
	SELECT	total_registros			= COUNT(1)
		FROM	Persona	
	
	SELECT	*
		FROM	Persona p	
		ORDER	BY p.IdPersona
		OFFSET	(@offset - 1) ROWS
		FETCH	NEXT @limit ROWS ONLY
	
	RETURN 0
END

RAISERROR ('El código de la acción es incorrecto.',16,1)

GO
ALTER AUTHORIZATION ON [dbo].[ps_persona] TO  SCHEMA OWNER 
GO
ALTER AUTHORIZATION ON [dbo].[ps_persona] TO  SCHEMA OWNER 
GO
USE [master]
GO
ALTER DATABASE [Prueba_NTTDATA_Galo_Baque] SET  READ_WRITE 
GO
