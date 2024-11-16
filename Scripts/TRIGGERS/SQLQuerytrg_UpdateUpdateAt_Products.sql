IF OBJECT_ID('trg_UpdateUpdateAt_Products', 'TR') IS NOT NULL
BEGIN
--DESPUES LO ELIMINA
	DROP TRIGGER trg_UpdateUpdateAt_Products;

END
GO
--SE CREA
CREATE TRIGGER trg_UpdateUpdateAt_Products
ON [dbo].[Products]
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON

	UPDATE Products
	SET Update_At = GETDATE()
	FROM inserted i
	WHERE Products.Id = i.Id
END