USE [master]
GO
/****** Object:  Database [FarmManage]    Script Date: 6/21/2021 12:00:23 AM ******/
CREATE DATABASE [FarmManage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FarmManage', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FarmManage.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FarmManage_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\FarmManage_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FarmManage] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FarmManage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FarmManage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FarmManage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FarmManage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FarmManage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FarmManage] SET ARITHABORT OFF 
GO
ALTER DATABASE [FarmManage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FarmManage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FarmManage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FarmManage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FarmManage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FarmManage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FarmManage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FarmManage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FarmManage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FarmManage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FarmManage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FarmManage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FarmManage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FarmManage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FarmManage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FarmManage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FarmManage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FarmManage] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FarmManage] SET  MULTI_USER 
GO
ALTER DATABASE [FarmManage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FarmManage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FarmManage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FarmManage] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FarmManage] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FarmManage]
GO
/****** Object:  Table [dbo].[Crop]    Script Date: 6/21/2021 12:00:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Crop](
	[CropID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[CreateTime] [datetime] NULL,
	[FarmID] [int] NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_Crop] PRIMARY KEY CLUSTERED 
(
	[CropID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CropStep]    Script Date: 6/21/2021 12:00:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CropStep](
	[CropStepID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Detail] [nvarchar](max) NULL,
	[Evaluate] [ntext] NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[CropID] [int] NULL,
	[IsActive] [bit] NULL,
	[SeedID] [int] NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_CropStep] PRIMARY KEY CLUSTERED 
(
	[CropStepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DateStatiticProfit]    Script Date: 6/21/2021 12:00:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DateStatiticProfit](
	[ProfitID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[CropStepID] [int] NULL,
	[Quantity] [int] NULL,
	[Profit] [int] NULL,
	[CreateTime] [datetime] NULL,
	[Note] [ntext] NULL,
 CONSTRAINT [PK_DateStatiticProfit_1] PRIMARY KEY CLUSTERED 
(
	[ProfitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Farm]    Script Date: 6/21/2021 12:00:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Farm](
	[FarmID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Detail] [nchar](10) NULL,
	[Location] [nvarchar](max) NULL,
	[isActive] [bit] NULL,
	[CreateBy] [varchar](50) NULL,
	[Note] [ntext] NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_Farm] PRIMARY KEY CLUSTERED 
(
	[FarmID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/21/2021 12:00:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Seed]    Script Date: 6/21/2021 12:00:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Seed](
	[SeedID] [int] IDENTITY(1,1) NOT NULL,
	[SeedName] [nvarchar](255) NULL,
	[SeedType] [nvarchar](255) NULL,
	[Evaluate] [ntext] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [varchar](50) NULL,
	[PlantingMonth] [int] NULL,
 CONSTRAINT [PK_Seed] PRIMARY KEY CLUSTERED 
(
	[SeedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Spending]    Script Date: 6/21/2021 12:00:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spending](
	[SpendingID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [ntext] NULL,
	[CreateTime] [datetime] NULL,
	[CropStepID] [int] NULL,
	[Amount] [int] NULL,
 CONSTRAINT [PK_Spending] PRIMARY KEY CLUSTERED 
(
	[SpendingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Step]    Script Date: 6/21/2021 12:00:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Step](
	[StepID] [int] IDENTITY(1,1) NOT NULL,
	[StepName] [nvarchar](255) NULL,
	[Description] [ntext] NULL,
	[Oder] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[CropStepID] [int] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_Step] PRIMARY KEY CLUSTERED 
(
	[StepID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 6/21/2021 12:00:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Avatar] [nchar](10) NULL,
	[UserRole] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WeatherNote]    Script Date: 6/21/2021 12:00:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeatherNote](
	[WeatherID] [int] IDENTITY(1,1) NOT NULL,
	[CreatTime] [nchar](10) NULL,
	[CreateBy] [int] NULL,
	[Evaluate] [ntext] NULL,
	[isDelete] [bit] NULL,
	[CropStepID] [int] NULL,
 CONSTRAINT [PK_WeatherNote] PRIMARY KEY CLUSTERED 
(
	[WeatherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Crop] ON 

INSERT [dbo].[Crop] ([CropID], [Title], [Description], [CreateTime], [FarmID], [UpdateTime]) VALUES (4, N'Vụ xuân', N'không có mo ta', CAST(N'2021-01-01 00:00:00.000' AS DateTime), 7, CAST(N'2021-02-02 00:00:00.000' AS DateTime))
INSERT [dbo].[Crop] ([CropID], [Title], [Description], [CreateTime], [FarmID], [UpdateTime]) VALUES (1004, N'vụ ad', N'ád', NULL, 7, NULL)
INSERT [dbo].[Crop] ([CropID], [Title], [Description], [CreateTime], [FarmID], [UpdateTime]) VALUES (1005, N'NULL545', NULL, NULL, 7, NULL)
INSERT [dbo].[Crop] ([CropID], [Title], [Description], [CreateTime], [FarmID], [UpdateTime]) VALUES (1006, N'XDongod', N'', CAST(N'2021-06-20 23:51:58.457' AS DateTime), 3011, NULL)
SET IDENTITY_INSERT [dbo].[Crop] OFF
SET IDENTITY_INSERT [dbo].[CropStep] ON 

INSERT [dbo].[CropStep] ([CropStepID], [Title], [Detail], [Evaluate], [CreateTime], [UpdateTime], [CropID], [IsActive], [SeedID], [IsDelete]) VALUES (10, N'test', N'test', N'ok', CAST(N'2021-06-16 00:00:00.000' AS DateTime), CAST(N'2021-06-16 00:00:00.000' AS DateTime), 4, 1, 1, NULL)
INSERT [dbo].[CropStep] ([CropStepID], [Title], [Detail], [Evaluate], [CreateTime], [UpdateTime], [CropID], [IsActive], [SeedID], [IsDelete]) VALUES (12, N'test', N'test', N'Chưa có đánh giá cho mùa này! Hãy cập nhật nhé. ', CAST(N'2021-06-16 21:54:16.770' AS DateTime), CAST(N'2021-06-16 21:54:16.770' AS DateTime), 4, 1, 1, NULL)
INSERT [dbo].[CropStep] ([CropStepID], [Title], [Detail], [Evaluate], [CreateTime], [UpdateTime], [CropID], [IsActive], [SeedID], [IsDelete]) VALUES (15, N'12312', N'123', N'12312', NULL, CAST(N'2021-06-16 23:48:09.907' AS DateTime), 4, 1, 1, NULL)
INSERT [dbo].[CropStep] ([CropStepID], [Title], [Detail], [Evaluate], [CreateTime], [UpdateTime], [CropID], [IsActive], [SeedID], [IsDelete]) VALUES (17, N'test', N'test', N'Chưa có đánh giá cho mùa này! Hãy cập nhật nhé. ', CAST(N'2021-06-20 22:55:41.817' AS DateTime), CAST(N'2021-06-20 22:55:41.817' AS DateTime), 4, 1, 1, NULL)
INSERT [dbo].[CropStep] ([CropStepID], [Title], [Detail], [Evaluate], [CreateTime], [UpdateTime], [CropID], [IsActive], [SeedID], [IsDelete]) VALUES (19, N'12312', N'123', N'', NULL, CAST(N'2021-06-20 23:26:57.757' AS DateTime), 4, 1, 1, NULL)
INSERT [dbo].[CropStep] ([CropStepID], [Title], [Detail], [Evaluate], [CreateTime], [UpdateTime], [CropID], [IsActive], [SeedID], [IsDelete]) VALUES (22, N'12312', N'', N'12312', NULL, CAST(N'2021-06-20 23:52:11.463' AS DateTime), 1006, 1, 5, NULL)
SET IDENTITY_INSERT [dbo].[CropStep] OFF
SET IDENTITY_INSERT [dbo].[DateStatiticProfit] ON 

INSERT [dbo].[DateStatiticProfit] ([ProfitID], [Title], [CropStepID], [Quantity], [Profit], [CreateTime], [Note]) VALUES (4, N'123', 10, NULL, 24, NULL, NULL)
INSERT [dbo].[DateStatiticProfit] ([ProfitID], [Title], [CropStepID], [Quantity], [Profit], [CreateTime], [Note]) VALUES (5, N'123123', 10, NULL, 452, NULL, NULL)
INSERT [dbo].[DateStatiticProfit] ([ProfitID], [Title], [CropStepID], [Quantity], [Profit], [CreateTime], [Note]) VALUES (6, N'323', 10, NULL, 528, NULL, NULL)
INSERT [dbo].[DateStatiticProfit] ([ProfitID], [Title], [CropStepID], [Quantity], [Profit], [CreateTime], [Note]) VALUES (1004, N'te', 12, NULL, 1000, CAST(N'2021-06-20 22:55:08.107' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[DateStatiticProfit] OFF
SET IDENTITY_INSERT [dbo].[Farm] ON 

INSERT [dbo].[Farm] ([FarmID], [Title], [Detail], [Location], [isActive], [CreateBy], [Note], [CreateTime]) VALUES (7, N'Đất nhà', N'Đất nhà ta', N'lodon', 1, N'user', N'chau thanh tay ninh', CAST(N'2021-01-01 00:00:00.000' AS DateTime))
INSERT [dbo].[Farm] ([FarmID], [Title], [Detail], [Location], [isActive], [CreateBy], [Note], [CreateTime]) VALUES (2011, N'123', N'123       ', N'thuan giao binh duong', NULL, N'luan', N'', CAST(N'2021-06-17 18:35:39.947' AS DateTime))
INSERT [dbo].[Farm] ([FarmID], [Title], [Detail], [Location], [isActive], [CreateBy], [Note], [CreateTime]) VALUES (3011, N'Đất bà ba', N'123       ', N'thuan giao', NULL, N'user', N'123', CAST(N'2021-06-20 23:16:23.863' AS DateTime))
SET IDENTITY_INSERT [dbo].[Farm] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (1, N'admin               ')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (2, N'user                ')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Seed] ON 

INSERT [dbo].[Seed] ([SeedID], [SeedName], [SeedType], [Evaluate], [CreateTime], [CreateBy], [PlantingMonth]) VALUES (1, N'Dưa leo', N'Dưa leo f1', N'tạm', CAST(N'2021-10-01 00:00:00.000' AS DateTime), N'user', 5)
INSERT [dbo].[Seed] ([SeedID], [SeedName], [SeedType], [Evaluate], [CreateTime], [CreateBy], [PlantingMonth]) VALUES (5, N'đưa', N'123', N'', CAST(N'2021-06-20 23:47:55.757' AS DateTime), N'user', 2)
SET IDENTITY_INSERT [dbo].[Seed] OFF
SET IDENTITY_INSERT [dbo].[Spending] ON 

INSERT [dbo].[Spending] ([SpendingID], [Title], [Description], [CreateTime], [CropStepID], [Amount]) VALUES (1003, N'b', NULL, NULL, 10, 30)
INSERT [dbo].[Spending] ([SpendingID], [Title], [Description], [CreateTime], [CropStepID], [Amount]) VALUES (2002, N'chi mua kẹo', N'', CAST(N'2021-06-20 22:37:16.143' AS DateTime), 12, 2000)
SET IDENTITY_INSERT [dbo].[Spending] OFF
SET IDENTITY_INSERT [dbo].[Step] ON 

INSERT [dbo].[Step] ([StepID], [StepName], [Description], [Oder], [CreateDate], [UpdateDate], [CropStepID], [isActive]) VALUES (3, N'123', N'123313', NULL, CAST(N'2021-06-20 09:35:03.420' AS DateTime), CAST(N'2021-06-20 09:35:03.420' AS DateTime), 12, 0)
INSERT [dbo].[Step] ([StepID], [StepName], [Description], [Oder], [CreateDate], [UpdateDate], [CropStepID], [isActive]) VALUES (4, N'', N'', NULL, CAST(N'2021-06-20 09:36:27.523' AS DateTime), CAST(N'2021-06-20 09:36:27.530' AS DateTime), 12, 0)
INSERT [dbo].[Step] ([StepID], [StepName], [Description], [Oder], [CreateDate], [UpdateDate], [CropStepID], [isActive]) VALUES (5, N'dsff', N'sdfs', NULL, CAST(N'2021-06-20 09:38:44.273' AS DateTime), CAST(N'2021-06-20 09:38:44.273' AS DateTime), 12, 1)
INSERT [dbo].[Step] ([StepID], [StepName], [Description], [Oder], [CreateDate], [UpdateDate], [CropStepID], [isActive]) VALUES (6, N'luan', N'ád', NULL, CAST(N'2021-06-20 09:41:35.317' AS DateTime), CAST(N'2021-06-20 09:41:35.317' AS DateTime), 12, 0)
INSERT [dbo].[Step] ([StepID], [StepName], [Description], [Oder], [CreateDate], [UpdateDate], [CropStepID], [isActive]) VALUES (7, N'1231231', N'123', NULL, CAST(N'2021-06-20 09:42:30.883' AS DateTime), CAST(N'2021-06-20 09:42:30.883' AS DateTime), 12, 1)
INSERT [dbo].[Step] ([StepID], [StepName], [Description], [Oder], [CreateDate], [UpdateDate], [CropStepID], [isActive]) VALUES (8, N'luan', N'12', NULL, CAST(N'2021-06-20 09:46:14.177' AS DateTime), CAST(N'2021-06-20 09:46:14.177' AS DateTime), 12, 0)
INSERT [dbo].[Step] ([StepID], [StepName], [Description], [Oder], [CreateDate], [UpdateDate], [CropStepID], [isActive]) VALUES (11, N'123', N'1', NULL, CAST(N'2021-06-20 21:48:48.743' AS DateTime), CAST(N'2021-06-20 21:48:48.743' AS DateTime), 12, 1)
INSERT [dbo].[Step] ([StepID], [StepName], [Description], [Oder], [CreateDate], [UpdateDate], [CropStepID], [isActive]) VALUES (12, N'ds', N'ádasda', NULL, CAST(N'2021-06-20 23:52:28.077' AS DateTime), CAST(N'2021-06-20 23:52:28.077' AS DateTime), 22, 0)
SET IDENTITY_INSERT [dbo].[Step] OFF
INSERT [dbo].[User] ([UserID], [Password], [Name], [Address], [Email], [PhoneNumber], [Avatar], [UserRole], [IsActive]) VALUES (N'admin', N'1', N'admin', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [Address], [Email], [PhoneNumber], [Avatar], [UserRole], [IsActive]) VALUES (N'luan', N'123', N'luan', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([UserID], [Password], [Name], [Address], [Email], [PhoneNumber], [Avatar], [UserRole], [IsActive]) VALUES (N'user', N'1', N'Minh Luân', N'Thuận giao Thuận An bình Dương', N'luanvo1ad@gmail.com', N'0354624774', NULL, 1, 1)
ALTER TABLE [dbo].[Crop]  WITH CHECK ADD  CONSTRAINT [FK_Crop_Farm] FOREIGN KEY([FarmID])
REFERENCES [dbo].[Farm] ([FarmID])
GO
ALTER TABLE [dbo].[Crop] CHECK CONSTRAINT [FK_Crop_Farm]
GO
ALTER TABLE [dbo].[CropStep]  WITH CHECK ADD  CONSTRAINT [FK_CropStep_Crop] FOREIGN KEY([CropID])
REFERENCES [dbo].[Crop] ([CropID])
GO
ALTER TABLE [dbo].[CropStep] CHECK CONSTRAINT [FK_CropStep_Crop]
GO
ALTER TABLE [dbo].[CropStep]  WITH CHECK ADD  CONSTRAINT [FK_CropStep_Seed] FOREIGN KEY([SeedID])
REFERENCES [dbo].[Seed] ([SeedID])
GO
ALTER TABLE [dbo].[CropStep] CHECK CONSTRAINT [FK_CropStep_Seed]
GO
ALTER TABLE [dbo].[DateStatiticProfit]  WITH CHECK ADD  CONSTRAINT [FK_DateStatiticProfit_CropStep] FOREIGN KEY([CropStepID])
REFERENCES [dbo].[CropStep] ([CropStepID])
GO
ALTER TABLE [dbo].[DateStatiticProfit] CHECK CONSTRAINT [FK_DateStatiticProfit_CropStep]
GO
ALTER TABLE [dbo].[Farm]  WITH CHECK ADD  CONSTRAINT [FK_Farm_User] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Farm] CHECK CONSTRAINT [FK_Farm_User]
GO
ALTER TABLE [dbo].[Seed]  WITH CHECK ADD  CONSTRAINT [FK_Seed_User] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Seed] CHECK CONSTRAINT [FK_Seed_User]
GO
ALTER TABLE [dbo].[Spending]  WITH CHECK ADD  CONSTRAINT [FK_Spending_CropStep] FOREIGN KEY([CropStepID])
REFERENCES [dbo].[CropStep] ([CropStepID])
GO
ALTER TABLE [dbo].[Spending] CHECK CONSTRAINT [FK_Spending_CropStep]
GO
ALTER TABLE [dbo].[Step]  WITH CHECK ADD  CONSTRAINT [FK_Step_CropStep] FOREIGN KEY([CropStepID])
REFERENCES [dbo].[CropStep] ([CropStepID])
GO
ALTER TABLE [dbo].[Step] CHECK CONSTRAINT [FK_Step_CropStep]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[WeatherNote]  WITH CHECK ADD  CONSTRAINT [FK_WeatherNote_CropStep] FOREIGN KEY([CropStepID])
REFERENCES [dbo].[CropStep] ([CropStepID])
GO
ALTER TABLE [dbo].[WeatherNote] CHECK CONSTRAINT [FK_WeatherNote_CropStep]
GO
USE [master]
GO
ALTER DATABASE [FarmManage] SET  READ_WRITE 
GO
