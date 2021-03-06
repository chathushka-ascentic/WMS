CREATE DATABASE [WMS];
GO
USE [WMS]
GO
/****** Object:  Database [WMS]    Script Date: 12/29/2017 6:26:02 AM ******/
CREATE DATABASE [WMS] ON  PRIMARY 
( NAME = N'WMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\WMS.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\WMS.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WMS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WMS] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [WMS] SET ANSI_NULLS ON 
GO
ALTER DATABASE [WMS] SET ANSI_PADDING ON 
GO
ALTER DATABASE [WMS] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [WMS] SET ARITHABORT ON 
GO
ALTER DATABASE [WMS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WMS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WMS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WMS] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [WMS] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [WMS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WMS] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [WMS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WMS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WMS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WMS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WMS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WMS] SET RECOVERY FULL 
GO
ALTER DATABASE [WMS] SET  MULTI_USER 
GO
ALTER DATABASE [WMS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WMS] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WMS', N'ON'
GO
USE [WMS]
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 12/29/2017 6:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Level] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Designat__3214EC0703317E3D] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/29/2017 6:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Designation] [int] NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK__Employee__3214EC077F60ED59] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Project]    Script Date: 12/29/2017 6:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[ProjectAllocations]    Script Date: 12/29/2017 6:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectAllocations](
	[Project] [int] NOT NULL,
	[Employee] [int] NOT NULL,
	[Role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProjectAllocations] PRIMARY KEY CLUSTERED 
(
	[Project] ASC,
	[Employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[UserStory]    Script Date: 12/29/2017 6:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserStory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[UserType] [varchar](50) NULL,
	[Activity] [varchar](100) NULL,
	[BusinessValue] [varchar](100) NULL,
	[AcceptanceCriteria] [varchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[Creator] [int] NULL,
	[LastModified] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[Project] [int] NULL,
	[ApprovalStatus] [varchar](20) NULL,
 CONSTRAINT [PK_UserStory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[Workflow]    Script Date: 12/29/2017 6:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Workflow](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Version] [float] NOT NULL,
	[Name] [varchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Workflow] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[WorkflowActivity]    Script Date: 12/29/2017 6:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WorkflowActivity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[Workflow] [int] NOT NULL,
	[WorkflowVersion] [float] NOT NULL,
	[Name] [varchar](50) NULL,
	[ActivityOrderNumber] [int] NULL,
 CONSTRAINT [PK_WorkflowActivity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[WorkflowActivityExecution]    Script Date: 12/29/2017 6:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WorkflowActivityExecution](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WorkflowExecution] [int] NOT NULL,
	[Activity] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[Status] [varchar](50) NULL,
	[OutCome] [varchar](100) NULL,
	[Comments] [varchar](1000) NULL,
	[CompletedDate] [datetime] NULL,
 CONSTRAINT [PK_WorkflowActivityExecution] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[WorkflowActivityField]    Script Date: 12/29/2017 6:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WorkflowActivityField](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NOT NULL,
	[Activity] [int] NOT NULL,
	[Value] [varchar](1000) NULL,
 CONSTRAINT [PK_WorkflowActivityField] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[WorkflowActivityFieldType]    Script Date: 12/29/2017 6:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WorkflowActivityFieldType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActivityType] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[DataType] [varchar](50) NULL,
 CONSTRAINT [PK_WorkflowActivityFieldType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[WorkflowActivityType]    Script Date: 12/29/2017 6:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WorkflowActivityType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_WorkflowActivityType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
/****** Object:  Table [dbo].[WorkflowExecution]    Script Date: 12/29/2017 6:26:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WorkflowExecution](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Workflow] [int] NOT NULL,
	[WorkflowVersion] [float] NOT NULL,
	[UserStory] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[Status] [varchar](50) NULL,
	[Progress] [float] NULL,
	[InitiatedBy] [int] NULL,
	[EndDate] [datetime] NULL,
 CONSTRAINT [PK_WorkflowExecution] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON
GO
SET IDENTITY_INSERT [dbo].[Designation] ON 

GO
INSERT [dbo].[Designation] ([Id], [Level], [Name]) VALUES (1, 0, N'CEO')
GO
INSERT [dbo].[Designation] ([Id], [Level], [Name]) VALUES (2, 1, N'Manager')
GO
INSERT [dbo].[Designation] ([Id], [Level], [Name]) VALUES (3, 2, N'Project Manager')
GO
INSERT [dbo].[Designation] ([Id], [Level], [Name]) VALUES (4, 3, N'Architect')
GO
INSERT [dbo].[Designation] ([Id], [Level], [Name]) VALUES (5, 4, N'Tech-Lead')
GO
INSERT [dbo].[Designation] ([Id], [Level], [Name]) VALUES (6, 5, N'Senior Engineer')
GO
INSERT [dbo].[Designation] ([Id], [Level], [Name]) VALUES (7, 6, N'Engineer')
GO
INSERT [dbo].[Designation] ([Id], [Level], [Name]) VALUES (8, 0, N'System Admin')
GO
SET IDENTITY_INSERT [dbo].[Designation] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Designation], [Email]) VALUES (4, N'Amanda', N'Anderson', 8, N'amanda.a@wms.com')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Designation], [Email]) VALUES (5, N'Rose', N'King', 5, N'rose.king@wms.com')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Designation], [Email]) VALUES (6, N'Isaac', N'Jones', 6, N'isaac.jones@wms.com')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Designation], [Email]) VALUES (7, N'Mike', N'Wazowski', 4, N'mike.w@wms.com')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Designation], [Email]) VALUES (8, N'Joseph', N'White', 2, N'joseph.white@wms.com')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Designation], [Email]) VALUES (9, N'Lily', N'Lawrence', 1, N'lily.lawrence@wms.com')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Designation], [Email]) VALUES (10, N'Bella', N'Smith', 3, N'bella.smith@wms.com')
GO
INSERT [dbo].[Employee] ([Id], [FirstName], [LastName], [Designation], [Email]) VALUES (12, N'David', N'Turner', 7, N'david.turner@wms.com')
GO
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

GO
INSERT [dbo].[Project] ([Id], [Name]) VALUES (1, N'Project Apollo')
GO
INSERT [dbo].[Project] ([Id], [Name]) VALUES (2, N'Artemis III')
GO
INSERT [dbo].[Project] ([Id], [Name]) VALUES (3, N'Marvel Green United')
GO
INSERT [dbo].[Project] ([Id], [Name]) VALUES (4, N'Matrix Blue')
GO
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
INSERT [dbo].[ProjectAllocations] ([Project], [Employee], [Role]) VALUES (1, 5, N'Senior Engineer')
GO
INSERT [dbo].[ProjectAllocations] ([Project], [Employee], [Role]) VALUES (1, 6, N'Engineer')
GO
INSERT [dbo].[ProjectAllocations] ([Project], [Employee], [Role]) VALUES (1, 7, N'Tech-Lead')
GO
INSERT [dbo].[ProjectAllocations] ([Project], [Employee], [Role]) VALUES (1, 10, N'Architect')
GO
INSERT [dbo].[ProjectAllocations] ([Project], [Employee], [Role]) VALUES (1, 12, N'Engineer')
GO
SET IDENTITY_INSERT [dbo].[UserStory] ON 

GO
INSERT [dbo].[UserStory] ([Id], [Name], [UserType], [Activity], [BusinessValue], [AcceptanceCriteria], [CreatedDate], [Creator], [LastModified], [ModifiedBy], [Project], [ApprovalStatus]) VALUES (49, N'Apollo-Doctor privileges 1', N'doctor', N'create a new patient file', N'I can record patient details in the system', N'Doctors are able to create new patient files.', CAST(N'2017-12-28 21:03:09.760' AS DateTime), 4, CAST(N'2017-12-28 21:03:09.760' AS DateTime), 4, 1, N'New')
GO
INSERT [dbo].[UserStory] ([Id], [Name], [UserType], [Activity], [BusinessValue], [AcceptanceCriteria], [CreatedDate], [Creator], [LastModified], [ModifiedBy], [Project], [ApprovalStatus]) VALUES (50, N'Apollo-Doctor privileges 2', N'doctor', N'view a patient''s medical history', N'I can do medical diagnosis', N'Doctors can view patients'' medical histories.', CAST(N'2017-12-28 21:07:51.617' AS DateTime), 4, CAST(N'2017-12-28 21:07:51.620' AS DateTime), 4, 1, N'New')
GO
INSERT [dbo].[UserStory] ([Id], [Name], [UserType], [Activity], [BusinessValue], [AcceptanceCriteria], [CreatedDate], [Creator], [LastModified], [ModifiedBy], [Project], [ApprovalStatus]) VALUES (51, N'Matrix-Designer Feature 1', N'Designer', N'view all past art works', N'I can get information I need', N'Designers can view all past art works', CAST(N'2017-12-28 21:42:20.887' AS DateTime), 5, CAST(N'2017-12-28 23:36:38.580' AS DateTime), 4, 4, N'New')
GO
INSERT [dbo].[UserStory] ([Id], [Name], [UserType], [Activity], [BusinessValue], [AcceptanceCriteria], [CreatedDate], [Creator], [LastModified], [ModifiedBy], [Project], [ApprovalStatus]) VALUES (52, N'Marvel - Online order - user feature 1', N'online customer', N'browse through product catalogs', N'I can have a good shopping experience', N'Users can browse through all the catalogs available', CAST(N'2017-12-28 21:49:00.457' AS DateTime), 7, CAST(N'2017-12-28 21:49:00.457' AS DateTime), 7, 3, N'New')
GO
INSERT [dbo].[UserStory] ([Id], [Name], [UserType], [Activity], [BusinessValue], [AcceptanceCriteria], [CreatedDate], [Creator], [LastModified], [ModifiedBy], [Project], [ApprovalStatus]) VALUES (53, N'Artemis - online user manual 1', N'reader', N'choose a preferred language', N'I can understand the manual better', N'Readers can choose a language for the manual out of a given list.', CAST(N'2017-12-28 21:53:03.357' AS DateTime), 9, CAST(N'2017-12-28 21:53:03.357' AS DateTime), 9, 2, N'New')
GO
INSERT [dbo].[UserStory] ([Id], [Name], [UserType], [Activity], [BusinessValue], [AcceptanceCriteria], [CreatedDate], [Creator], [LastModified], [ModifiedBy], [Project], [ApprovalStatus]) VALUES (54, N'Artemis - website feature 1', N'user', N'watch videos on how to operate equipment', N'I can learn about products easily', N'Users can watch operating guide videos on the web site', CAST(N'2017-12-28 23:24:33.257' AS DateTime), 4, CAST(N'2017-12-28 23:24:33.257' AS DateTime), 4, 2, N'New')
GO
SET IDENTITY_INSERT [dbo].[UserStory] OFF
GO
SET IDENTITY_INSERT [dbo].[Workflow] ON 

GO
INSERT [dbo].[Workflow] ([Id], [Version], [Name], [CreatedDate], [CreatedBy], [IsActive]) VALUES (3, 1, N'Single Approver', CAST(N'2017-12-29 03:49:25.137' AS DateTime), 4, 1)
GO
INSERT [dbo].[Workflow] ([Id], [Version], [Name], [CreatedDate], [CreatedBy], [IsActive]) VALUES (4, 1, N'In-project Validation', CAST(N'2017-12-29 05:05:49.897' AS DateTime), 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Workflow] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkflowActivity] ON 

GO
INSERT [dbo].[WorkflowActivity] ([Id], [Type], [Workflow], [WorkflowVersion], [Name], [ActivityOrderNumber]) VALUES (1, 1, 3, 1, N'CEO Approval', NULL)
GO
INSERT [dbo].[WorkflowActivity] ([Id], [Type], [Workflow], [WorkflowVersion], [Name], [ActivityOrderNumber]) VALUES (2, 1, 4, 1, N'Teach-lead Approval', NULL)
GO
INSERT [dbo].[WorkflowActivity] ([Id], [Type], [Workflow], [WorkflowVersion], [Name], [ActivityOrderNumber]) VALUES (3, 1, 4, 1, N'Architect Approval', NULL)
GO
INSERT [dbo].[WorkflowActivity] ([Id], [Type], [Workflow], [WorkflowVersion], [Name], [ActivityOrderNumber]) VALUES (4, 1, 4, 1, N'PM Approval', NULL)
GO
SET IDENTITY_INSERT [dbo].[WorkflowActivity] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkflowActivityExecution] ON 

GO
INSERT [dbo].[WorkflowActivityExecution] ([Id], [WorkflowExecution], [Activity], [StartDate], [Status], [OutCome], [Comments], [CompletedDate]) VALUES (1, 2, 1, CAST(N'2017-12-29 06:15:02.763' AS DateTime), N'Sarted', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[WorkflowActivityExecution] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkflowActivityField] ON 

GO
INSERT [dbo].[WorkflowActivityField] ([Id], [Type], [Activity], [Value]) VALUES (1, 1, 1, N'lily.lawrence@wms.com')
GO
INSERT [dbo].[WorkflowActivityField] ([Id], [Type], [Activity], [Value]) VALUES (2, 2, 1, NULL)
GO
INSERT [dbo].[WorkflowActivityField] ([Id], [Type], [Activity], [Value]) VALUES (3, 3, 1, NULL)
GO
INSERT [dbo].[WorkflowActivityField] ([Id], [Type], [Activity], [Value]) VALUES (4, 1, 2, N'rose.king@wms.com')
GO
INSERT [dbo].[WorkflowActivityField] ([Id], [Type], [Activity], [Value]) VALUES (5, 2, 2, NULL)
GO
INSERT [dbo].[WorkflowActivityField] ([Id], [Type], [Activity], [Value]) VALUES (6, 3, 2, NULL)
GO
INSERT [dbo].[WorkflowActivityField] ([Id], [Type], [Activity], [Value]) VALUES (7, 1, 3, N'mike.w@wms.com')
GO
INSERT [dbo].[WorkflowActivityField] ([Id], [Type], [Activity], [Value]) VALUES (8, 2, 3, NULL)
GO
INSERT [dbo].[WorkflowActivityField] ([Id], [Type], [Activity], [Value]) VALUES (9, 3, 3, NULL)
GO
INSERT [dbo].[WorkflowActivityField] ([Id], [Type], [Activity], [Value]) VALUES (10, 1, 4, N'bella.smith@wms.com')
GO
INSERT [dbo].[WorkflowActivityField] ([Id], [Type], [Activity], [Value]) VALUES (11, 2, 4, NULL)
GO
INSERT [dbo].[WorkflowActivityField] ([Id], [Type], [Activity], [Value]) VALUES (12, 3, 4, NULL)
GO
SET IDENTITY_INSERT [dbo].[WorkflowActivityField] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkflowActivityFieldType] ON 

GO
INSERT [dbo].[WorkflowActivityFieldType] ([Id], [ActivityType], [Name], [DataType]) VALUES (1, 1, N'Approver', N'email')
GO
INSERT [dbo].[WorkflowActivityFieldType] ([Id], [ActivityType], [Name], [DataType]) VALUES (2, 1, N'Approval', N'boolean')
GO
INSERT [dbo].[WorkflowActivityFieldType] ([Id], [ActivityType], [Name], [DataType]) VALUES (3, 1, N'Due date', N'Date')
GO
SET IDENTITY_INSERT [dbo].[WorkflowActivityFieldType] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkflowActivityType] ON 

GO
INSERT [dbo].[WorkflowActivityType] ([Id], [Name]) VALUES (1, N'Approval')
GO
SET IDENTITY_INSERT [dbo].[WorkflowActivityType] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkflowExecution] ON 

GO
INSERT [dbo].[WorkflowExecution] ([Id], [Workflow], [WorkflowVersion], [UserStory], [StartDate], [Status], [Progress], [InitiatedBy], [EndDate]) VALUES (2, 3, 1, 50, CAST(N'2017-12-29 06:12:37.660' AS DateTime), N'3', 0, 4, NULL)
GO
SET IDENTITY_INSERT [dbo].[WorkflowExecution] OFF
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Designation] FOREIGN KEY([Designation])
REFERENCES [dbo].[Designation] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Designation]
GO
ALTER TABLE [dbo].[ProjectAllocations]  WITH CHECK ADD  CONSTRAINT [FK_ProjectAllocations_Employee] FOREIGN KEY([Employee])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[ProjectAllocations] CHECK CONSTRAINT [FK_ProjectAllocations_Employee]
GO
ALTER TABLE [dbo].[ProjectAllocations]  WITH CHECK ADD  CONSTRAINT [FK_ProjectAllocations_Project] FOREIGN KEY([Project])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[ProjectAllocations] CHECK CONSTRAINT [FK_ProjectAllocations_Project]
GO
ALTER TABLE [dbo].[UserStory]  WITH CHECK ADD  CONSTRAINT [FK_UserStory_Employee] FOREIGN KEY([Creator])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[UserStory] CHECK CONSTRAINT [FK_UserStory_Employee]
GO
ALTER TABLE [dbo].[UserStory]  WITH CHECK ADD  CONSTRAINT [FK_UserStory_Employee2] FOREIGN KEY([ModifiedBy])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[UserStory] CHECK CONSTRAINT [FK_UserStory_Employee2]
GO
ALTER TABLE [dbo].[UserStory]  WITH CHECK ADD  CONSTRAINT [FK_UserStory_Project] FOREIGN KEY([Project])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[UserStory] CHECK CONSTRAINT [FK_UserStory_Project]
GO
ALTER TABLE [dbo].[Workflow]  WITH CHECK ADD  CONSTRAINT [FK_Workflow_Employee] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Workflow] CHECK CONSTRAINT [FK_Workflow_Employee]
GO
ALTER TABLE [dbo].[WorkflowActivity]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowActivity_Workflow] FOREIGN KEY([Workflow], [WorkflowVersion])
REFERENCES [dbo].[Workflow] ([Id], [Version])
GO
ALTER TABLE [dbo].[WorkflowActivity] CHECK CONSTRAINT [FK_WorkflowActivity_Workflow]
GO
ALTER TABLE [dbo].[WorkflowActivity]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowActivityType_WorkflowActivityFieldType] FOREIGN KEY([Type])
REFERENCES [dbo].[WorkflowActivityType] ([Id])
GO
ALTER TABLE [dbo].[WorkflowActivity] CHECK CONSTRAINT [FK_WorkflowActivityType_WorkflowActivityFieldType]
GO
ALTER TABLE [dbo].[WorkflowActivityExecution]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowActivityExecution_WorkflowExecution] FOREIGN KEY([WorkflowExecution])
REFERENCES [dbo].[WorkflowExecution] ([Id])
GO
ALTER TABLE [dbo].[WorkflowActivityExecution] CHECK CONSTRAINT [FK_WorkflowActivityExecution_WorkflowExecution]
GO
ALTER TABLE [dbo].[WorkflowActivityField]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_WorkflowActivity] FOREIGN KEY([Activity])
REFERENCES [dbo].[WorkflowActivity] ([Id])
GO
ALTER TABLE [dbo].[WorkflowActivityField] CHECK CONSTRAINT [FK_Table_1_WorkflowActivity]
GO
ALTER TABLE [dbo].[WorkflowActivityField]  WITH CHECK ADD  CONSTRAINT [FK_Table_1_WorkflowActivityType] FOREIGN KEY([Type])
REFERENCES [dbo].[WorkflowActivityFieldType] ([Id])
GO
ALTER TABLE [dbo].[WorkflowActivityField] CHECK CONSTRAINT [FK_Table_1_WorkflowActivityType]
GO
ALTER TABLE [dbo].[WorkflowActivityFieldType]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowActivityFieldType_WorkflowActivityType] FOREIGN KEY([ActivityType])
REFERENCES [dbo].[WorkflowActivityType] ([Id])
GO
ALTER TABLE [dbo].[WorkflowActivityFieldType] CHECK CONSTRAINT [FK_WorkflowActivityFieldType_WorkflowActivityType]
GO
ALTER TABLE [dbo].[WorkflowExecution]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowExecution_Employee] FOREIGN KEY([InitiatedBy])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[WorkflowExecution] CHECK CONSTRAINT [FK_WorkflowExecution_Employee]
GO
ALTER TABLE [dbo].[WorkflowExecution]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowExecution_UserStory] FOREIGN KEY([UserStory])
REFERENCES [dbo].[UserStory] ([Id])
GO
ALTER TABLE [dbo].[WorkflowExecution] CHECK CONSTRAINT [FK_WorkflowExecution_UserStory]
GO
ALTER TABLE [dbo].[WorkflowExecution]  WITH CHECK ADD  CONSTRAINT [FK_WorkflowExecution_Workflow] FOREIGN KEY([Workflow], [WorkflowVersion])
REFERENCES [dbo].[Workflow] ([Id], [Version])
GO
ALTER TABLE [dbo].[WorkflowExecution] CHECK CONSTRAINT [FK_WorkflowExecution_Workflow]
GO
USE [master]
GO
ALTER DATABASE [WMS] SET  READ_WRITE 
GO
