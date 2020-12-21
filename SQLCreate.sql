USE master
GO
DROP DATABASE ZooDB
GO

CREATE DATABASE ZooDB
GO

USE ZooDB

GO

CREATE TABLE Country (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
	CountryName varchar(255),
);
GO

CREATE TABLE City (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
	CityName varchar(255),
	CountryID int FOREIGN KEY REFERENCES Country(ID)
);

GO

CREATE TABLE Address (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
	StreetNumber int NOT NULL,
	Street varchar(255),
	Zip varchar(255),
	ContactID int,
	CityID int FOREIGN KEY REFERENCES City(ID)
);

GO

CREATE TABLE Contact (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
);

GO

ALTER TABLE Address ADD FOREIGN KEY (ContactID) REFERENCES Contact(ID);

GO

CREATE TABLE Zoo (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
    Name varchar(255),
    ContactID int FOREIGN KEY REFERENCES Contact(ID)
);
GO

CREATE TABLE Email (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
    EmailName varchar(255),
    ContactID int FOREIGN KEY REFERENCES Contact(ID)
);
GO

CREATE TABLE PhoneNumber (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
    PhoneNumber varchar(255),
    ContactID int FOREIGN KEY REFERENCES Contact(ID)
);

GO

CREATE TABLE Category (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
    CategoryName varchar(255),
	Description varchar(1024)
);
GO

CREATE TABLE Supplier (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
    SupplierName varchar(255),
	ProductID int,
	ContactID int FOREIGN KEY REFERENCES Contact(ID),
);
GO

CREATE TABLE Product (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
    ProductName varchar(255),
	Description varchar(1024),
	Quantity int,
	Price decimal(9,2),
	ShopID int,
	SupplierID int FOREIGN KEY REFERENCES Supplier(ID),
	CategoryID int FOREIGN KEY REFERENCES Category(ID),
);
GO

CREATE TABLE Shop (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
    ShopName varchar(255),	
	ZooID int FOREIGN KEY REFERENCES Zoo(ID),
	SectorID int,
	EmployeeID int,
	ContactID int FOREIGN KEY REFERENCES Contact(ID),
);
GO

ALTER TABLE Product ADD FOREIGN KEY (ShopID) REFERENCES Shop(ID);

GO