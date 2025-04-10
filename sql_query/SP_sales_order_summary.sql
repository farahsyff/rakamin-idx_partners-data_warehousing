USE [DWH_Project]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[summary_order_status] 
	-- Add the parameters for the stored procedure here
	@StatusID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		a.OrderID,
		b.CustomerID,
		c.ProductName,
		a.Quantity,
		d.StatusOrder
	FROM FactSalesOrder a
	LEFT JOIN DimCustomer b ON a.CustomerID = b.CustomerID
	LEFT JOIN DimProduct c ON a.ProductID = c.ProductID
	LEFT JOIN DimStatusOrder d ON a.StatusID = d.StatusID
	WHERE d.StatusID = @StatusID

END
