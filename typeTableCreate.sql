CREATE TABLE LTEiWatchProviders(
	providerID int IDENTITY(1,1) PRIMARY KEY,
	providerType nvarchar(50) NOT NULL
)

INSERT INTO LTEiWatchProviders
VALUES('Verizon');

INSERT INTO LTEiWatchProviders
VALUES('AT&T');

INSERT INTO LTEiWatchProviders
VALUES('Not Provided');

CREATE TABLE LTEiWatchEvents(
	eventID int IDENTITY(1,1) PRIMARY KEY,
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
	watchID int IDENTITY(1,1) PRIMARY KEY,
	watchType nvarchar(25) NOT NULL
)

INSERT INTO LTEiWatchType
VALUES('Samsung')

CREATE TABLE LTEiWatchDetails(
	userID int NOT NULL,
	dataType nvarchar(30) NOT NULL,
	dataValue nvarchar(30) NOT NULL,
)

CREATE TABLE LTEiWatchPortalHistory(
	historyID int IDENTITY(1,1) PRIMARY KEY,
	userID int,
	eventID int,
	Timestamp datetime,
	watchID int,
	providerID int
)