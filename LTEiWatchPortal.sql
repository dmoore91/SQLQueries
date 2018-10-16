

/****** Object:  Table [dbo].[LTEiWatchPortal]    Script Date: 7/24/2018 1:59:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LTEiWatchPortal](
	[Name] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Timestamp] [datetime] NOT NULL,
	[AcceptedAgreement] [bit] NOT NULL,
	[Approved] [bit] NULL,
	[ApprovedBy] [nvarchar](100) NULL,
	[ApproveTime] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


