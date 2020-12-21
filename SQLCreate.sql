--USE master
--GO
--DROP DATABASE ZooDB
--GO

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

CREATE TABLE Sector (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
    SectorCode varchar(255),
);
GO

CREATE TABLE Department (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
    SectorCode varchar(255),
	DepartmentName varchar(255),
	ContactID int FOREIGN KEY REFERENCES Contact(ID),
	SectorID int FOREIGN KEY REFERENCES Sector(ID),
);
GO

CREATE TABLE JobContract (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
    JobName varchar(255),
	Salary decimal(9,2),
	FromDate datetime2,
	ToDate datetime2,
	EmployeeID int,
);
GO

CREATE TABLE Employee (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
    FirstName varchar(255),
	LastName varchar(255),
	ZooID int FOREIGN KEY REFERENCES Zoo(ID),
	DepartmentID int FOREIGN KEY REFERENCES Department(ID)
);
GO

ALTER TABLE JobContract ADD FOREIGN KEY (EmployeeID) REFERENCES Employee(ID);

GO

CREATE TABLE TreatmentsType (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
    TreatmentName varchar(255),
);
GO

CREATE TABLE MedicalTreatments (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
    TreatmentsDetails varchar(255),
	TreatmentsDate datetime2,
	AmimalID int,
	TreatmentsTypeID int FOREIGN KEY REFERENCES TreatmentsType(ID)
);
GO

CREATE TABLE AnimalCheckUp (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
    CheckUpResults varchar(255),
	OtherDetails varchar(255),
	CheckUpDate datetime2,
	AmimalID int,
	EmployeeID int FOREIGN KEY REFERENCES Employee(ID)
);
GO

CREATE TABLE Animal (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
	AnimalName varchar,
	ZooID int FOREIGN KEY REFERENCES Zoo(ID),
	KeeperID int FOREIGN KEY REFERENCES Employee(ID),
	AnimalDetailsID int,
	AccommodationID int,
	CroftID int,
);
GO

ALTER TABLE AnimalCheckUp ADD FOREIGN KEY (AmimalID) REFERENCES Animal(ID);

GO

ALTER TABLE MedicalTreatments ADD FOREIGN KEY (AmimalID) REFERENCES Animal(ID);

GO

CREATE TABLE CageType (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
    TypeName varchar(255),
);
GO

CREATE TABLE Cage (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
	CageTypeID int FOREIGN KEY REFERENCES CageType(ID),
	Descryption varchar(255)
);
GO

CREATE TABLE Croft (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
	CageID int FOREIGN KEY REFERENCES CageType(ID),
	SectorID int FOREIGN KEY REFERENCES Sector(ID),
	CroftName varchar(255)
);
GO

ALTER TABLE Animal ADD FOREIGN KEY (CroftID) REFERENCES Croft(ID);

GO

CREATE TABLE Food (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
	FoodName varchar(255),
	Descryption varchar(255),
);
GO

CREATE TABLE DietaryRequirementsHasFood (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
	FoodID int FOREIGN KEY REFERENCES Food(ID),
	DietaryRequirementsID int,
);
GO

CREATE TABLE DietaryRequirements (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
	OtherDetails varchar,
	BreedID int
);
GO

ALTER TABLE DietaryRequirementsHasFood ADD FOREIGN KEY (DietaryRequirementsID) REFERENCES DietaryRequirements(ID);

GO

CREATE TABLE Breed (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
	BreedName varchar,
);
GO

ALTER TABLE DietaryRequirements ADD FOREIGN KEY (BreedID) REFERENCES Breed(ID);

GO

CREATE TABLE Behavior (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
	BehaviorName varchar,
);
GO

CREATE TABLE Orgin (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
	OrginName varchar,
);
GO

CREATE TABLE Gender (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
	Gender varchar,
);
GO

CREATE TABLE Accommodation (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
	ArrivalDay datetime2,
	DepartureDay datetime2,
	DescriptionAnimal varchar,
);
GO

ALTER TABLE Animal ADD FOREIGN KEY (AccommodationID) REFERENCES Accommodation(ID);

GO

CREATE TABLE AnimalDetails (
    ID int PRIMARY KEY NOT NULL IDENTITY(1,1),
	BirthDate datetime2,
	DeathDate datetime2,
	Color varchar,
	BreedID int FOREIGN KEY REFERENCES Breed(ID),
	GenderID int FOREIGN KEY REFERENCES Gender(ID),
	OrginID int FOREIGN KEY REFERENCES Orgin(ID),
	BehaviorID int FOREIGN KEY REFERENCES Behavior(ID),
);
GO

ALTER TABLE Animal ADD FOREIGN KEY (AnimalDetailsID) REFERENCES AnimalDetails(ID);

GO