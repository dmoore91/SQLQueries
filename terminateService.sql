UPDATE [LTEiWatchPortal]
SET Timestamp=GETDATE()
WHERE Email='xpath:{/workflow/variables/email}'

INSERT INTO [LTEiWatchPortalHistory]
VALUES((SELECT ID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}'),
		(SELECT ID FROM LTEiWatchEvents WHERE eventType='Service Terminated'),
		GETDATE(),
		(SELECT watchID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}'),
		(SELECT providerID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}'))