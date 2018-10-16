UPDATE [LTEiWatchPortal]
SET Timestamp=GETDATE()
WHERE ID= (SELECT ID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}')

INSERT INTO [LTEiWatchDetails]
VALUES ((SELECT ID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}'),
		'IMEI#',
		'xpath:{/workflow/PopupInput_2/IMEI_Number}',
		GETDATE(),
		NULL)

INSERT INTO [LTEiWatchDetails]
VALUES ((SELECT ID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}'),
		'EID#',
		'xpath:{/workflow/PopupInput_2/EID_Number}',
		GETDATE(),
		NULL)