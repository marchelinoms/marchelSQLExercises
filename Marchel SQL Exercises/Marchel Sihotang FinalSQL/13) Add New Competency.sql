CREATE PROCEDURE dbo.AddNewCompetency 
@staffNumber as Varchar(20),
@subjectCode as Varchar(10)
AS
BEGIN
	DECLARE @subjectID as bigint;
	DECLARE @existingCombination as bigint;

	SELECT @subjectID = sub.ID 
	FROM dbo.Subject as sub Where sub.Code = @subjectCode;
	---
	IF (@subjectID IN (
			SELECT sub.ID
			FROM dbo.Subject AS sub
			)
		AND
		@staffNumber IN(
			SELECT tut.StaffNumber 
			FROM dbo.Tutor AS tut
			)
		)
	BEGIN
		SELECT @existingCombination = COUNT(comp.ID)
		FROM dbo.Competency AS comp
		WHERE comp.StaffNumber = @staffNumber
		AND comp.SubjectID = @subjectID;

		IF(@existingCombination = 0)
		BEGIN
			BEGIN TRY
				BEGIN TRANSACTION ;
					INSERT INTO dbo.Competency (StaffNumber,SubjectID)
					VALUES (@staffNumber,@subjectID);
				COMMIT TRANSACTION;
			END TRY
			BEGIN CATCH
				SELECT 'you miss something' AS [Error Massage];
				ROLLBACK TRANSACTION;
			END CATCH
		END 
		ELSE
		BEGIN
			SELECT 'this competency already exist' AS [Massage];
		END
		
	END
	ELSE
	BEGIN
		SELECT 'subject code or staff Number you input doesnt exist' AS [Error Massage];
	END
END