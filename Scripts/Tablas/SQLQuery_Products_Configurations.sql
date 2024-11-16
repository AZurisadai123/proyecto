USE dbSiticCommerce;

IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Product_Configurations]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	--Define las configuraciones espec�ficas para los productos, 
	--como diferentes colores y tama�os
	CREATE TABLE [dbo].[Product_Configurations]
	(
		[Id]					INT NOT NULL PRIMARY KEY IDENTITY(1,1), --Identificador �nico de la configuraci�n
		[Product_Id]			INT NOT NULL, --Identificador de la llave for�nea de Products 
		[Configuration_Name]	VARCHAR(255) NOT NULL, --Nombre de la configuraci�n como puede ser: Color, Tama�o, etc.
		[Value]					VARCHAR(255) NOT NULL, --El valor asigndo dependiendo la configuraci�n
		[Created_At]			DATETIME NOT NULL DEFAULT GETDATE(), --Fecha de creaci�n de la configuraci�n
		[Updated_At]			DATETIME NOT NULL DEFAULT GETDATE(), --Fecha de �ltima actualizaci�n de la configuraci�n
		FOREIGN KEY ([Product_Id]) REFERENCES [dbo].[Products]([Id])
	)
END


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 'MS_Description', 'Define las configuraciones espec�ficas para los productos, como diferentes colores y tama�os', 'SCHEMA', 'dbo', 'table', 'Product_Configurations'
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 'MS_Description', 'Define las configuraciones espec�ficas para los productos, como diferentes colores y tama�os', 'SCHEMA', 'dbo', 'table', 'Product_Configurations'
END
GO


/*  Comentarios para las columnas */
-- Descripci�n para la columna Id
IF NOT EXISTS (SELECT * 
               FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Id'))
    EXEC sp_addextendedproperty 'MS_Description', 'Identificador unico de la configuracion', 'Schema', 'dbo', 'table', 'Product_Configurations', 'column', 'Id';

-- Descripci�n para la columna Product_Id
IF NOT EXISTS (SELECT * 
               FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Product_Id'))
    EXEC sp_addextendedproperty 'MS_Description', 'Identificador de la llave foranea de Products', 'Schema', 'dbo', 'table', 'Product_Configurations', 'column', 'Product_Id';

-- Descripci�n para la columna Configuration_Name
IF NOT EXISTS (SELECT * 
               FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Configuration_Name'))
    EXEC sp_addextendedproperty 'MS_Description', 'Nombre de la configuracion como puede ser: Color, Tama�o, etc.', 'Schema', 'dbo', 'table', 'Product_Configurations', 'column', 'Configuration_Name';

-- Descripci�n para la columna Value
IF NOT EXISTS (SELECT * 
               FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Value'))
    EXEC sp_addextendedproperty 'MS_Description', 'El valor asignado dependiendo la configuracion', 'Schema', 'dbo', 'table', 'Product_Configurations', 'column', 'Value';

-- Descripci�n para la columna Created_At
IF NOT EXISTS (SELECT * 
               FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Created_At'))
    EXEC sp_addextendedproperty 'MS_Description', 'Fecha de creacion de la configuracion', 'Schema', 'dbo', 'table', 'Product_Configurations', 'column', 'Created_At';

-- Descripci�n para la columna Updated_At
IF NOT EXISTS (SELECT * 
               FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'Product_Configurations', 'column', 'Updated_At'))
    EXEC sp_addextendedproperty 'MS_Description', 'Fecha de ultima actualizacion de la configuracion', 'Schema', 'dbo', 'table', 'Product_Configurations', 'column', 'Updated_At';