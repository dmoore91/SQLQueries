UPDATE [LTEiWatchPortal]
SET Timestamp=GETDATE()
WHERE ID= (SELECT ID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}')

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