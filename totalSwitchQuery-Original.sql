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

WAITFOR DELAY '00:00:05:00' --Wait for 5 seconds to make sure the table is created properly

INSERT INTO tempTable
SELECT *  
FROM LTEiWatchPortal

ALTER TABLE tempTable
ADD watchID int NULL

ALTER TABLE tempTable
ADD providerID int NULL

exec sp_rename 'LTEiWatchPortal', 'LTEiWatchPortal_old'

exec sp_rename 'tempTable', 'LTEiWatchPortal' --Change testTempTable to LTEiWatchPortal in production version

GO 

CREATE TABLE LTEiWatchProviders(
	ID int IDENTITY(1,1) PRIMARY KEY,
	providerType nvarchar(50) NOT NULL
)

INSERT INTO LTEiWatchProviders
VALUES('Verizon');

INSERT INTO LTEiWatchProviders
VALUES('AT&T');

CREATE TABLE LTEiWatchEvents(
	ID int IDENTITY(1,1) PRIMARY KEY,
	eventType nvarchar(50) NOT NULL
)

INSERT INTO LTEiWatchEvents
VALUES('Requested');

INSERT INTO LTEiWatchEvents
VALUES('Request Approved');

INSERT INTO LTEiWatchEvents
VALUES('Request Denied');

INSERT INTO LTEiWatchEvents
VALUES('Service Terminated')

INSERT INTO LTEiWatchEvents
VALUES('Employment Terminated')

INSERT INTO LTEiWatchEvents
VALUES('Provider Change')

INSERT INTO LTEiWatchEvents
VALUES('Watch Type Change')

CREATE TABLE LTEiWatchType(
	ID int IDENTITY(1,1) PRIMARY KEY,
	watchType nvarchar(25) NOT NULL
)

INSERT INTO LTEiWatchType
VALUES('Samsung')

INSERT INTO LTEiWatchType
VALUES('Apple')

CREATE TABLE LTEiWatchDetails(
	userID int NOT NULL,
	dataType nvarchar(30) NOT NULL,
	dataValue nvarchar(30) NOT NULL,
	created datetime NOT NULL,
	modified datetime NULL
)

CREATE TABLE LTEiWatchPortalHistory(
	ID int IDENTITY(1,1) PRIMARY KEY,
	userID int,
	eventID int,
	Timestamp datetime,
	watchID int,
	providerID int
)

INSERT INTO LTEiWatchPortalHistory
SELECT ID,1,Timestamp,Null,Null FROM LTEiWatchPortal

INSERT INTO LTEiWatchPortalHistory
SELECT ID,2,ApproveTime,Null,Null FROM LTEiWatchPortal