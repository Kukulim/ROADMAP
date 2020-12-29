Declare @FoodName varchar(255) = 'Green grass pellet'
Declare @DietaryRequirementsName varchar(255) = 'Herbivores'
Declare @BreedID int = 1
Declare @DietaryRequirementsOtherDetails varchar(1024) = 'Grass only'
Declare @FoodDescription varchar(255) = 'Emerald Green Feeds Grass Pellets are a natural high value feed, the harvesting and drying processes enable to the naturally occurring vitamins and minerals.'

Declare @FoodID int
Declare @DietaryRequirementsID int

SELECT @FoodID = ID FROM Food WHERE FoodName = @FoodName
SELECT @DietaryRequirementsID = ID FROM DietaryRequirements WHERE DietaryName = @DietaryRequirementsName

IF(@FoodID Is null)
BEGIN
	INSERT INTO Food (FoodName,Descryption)
	VALUES(@FoodName,@FoodDescription)
	SELECT @FoodID = SCOPE_IDENTITY()
END

IF(@DietaryRequirementsID Is null)
BEGIN
	INSERT INTO DietaryRequirements(DietaryName,OtherDetails,BreedID)
	VALUES(@DietaryRequirementsName,@DietaryRequirementsOtherDetails,@BreedID)
	SELECT @DietaryRequirementsID = SCOPE_IDENTITY()
END

INSERT INTO DietaryRequirementsHasFood(FoodID,DietaryRequirementsID) VALUES(@FoodID,@DietaryRequirementsID)