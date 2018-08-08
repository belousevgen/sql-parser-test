-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

DROP TABLE [dbo].[OrderItem];
GO


DROP TABLE [dbo].[Product];
GO


DROP TABLE [dbo].[Order];
GO


DROP TABLE [dbo].[Supplier];
GO


DROP TABLE [dbo].[Customer];
GO


--************************************** [dbo].[Supplier]

CREATE TABLE [dbo].[Supplier]
(
 [SupplierId]  INT IDENTITY (1, 1) NOT NULL ,
 [CompanyName] NVARCHAR(40) NOT NULL ,
 [Phone]       NVARCHAR(20) NULL ,

 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED ([SupplierId] ASC),
 CONSTRAINT [AK1_Supplier_CompanyName] UNIQUE NONCLUSTERED ([CompanyName] ASC)
);
GO



--************************************** [dbo].[Customer]

CREATE TABLE [dbo].[Customer]
(
 [CustomerId]   INT IDENTITY (1, 1) NOT NULL ,
 [CustomerName] NVARCHAR(40) NOT NULL ,
 [Phone]        NVARCHAR(20) NULL ,

 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([CustomerId] ASC),
 CONSTRAINT [AK1_Customer_CustomerName] UNIQUE NONCLUSTERED ([CustomerName] ASC)
);
GO



--************************************** [dbo].[Product]

CREATE TABLE [dbo].[Product]
(
 [ProductId]      INT IDENTITY (1, 1) NOT NULL ,
 [ProductName]    NVARCHAR(50) NOT NULL ,
 [SupplierId]     INT NOT NULL ,
 [UnitPrice]      DECIMAL(12,2) NULL ,
 [IsDiscontinued] BIT NOT NULL CONSTRAINT [DF_Product_IsDiscontinued] DEFAULT '((0))' ,

 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([ProductId] ASC),
 CONSTRAINT [AK1_Product_SupplierId_ProductName] UNIQUE NONCLUSTERED ([SupplierId] ASC, [ProductName] ASC),
 CONSTRAINT [FK_Product_SupplierId_Supplier] FOREIGN KEY ([SupplierId])
  REFERENCES [dbo].[Supplier]([SupplierId])
);
GO


--SKIP Index: [FK_Product_SupplierId_Supplier]


--************************************** [dbo].[Order]

CREATE TABLE [dbo].[Order]
(
 [OrderId]     INT IDENTITY (1, 1) NOT NULL ,
 [OrderNumber] NVARCHAR(10) NULL ,
 [CustomerId]  INT NOT NULL ,
 [OrderDate]   DATETIME NOT NULL CONSTRAINT [DF_Order_OrderDate] DEFAULT '(getdate())' ,
 [TotalAmount] DECIMAL(12,2) NOT NULL ,

 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED ([OrderId] ASC),
 CONSTRAINT [AK1_Order_OrderNumber] UNIQUE NONCLUSTERED ([OrderNumber] ASC),
 CONSTRAINT [FK_Order_CustomerId_Customer] FOREIGN KEY ([CustomerId])
  REFERENCES [dbo].[Customer]([CustomerId])
);
GO


--SKIP Index: [FK_Order_CustomerId_Customer]


--************************************** [dbo].[OrderItem]

CREATE TABLE [dbo].[OrderItem]
(
 [OrderId]   INT NOT NULL ,
 [ProductId] INT NOT NULL ,
 [UnitPrice] DECIMAL(12,2) NOT NULL ,
 [Quantity]  INT NOT NULL ,

 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED ([OrderId] ASC, [ProductId] ASC),
 CONSTRAINT [FK_OrderItem_OrderId_Order] FOREIGN KEY ([OrderId])
  REFERENCES [dbo].[Order]([OrderId]),
 CONSTRAINT [FK_OrderItem_ProductId_Product] FOREIGN KEY ([ProductId])
  REFERENCES [dbo].[Product]([ProductId])
);
GO


--SKIP Index: [FK_OrderItem_OrderId_Order]

--SKIP Index: [FK_OrderItem_ProductId_Product]


