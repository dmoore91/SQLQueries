INSERT INTO [LTEiWatchPortal] 
VALUES ('Daniel Moore',
        'dmoore',
        'dmoore@commvault.com',
        GETDATE(),
        1,
        NULL,
        NULL,
        NULL)

INSERT INTO [LTEiWatchStatus]
VALUES ((SELECT ID FROM LTEiWatchPortal WHERE UserName='dmoore' and Name='Daniel Moore' and Email='dmoore@commvault.com'),
		0,
		GETDATE())

INSERT INTO [LTEiWatchDetails]
VALUES ((SELECT ID FROM LTEiWatchPortal WHERE UserName='dmoore' and Name='Daniel Moore' and Email='dmoore@commvault.com'),
		'WatchType',
		'Samsung')

INSERT INTO [LTEiWatchDetails]
VALUES ((SELECT ID FROM LTEiWatchPortal WHERE UserName='dmoore' and Name='Daniel Moore' and Email='dmoore@commvault.com'),
		'ServiceProvider',
		'Verizon')

INSERT INTO [LTEiWatchDetails]
VALUES ((SELECT ID FROM LTEiWatchPortal WHERE UserName='dmoore' and Name='Daniel Moore' and Email='dmoore@commvault.com'),
		'IMEI#',
		'12345')

INSERT INTO [LTEiWatchDetails]
VALUES ((SELECT ID FROM LTEiWatchPortal WHERE UserName='dmoore' and Name='Daniel Moore' and Email='dmoore@commvault.com'),
		'addressForE911',
		'123456')