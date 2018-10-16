SELECT Name,UserName,Email,

CASE 
	WHEN AcceptedAgreement=0 THEN 'Agreement Not Accepted'
	WHEN AcceptedAgreement=1 THEN 'Agreement Accepted'
END AS 'Agreement Accepted?',

CASE
	WHEN Status= (SELECT ID FROM LTEiWatchEvents WHERE eventType='Request Approved') THEN 'Approved'
	WHEN Status= (SELECT ID FROM LTEiWatchEvents WHERE eventType='Request Denied') THEN 'Denied'
	WHEN Status= (SELECT ID FROM LTEiWatchEvents WHERE eventType='Requested') THEN 'Not Handled Yet'
	WHEN Status= (SELECT ID FROM LTEiWatchEvents WHERE eventType='Service Terminated') THEN 'Service Terminated'
	WHEN Status= (SELECT ID FROM LTEiWatchEvents WHERE eventType='Employment Terminated') THEN 'Employment Terminated'
END AS 'Current Status',

ISNULL(ApprovedBy,'Not Handled Yet') AS Approver,
ISNULL(CONVERT(varchar(20),ApproveTime,100),'Not Handled Yet') AS ApproveTime,
ISNULL((SELECT providerType FROM LTEiWatchProviders WHERE ID=LTEiWatchPortal.providerID),'Not Available') AS provider,
ISNULL((SELECT watchType FROM LTEiWatchType WHERE ID=LTEiWatchPortal.watchID),'Not Available') AS watchType,
CONVERT(varchar(20),LTEiWatchPortal.Timestamp,100) AS 'Last Updated',
CASE
	WHEN (SELECT eventType FROM LTEiWatchEvents WHERE ID=eventID)='Request Approved' THEN 'Approved'
	WHEN (SELECT eventType FROM LTEiWatchEvents WHERE ID=eventID)='Request Denied' THEN 'Denied'
	WHEN (SELECT eventType FROM LTEiWatchEvents WHERE ID=eventID)='Requested' THEN 'Requested'
END AS 'Approved?',
dataType, dataValue
FROM LTEiWatchPortal 
INNER JOIN LTEiWatchPortalHistory ON LTEiWatchPortal.ID = LTEiWatchPortalHistory.userID
LEFT JOIN LTEiWatchDetails ON LTEiWatchPortal.ID = LTEiWatchDetails.userID
WHERE ((eventID = (SELECT ID FROM LTEiWatchEvents WHERE eventType='Request Approved') OR eventID = (SELECT ID FROM LTEiWatchEvents WHERE eventType='Request Denied') 
OR eventID = (SELECT ID FROM LTEiWatchEvents WHERE eventType='Requested'))
AND EXISTS (SELECT ID FROM LTEiWatchPortal) 
AND DATEADD(ms, -DATEPART(ms, LTEiWatchPortalHistory.Timestamp), LTEiWatchPortalHistory.Timestamp) = DATEADD(ms, -DATEPART(ms, LTEiWatchPortal.ApproveTime), LTEiWatchPortal.ApproveTime)
OR LTEiWatchPortal.ApproveTime IS NULL)
AND Email='test@commvault.com'
ORDER BY dataType ASC

SELECT Name,UserName,Email,
CASE 
	WHEN AcceptedAgreement=0 THEN 'Agreement Not Accepted'
	WHEN AcceptedAgreement=1 THEN 'Agreement Accepted'
END AS 'Agreement Accepted?',
CASE
	WHEN Status= (SELECT ID FROM LTEiWatchEvents WHERE eventType='Request Approved') THEN 'Approved'
	WHEN Status= (SELECT ID FROM LTEiWatchEvents WHERE eventType='Request Denied') THEN 'Denied'
	WHEN Status= (SELECT ID FROM LTEiWatchEvents WHERE eventType='Requested') THEN 'Not Handled Yet'
	WHEN Status= (SELECT ID FROM LTEiWatchEvents WHERE eventType='Service Terminated') THEN 'Service Terminated'
	WHEN Status= (SELECT ID FROM LTEiWatchEvents WHERE eventType='Employment Terminated') THEN 'Employment Terminated'
END AS 'Current Status',
ISNULL(ApprovedBy,'Not Handled Yet') AS Approver,
ISNULL(CONVERT(varchar(20),ApproveTime,100),'Not Handled Yet') AS ApproveTime,
ISNULL((SELECT providerType FROM LTEiWatchProviders WHERE ID=LTEiWatchPortal.providerID),'Not Available') AS provider,
ISNULL((SELECT watchType FROM LTEiWatchType where ID=LTEiWatchPortal.watchID),'Not Available') AS watchType,
CONVERT(varchar(20),LTEiWatchPortal.Timestamp,100) AS 'Last Updated',
CASE
	WHEN (SELECT eventType FROM LTEiWatchEvents WHERE ID=eventID)='Request Approved' THEN 'Approved'
	WHEN (SELECT eventType FROM LTEiWatchEvents WHERE ID=eventID)='Request Denied' THEN 'Denied'
	WHEN (SELECT eventType FROM LTEiWatchEvents WHERE ID=eventID)='Requested' THEN 'Requested'
END AS 'Approved?'
FROM LTEiWatchPortal INNER JOIN LTEiWatchPortalHistory
ON LTEiWatchPortal.ID = LTEiWatchPortalHistory.userID
WHERE (eventID = (SELECT ID FROM LTEiWatchEvents WHERE eventType='Request Approved') OR eventID = (SELECT ID FROM LTEiWatchEvents WHERE eventType='Request Denied') 
OR eventID = (SELECT ID FROM LTEiWatchEvents WHERE eventType='Requested'))
AND EXISTS (SELECT ID FROM LTEiWatchPortal) 
AND DATEADD(ms, -DATEPART(ms, LTEiWatchPortalHistory.Timestamp), LTEiWatchPortalHistory.Timestamp) = DATEADD(ms, -DATEPART(ms, LTEiWatchPortal.ApproveTime), LTEiWatchPortal.ApproveTime)
OR LTEiWatchPortal.ApproveTime IS NULL
ORDER BY LTEiWatchPortal.ID

SELECT LTEiWatchPortal.ID, 
CASE
	WHEN (SELECT eventType FROM LTEiWatchEvents WHERE ID=eventID)='Request Approved' THEN 'Approved'
	WHEN (SELECT eventType FROM LTEiWatchEvents WHERE ID=eventID)='Request Denied' THEN 'Denied'
END AS 'Approved?'
FROM LTEiWatchPortal INNER JOIN LTEiWatchPortalHistory
ON LTEiWatchPortal.ID = LTEiWatchPortalHistory.userID
WHERE (eventID = (SELECT ID FROM LTEiWatchEvents WHERE eventType='Request Approved') OR eventID = (SELECT ID FROM LTEiWatchEvents WHERE eventType='Request Denied')) 
AND EXISTS (SELECT ID FROM LTEiWatchPortal) 
AND DATEADD(ms, -DATEPART(ms, LTEiWatchPortalHistory.Timestamp), LTEiWatchPortalHistory.Timestamp) = DATEADD(ms, -DATEPART(ms, LTEiWatchPortal.ApproveTime), LTEiWatchPortal.ApproveTime)
ORDER BY LTEiWatchPortal.ID