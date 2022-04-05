IF EXISTS (SELECT * FROM sysobjects WHERE name = 'ps_cuentas')
	DROP PROC dbo.ps_cuentas
GO

CREATE PROC dbo.ps_cuentas (
	@accion						char(1),
	@id_cuenta				    int					= null,	
	@id_cliente					int					= null,
	@tipo_cuenta 				varchar(10)			= null,
	@numero_cuenta 				varchar(10)			= null,
	@saldo_inicial 				decimal(18,2)		= null,
	@valor_tope					decimal(18,2)		= null,
	@estado						bit					= null,
	@offset						int					= null,
	@limit						int					= null
)
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
