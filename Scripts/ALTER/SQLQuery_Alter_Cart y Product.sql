-- ALTER TABLE PAA AÑADIR 
IF NOT EXISTS (
	SELECT 1
	FROM sys.foreign_keys
	WHERE name = 'FK_Cart_Items_Cart_Id'
)
BEGIN
	ALTER TABLE [dbo].[Cart_Items]
	ADD CONSTRAINT FK_Cart_Items_Cart_Id
	FOREIGN KEY ([Cart_Id]) REFERENCES [dbo].[Cart]([Id])
END
GO

IF NOT EXISTS (
	SELECT 1
	FROM sys.foreign_keys
	WHERE name = 'FK_Cart_Items_Products_Id'
)
BEGIN
	ALTER TABLE [dbo].[Cart_Items]
	ADD CONSTRAINT FK_Cart_Items_Products_Id
	FOREIGN KEY ([Product_Id]) REFERENCES [dbo].[Products]([Id])
END
GO