-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;

DROP TABLE `OrderItem`;


DROP TABLE `Product`;


DROP TABLE `Order`;


DROP TABLE `Supplier`;


DROP TABLE `Customer`;



-- ************************************** `Supplier`

CREATE TABLE `Supplier`
(
 `SupplierId`  INT NOT NULL AUTO_INCREMENT ,
 `CompanyName` VARCHAR(40) NOT NULL ,
 `Phone`       VARCHAR(20) ,

PRIMARY KEY (`SupplierId`),
UNIQUE KEY `AK1_Supplier_CompanyName` (`CompanyName`)
) AUTO_INCREMENT=1;





-- ************************************** `Customer`

CREATE TABLE `Customer`
(
 `CustomerId`   INT NOT NULL AUTO_INCREMENT ,
 `CustomerName` VARCHAR(40) NOT NULL ,
 `Phone`        VARCHAR(20) ,

PRIMARY KEY (`CustomerId`),
UNIQUE KEY `AK1_Customer_CustomerName` (`CustomerName`)
) AUTO_INCREMENT=1;





-- ************************************** `Product`

CREATE TABLE `Product`
(
 `ProductId`      INT NOT NULL AUTO_INCREMENT ,
 `ProductName`    VARCHAR(50) NOT NULL ,
 `SupplierId`     INT NOT NULL ,
 `UnitPrice`      DECIMAL(12,2) ,
 `IsDiscontinued` BIT NOT NULL DEFAULT '0' ,

PRIMARY KEY (`ProductId`),
UNIQUE KEY `AK1_Product_SupplierId_ProductName` (`ProductName`, `SupplierId`),
KEY `FK_Product_SupplierId_Supplier` (`SupplierId`),
CONSTRAINT `FK_Product_SupplierId_Supplier` FOREIGN KEY `FK_Product_SupplierId_Supplier` (`SupplierId`) REFERENCES `Supplier` (`SupplierId`)
) AUTO_INCREMENT=1;





-- ************************************** `Order`

CREATE TABLE `Order`
(
 `OrderId`     INT NOT NULL AUTO_INCREMENT ,
 `OrderNumber` VARCHAR(10) ,
 `CustomerId`  INT NOT NULL ,
 `OrderDate`   DATETIME NOT NULL DEFAULT 'CURRENT\_TIMESTAMP' ,
 `TotalAmount` DECIMAL(12,2) NOT NULL ,

PRIMARY KEY (`OrderId`),
UNIQUE KEY `AK1_Order_OrderNumber` (`OrderNumber`),
KEY `FK_Order_CustomerId_Customer` (`CustomerId`),
CONSTRAINT `FK_Order_CustomerId_Customer` FOREIGN KEY `FK_Order_CustomerId_Customer` (`CustomerId`) REFERENCES `Customer` (`CustomerId`)
) AUTO_INCREMENT=1;





-- ************************************** `OrderItem`

CREATE TABLE `OrderItem`
(
 `OrderId`   INT NOT NULL ,
 `ProductId` INT NOT NULL ,
 `UnitPrice` DECIMAL(12,2) NOT NULL ,
 `Quantity`  INT NOT NULL ,

PRIMARY KEY (`OrderId`, `ProductId`),
KEY `FK_OrderItem_OrderId_Order` (`OrderId`),
CONSTRAINT `FK_OrderItem_OrderId_Order` FOREIGN KEY `FK_OrderItem_OrderId_Order` (`OrderId`) REFERENCES `Order` (`OrderId`),
KEY `FK_OrderItem_ProductId_Product` (`ProductId`),
CONSTRAINT `FK_OrderItem_ProductId_Product` FOREIGN KEY `FK_OrderItem_ProductId_Product` (`ProductId`) REFERENCES `Product` (`ProductId`)
);




