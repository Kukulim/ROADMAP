
Declare @AnimalName varchar(255) = 'Bill'
Declare @BirthDate datetime2 = '1999-11-15'
Declare @DeathDate datetime2 = null
Declare @Color varchar(255) = 'Brown'
Declare @ZooID int = '1'
Declare @KeeperID int = '1'
Declare @CroftID int = '1'
Declare @AccommodationID int = '1'


Declare @Orgin varchar(255) = 'fish'
Declare @Behavior varchar(255) = 'clam'
Declare @Breed varchar(255) = 'mediterranean fish'
Declare @Gender varchar(255) = 'male'

Declare @AnimalDetailsID int

Declare @OrginID int
Declare @BehaviorID int
Declare @BreedID int
Declare @GenderID int

SELECT @OrginID = ID FROM Orgin WHERE OrginName = @Orgin
SELECT @BehaviorID = ID FROM Behavior WHERE BehaviorName = @Behavior
SELECT @BreedID = ID FROM Breed WHERE BreedName = @Breed
SELECT @GenderID = ID FROM Gender WHERE Gender = @Gender

IF(@OrginID Is null)
BEGIN
	INSERT INTO Orgin(OrginName)
	VALUES(@Orgin)
	SELECT @OrginID = SCOPE_IDENTITY()
END

IF(@BehaviorID Is null)
BEGIN
	INSERT INTO Behavior(BehaviorName)
	VALUES(@Behavior)
	SELECT @BehaviorID = SCOPE_IDENTITY()
END

IF(@BreedID Is null)
BEGIN
	INSERT INTO Breed(BreedName)
	VALUES(@Breed)
	SELECT @BreedID = SCOPE_IDENTITY()
END

IF(@GenderID Is null)
BEGIN
	INSERT INTO Gender(Gender)
	VALUES(@Gender)
	SELECT @GenderID = SCOPE_IDENTITY()
END

BEGIN
INSERT INTO AnimalDetails (BirthDate, DeathDate, Color, OrginID, BehaviorID, BreedID, GenderID)
VALUES(@BirthDate, @DeathDate, @Color, @OrginID, @BehaviorID, @BreedID, @GenderID)
SELECT @AnimalDetailsID = ID FROM AnimalDetails WHERE BirthDate=@BirthDate AND DeathDate=@DeathDate AND 
Color=@Color AND OrginID=@OrginID AND BehaviorID=@BehaviorID AND BreedID=@BreedID AND GenderID=@GenderID
END


BEGIN
INSERT INTO Animal(ZooID, AnimalName, KeeperID, CroftID, AnimalDetailsID, AccommodationID)
VALUES (@ZooID, @AnimalName, @KeeperID, @CroftID, @AnimalDetailsID,  @AccommodationID)
END