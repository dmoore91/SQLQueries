UPDATE [LTEiWatchPortal] 
SET ApprovedBy = 'xpath:{/workflow/UserInput_1/completedBy/userName}',
    Approved = CAST(CASE xpath:{/workflow/variables/rejected} WHEN 1 THEN 1 ELSE 0 END AS BIT),
    ApproveTime = GETDATE(),
	Timestamp=GETDATE()
WHERE Email='xpath:{/workflow/variables/email}'

INSERT INTO [LTEiWatchPortalHistory]
VALUES((SELECT ID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}'),
		(SELECT ID FROM LTEiWatchEvents WHERE eventType='xpath:{/workflow/variables/approvedOrDenied}'),
		GETDATE(),
		(SELECT ID FROM LTEiWatchType WHERE watchType='xpath:{/workflow/variables/watchType}'),
		(SELECT ID FROM LTEiWatchProviders WHERE providerType='xpath:{/workflow/variables/providerType}'))