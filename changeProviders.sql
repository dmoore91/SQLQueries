UPDATE [LTEiWatchPortal]
SET Timestamp=GETDATE(), providerID=xpath:{/workflow/variables/serviceProviderID}
WHERE ID= (SELECT ID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/PopupInput_1/employeeEmail}')

INSERT INTO [LTEiWatchPortalHistory]
VALUES((SELECT ID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/PopupInput_1/employeeEmail}'),
		6,
		GETDATE(),
		(SELECT watchID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/PopupInput_1/employeeEmail}'),
		xpath:{/workflow/variables/serviceProviderID})