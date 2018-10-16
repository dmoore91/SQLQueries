SELECT 
Name,UserName,Email,CONVERT(varchar(20),ApproveTime,100) AS ApproveTime, ApprovedBy as Approver, (SELECT providerType FROM LTEiWatchProviders WHERE ID=providerID) AS provider, 
(SELECT watchType FROM LTEiWatchType where ID=watchID) AS watchType
FROM LTEiWatchPortal