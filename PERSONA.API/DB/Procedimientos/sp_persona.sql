IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ps_persona')
	DROP PROC dbo.ps_persona
GO

CREATE PROC dbo.ps_persona (
	@id_persona				    int					=null,
	@accion						char(1),
	@nombre						varchar(100)		= null,
	@genero						varchar(10)			= null,
	@identificacion				varchar(13)			= null,
	@direccion					varchar(200)		= null,
	@telefono					varchar(13)			= null,
	@estado						bit					= null,
	@offset						int					= null,
	@limit						int					= null
)
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
