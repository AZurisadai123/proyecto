USE dbSiticCommerce;

IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Carts]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	--Almacena los diferentes carritos dados de alta en el sistema
	CREATE TABLE [dbo].[Carts]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- IDENTIFICADOR UNICO DEL CARRITO
		[Created_At] DATETIME DEFAULT GETDATE(),-- FECHA DE CREACION DEL CARRITO
		[Update_At] DATETIME DEFAULT GETDATE() -- FECHA DE ULTIMA ACTUALIZACION DEL CARRITO
		
	)
END


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'NombreTabla', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena los diferentes carritos dados de alta en el sistema'
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena los diferentes carritos dados de alta en el sistema', 'SCHEMA', 'dbo', 'table', 'Carts'
END
GO


/*  Comentarios para las columnas */
-- Descripción para la columna Id
IF NOT EXISTS (SELECT * 
               FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Carts', 'column', 'Id'))
    EXEC sp_addextendedproperty 'MS_Description', 'IDENTIFICADOR UNICO DEL CARRITO', 'Schema', 'dbo', 'table', 'Carts', 'column', 'Id';

-- Descripción para la columna Created_At
IF NOT EXISTS (SELECT * 
               FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Carts', 'column', 'Created_At'))
    EXEC sp_addextendedproperty 'MS_Description', 'FECHA DE CREACION DEL CARRITO', 'Schema', 'dbo', 'table', 'Carts', 'column', 'Created_At';

-- Descripción para la columna Updated_At
IF NOT EXISTS (SELECT * 
               FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Carts', 'column', 'Updated_At'))
    EXEC sp_addextendedproperty 'MS_Description', 'FECHA DE ULTIMA ACTUALIZACION DEL CARRITO', 'Schema', 'dbo', 'table', 'Carts', 'column', 'Update_At';