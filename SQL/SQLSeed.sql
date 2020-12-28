
USE ZooDB

GO

INSERT INTO 
	Gender( 
		Gender
	)
VALUES
	('male'),
	('female')

GO

INSERT INTO 
	Orgin( 
		OrginName
	)
VALUES
	('fish'),
	('amphibians'),
	('birds'),
	('reptiles'),
	('mammals')

GO

INSERT INTO 
	Behavior( 
		BehaviorName
	)
VALUES
	('aggressive'),
	('children-frendly'),
	('calm')
GO

INSERT INTO 
	Behavior( 
		BehaviorName
	)
VALUES
	('aggressive'),
	('children-frendly'),
	('calm')
GO

INSERT INTO 
	CageType( 
		TypeName
	)
VALUES
	('aquarium'),
	('aquaterrarium'),
	('cage'),
	('breeding box'),
	('terrarium'),
	('aviary'),
	('insectarium'),
	('catwalk')
GO

INSERT INTO 
	Cage( 
		Descryption, CageTypeID
	)
VALUES
	('small fish',1),
	('shark',1),
	('plankton',1),
	('gekon',2),
	('turrtle',2),
	('hyena',3),
	('tiger',3),
	('tiger',4),
	('lion',4),
	('fowler',5),
	('spider',5),
	('snake',5),
	('woodpecker',6),
	('woodpecker2',6),
	('parrot',6),
	('ant',7),
	('seal',8),
	('lion',8),
	('bear',8)
GO

INSERT INTO 
	Sector( 
		SectorCode
	)
VALUES
	('Z1'),
	('Z2'),
	('B1'),
	('B2'),
	('C1'),
	('C2'),
	('C3'),
	('C4')
GO

INSERT INTO 
	Croft( 
		CroftName,CageID,SectorID
	)
VALUES
	('Yellow Africa', 8,1),
	('Red Africa', 3,1),
	('Green Africa', 4,1),
	('Yellow America', 2,2),
	('Red America', 6,2),
	('Green America', 5,2),
	('Yellow Europa', 5,1),
	('Red Europa', 8,1),
	('Green Europa', 8,1),
	('Yellow Asia', 8,2),
	('Red Asia', 8,2)
GO

INSERT INTO 
	Food( 
		FoodName
	)
VALUES
	('Meat'),
	('Fish'),
	('Forage'),
	('Grass'),
	('Hay'),
	('Water'),
	('Fruit')
GO

INSERT INTO 
	Breed( 
		BreedName
	)
VALUES
	('Wild Cats')
GO

INSERT INTO 
	DietaryRequirements( 
		BreedID,DietaryName, OtherDetails
	)
VALUES
	(1,'Low carb, hight protein diet',
	'Cats need several different kinds of nutrients to survive: amino acids
		from protein, fatty acids and carbohydrates, vitamins, minerals, and
		water. As carnivorous animals, cats derive most of their protein from meat, fish,
		and other animal products. Some animal-based protein is easier to
		digest than plant-based protein and is better suited to the cat’s
		digestive system.')
GO

INSERT INTO 
	DietaryRequirementsHasFood( 
		DietaryRequirementsID,FoodID
	)
VALUES
	(1,1),
	(1,2),
	(1,6)
GO