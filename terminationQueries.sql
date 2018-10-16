UPDATE [LTEiWatchPortal]
SET Timestamp=GETDATE()
WHERE Email='xpath:{/workflow/ForEach_7/col}'

INSERT INTO [LTEiWatchPortalHistory]
VALUES((SELECT ID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/ForEach_7/col}'),
		(SELECT ID FROM LTEiWatchEvents WHERE eventType='Service Terminated'),
		GETDATE(),
		(SELECT watchID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/ForEach_7/col}'),
		(SELECT providerID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/ForEach_7/col}'))