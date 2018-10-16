CREATE TABLE LTEiWatchStatus(
	LTEiWatchID int NOT NULL,
	Status int NOT NULL,
	Timestamp datetime NOT NULL
)

CREATE TABLE LTEiWatchDetails(
	LTEiWatchID int NOT NULL,
	DataType nvarchar(50) NOT NULL,
	Data nvarchar(50) NOT NULL
)