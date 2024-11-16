--CREATE DATABASE dbSiticCommerce;
USE dbSiticCommerce;

IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[dbo].[Products]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
	/* Create Tables */
	CREATE TABLE [dbo].[Products]
	(
		[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Identificador principal de la tabla Products
		[Name] VARCHAR(255) NOT NULL, -- NOMBRE DEL PRODUCTO
		[Description] TEXT NOT NULL, -- DESCRIPCION DEL PRPDUCTO (detallado)
		[Price] DECIMAL(18,2) NOT NULL,-- PRECIO DEL PRODUCTO
		[Current_Stock] INT NOT NULL,-- EXISTENCIA ACTUAL DEL PRODUCTO
		[Max_Stock] INT NOT NULL,-- EXISTENCIA MAXIMA DEL PRODUCTO
		[Min_Stock] INT NOT NULL,-- EXISTENCIA MINIMA DEL PRODUCTO
		[Stock_Status_Id] INT NULL,--RELACION CON LA TABLA Stock_Status
		[Image_Path] VARCHAR(255) NOT NULL,-- RUTA DE LA IMAGEN
		[Created_At] DATETIME DEFAULT GETDATE(),-- FECHA DE CREACION DEL PRODUCTO
		[Update_At] DATETIME DEFAULT GETDATE() -- FECHA DE ACTUALIZACION DEL PRODUCTO
		FOREIGN KEY ([Stock_Status_Id]) REFERENCES [dbo].[Stock_Status]([Id])
	)
END


/* Create Table Comments */
IF EXISTS (SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'NombreTabla', NULL, NULL))
BEGIN
  EXEC sys.sp_updateextendedproperty 'MS_Description', 'Almacena la informacion basica de los productos, asi como la diferencia actual y su control', 'SCHEMA', 'dbo', 'table', 'Products'
END 
ELSE
BEGIN
  EXEC sys.sp_addextendedproperty 'MS_Description', 'Almacena la informacion basica de los productos, asi como la diferencia actual y su control', 'SCHEMA', 'dbo', 'table', 'Products'
END
GO


/*  Comentarios para las columnas */
IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'NombreTabla', 'column', 'NombreColumna'))
	EXEC sp_addextendedproperty 'MS_Description', 'Identificador principal de la tabla Products', 'Schema', [dbo], 'table', [Products], 'column', [Id]

	IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'NombreTabla', 'column', 'NombreColumna'))
	EXEC sp_addextendedproperty 'MS_Description', 'NOMBRE DEL PRODUCTO', 'Schema', [dbo], 'table', [Products], 'column', [Name]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'NombreTabla', 'column', 'NombreColumna'))
	EXEC sp_addextendedproperty 'MS_Description', 'DESCRIPCION DEL PRODUCTO (detallado)', 'Schema', [dbo], 'table', [Products], 'column', [Description]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'NombreTabla', 'column', 'NombreColumna'))
EXEC sp_addextendedproperty 'MS_Description', 'PRECIO DEL PRODUCTO', 'Schema', [dbo], 'table', [Products], 'column', [Price]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'NombreTabla', 'column', 'NombreColumna'))
	EXEC sp_addextendedproperty 'MS_Description', 'EXISTENCIA ACTUAL DEL PRODUCTO', 'Schema', [dbo], 'table', [Products], 'column', [Current_Stock]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'NombreTabla', 'column', 'NombreColumna'))
	EXEC sp_addextendedproperty 'MS_Description', 'EXISTENCIA MAXIMA DEL PRODUCTO', 'Schema', [dbo], 'table', [Products], 'column', [Max_Stock]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'NombreTabla', 'column', 'NombreColumna'))
	EXEC sp_addextendedproperty 'MS_Description', 'EXISTENCIA MINIMA DEL PRODUCTO', 'Schema', [dbo], 'table', [Products], 'column', [Min_Stock]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'NombreTabla', 'column', 'NombreColumna'))
	EXEC sp_addextendedproperty 'MS_Description', 'RELACION CON LA TABLA Stock_Status', 'Schema', [dbo], 'table', [Products], 'column', [Stock_Status_Id]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'NombreTabla', 'column', 'NombreColumna'))
	EXEC sp_addextendedproperty 'MS_Description', 'RUTA DE LA IMAGEN', 'Schema', [dbo], 'table', [Products], 'column', [Image_Path]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'NombreTabla', 'column', 'NombreColumna'))
	EXEC sp_addextendedproperty 'MS_Description', 'FECHA DE CREACION DEL PRODUCTO', 'Schema', [dbo], 'table', [Products], 'column', [Created_At]

IF NOT EXISTS(SELECT * FROM ::fn_listextendedproperty ('MS_Description', 'SCHEMA', 'dbo', 'table', 'NombreTabla', 'column', 'NombreColumna'))
	EXEC sp_addextendedproperty 'MS_Description', 'FECHA DE ACTUALIZACION DEL PRODUCTO', 'Schema', [dbo], 'table', [Products], 'column', [Update_At]