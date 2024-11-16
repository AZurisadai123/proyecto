

IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Orders]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	--Almacena la informaci�n sobre los pedidos realizados
	CREATE TABLE [dbo].[Orders]
	(
		[Id]			INT NOT NULL PRIMARY KEY IDENTITY(1,1), --Identificador �nico de la tabla
		[Total_Price]	DECIMAL(20, 2) NOT NULL, --Precio total del pedido
		[Status]		VARCHAR(50) NOT NULL, --Estado del pedido (e.g., pendiente, enviado, completado)
		[Created_At]	DATETIME NOT NULL DEFAULT GETDATE(), --Fecha de creaci�n del pedido
		[Update_At]		DATETIME NOT NULL DEFAULT GETDATE(), --Fecha de �ltima actualizaci�n del pedido
	)
END


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena la informaci�n sobre los pedidos realizados', 'SCHEMA', 'dbo', 'table', 'Orders'
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena la informaci�n sobre los pedidos realizados', 'SCHEMA', 'dbo', 'table', 'Orders'
END
GO


/*  Comentarios para las columnas */
-- Descripci�n para la columna Id
IF NOT EXISTS (SELECT * 
               FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Id'))
    EXEC sp_addextendedproperty 'MS_Description', 'Identificador �nico de la tabla', 'Schema', 'dbo', 'table', 'Orders', 'column', 'Id';

-- Descripci�n para la columna Total_Price
IF NOT EXISTS (SELECT * 
               FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Total_Price'))
    EXEC sp_addextendedproperty 'MS_Description', 'Precio total del pedido', 'Schema', 'dbo', 'table', 'Orders', 'column', 'Total_Price';

-- Descripci�n para la columna Status
IF NOT EXISTS (SELECT * 
               FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Status'))
    EXEC sp_addextendedproperty 'MS_Description', 'Estado del pedido (e.g., pendiente, enviado, completado)', 'Schema', 'dbo', 'table', 'Orders', 'column', 'Status';

-- Descripci�n para la columna Created_At
IF NOT EXISTS (SELECT * 
               FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Created_At'))
    EXEC sp_addextendedproperty 'MS_Description', 'Fecha de creaci�n del pedido', 'Schema', 'dbo', 'table', 'Orders', 'column', 'Created_At';

-- Descripci�n para la columna Update_At
IF NOT EXISTS (SELECT * 
               FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Orders', 'column', 'Update_At'))
    EXEC sp_addextendedproperty 'MS_Description', 'Fecha de �ltima actualizaci�n del pedido', 'Schema', 'dbo', 'table', 'Orders', 'column', 'Update_At';