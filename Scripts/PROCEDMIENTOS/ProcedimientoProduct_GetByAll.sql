-- Author:		Andrea Escobar
-- Description:	Desautoriza un DoctoXCobrar
-- Fecha:		09/11/2024
IF EXISTS (SELECT 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[Products].[GetByAll]') AND type in (N'P', N'PC'))
	DROP PROCEDURE [Products].[GetByAll]
GO
CREATE PROCEDURE [Products].[GetByAll]
(
	@Id INT
)

WITH  ENCRYPTION  
AS 
BEGIN
	SELECT	Id AS 'Id',
			Name AS 'Name', 
			Description AS 'Description', 
			Price AS 'Price', 
			Current_Stock AS 'CurrentStock', 
			Max_Stock AS 'MaxStock', 
			Min_Stock AS 'MinStock', 
			Stock_Status_Id AS 'StockStatusId', 
			Image_Path AS 'ImagePath', 
			Created_At AS 'CreatedAt', 
			Update_At AS 'UpdateAt'
	FROM Products
END
GO
EXEC sp_recompile N'[Products].[GetByAll]';
GO