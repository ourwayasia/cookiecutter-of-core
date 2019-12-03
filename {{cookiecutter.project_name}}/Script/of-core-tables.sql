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
 CONSTRAINT [PK_common_fields] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
 CONSTRAINT [PK_sys_config] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
	[FullDepartmentId] [nvarchar](1024) NULL,
	[FullDepartmentName] [nvarchar](1024) NULL,
	[LeaderId] [nvarchar](64) NULL,
	[LeaderName] [nvarchar](64) NULL,
	[SortNum] [int] NULL,
	[Status] [int] NULL,
	[SourceType] [int] NULL,
	[ThirdId] [nvarchar](64) NULL,
	[IsDeleted] [int] NULL,
	[Timestamp] [nvarchar](64) NULL,
 CONSTRAINT [PK_sys_department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
 CONSTRAINT [PK_sys_dictionary] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
 CONSTRAINT [PK_sys_employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_employee_secondment](
	[Id] [nvarchar](64) NOT NULL,
	[EmployeeId] [nvarchar](64) NULL,
	[EmployeeNo] [nvarchar](64) NULL,
	[Account] [nvarchar](64) NULL,
	[RealName] [nvarchar](128) NULL,
	[MobileNo] [nvarchar](64) NULL,
	[FullDepartmentName] [nvarchar](256) NULL,
	[SecondmentDepartmentId] [nvarchar](64) NULL,
	[SecondmentDepartmentName] [nvarchar](64) NULL,
	[SecondmentFullDepartmentId] [nvarchar](1024) NULL,
	[SecondmentFullDepartmentName] [nvarchar](1024) NULL,
	[Timestamp] [nvarchar](64) NULL,
 CONSTRAINT [PK_sys_employee_secondment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
 CONSTRAINT [PK_sys_file] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
 CONSTRAINT [PK_sys_log] PRIMARY KEY CLUSTERED 
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
	[IsQuickMenu] [int] NULL,
	[MenuType] [int] NULL
 CONSTRAINT [PK_sys_menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
 CONSTRAINT [PK_sys_mobile_verification_record] PRIMARY KEY CLUSTERED 
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
 CONSTRAINT [PK_sys_module] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
 CONSTRAINT [PK_sys_permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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
 CONSTRAINT [PK_sys_role] PRIMARY KEY CLUSTERED 
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
 CONSTRAINT [PK_sys_role_member] PRIMARY KEY CLUSTERED 
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
 CONSTRAINT [PK_sys_role_permission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
	[OwnerType] [nvarchar](32) NULL,
	[OwnerId] [nvarchar](1024) NULL,
	[OwnerName] [nvarchar](1024) NULL,
	[GroupId] [nvarchar](1024) NULL,
	[GroupName] [nvarchar](1024) NULL,
	[SuperAdminUserId] [nvarchar](64) NULL,
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
 CONSTRAINT [PK_sys_tenant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_groups](
	[Id] [nvarchar](64) NOT NULL,
	[TenantId] [nvarchar](64) NULL,
	[GroupName] [nvarchar](128) NULL,
	[SortNum] [int] NULL,
	[Status] [int] NULL,
	[IsDeleted] [int] NULL,
	[CreatorId] [nvarchar](64) NULL,
	[CreatorName] [nvarchar](64) NULL,
	[CreateDate] [datetime] NULL,
	[Timestamp] [nvarchar](64) NULL,
 CONSTRAINT [PK_sys_groups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sys_groups_member](
	[Id] [nvarchar](64) NOT NULL,
	[GroupId] [nvarchar](64) NULL,
	[TenantId] [nvarchar](64) NULL,
	[MemberType] [int] NULL,
	[MemberId] [nvarchar](64) NULL,
	[MemberName] [nvarchar](64) NULL,
	[Timestamp] [nvarchar](64) NULL,
 CONSTRAINT [PK_sys_groups_member] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields', @level2type=N'COLUMN',@level2name=N'CreatorId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields', @level2type=N'COLUMN',@level2name=N'CreatorName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields', @level2type=N'COLUMN',@level2name=N'CreateDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(0-禁用 1-启用)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逻辑删除标识(0-正常 1-已删除)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields', @level2type=N'COLUMN',@level2name=N'IsDeleted'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'常用公共字段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'common_fields'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'ConfigName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'Description'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置类型（0-客户配置 1-系统配置）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'ConfigType'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置键' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'ConfigKey'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配置项值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'ConfigValue'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逻辑删除标识(0-正常 1-已删除)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'IsDeleted'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统配置表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_config'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级部门' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'ParentId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'No'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'Name'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态标识(0-禁用 1-已启用)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据来源（0-默认 1-）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'SourceType'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第三方Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'ThirdId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逻辑删除标识（0-正常 1-已删除）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'IsDeleted'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统部门表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_department'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dictionary', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级字典' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dictionary', @level2type=N'COLUMN',@level2name=N'ParentId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'字典代码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dictionary', @level2type=N'COLUMN',@level2name=N'ItemKey'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示文本' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dictionary', @level2type=N'COLUMN',@level2name=N'ItemText'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联项值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dictionary', @level2type=N'COLUMN',@level2name=N'ItemValue'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dictionary', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态标识(0-禁用 1-启用)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dictionary', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dictionary', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统数据字典' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_dictionary'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'员工号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'EmployeeNo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Account'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Password'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'昵称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Nickname'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'RealName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名拼音' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Spell'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'MobileNo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Email'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'头像' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'HeadPicture'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Sex'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生日' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Birthday'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'DepartmentId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'DepartmentName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Level'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否内部员工' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'IsStaff'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0-禁用 1-启用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数据来源（0-默认 1-）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'SourceType'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'第三方Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'ThirdId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后修改密码时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'LastModifyPwdDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逻辑删除状态（0-正常 1-删除）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'IsDeleted'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统员工表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'员工号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee_secondment', @level2type=N'COLUMN',@level2name=N'EmployeeNo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee_secondment', @level2type=N'COLUMN',@level2name=N'Account'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee_secondment', @level2type=N'COLUMN',@level2name=N'RealName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee_secondment', @level2type=N'COLUMN',@level2name=N'MobileNo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'所属部门名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee_secondment', @level2type=N'COLUMN',@level2name=N'FullDepartmentName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挂职部门Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee_secondment', @level2type=N'COLUMN',@level2name=N'SecondmentDepartmentId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挂职部门名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee_secondment', @level2type=N'COLUMN',@level2name=N'SecondmentDepartmentName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挂职部门Id全路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee_secondment', @level2type=N'COLUMN',@level2name=N'SecondmentFullDepartmentId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'挂职部门名称全路径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee_secondment', @level2type=N'COLUMN',@level2name=N'SecondmentFullDepartmentName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_employee_secondment', @level2type=N'COLUMN',@level2name=N'Timestamp'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'FileName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'扩展名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'ExtensionName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完整文件名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'FullName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'存储路径(相对根目录的路径)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'StorePath'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件大小' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'FileSize'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否图片类型文件（0-否 1-是）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'IsImage'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片宽度px' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'ImageWidth'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图片高度px' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'ImageHeight'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'CreatorId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'CreatorName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'CreateDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（0-临时文件 1-正式文件）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统配置表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_file'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_log', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_log', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_log', @level2type=N'COLUMN',@level2name=N'OperationName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_log', @level2type=N'COLUMN',@level2name=N'OperationContent'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_log', @level2type=N'COLUMN',@level2name=N'CreatorId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_log', @level2type=N'COLUMN',@level2name=N'CreatorName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建用户时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_log', @level2type=N'COLUMN',@level2name=N'CreateDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_log', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统日志表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_log'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'MenuName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级菜单Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'ParentId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'菜单地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'MenuUrl'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'目标类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'TargetType'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'图标样式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'IconCss'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'ModuleKey'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态(0-禁用 1-启用)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逻辑删除标识（0-正常 1-已删除）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'IsDeleted'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统菜单表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_menu'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mobile_verification_record', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mobile_verification_record', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mobile_verification_record', @level2type=N'COLUMN',@level2name=N'MobileNo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验证码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mobile_verification_record', @level2type=N'COLUMN',@level2name=N'VerificationCode'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mobile_verification_record', @level2type=N'COLUMN',@level2name=N'CreateDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'过期时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mobile_verification_record', @level2type=N'COLUMN',@level2name=N'ExpireDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态（默认：0）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mobile_verification_record', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mobile_verification_record', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机验证码记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_mobile_verification_record'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module', @level2type=N'COLUMN',@level2name=N'ModuleKey'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module', @level2type=N'COLUMN',@level2name=N'ModuleName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'应用名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module', @level2type=N'COLUMN',@level2name=N'ApplicationName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态 (0-禁用 1-启用)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标记(0-正常 1-已删除)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module', @level2type=N'COLUMN',@level2name=N'IsDeleted'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统模块表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_module'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_permission', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_permission', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_permission', @level2type=N'COLUMN',@level2name=N'Name'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_permission', @level2type=N'COLUMN',@level2name=N'ModuleId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'模块编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_permission', @level2type=N'COLUMN',@level2name=N'ModuleKey'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'操作标识集合,多个| 分割' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_permission', @level2type=N'COLUMN',@level2name=N'Operations'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'请求地址集合,多个|分割' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_permission', @level2type=N'COLUMN',@level2name=N'Actions'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_permission', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统权限表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_permission'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'RoleName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态标识(0-禁用 1-启用)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标识(0-正常 1-已删除)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'IsDeleted'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统角色表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_member', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_member', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_member', @level2type=N'COLUMN',@level2name=N'RoleId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成员类型,1:员工,2:部门,3:员工组' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_member', @level2type=N'COLUMN',@level2name=N'MemberType'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成员Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_member', @level2type=N'COLUMN',@level2name=N'MemberId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_member', @level2type=N'COLUMN',@level2name=N'MemberName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_member', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统角色成员表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_member'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_permission', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_permission', @level2type=N'COLUMN',@level2name=N'TenantId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'角色Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_permission', @level2type=N'COLUMN',@level2name=N'RoleId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_permission', @level2type=N'COLUMN',@level2name=N'PermissionId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_permission', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系统角色权限表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_role_permission'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'Code'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'Name'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'Description'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上级租户ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'ParentId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户所有者类型：department|role' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'OwnerType'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户所有者ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'OwnerId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户所有者名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'OwnerName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户超级管理员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'SuperAdminUserId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'语言' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'Lang'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时区' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'TimeZone'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最大授权用户数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'AuthUserCount'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'过期时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'ExpireDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'默认风格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'Theme'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户状态（0-禁用 1-启用）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'CreatorId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'CreatorName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'CreateDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逻辑删除状态(0-正常 1-已删除）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'IsDeleted'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'租户表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_tenant'

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groups', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groups', @level2type=N'COLUMN',@level2name=N'GroupName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groups', @level2type=N'COLUMN',@level2name=N'SortNum'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态标识(0-禁用 1-启用)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groups', @level2type=N'COLUMN',@level2name=N'Status'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'删除标识(0-正常 1-已删除)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groups', @level2type=N'COLUMN',@level2name=N'IsDeleted'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groups', @level2type=N'COLUMN',@level2name=N'CreatorId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groups', @level2type=N'COLUMN',@level2name=N'CreatorName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groups', @level2type=N'COLUMN',@level2name=N'CreateDate'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groups', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组表（用途：租户管理）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groups'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主键Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groups_member', @level2type=N'COLUMN',@level2name=N'Id'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组的Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groups_member', @level2type=N'COLUMN',@level2name=N'GroupId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成员类型,1:员工,' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groups_member', @level2type=N'COLUMN',@level2name=N'MemberType'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成员Id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groups_member', @level2type=N'COLUMN',@level2name=N'MemberId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groups_member', @level2type=N'COLUMN',@level2name=N'MemberName'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间戳' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groups_member', @level2type=N'COLUMN',@level2name=N'Timestamp'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'组成员表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sys_groups_member'

