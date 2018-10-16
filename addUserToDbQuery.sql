INSERT INTO [LTEiWatchPortal] 
VALUES ('xpath:{/workflow/variables/name}',
        'xpath:{/workflow/variables/loginUsername}',
        'xpath:{/workflow/variables/email}',
        GETDATE(),
        1,
        NULL,
        NULL,
		NULL,
		(SELECT ID FROM LTEiWatchType WHERE watchType='xpath:{/workflow/variables/watchType}'),
        (SELECT ID FROM LTEiWatchProviders WHERE providerType='xpath:{/workflow/variables/providerType}')
        )

INSERT INTO [LTEiWatchPortalHistory]
VALUES ((SELECT ID FROM LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}'),
		(SELECT ID FROM LTEiWatchEvents WHERE eventType='Requested'),
		GETDATE(),
		(SELECT ID FROM LTEiWatchType WHERE watchType='xpath:{/workflow/variables/watchType}'),
        (SELECT ID FROM LTEiWatchProviders WHERE providerType='xpath:{/workflow/variables/providerType}')
		)