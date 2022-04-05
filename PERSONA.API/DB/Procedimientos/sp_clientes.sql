IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ps_clientes')
	DROP PROC dbo.ps_clientes
GO

CREATE PROC dbo.ps_clientes (
	@id_persona				    int					=null,
	@accion						char(1),
	@id_cliente					int					= null,
	@contrasena 				varchar(100)		= null,
	@estado						bit					= null,
	@offset						int					= null,
	@limit						int					= null
)
AS

IF @accion = 'I'
BEGIN
	BEGIN TRANSACTION  
		INSERT	INTO [dbo].[Cliente]
			   ([IdPersona]
			   ,[Contrase�a]			  
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
				   [Contrase�a] = @contrasena,
				   --[Estado]=@estado
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

RAISERROR ('El c�digo de la acci�n es incorrecto.',16,1)

GO
