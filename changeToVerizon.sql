UPDATE [LTEiWatchPortal]
SET Timestamp=GETDATE(), providerID= (SELECT ID FROM LTEiWatchProviders WHERE providerType='Verizon')
WHERE Email='xpath:{/workflow/variables/email}'

UPDATE [LTEiWatchDetails]
SET modified=GETDATE()
WHERE userID= (SELECT ID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}') and modified IS NULL

INSERT INTO [LTEiWatchDetails]
VALUES ((SELECT ID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}'),
		'IMEI#',
		'xpath:{/workflow/PopupInput_3/IMEI_Number}',
		GETDATE(),
		NULL)

INSERT INTO [LTEiWatchDetails]
VALUES ((SELECT ID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}'),
		'addressForE911',
		'xpath:{/workflow/PopupInput_3/addressForE911}',
		GETDATE(),
		NULL)

INSERT INTO [LTEiWatchPortalHistory]
VALUES((SELECT ID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}'),
		(SELECT ID FROM LTEiWatchEvents WHERE eventType='Provider Change'),
		GETDATE(),
		(SELECT watchID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}'),
		(SELECT ID FROM LTEiWatchProviders WHERE providerType='Verizon'))