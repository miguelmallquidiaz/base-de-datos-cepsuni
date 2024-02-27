-- Versión
SELECT @@VERSION
GO

-- USAR BD
USE AdventureWorks2022
GO

-- Se pone en esquema y tabla
-- Mostrar columnas city, addressid, addressline1
SELECT City,
		AddressID,
		AddressLine1
FROM [Person].[Address]
GO

-- (Mostrar de la tabla SalesOrderDetails y Product algunos campos)
SELECT TOP 10 SalesOrderID,
			  SalesOrderDetailID,
			  CarrierTrackingNumber,
			  ProductID,
			  UnitPrice 
FROM [Sales].[SalesOrderDetail] 
SELECT TOP 10 Name,
			  ProductNumber
FROM [Production].[Product] 
GO
-- INNER JOIN COINCIDENCIAS QUE EXISTEN EN LAS TABLAS
SELECT TOP 10 SOD.SalesOrderID AS CodigoVenta,
			  SOD.SalesOrderDetailID AS DetalleVenta,
			  SOD.CarrierTrackingNumber AS NumeroTicket,
			  SOD.ProductID AS codigoProducto,
			  SOD.UnitPrice AS PrecioUnitario,
			  P.Name AS [Descripcion producto],
			  p.ProductNumber AS [Numero Producto]
FROM [Sales].[SalesOrderDetail] SOD INNER JOIN [Production].[Product] P
ON SOD.ProductID = P.ProductID

-- LEFT JOIN Mostrar toda lo de la izquierda
SELECT TOP 10 SOD.SalesOrderID AS CodigoVenta,
			  SOD.SalesOrderDetailID AS DetalleVenta,
			  SOD.CarrierTrackingNumber AS NumeroTicket,
			  SOD.ProductID AS codigoProducto,
			  SOD.UnitPrice AS PrecioUnitario,
			  P.Name AS [Descripcion producto],
			  p.ProductNumber AS [Numero Producto]
FROM [Sales].[SalesOrderDetail] SOD 
LEFT JOIN [Production].[Product] P ON SOD.ProductID = P.ProductID
-- RIGHT JOIN
SELECT TOP 10 SOD.SalesOrderID AS CodigoVenta,
			  SOD.SalesOrderDetailID AS DetalleVenta,
			  SOD.CarrierTrackingNumber AS NumeroTicket,
			  SOD.ProductID AS codigoProducto,
			  SOD.UnitPrice AS PrecioUnitario,
			  P.Name AS [Descripcion producto],
			  p.ProductNumber AS [Numero Producto]
FROM [Sales].[SalesOrderDetail] SOD 
RIGHT JOIN [Production].[Product] P ON SOD.ProductID = P.ProductID
-- FULL JOIN
SELECT SOD.SalesOrderID AS CodigoVenta,
			  SOD.SalesOrderDetailID AS DetalleVenta,
			  SOD.CarrierTrackingNumber AS NumeroTicket,
			  SOD.ProductID AS codigoProducto,
			  SOD.UnitPrice AS PrecioUnitario,
			  P.Name AS [Descripcion producto],
			  p.ProductNumber AS [Numero Producto]
FROM [Sales].[SalesOrderDetail] SOD 
FULL JOIN [Production].[Product] P ON SOD.ProductID = P.ProductID
-- NOT (Mostrar los registros que no sean DetalleVenta 13)
SELECT SOD.SalesOrderID AS CodigoVenta,
			  SOD.SalesOrderDetailID AS DetalleVenta,
			  SOD.CarrierTrackingNumber AS NumeroTicket,
			  SOD.ProductID AS codigoProducto,
			  SOD.UnitPrice AS PrecioUnitario,
			  P.Name AS [Descripcion producto],
			  p.ProductNumber AS [Numero Producto]
FROM [Sales].[SalesOrderDetail] SOD 
FULL JOIN [Production].[Product] P ON SOD.ProductID = P.ProductID
WHERE NOT SOD.SalesOrderDetailID = 13
-- Qué sea diferente a la descripción Mountain-100 Black, 42
SELECT SOD.SalesOrderID AS CodigoVenta,
			  SOD.SalesOrderDetailID AS DetalleVenta,
			  SOD.CarrierTrackingNumber AS NumeroTicket,
			  SOD.ProductID AS codigoProducto,
			  SOD.UnitPrice AS PrecioUnitario,
			  P.Name AS [Descripcion producto],
			  p.ProductNumber AS [Numero Producto]
FROM [Sales].[SalesOrderDetail] SOD 
FULL JOIN [Production].[Product] P ON SOD.ProductID = P.ProductID
WHERE NOT P.Name = 'Mountain-100 Black, 42'

-- IN Mostrar de la tabla [SalesOrderDetail] los valores 103737 codigo de producto 926, 905, 867
SELECT SOD.SalesOrderID AS CodigoVenta,
			  SOD.SalesOrderDetailID AS DetalleVenta,
			  SOD.CarrierTrackingNumber AS NumeroTicket,
			  SOD.ProductID AS codigoProducto,
			  SOD.UnitPrice AS PrecioUnitario,
			  P.Name AS [Descripcion producto],
			  p.ProductNumber AS [Numero Producto]
FROM [Sales].[SalesOrderDetail] SOD 
FULL JOIN [Production].[Product] P ON SOD.ProductID = P.ProductID
WHERE SOD.ProductID IN(926,905,867)
ORDER BY SOD.ProductID ASC --desc

-- LIKE nos permite buscar registro
SELECT SOD.SalesOrderID AS CodigoVenta,
			  SOD.SalesOrderDetailID AS DetalleVenta,
			  SOD.CarrierTrackingNumber AS NumeroTicket,
			  SOD.ProductID AS codigoProducto,
			  SOD.UnitPrice AS PrecioUnitario,
			  P.Name AS [Descripcion producto],
			  p.ProductNumber AS [Numero Producto]
FROM [Sales].[SalesOrderDetail] SOD 
FULL JOIN [Production].[Product] P ON SOD.ProductID = P.ProductID
WHERE SOD.CarrierTrackingNumber LIKE '_____4%'
ORDER BY SOD.ProductID ASC 

-- BETWEEN
SELECT SOD.SalesOrderID AS CodigoVenta,
			  SOD.SalesOrderDetailID AS DetalleVenta,
			  SOD.CarrierTrackingNumber AS NumeroTicket,
			  SOD.ProductID AS codigoProducto,
			  SOD.UnitPrice AS PrecioUnitario,
			  P.Name AS [Descripcion producto],
			  p.ProductNumber AS [Numero Producto]
FROM [Sales].[SalesOrderDetail] SOD 
FULL JOIN [Production].[Product] P ON SOD.ProductID = P.ProductID
WHERE SOD.CarrierTrackingNumber BETWEEN '774' AND '778'
ORDER BY SOD.ProductID ASC 