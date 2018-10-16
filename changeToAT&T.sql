UPDATE [LTEiWatchPortal]
SET Timestamp=GETDATE(), providerID= (SELECT ID FROM LTEiWatchProviders WHERE providerType='AT&T')
WHERE Email='xpath:{/workflow/variables/email}'

UPDATE [LTEiWatchDetails]
SET modified=GETDATE()
WHERE userID= (SELECT ID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}') and modified IS NULL

INSERT INTO [LTEiWatchDetails]
VALUES ((SELECT ID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}'),
		'IMEI#',
		'xpath:{/workflow/PopupInput_4/IMEI_Number}',
		GETDATE(),
		NULL)

INSERT INTO [LTEiWatchDetails]
VALUES ((SELECT ID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}'),
		'EID',
		'xpath:{/workflow/PopupInput_4/EID_Number}',
		GETDATE(),
		NULL)

INSERT INTO [LTEiWatchPortalHistory]
VALUES((SELECT ID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}'),
		(SELECT ID FROM LTEiWatchEvents WHERE eventType='Provider Change'),
		GETDATE(),
		(SELECT watchID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}'),
		(SELECT ID FROM LTEiWatchProviders WHERE providerType='AT&T'))