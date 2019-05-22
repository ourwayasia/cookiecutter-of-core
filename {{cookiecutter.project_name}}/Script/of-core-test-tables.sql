SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ts_test](
	[Id] [nvarchar](64) NOT NULL,
	[TestName] [nvarchar](64) NULL,
	[CreatorId] [nvarchar](64) NULL,
	[CreatorName] [nvarchar](64) NULL,
	[CreateDate] [datetime] NULL,
	[Timestamp] [nvarchar](64) NULL,
 CONSTRAINT [PK_ts_test] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO