SELECT providerType FROM LTEiWatchProviders
WHERE ID != CASE WHEN (SELECT providerID from LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}') IS NULL then -1 else (SELECT providerID from LTEiWatchPortal WHERE Email='xpath:{/workflow/variables/email}') END