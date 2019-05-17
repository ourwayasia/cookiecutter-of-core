SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[common_fields](
	[Id] [nvarchar](64) NOT NULL,
	[TenantId] [nvarchar](64) NULL,
	[SortNum] [int] NULL,
	[CreatorId] [nvarchar](64) NULL,
	[CreatorName] [nvarchar](64) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [int] NULL,
	[IsDeleted] [int] NULL,
	[Timestamp] [nvarchar](64) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_config](
	[Id] [nvarchar](64) NOT NULL,
	[ConfigName] [nvarchar](64) NULL,
	[Description] [nvarchar](1024) NULL,
	[ConfigType] [int] NULL,
	[ConfigKey] [nvarchar](64) NULL,
	[ConfigValue] [text] NULL,
	[SortNum] [int] NULL,
	[IsDeleted] [int] NULL,
	[Timestamp] [nvarchar](64) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_department](
	[Id] [nvarchar](64) NOT NULL,
	[TenantId] [nvarchar](64) NULL,
	[ParentId] [nvarchar](64) NULL,
	[No] [nvarchar](64) NULL,
	[Name] [nvarchar](64) NULL,
	[SortNum] [int] NULL,
	[Status] [int] NULL,
	[SourceType] [int] NULL,
	[ThirdId] [nvarchar](64) NULL,
	[IsDeleted] [int] NULL,
	[Timestamp] [nvarchar](64) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_dictionary](
	[Id] [nvarchar](64) NOT NULL,
	[ParentId] [nvarchar](64) NULL,
	[ItemKey] [nvarchar](64) NULL,
	[ItemText] [nvarchar](64) NULL,
	[ItemValue] [nvarchar](512) NULL,
	[SortNum] [int] NULL,
	[Status] [int] NULL,
	[Timestamp] [nvarchar](64) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_employee](
	[Id] [nvarchar](64) NOT NULL,
	[TenantId] [nvarchar](64) NULL,
	[EmployeeNo] [nvarchar](64) NULL,
	[Account] [nvarchar](64) NULL,
	[Password] [nvarchar](64) NULL,
	[Nickname] [nvarchar](128) NULL,
	[RealName] [nvarchar](128) NULL,
	[Spell] [nvarchar](64) NULL,
	[MobileNo] [nvarchar](64) NULL,
	[Email] [nvarchar](64) NULL,
	[HeadPicture] [nvarchar](512) NULL,
	[Sex] [int] NULL,
	[Birthday] [datetime] NULL,
	[DepartmentId] [nvarchar](64) NULL,
	[DepartmentName] [nvarchar](64) NULL,
	[Level] [int] NULL,
	[IsStaff] [int] NULL,
	[SortNum] [int] NULL,
	[Status] [int] NULL,
	[SourceType] [int] NULL,
	[ThirdId] [nvarchar](64) NULL,
	[LastModifyPwdDate] [datetime] NULL,
	[IsDeleted] [int] NULL,
	[Timestamp] [nvarchar](64) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_file](
	[Id] [nvarchar](64) NOT NULL,
	[TenantId] [nvarchar](64) NULL,
	[FileName] [nvarchar](128) NULL,
	[ExtensionName] [nvarchar](16) NULL,
	[FullName] [nvarchar](128) NULL,
	[StorePath] [text] NULL,
	[FileSize] [bigint] NULL,
	[IsImage] [int] NULL,
	[ImageWidth] [int] NULL,
	[ImageHeight] [int] NULL,
	[CreatorId] [nvarchar](64) NULL,
	[CreatorName] [nvarchar](64) NULL,
	[CreateDate] [datetime] NULL,
	[Status] [int] NULL,
	[Timestamp] [nvarchar](64) NULL,
	[BusinessType] [nvarchar](64) NULL,
	[BusinessId] [nvarchar](64) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_log](
	[Id] [nvarchar](64) NOT NULL,
	[TenantId] [nvarchar](64) NULL,
	[OperationName] [nvarchar](64) NULL,
	[OperationContent] [nvarchar](2048) NULL,
	[CreatorId] [nvarchar](64) NULL,
	[CreatorName] [nvarchar](64) NULL,
	[CreateDate] [datetime] NULL,
	[Timestamp] [nvarchar](64) NULL,
 CONSTRAINT [PK_SYS_LOG] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_menu](
	[Id] [nvarchar](64) NOT NULL,
	[TenantId] [nvarchar](64) NULL,
	[MenuName] [nvarchar](64) NULL,
	[ParentId] [nvarchar](64) NULL,
	[MenuUrl] [nvarchar](512) NULL,
	[TargetType] [nvarchar](64) NULL,
	[IconCss] [nvarchar](64) NULL,
	[ModuleKey] [nvarchar](64) NULL,
	[SortNum] [int] NULL,
	[Status] [int] NULL,
	[IsDeleted] [int] NULL,
	[Timestamp] [nvarchar](64) NULL,
	[IsQuickMenu] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_mobile_verification_record](
	[Id] [nvarchar](64) NOT NULL,
	[TenantId] [nvarchar](64) NULL,
	[MobileNo] [nvarchar](64) NULL,
	[VerificationCode] [nvarchar](64) NULL,
	[CreateDate] [datetime] NULL,
	[ExpireDate] [datetime] NULL,
	[Status] [int] NULL,
	[Timestamp] [nvarchar](64) NULL,
 CONSTRAINT [PK_SYS_MOBILE_VERIFICATION_REC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_module](
	[Id] [nvarchar](64) NOT NULL,
	[TenantId] [nvarchar](64) NULL,
	[ModuleKey] [nvarchar](64) NULL,
	[ModuleName] [nvarchar](64) NULL,
	[ApplicationName] [nvarchar](64) NULL,
	[SortNum] [int] NULL,
	[Status] [int] NULL,
	[IsDeleted] [int] NULL,
	[Timestamp] [nvarchar](64) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_permission](
	[Id] [nvarchar](64) NOT NULL,
	[TenantId] [nvarchar](64) NULL,
	[Name] [nvarchar](64) NULL,
	[ModuleId] [nvarchar](64) NULL,
	[ModuleKey] [nvarchar](64) NULL,
	[Operations] [nvarchar](1024) NULL,
	[Actions] [text] NULL,
	[Timestamp] [nvarchar](64) NULL,
	[SortNum] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_role](
	[Id] [nvarchar](64) NOT NULL,
	[TenantId] [nvarchar](64) NULL,
	[RoleName] [nvarchar](128) NULL,
	[SortNum] [int] NULL,
	[Status] [int] NULL,
	[IsDeleted] [int] NULL,
	[Timestamp] [nvarchar](64) NULL,
 CONSTRAINT [PK_SYS_ROLE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_role_member](
	[Id] [nvarchar](64) NOT NULL,
	[TenantId] [nvarchar](64) NULL,
	[RoleId] [nvarchar](64) NULL,
	[MemberType] [int] NULL,
	[MemberId] [nvarchar](64) NULL,
	[MemberName] [nvarchar](64) NULL,
	[Timestamp] [nvarchar](64) NULL,
 CONSTRAINT [PK_SYS_ROLE_MEMBER] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_role_permission](
	[Id] [nvarchar](64) NOT NULL,
	[TenantId] [nvarchar](64) NULL,
	[RoleId] [nvarchar](64) NULL,
	[PermissionId] [nvarchar](64) NULL,
	[Timestamp] [nvarchar](64) NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_tenant](
	[Id] [nvarchar](64) NOT NULL,
	[Code] [nvarchar](64) NOT NULL,
	[Name] [nvarchar](128) NULL,
	[Description] [nvarchar](512) NULL,
	[ParentId] [nvarchar](64) NULL,
	[Lang] [nvarchar](64) NULL,
	[TimeZone] [int] NULL,
	[AuthUserCount] [int] NULL,
	[ExpireDate] [datetime] NULL,
	[Theme] [nvarchar](64) NULL,
	[SortNum] [int] NULL,
	[Status] [int] NOT NULL,
	[CreatorId] [nvarchar](64) NULL,
	[CreatorName] [nvarchar](64) NULL,
	[CreateDate] [datetime] NULL,
	[IsDeleted] [int] NULL,
	[Timestamp] [nvarchar](64) NULL,
 CONSTRAINT [PK_SYS_TENANT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�⻧Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields', @level2type=N'COLUMN',@level2name=N'CreatorId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields', @level2type=N'COLUMN',@level2name=N'CreatorName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields', @level2type=N'COLUMN',@level2name=N'CreateDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬(0-���� 1-����)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�߼�ɾ����ʶ(0-���� 1-��ɾ��)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields', @level2type=N'COLUMN',@level2name=N'IsDeleted'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʱ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ù����ֶ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'ConfigName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'Description'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������ͣ�0-�ͻ����� 1-ϵͳ���ã�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'ConfigType'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ü�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'ConfigKey'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'ConfigValue'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�߼�ɾ����ʶ(0-���� 1-��ɾ��)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'IsDeleted'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʱ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ϵͳ���ñ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�⻧Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϼ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'ParentId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'���ű��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'No'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'Name'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬��ʶ(0-���� 1-������)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Դ��0-Ĭ�� 1-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'SourceType'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'ThirdId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�߼�ɾ����ʶ��0-���� 1-��ɾ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'IsDeleted'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʱ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ϵͳ���ű�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dictionary', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϼ��ֵ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dictionary', @level2type=N'COLUMN',@level2name=N'ParentId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dictionary', @level2type=N'COLUMN',@level2name=N'ItemKey'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʾ�ı�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dictionary', @level2type=N'COLUMN',@level2name=N'ItemText'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ֵ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dictionary', @level2type=N'COLUMN',@level2name=N'ItemValue'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dictionary', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬��ʶ(0-���� 1-����)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dictionary', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʱ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dictionary', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ϵͳ�����ֵ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dictionary'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�⻧Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ա����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'EmployeeNo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˺�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Account'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Password'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ǳ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Nickname'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʵ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'RealName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ƴ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Spell'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ϵ�绰' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'MobileNo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Email'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ͷ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'HeadPicture'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ա�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Sex'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Birthday'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'DepartmentId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'DepartmentName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ְ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Level'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ��ڲ�Ա��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'IsStaff'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬��0-���� 1-���ã�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Դ��0-Ĭ�� 1-��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'SourceType'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'ThirdId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����޸�����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'LastModifyPwdDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�߼�ɾ��״̬��0-���� 1-ɾ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'IsDeleted'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʱ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ϵͳԱ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�⻧Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ļ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'FileName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��չ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'ExtensionName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ļ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'FullName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�洢·��(��Ը�Ŀ¼��·��)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'StorePath'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ļ���С' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'FileSize'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�Ƿ�ͼƬ�����ļ���0-�� 1-�ǣ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'IsImage'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ͼƬ���px' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'ImageWidth'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ͼƬ�߶�px' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'ImageHeight'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����û�ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'CreatorId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����û�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'CreatorName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'CreateDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬��0-��ʱ�ļ� 1-��ʽ�ļ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʱ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ϵͳ���ñ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_log', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�⻧Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_log', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_log', @level2type=N'COLUMN',@level2name=N'OperationName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_log', @level2type=N'COLUMN',@level2name=N'OperationContent'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����û�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_log', @level2type=N'COLUMN',@level2name=N'CreatorId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����û�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_log', @level2type=N'COLUMN',@level2name=N'CreatorName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����û�ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_log', @level2type=N'COLUMN',@level2name=N'CreateDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʱ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_log', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ϵͳ��־��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_log'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�⻧Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'MenuName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϼ��˵�Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'ParentId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�˵���ַ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'MenuUrl'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ŀ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'TargetType'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ͼ����ʽ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'IconCss'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ģ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'ModuleKey'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬(0-���� 1-����)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�߼�ɾ����ʶ��0-���� 1-��ɾ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'IsDeleted'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʱ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ϵͳ�˵���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mobile_verification_record', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�⻧Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mobile_verification_record', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֻ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mobile_verification_record', @level2type=N'COLUMN',@level2name=N'MobileNo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֤��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mobile_verification_record', @level2type=N'COLUMN',@level2name=N'VerificationCode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mobile_verification_record', @level2type=N'COLUMN',@level2name=N'CreateDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mobile_verification_record', @level2type=N'COLUMN',@level2name=N'ExpireDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬��Ĭ�ϣ�0��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mobile_verification_record', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʱ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mobile_verification_record', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ֻ���֤���¼��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mobile_verification_record'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�⻧Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ģ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module', @level2type=N'COLUMN',@level2name=N'ModuleKey'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ģ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module', @level2type=N'COLUMN',@level2name=N'ModuleName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ӧ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module', @level2type=N'COLUMN',@level2name=N'ApplicationName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬ (0-���� 1-����)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ɾ�����(0-���� 1-��ɾ��)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module', @level2type=N'COLUMN',@level2name=N'IsDeleted'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʱ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ϵͳģ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_permission', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�⻧Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_permission', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ȩ������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_permission', @level2type=N'COLUMN',@level2name=N'Name'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ģ��Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_permission', @level2type=N'COLUMN',@level2name=N'ModuleId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ģ�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_permission', @level2type=N'COLUMN',@level2name=N'ModuleKey'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ʶ����,���| �ָ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_permission', @level2type=N'COLUMN',@level2name=N'Operations'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����ַ����,���|�ָ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_permission', @level2type=N'COLUMN',@level2name=N'Actions'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʱ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_permission', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ϵͳȨ�ޱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_permission'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�⻧Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ɫ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'RoleName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'״̬��ʶ(0-���� 1-����)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ɾ����ʶ(0-���� 1-��ɾ��)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'IsDeleted'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʱ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ϵͳ��ɫ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_member', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�⻧Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_member', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ɫId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_member', @level2type=N'COLUMN',@level2name=N'RoleId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��Ա����,1:Ա��,2:����,3:Ա����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_member', @level2type=N'COLUMN',@level2name=N'MemberType'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ԱId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_member', @level2type=N'COLUMN',@level2name=N'MemberId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_member', @level2type=N'COLUMN',@level2name=N'MemberName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʱ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_member', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ϵͳ��ɫ��Ա��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_member'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_permission', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�⻧Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_permission', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ɫId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_permission', @level2type=N'COLUMN',@level2name=N'RoleId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ȩ��Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_permission', @level2type=N'COLUMN',@level2name=N'PermissionId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʱ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_permission', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ϵͳ��ɫȨ�ޱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_permission'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�⻧����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'Code'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�⻧����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'Name'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�⻧����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'Description'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ϼ��⻧ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'ParentId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'Lang'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'TimeZone'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�����Ȩ�û���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'AuthUserCount'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'ExpireDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ĭ�Ϸ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'Theme'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ʾ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�⻧״̬��0-���� 1-���ã�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'CreatorId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'CreatorName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����ʱ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'CreateDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�߼�ɾ��״̬(0-���� 1-��ɾ����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'IsDeleted'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ʱ���' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�⻧��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant'
