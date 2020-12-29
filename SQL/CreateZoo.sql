USE ZooDB
GO
DROP PROCEDURE IF EXISTS CreateZoo
GO
CREATE PROCEDURE CreateZoo
(
@ZooName				varchar(255),
@ContactID				int
)
AS
BEGIN;
SET NOCOUNT ON; -- to remove unnesesery messages and reduce traffic
IF NOT EXISTS (SELECT 1 FROM Zoo WHERE Name=@ZooName AND ContactID = @ContactID)
	BEGIN;
		INSERT INTO dbo.Cardios (Date,LengthOfTraining,CardioType,UserId,Distance)
				VALUES (@Date, @LenghtOfTraning,@CardioType,@UserId,@Distance)
		SELECT @CardioID = SCOPE_IDENTITY();
	END;
EXEC dbo.SelectCardio @CardioID =@CardioID;
SELECT * FROM Zoo;
SET NOCOUNT OFF;
END;
