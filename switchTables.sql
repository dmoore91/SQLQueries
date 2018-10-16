CREATE TABLE tempTable(
	ID int IDENTITY(1,1) PRIMARY KEY,
	Name nvarchar(max) NOT NULL,
	UserName nvarchar(50) NOT NULL,
	Email nvarchar(50) NOT NULL,
	Timestamp datetime NOT NULL,
	AcceptedAgreement bit NOT NULL,
	Approved bit NULL,
	ApprovedBy nvarchar(100) NULL,
	ApproveTime datetime NULL
)

INSERT INTO TEMPtABLE
SELECT *  
FROM LTEiWatchPortal


exec sp_rename 'tempTable', 'testTempTable' --Change testTempTable to LTEiWatchPortal in production version