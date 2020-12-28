
SELECT * FROM DietaryRequirementsHasFood

SELECT Breed.BreedName, DietaryRequirements.DietaryName, DietaryRequirements.OtherDetails AS Details, Food.FoodName AS Food, DietaryRequirements.ID AS DietaryRequirements_ID
FROM DietaryRequirements 
JOIN DietaryRequirementsHasFood on (DietaryRequirements.ID=DietaryRequirementsHasFood.DietaryRequirementsID)
JOIN Food on (Food.ID=DietaryRequirementsHasFood.FoodID)
JOIN Breed on (Breed.ID=DietaryRequirements.ID)

SELECT * FROM DietaryRequirementsHasFood WHERE DietaryRequirementsID = 1