USE ZooDB

SELECT * FROM DietaryRequirementsHasFood
SELECT * FROM DietaryRequirements
SELECT * FROM Food

DELETE FROM DietaryRequirementsHasFood
DELETE FROM DietaryRequirements
DELETE FROM Food

CREATE VIEW vWFullBreadDetails
AS
SELECT Breed.BreedName, DietaryRequirements.DietaryName, DietaryRequirements.OtherDetails AS Details, Food.FoodName AS Food, DietaryRequirements.ID AS DietaryRequirements_ID
FROM DietaryRequirements 
JOIN DietaryRequirementsHasFood on (DietaryRequirements.ID=DietaryRequirementsHasFood.DietaryRequirementsID)
JOIN Food on (Food.ID=DietaryRequirementsHasFood.FoodID)
JOIN Breed on (Breed.ID=DietaryRequirements.ID)

SELECT * FROM vWFullBreadDetails
SELECT * FROM vWFullBreadDetails WHERE Food = 'Fish'

SELECT * FROM DietaryRequirementsHasFood WHERE DietaryRequirementsID = 1

SELECT * FROM Orgin
SELECT * FROM Behavior
SELECT * FROM Breed
SELECT * FROM Gender

SELECT * FROM Zoo

SELECT * FROM AnimalDetails