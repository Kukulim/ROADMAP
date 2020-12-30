USE ZooDB
GO
DROP PROCEDURE IF EXISTS CreateZoo
GO
CREATE PROCEDURE CreateZoo
(
@ZooName				varchar(255),
@PhoneNumber			varchar(255),
@Email					varchar(255),
@Street					varchar(255),
@StreetNumber			int,
@Zip					varchar(255),
@City					varchar(255),
@Country				varchar(255)
)
AS
BEGIN;
SET NOCOUNT ON; -- to remove unnesesery messages and reduce traffic
IF NOT EXISTS (SELECT 1 FROM Zoo WHERE Name=@ZooName)
	BEGIN;

	DECLARE @ContactID int;
	DECLARE @CountryID int;
	DECLARE @CityID int;
	DECLARE @AddressID int;
	DECLARE @EmailID int;
	DECLARE @PhoneID int;

		INSERT INTO PhoneNumber(PhoneNumber)
				VALUES (@PhoneNumber)
		SELECT @PhoneID = SCOPE_IDENTITY();

		INSERT INTO Email(EmailName)
				VALUES (@Email)
		SELECT @EmailID = SCOPE_IDENTITY();

		INSERT INTO Country(CountryName)
				VALUES (@Country)
		SELECT @CountryID = SCOPE_IDENTITY();

		INSERT INTO City(CityName,CountryID)
				VALUES (@City,@CountryID)
		SELECT @CityID = SCOPE_IDENTITY();

		INSERT INTO Contact DEFAULT VALUES 
		SELECT @ContactID = SCOPE_IDENTITY();

		INSERT INTO Zoo(Name,ContactID)
				VALUES (@ZooName, @ContactID)
		SELECT @CityID = SCOPE_IDENTITY();

		INSERT INTO Address(Street,StreetNumber,Zip,CityID,ContactID)
				VALUES (@Street, @StreetNumber, @Zip, @CityID, @ContactID)
		SELECT @CityID = SCOPE_IDENTITY();
	END;
SELECT * FROM Zoo;
SET NOCOUNT OFF;
END;


EXEC CreateZoo @ZooName= 'NY Zoo',@PhoneNumber='+34 4352 134 555',@Email='nyzoo@com.pl',@Street='Golden St.',
		@StreetNumber=5,@Zip='41-666',@City='Ney York',@Country='USA'

SELECT * FROM Address WHERE ID=1