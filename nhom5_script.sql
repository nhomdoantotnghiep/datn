USE [master]
GO
/****** Object:  Database [computerlabsdatn]    Script Date: 10/16/2017 15:01:54 ******/
CREATE DATABASE [computerlabsdatn] ON  PRIMARY 
( NAME = N'computerlabdatn', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\computerlabdatn.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'computerlabdatn_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\computerlabdatn_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [computerlabsdatn] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [computerlabsdatn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [computerlabsdatn] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [computerlabsdatn] SET ANSI_NULLS OFF
GO
ALTER DATABASE [computerlabsdatn] SET ANSI_PADDING OFF
GO
ALTER DATABASE [computerlabsdatn] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [computerlabsdatn] SET ARITHABORT OFF
GO
ALTER DATABASE [computerlabsdatn] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [computerlabsdatn] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [computerlabsdatn] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [computerlabsdatn] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [computerlabsdatn] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [computerlabsdatn] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [computerlabsdatn] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [computerlabsdatn] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [computerlabsdatn] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [computerlabsdatn] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [computerlabsdatn] SET  DISABLE_BROKER
GO
ALTER DATABASE [computerlabsdatn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [computerlabsdatn] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [computerlabsdatn] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [computerlabsdatn] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [computerlabsdatn] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [computerlabsdatn] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [computerlabsdatn] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [computerlabsdatn] SET  READ_WRITE
GO
ALTER DATABASE [computerlabsdatn] SET RECOVERY SIMPLE
GO
ALTER DATABASE [computerlabsdatn] SET  MULTI_USER
GO
ALTER DATABASE [computerlabsdatn] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [computerlabsdatn] SET DB_CHAINING OFF
GO
USE [computerlabsdatn]
GO
/****** Object:  Table [dbo].[tbl_workingshift]    Script Date: 10/16/2017 15:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_workingshift](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[status] [int] NULL,
	[create_date] [datetime] NULL,
 CONSTRAINT [PK__tbl_work__3213E83F5EBF139D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_workingshift] ON
INSERT [dbo].[tbl_workingshift] ([id], [date_id], [user_id], [status], [create_date]) VALUES (28, 96, 91, 1, CAST(0x0000A80E002511D8 AS DateTime))
INSERT [dbo].[tbl_workingshift] ([id], [date_id], [user_id], [status], [create_date]) VALUES (29, 96, 92, 1, CAST(0x0000A80E002511D8 AS DateTime))
INSERT [dbo].[tbl_workingshift] ([id], [date_id], [user_id], [status], [create_date]) VALUES (30, 96, 93, 1, CAST(0x0000A80E002511D8 AS DateTime))
INSERT [dbo].[tbl_workingshift] ([id], [date_id], [user_id], [status], [create_date]) VALUES (34, 95, 87, 1, CAST(0x0000A80E00A41BB8 AS DateTime))
INSERT [dbo].[tbl_workingshift] ([id], [date_id], [user_id], [status], [create_date]) VALUES (35, 95, 91, 1, CAST(0x0000A80E00A41BB8 AS DateTime))
INSERT [dbo].[tbl_workingshift] ([id], [date_id], [user_id], [status], [create_date]) VALUES (36, 95, 93, 1, CAST(0x0000A80E00A41BB8 AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_workingshift] OFF
/****** Object:  Table [dbo].[tbl_user]    Script Date: 10/16/2017 15:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](225) NULL,
	[password] [nvarchar](225) NULL,
	[fullname] [nvarchar](225) NULL,
	[address] [nvarchar](225) NULL,
	[Email] [nvarchar](225) NULL,
	[gender] [tinyint] NULL,
	[birthday] [datetime2](0) NULL,
	[status] [tinyint] NULL,
	[departmentID] [int] NULL,
	[HOD] [tinyint] NULL,
 CONSTRAINT [PK__tbl_user__CB9A1CDF3C69FB99] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [departmentID] ON [dbo].[tbl_user] 
(
	[departmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_user] ON
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [Email], [gender], [birthday], [status], [departmentID], [HOD]) VALUES (1, N'letai', N'admin123', N'tai le', N'chuong duong do', NULL, 1, CAST(0x000000003E1B0B0000 AS DateTime2), 1, 1, 1)
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [Email], [gender], [birthday], [status], [departmentID], [HOD]) VALUES (84, N'nguyensontung1', N'tung1234', N'nguyen son tung', N'bạch mai', N'tung@tung.com', 1, CAST(0x00000000371A0B0000 AS DateTime2), 1, 2, 1)
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [Email], [gender], [birthday], [status], [departmentID], [HOD]) VALUES (85, N'letuantai1', N'123456', N'letuantai1', N'5555555555555', N'tai11@gmail.com', 0, CAST(0x00000000141A0B0000 AS DateTime2), 1, 1, 1)
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [Email], [gender], [birthday], [status], [departmentID], [HOD]) VALUES (86, N'letuantai2', N'123456', N'giáo viên tài 2', N'chương dương', N'tai2@tai.com', 0, CAST(0x00000000141A0B0000 AS DateTime2), 1, 2, 1)
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [Email], [gender], [birthday], [status], [departmentID], [HOD]) VALUES (87, N'letuantai3', N'123456', N'tài kỹ thuật 3', N'hàm tử quan', N'tai3@tai.com', 1, CAST(0x00000000141A0B0000 AS DateTime2), 1, 3, 1)
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [Email], [gender], [birthday], [status], [departmentID], [HOD]) VALUES (88, N'letuantai4', N'123456', N'tài sinh viên 4', N'mỹ đình', N'tai4@gmail.com', 1, CAST(0x00000000141A0B0000 AS DateTime2), 1, 4, 1)
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [Email], [gender], [birthday], [status], [departmentID], [HOD]) VALUES (89, N'instructor1', N'123456', N'Teacher 1', N'duong hoang quoc viet', N'teacher1@teacher.com', 0, CAST(0x000000004C320B0000 AS DateTime2), 1, 2, 1)
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [Email], [gender], [birthday], [status], [departmentID], [HOD]) VALUES (90, N'instructor2', N'123456', N'Teacher 26456', N'đường hoàng quốc việt', N'teacher1@teacher.com', 0, CAST(0x000000004C320B0000 AS DateTime2), 1, 2, 1)
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [Email], [gender], [birthday], [status], [departmentID], [HOD]) VALUES (91, N'letuantai31', N'123456', N'tài kỹ thuật 31', N'hàm tử quan', N'tai3@tai.com', 1, CAST(0x00000000141A0B0000 AS DateTime2), 1, 3, 1)
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [Email], [gender], [birthday], [status], [departmentID], [HOD]) VALUES (92, N'letuantai32', N'123456', N'tài kỹ thuật 32', N'hàm tử quan', N'tai3@tai.com', 1, CAST(0x00000000141A0B0000 AS DateTime2), 1, 3, 1)
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [Email], [gender], [birthday], [status], [departmentID], [HOD]) VALUES (93, N'letuantai33', N'123456', N'tài kỹ thuật 33', N'hàm tử quan', N'tai3@tai.com', 1, CAST(0x00000000141A0B0000 AS DateTime2), 1, 3, 1)
SET IDENTITY_INSERT [dbo].[tbl_user] OFF
/****** Object:  Table [dbo].[tbl_type_accessory]    Script Date: 10/16/2017 15:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_type_accessory](
	[typeID] [int] IDENTITY(1,1) NOT NULL,
	[type_accessory] [nvarchar](225) NULL,
	[status] [tinyint] NULL,
 CONSTRAINT [PK__tbl_type__F04DF11A398D8EEE] PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_type_accessory] ON
INSERT [dbo].[tbl_type_accessory] ([typeID], [type_accessory], [status]) VALUES (1, N'Software1', 1)
INSERT [dbo].[tbl_type_accessory] ([typeID], [type_accessory], [status]) VALUES (2, N'Hardware', 1)
INSERT [dbo].[tbl_type_accessory] ([typeID], [type_accessory], [status]) VALUES (5, N'Type Accessory 6', 1)
INSERT [dbo].[tbl_type_accessory] ([typeID], [type_accessory], [status]) VALUES (6, N'Type Accessory 5', 1)
INSERT [dbo].[tbl_type_accessory] ([typeID], [type_accessory], [status]) VALUES (7, N'Type Accessory 4', 1)
INSERT [dbo].[tbl_type_accessory] ([typeID], [type_accessory], [status]) VALUES (9, N'Software 2', 1)
INSERT [dbo].[tbl_type_accessory] ([typeID], [type_accessory], [status]) VALUES (10, N'Software 3', 0)
SET IDENTITY_INSERT [dbo].[tbl_type_accessory] OFF
/****** Object:  Table [dbo].[tbl_shiftname]    Script Date: 10/16/2017 15:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_shiftname](
	[shiftID] [int] IDENTITY(1,1) NOT NULL,
	[starttime] [time](0) NULL,
	[endtime] [time](0) NULL,
	[shiftname] [nvarchar](50) NULL,
	[status] [tinyint] NULL,
	[shiftType] [tinyint] NULL,
 CONSTRAINT [PK__tbl_shif__F2F06B2236B12243] PRIMARY KEY CLUSTERED 
(
	[shiftID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_shiftname] ON
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (1, CAST(0x00F4650000000000 AS Time), CAST(0x0098850000000000 AS Time), N'Shift 1', 1, 1)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (2, CAST(0x0098850000000000 AS Time), CAST(0x00B8A10000000000 AS Time), N'Tiết 2', 1, 1)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (3, CAST(0x00D0B60000000000 AS Time), CAST(0x00F0D20000000000 AS Time), N'Tiết 3', 1, 1)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (4, CAST(0x00F0D20000000000 AS Time), CAST(0x0010EF0000000000 AS Time), N'Tiết 4', 1, 1)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (5, CAST(0x0010EF0000000000 AS Time), CAST(0x00907E0000000000 AS Time), N'Tiết 5', 1, 1)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (6, CAST(0x00300B0100000000 AS Time), CAST(0x0050270100000000 AS Time), N'Tiết 6', 1, 1)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (7, CAST(0x0000000000000000 AS Time), CAST(0x0000000000000000 AS Time), N'Tiết 7', 1, 2)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (8, CAST(0x0078690000000000 AS Time), CAST(0x0078690000000000 AS Time), N'Tiết 8', 1, 2)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (9, CAST(0x0078690000000000 AS Time), CAST(0x0078690000000000 AS Time), N'Tiết 9', 1, 2)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (10, CAST(0x0078690000000000 AS Time), CAST(0x0078690000000000 AS Time), N'Tiết 10', 1, 2)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (11, CAST(0x0078690000000000 AS Time), CAST(0x0078690000000000 AS Time), N'Tiết 11', 1, 2)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (12, CAST(0x0078690000000000 AS Time), CAST(0x0078690000000000 AS Time), N'Tiết 12', 1, 2)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (13, CAST(0x0078690000000000 AS Time), CAST(0x0078690000000000 AS Time), N'Tiết 13', 1, 3)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (14, CAST(0x0078690000000000 AS Time), CAST(0x0078690000000000 AS Time), N'Tiết 14', 1, 3)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (15, CAST(0x0078690000000000 AS Time), CAST(0x0078690000000000 AS Time), N'Tiết 15', 1, 3)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (16, CAST(0x0078690000000000 AS Time), CAST(0x0078690000000000 AS Time), N'Tiết 16', 1, 3)
SET IDENTITY_INSERT [dbo].[tbl_shiftname] OFF
/****** Object:  Table [dbo].[tbl_schedule]    Script Date: 10/16/2017 15:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_schedule](
	[scheduleID] [int] IDENTITY(1,1) NOT NULL,
	[shiftID] [int] NULL,
	[roomID] [int] NULL,
	[dateworkID] [int] NULL,
	[status] [tinyint] NULL,
 CONSTRAINT [PK__tbl_sche__A532EDB433D4B598] PRIMARY KEY CLUSTERED 
(
	[scheduleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [dateworkID] ON [dbo].[tbl_schedule] 
(
	[dateworkID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [roomID] ON [dbo].[tbl_schedule] 
(
	[roomID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [shiftID] ON [dbo].[tbl_schedule] 
(
	[shiftID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_schedule] ON
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1067, 1, 1, 77, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1068, 2, 1, 77, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1069, 3, 1, 77, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1070, 4, 1, 77, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1071, 5, 1, 77, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1072, 6, 1, 77, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1073, 7, 1, 77, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1074, 8, 1, 77, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1075, 9, 1, 77, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1076, 10, 1, 77, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1077, 11, 1, 77, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1078, 12, 1, 77, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1079, 13, 1, 77, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1080, 14, 1, 77, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1081, 15, 1, 77, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1082, 16, 1, 77, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1083, 1, 1, 78, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1084, 2, 1, 78, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1085, 3, 1, 78, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1086, 4, 1, 78, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1087, 5, 1, 78, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1088, 6, 1, 78, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1089, 7, 1, 78, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1090, 8, 1, 78, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1091, 9, 1, 78, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1092, 10, 1, 78, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1093, 11, 1, 78, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1094, 12, 1, 78, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1095, 13, 1, 78, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1096, 14, 1, 78, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1097, 15, 1, 78, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1098, 16, 1, 78, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1099, 1, 1, 79, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1100, 2, 1, 79, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1101, 3, 1, 79, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1102, 4, 1, 79, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1103, 5, 1, 79, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1104, 6, 1, 79, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1105, 7, 1, 79, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1106, 8, 1, 79, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1107, 9, 1, 79, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1108, 10, 1, 79, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1109, 11, 1, 79, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1110, 12, 1, 79, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1111, 13, 1, 79, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1112, 14, 1, 79, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1113, 15, 1, 79, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1114, 16, 1, 79, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1115, 1, 1, 80, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1116, 2, 1, 80, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1117, 3, 1, 80, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1118, 4, 1, 80, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1119, 5, 1, 80, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1120, 6, 1, 80, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1121, 7, 1, 80, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1122, 8, 1, 80, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1123, 9, 1, 80, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1124, 10, 1, 80, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1125, 11, 1, 80, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1126, 12, 1, 80, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1127, 13, 1, 80, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1128, 14, 1, 80, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1129, 15, 1, 80, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1130, 16, 1, 80, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1131, 1, 1, 81, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1132, 2, 1, 81, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1133, 3, 1, 81, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1134, 4, 1, 81, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1135, 5, 1, 81, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1136, 6, 1, 81, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1137, 7, 1, 81, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1138, 8, 1, 81, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1139, 9, 1, 81, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1140, 10, 1, 81, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1141, 11, 1, 81, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1142, 12, 1, 81, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1143, 13, 1, 81, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1144, 14, 1, 81, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1145, 15, 1, 81, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1146, 16, 1, 81, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1147, 1, 1, 82, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1148, 2, 1, 82, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1149, 3, 1, 82, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1150, 4, 1, 82, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1151, 5, 1, 82, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1152, 6, 1, 82, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1153, 7, 1, 82, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1154, 8, 1, 82, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1155, 9, 1, 82, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1156, 10, 1, 82, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1157, 11, 1, 82, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1158, 12, 1, 82, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1159, 13, 1, 82, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1160, 14, 1, 82, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1161, 15, 1, 82, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1162, 16, 1, 82, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1163, 1, 1, 83, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1164, 2, 1, 83, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1165, 3, 1, 83, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1166, 4, 1, 83, 0)
GO
print 'Processed 100 total records'
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1167, 5, 1, 83, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1168, 6, 1, 83, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1169, 7, 1, 83, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1170, 8, 1, 83, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1171, 9, 1, 83, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1172, 10, 1, 83, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1173, 11, 1, 83, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1174, 12, 1, 83, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1175, 13, 1, 83, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1176, 14, 1, 83, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1177, 15, 1, 83, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1178, 16, 1, 83, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1179, 1, 1, 84, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1180, 2, 1, 84, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1181, 3, 1, 84, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1182, 4, 1, 84, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1183, 5, 1, 84, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1184, 6, 1, 84, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1185, 7, 1, 84, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1186, 8, 1, 84, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1187, 9, 1, 84, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1188, 10, 1, 84, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1189, 11, 1, 84, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1190, 12, 1, 84, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1191, 13, 1, 84, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1192, 14, 1, 84, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1193, 15, 1, 84, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1194, 16, 1, 84, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1195, 1, 1, 85, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1196, 2, 1, 85, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1197, 3, 1, 85, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1198, 4, 1, 85, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1199, 5, 1, 85, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1200, 6, 1, 85, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1201, 7, 1, 85, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1202, 8, 1, 85, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1203, 9, 1, 85, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1204, 10, 1, 85, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1205, 11, 1, 85, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1206, 12, 1, 85, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1207, 13, 1, 85, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1208, 14, 1, 85, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1209, 15, 1, 85, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1210, 16, 1, 85, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1211, 1, 1, 86, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1212, 2, 1, 86, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1213, 3, 1, 86, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1214, 4, 1, 86, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1215, 5, 1, 86, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1216, 6, 1, 86, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1217, 7, 1, 86, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1218, 8, 1, 86, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1219, 9, 1, 86, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1220, 10, 1, 86, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1221, 11, 1, 86, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1222, 12, 1, 86, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1223, 13, 1, 86, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1224, 14, 1, 86, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1225, 15, 1, 86, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1226, 16, 1, 86, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1227, 1, 1, 87, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1228, 2, 1, 87, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1229, 3, 1, 87, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1230, 4, 1, 87, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1231, 5, 1, 87, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1232, 6, 1, 87, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1233, 7, 1, 87, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1234, 8, 1, 87, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1235, 9, 1, 87, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1236, 10, 1, 87, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1237, 11, 1, 87, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1238, 12, 1, 87, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1239, 13, 1, 87, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1240, 14, 1, 87, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1241, 15, 1, 87, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1242, 16, 1, 87, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1243, 1, 1, 88, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1244, 2, 1, 88, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1245, 3, 1, 88, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1246, 4, 1, 88, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1247, 5, 1, 88, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1248, 6, 1, 88, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1249, 7, 1, 88, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1250, 8, 1, 88, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1251, 9, 1, 88, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1252, 10, 1, 88, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1253, 11, 1, 88, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1254, 12, 1, 88, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1255, 13, 1, 88, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1256, 14, 1, 88, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1257, 15, 1, 88, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1258, 16, 1, 88, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1259, 1, 1, 89, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1260, 2, 1, 89, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1261, 3, 1, 89, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1262, 4, 1, 89, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1263, 5, 1, 89, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1264, 6, 1, 89, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1265, 7, 1, 89, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1266, 8, 1, 89, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1267, 9, 1, 89, 0)
GO
print 'Processed 200 total records'
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1268, 10, 1, 89, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1269, 11, 1, 89, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1270, 12, 1, 89, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1271, 13, 1, 89, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1272, 14, 1, 89, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1273, 15, 1, 89, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1274, 16, 1, 89, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1275, 1, 1, 90, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1276, 2, 1, 90, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1277, 3, 1, 90, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1278, 4, 1, 90, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1279, 5, 1, 90, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1280, 6, 1, 90, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1281, 7, 1, 90, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1282, 8, 1, 90, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1283, 9, 1, 90, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1284, 10, 1, 90, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1285, 11, 1, 90, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1286, 12, 1, 90, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1287, 13, 1, 90, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1288, 14, 1, 90, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1289, 15, 1, 90, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1290, 16, 1, 90, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1307, 1, 1, 92, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1308, 2, 1, 92, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1309, 3, 1, 92, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1310, 4, 1, 92, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1311, 5, 1, 92, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1312, 6, 1, 92, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1313, 7, 1, 92, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1314, 8, 1, 92, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1315, 9, 1, 92, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1316, 10, 1, 92, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1317, 11, 1, 92, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1318, 12, 1, 92, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1319, 13, 1, 92, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1320, 14, 1, 92, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1321, 15, 1, 92, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1322, 16, 1, 92, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1339, 1, 1, 94, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1340, 2, 1, 94, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1341, 3, 1, 94, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1342, 4, 1, 94, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1343, 5, 1, 94, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1344, 6, 1, 94, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1345, 7, 1, 94, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1346, 8, 1, 94, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1347, 9, 1, 94, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1348, 10, 1, 94, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1349, 11, 1, 94, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1350, 12, 1, 94, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1351, 13, 1, 94, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1352, 14, 1, 94, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1353, 15, 1, 94, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1354, 16, 1, 94, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1355, 1, 1, 95, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1356, 2, 1, 95, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1357, 3, 1, 95, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1358, 4, 1, 95, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1359, 5, 1, 95, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1360, 6, 1, 95, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1361, 7, 1, 95, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1362, 8, 1, 95, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1363, 9, 1, 95, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1364, 10, 1, 95, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1365, 11, 1, 95, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1366, 12, 1, 95, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1367, 13, 1, 95, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1368, 14, 1, 95, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1369, 15, 1, 95, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1370, 16, 1, 95, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1371, 1, 1, 96, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1372, 2, 1, 96, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1373, 3, 1, 96, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1374, 4, 1, 96, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1375, 5, 1, 96, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1376, 6, 1, 96, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1377, 7, 1, 96, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1378, 8, 1, 96, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1379, 9, 1, 96, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1380, 10, 1, 96, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1381, 11, 1, 96, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1382, 12, 1, 96, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1383, 13, 1, 96, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1384, 14, 1, 96, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1385, 15, 1, 96, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (1386, 16, 1, 96, 1)
SET IDENTITY_INSERT [dbo].[tbl_schedule] OFF
/****** Object:  Table [dbo].[tbl_request]    Script Date: 10/16/2017 15:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_request](
	[requestID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[classID] [int] NULL,
	[scheduleID] [int] NULL,
	[courseName] [nvarchar](225) NULL,
	[sizeStudent] [int] NULL,
	[sendDate] [datetime2](0) NULL,
	[status] [tinyint] NULL,
 CONSTRAINT [PK__tbl_requ__E3C5DE5130F848ED] PRIMARY KEY CLUSTERED 
(
	[requestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [classID] ON [dbo].[tbl_request] 
(
	[classID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [scheduleID] ON [dbo].[tbl_request] 
(
	[scheduleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [userID] ON [dbo].[tbl_request] 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_request] ON
INSERT [dbo].[tbl_request] ([requestID], [userID], [classID], [scheduleID], [courseName], [sizeStudent], [sendDate], [status]) VALUES (1, 86, 50, 1290, N'DataBase', 5, CAST(0x00000000643D0B0000 AS DateTime2), 0)
INSERT [dbo].[tbl_request] ([requestID], [userID], [classID], [scheduleID], [courseName], [sizeStudent], [sendDate], [status]) VALUES (2, 86, 50, 1371, N'dbbbbbbb', 5, CAST(0x00000000653D0B0000 AS DateTime2), 2)
INSERT [dbo].[tbl_request] ([requestID], [userID], [classID], [scheduleID], [courseName], [sizeStudent], [sendDate], [status]) VALUES (3, 86, 50, 1372, N'dbdb', 10, CAST(0x00000000683D0B0000 AS DateTime2), 0)
INSERT [dbo].[tbl_request] ([requestID], [userID], [classID], [scheduleID], [courseName], [sizeStudent], [sendDate], [status]) VALUES (4, 86, 50, 1355, N'dbdb2', 10, CAST(0x00000000683D0B0000 AS DateTime2), 2)
INSERT [dbo].[tbl_request] ([requestID], [userID], [classID], [scheduleID], [courseName], [sizeStudent], [sendDate], [status]) VALUES (10, 86, 50, 1339, N'122121', 12, CAST(0x00000000683D0B0000 AS DateTime2), 0)
INSERT [dbo].[tbl_request] ([requestID], [userID], [classID], [scheduleID], [courseName], [sizeStudent], [sendDate], [status]) VALUES (15, 86, 50, 1307, N'151020171', 4, CAST(0x00000000683D0B0000 AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[tbl_request] OFF
/****** Object:  Table [dbo].[tbl_labroom]    Script Date: 10/16/2017 15:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_labroom](
	[roomID] [int] IDENTITY(1,1) NOT NULL,
	[roomName] [nvarchar](225) NULL,
	[status] [tinyint] NULL,
	[width] [float] NULL,
	[length] [float] NULL,
	[datecreate] [date] NULL,
	[size] [int] NULL,
 CONSTRAINT [PK__tbl_labr__6C3BF5DE2E1BDC42] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_labroom] ON
INSERT [dbo].[tbl_labroom] ([roomID], [roomName], [status], [width], [length], [datecreate], [size]) VALUES (1, N'LAB 1', 1, 60, 60, CAST(0xA73C0B00 AS Date), 50)
INSERT [dbo].[tbl_labroom] ([roomID], [roomName], [status], [width], [length], [datecreate], [size]) VALUES (2, N'LAB 2', 1, 65, 60, CAST(0xA73C0B00 AS Date), 40)
INSERT [dbo].[tbl_labroom] ([roomID], [roomName], [status], [width], [length], [datecreate], [size]) VALUES (3, N'LAB 4', 0, 43, 39, CAST(0xA83C0B00 AS Date), 10)
INSERT [dbo].[tbl_labroom] ([roomID], [roomName], [status], [width], [length], [datecreate], [size]) VALUES (8, N'LAB3', 1, 45.299999237060547, 56.599998474121094, CAST(0xC73C0B00 AS Date), 50)
INSERT [dbo].[tbl_labroom] ([roomID], [roomName], [status], [width], [length], [datecreate], [size]) VALUES (9, N'LAB 6', 1, 34, 56, CAST(0xC83C0B00 AS Date), 20)
INSERT [dbo].[tbl_labroom] ([roomID], [roomName], [status], [width], [length], [datecreate], [size]) VALUES (10, N'LAB 7', 0, 34, 56, CAST(0xC83C0B00 AS Date), 30)
INSERT [dbo].[tbl_labroom] ([roomID], [roomName], [status], [width], [length], [datecreate], [size]) VALUES (11, N'LAB 8', 1, 450, 400, CAST(0xCD3C0B00 AS Date), 50)
SET IDENTITY_INSERT [dbo].[tbl_labroom] OFF
/****** Object:  Table [dbo].[tbl_device_accessory]    Script Date: 10/16/2017 15:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_device_accessory](
	[dID] [int] NOT NULL,
	[accessID] [int] NOT NULL,
	[a_warranty_to] [date] NULL,
	[a_warranty_from] [date] NULL,
	[status] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[dID] ASC,
	[accessID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [accessID] ON [dbo].[tbl_device_accessory] 
(
	[accessID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (1, 1, CAST(0x233F0B00 AS Date), CAST(0x863C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (22, 2, CAST(0xA43F0B00 AS Date), CAST(0xCA3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (22, 7, CAST(0xA43F0B00 AS Date), CAST(0xCA3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (23, 2, CAST(0xA43F0B00 AS Date), CAST(0xCA3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (23, 7, CAST(0xA43F0B00 AS Date), CAST(0xCA3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (24, 3, CAST(0xA43F0B00 AS Date), CAST(0xCA3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (24, 8, CAST(0xA43F0B00 AS Date), CAST(0xCA3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (25, 3, CAST(0xA43F0B00 AS Date), CAST(0xCA3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (25, 8, CAST(0xA43F0B00 AS Date), CAST(0xCA3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (27, 2, CAST(0xA43F0B00 AS Date), CAST(0xCA3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (27, 7, CAST(0xA43F0B00 AS Date), CAST(0xCA3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (28, 7, CAST(0xDC3F0B00 AS Date), CAST(0xEC3C0B00 AS Date), 1)
/****** Object:  Table [dbo].[tbl_device]    Script Date: 10/16/2017 15:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_device](
	[dID] [int] IDENTITY(1,1) NOT NULL,
	[dName] [nvarchar](225) NULL,
	[warranty_to] [date] NULL,
	[warranty_from] [date] NULL,
	[description] [nvarchar](225) NULL,
	[status] [tinyint] NULL,
	[cateID] [int] NULL,
	[roomID] [int] NULL,
	[dateAdd] [date] NULL,
 CONSTRAINT [PK__tbl_devi__D870D60E286302EC] PRIMARY KEY CLUSTERED 
(
	[dID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [cateID] ON [dbo].[tbl_device] 
(
	[cateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [roomID] ON [dbo].[tbl_device] 
(
	[roomID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_device] ON
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (1, N'May tinh', CAST(0xCD3C0B00 AS Date), CAST(0xA73F0B00 AS Date), N'', 1, 1, 1, CAST(0xA73C0B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (22, N'May CHieu', CAST(0xCD3C0B00 AS Date), CAST(0xA73F0B00 AS Date), N'', 1, 1, 1, CAST(0xCA3C0B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (23, N'TI VI', CAST(0xCD3C0B00 AS Date), CAST(0xA73F0B00 AS Date), N'', 1, 1, 1, CAST(0xCA3C0B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (24, N'Dieu Hoa', CAST(0xCD3C0B00 AS Date), CAST(0xA73F0B00 AS Date), N'', 1, 1, 1, CAST(0xCA3C0B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (25, N'QUat', CAST(0xCD3C0B00 AS Date), CAST(0xA73F0B00 AS Date), N'', 1, 1, 1, CAST(0xCA3C0B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (27, N'sdasdasdssssssssssssssss', CAST(0xCD3C0B00 AS Date), CAST(0xA73F0B00 AS Date), N'', 1, 1, 1, CAST(0xCA3C0B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (28, N'sdasdasdssssssssssssssss', CAST(0xCD3C0B00 AS Date), CAST(0xA73F0B00 AS Date), N'', 1, 1, 1, CAST(0xCD3C0B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (29, N'sdasdasdssssssssssssssss', CAST(0xCD3C0B00 AS Date), CAST(0xA73F0B00 AS Date), N'', 1, 1, 1, CAST(0xCD3C0B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (30, N'sdasdasdssssssssssssssss', CAST(0xCD3C0B00 AS Date), CAST(0xA73F0B00 AS Date), N'', 1, 1, 1, CAST(0xCD3C0B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (31, N'sdasdasdssssssssssssssss', CAST(0xCD3C0B00 AS Date), CAST(0xA73F0B00 AS Date), N'', 1, 1, 1, CAST(0xCD3C0B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (32, N'sdasdasdssssssssssssssss', CAST(0xCD3C0B00 AS Date), CAST(0xA73F0B00 AS Date), N'', 1, 1, 1, CAST(0xCD3C0B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (33, N'sdasdasdssssssssssssssss', CAST(0xCD3C0B00 AS Date), CAST(0xA73F0B00 AS Date), N'', 1, 1, 1, CAST(0xCD3C0B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (34, N'sdasdasdsssssszxczxczx', CAST(0xCD3C0B00 AS Date), CAST(0xA73F0B00 AS Date), N'xcxczxczczxczxczxcasdsadasd', 1, 1, 1, CAST(0xCD3C0B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (47, N'CPU VIP', CAST(0xCD3C0B00 AS Date), CAST(0xA73F0B00 AS Date), N'CPU VIP', 1, 3, 9, CAST(0xCD3C0B00 AS Date))
SET IDENTITY_INSERT [dbo].[tbl_device] OFF
/****** Object:  Table [dbo].[tbl_department]    Script Date: 10/16/2017 15:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_department](
	[departmentID] [int] IDENTITY(1,1) NOT NULL,
	[departmentName] [nvarchar](225) NULL,
 CONSTRAINT [PK__tbl_depa__F9B8344D25869641] PRIMARY KEY CLUSTERED 
(
	[departmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_department] ON
INSERT [dbo].[tbl_department] ([departmentID], [departmentName]) VALUES (1, N'Admin')
INSERT [dbo].[tbl_department] ([departmentID], [departmentName]) VALUES (2, N'Instructors')
INSERT [dbo].[tbl_department] ([departmentID], [departmentName]) VALUES (3, N'Technical   Staff   ')
INSERT [dbo].[tbl_department] ([departmentID], [departmentName]) VALUES (4, N'Students')
SET IDENTITY_INSERT [dbo].[tbl_department] OFF
/****** Object:  Table [dbo].[tbl_datework]    Script Date: 10/16/2017 15:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_datework](
	[datewordID] [int] IDENTITY(1,1) NOT NULL,
	[dateword] [datetime2](0) NULL,
	[status] [tinyint] NULL,
	[dayID] [int] NULL,
 CONSTRAINT [PK__tbl_date__6E6D603D22AA2996] PRIMARY KEY CLUSTERED 
(
	[datewordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [dayID] ON [dbo].[tbl_datework] 
(
	[dayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_datework] ON
INSERT [dbo].[tbl_datework] ([datewordID], [dateword], [status], [dayID]) VALUES (85, CAST(0x00000000623D0B0000 AS DateTime2), 1, 1)
INSERT [dbo].[tbl_datework] ([datewordID], [dateword], [status], [dayID]) VALUES (86, CAST(0x00000000633D0B0000 AS DateTime2), 1, 2)
INSERT [dbo].[tbl_datework] ([datewordID], [dateword], [status], [dayID]) VALUES (87, CAST(0x00000000643D0B0000 AS DateTime2), 1, 3)
INSERT [dbo].[tbl_datework] ([datewordID], [dateword], [status], [dayID]) VALUES (88, CAST(0x00000000653D0B0000 AS DateTime2), 1, 4)
INSERT [dbo].[tbl_datework] ([datewordID], [dateword], [status], [dayID]) VALUES (89, CAST(0x00000000663D0B0000 AS DateTime2), 1, 5)
INSERT [dbo].[tbl_datework] ([datewordID], [dateword], [status], [dayID]) VALUES (90, CAST(0x00000000673D0B0000 AS DateTime2), 1, 6)
INSERT [dbo].[tbl_datework] ([datewordID], [dateword], [status], [dayID]) VALUES (92, CAST(0x000000006A3D0B0000 AS DateTime2), 1, 2)
INSERT [dbo].[tbl_datework] ([datewordID], [dateword], [status], [dayID]) VALUES (94, CAST(0x000000006C3D0B0000 AS DateTime2), 1, 4)
INSERT [dbo].[tbl_datework] ([datewordID], [dateword], [status], [dayID]) VALUES (95, CAST(0x000000006D3D0B0000 AS DateTime2), 1, 5)
INSERT [dbo].[tbl_datework] ([datewordID], [dateword], [status], [dayID]) VALUES (96, CAST(0x000000006E3D0B0000 AS DateTime2), 1, 6)
SET IDENTITY_INSERT [dbo].[tbl_datework] OFF
/****** Object:  Table [dbo].[tbl_contact]    Script Date: 10/16/2017 15:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_contact](
	[contactID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](225) NULL,
	[contents] [nvarchar](max) NULL,
	[userID] [int] NULL,
 CONSTRAINT [PK__tbl_cont__7121FD151FCDBCEB] PRIMARY KEY CLUSTERED 
(
	[contactID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [userID] ON [dbo].[tbl_contact] 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_complaint_device]    Script Date: 10/16/2017 15:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_complaint_device](
	[complaintID] [int] NOT NULL,
	[dID] [int] NOT NULL,
	[complaint_details] [nvarchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[complaintID] ASC,
	[dID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [dID] ON [dbo].[tbl_complaint_device] 
(
	[dID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (1, 1, N'Error mouse')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (1, 24, N'Error mouse')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (1, 25, N'Error mouse')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (1, 27, N'Error mouse')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (2, 24, N'Error mouse')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (2, 25, N'Error mouse')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (8, 24, N'Error mouse')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (8, 25, N'Error mouse')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (9, 24, N'Error mouse')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (9, 25, N'Error mouse')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (10, 24, N'Error mouse')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (10, 25, N'Error mouse')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (11, 24, N'Error mouse')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (11, 25, N'Error mouse')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (12, 25, N'Error mouse')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (12, 27, N'Error main')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (13, 31, N'44444444444')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (13, 34, N'1222222222222222')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (14, 31, N'Error Mouse')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (14, 32, N'Error Mouse')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (14, 33, N'Error Mouse')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (15, 22, N'may hu')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (15, 23, N'man hong')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (15, 25, N'loi con coc')
/****** Object:  Table [dbo].[tbl_complaint]    Script Date: 10/16/2017 15:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_complaint](
	[complaintID] [int] IDENTITY(1,1) NOT NULL,
	[userSend] [int] NULL,
	[status] [tinyint] NULL,
	[datesend] [date] NULL,
	[title] [nvarchar](225) NULL,
	[userProcess] [int] NULL,
 CONSTRAINT [PK__tbl_comp__489708E11A14E395] PRIMARY KEY CLUSTERED 
(
	[complaintID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [userProcess] ON [dbo].[tbl_complaint] 
(
	[userProcess] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [userSend] ON [dbo].[tbl_complaint] 
(
	[userSend] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_complaint] ON
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (1, 77, 0, CAST(0xEB3C0B00 AS Date), N'Error', 41)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (2, 77, 1, CAST(0xEC3C0B00 AS Date), N'Error', 72)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (8, 77, 2, CAST(0x0B3D0B00 AS Date), N'Error', 51)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (9, 77, 0, CAST(0x0C3D0B00 AS Date), N'Error', 51)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (10, 77, 1, CAST(0x093D0B00 AS Date), N'Error', 41)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (11, 77, 1, CAST(0x093D0B00 AS Date), N'Error', 71)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (12, 77, 0, CAST(0x093D0B00 AS Date), N'Error', 72)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (13, 77, 0, CAST(0x093D0B00 AS Date), N'loiiii', 71)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (14, 77, 0, CAST(0x0A3D0B00 AS Date), N'Error', 71)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (15, 86, 2, CAST(0x683D0B00 AS Date), N'hong quat tivi may chieu', 87)
SET IDENTITY_INSERT [dbo].[tbl_complaint] OFF
/****** Object:  Table [dbo].[tbl_class]    Script Date: 10/16/2017 15:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_class](
	[classID] [int] IDENTITY(1,1) NOT NULL,
	[className] [nvarchar](225) NULL,
	[status] [tinyint] NULL,
 CONSTRAINT [PK__tbl_clas__7577345E173876EA] PRIMARY KEY CLUSTERED 
(
	[classID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_class] ON
INSERT [dbo].[tbl_class] ([classID], [className], [status]) VALUES (49, N'VB2K19', 0)
INSERT [dbo].[tbl_class] ([classID], [className], [status]) VALUES (50, N'VB2K20', 1)
INSERT [dbo].[tbl_class] ([classID], [className], [status]) VALUES (54, N'VB2K21', 0)
INSERT [dbo].[tbl_class] ([classID], [className], [status]) VALUES (55, N'VB2K22', 0)
SET IDENTITY_INSERT [dbo].[tbl_class] OFF
/****** Object:  Table [dbo].[tbl_category]    Script Date: 10/16/2017 15:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_category](
	[cateID] [int] IDENTITY(1,1) NOT NULL,
	[cateName] [nvarchar](225) NULL,
	[status] [tinyint] NULL,
 CONSTRAINT [PK__tbl_cate__A88B4DC4145C0A3F] PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_category] ON
INSERT [dbo].[tbl_category] ([cateID], [cateName], [status]) VALUES (1, N'Computer1', 1)
INSERT [dbo].[tbl_category] ([cateID], [cateName], [status]) VALUES (2, N'Aptech', 1)
INSERT [dbo].[tbl_category] ([cateID], [cateName], [status]) VALUES (3, N'Projector1', 1)
INSERT [dbo].[tbl_category] ([cateID], [cateName], [status]) VALUES (10, N'eeeeeeeeeeeeee1', 1)
INSERT [dbo].[tbl_category] ([cateID], [cateName], [status]) VALUES (11, N'a´ddasd', 1)
SET IDENTITY_INSERT [dbo].[tbl_category] OFF
/****** Object:  Table [dbo].[tbl_accessory]    Script Date: 10/16/2017 15:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_accessory](
	[accessID] [int] IDENTITY(1,1) NOT NULL,
	[typeID] [int] NULL,
	[accessName] [nvarchar](225) NULL,
	[status] [tinyint] NULL,
 CONSTRAINT [PK__tbl_acce__78E27549117F9D94] PRIMARY KEY CLUSTERED 
(
	[accessID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [typeID] ON [dbo].[tbl_accessory] 
(
	[typeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = ON, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_accessory] ON
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (1, 1, N'Photoshop', 0)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (2, 2, N'CPU', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (3, 1, N'dssadasda1', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (4, 1, N'a´dasdasd', 0)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (7, 2, N'Photoshop1', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (8, 1, N'Photoshop12', 0)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (9, 1, N'Photoshop5', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (11, 1, N'Photoshop6', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (12, 1, N'CPU 2', 1)
SET IDENTITY_INSERT [dbo].[tbl_accessory] OFF
/****** Object:  Table [dbo].[days_week]    Script Date: 10/16/2017 15:01:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[days_week](
	[dayID] [int] IDENTITY(1,1) NOT NULL,
	[dayName] [nvarchar](50) NULL,
	[keyword] [nvarchar](50) NULL,
 CONSTRAINT [PK__days_wee__B0FA5EC00EA330E9] PRIMARY KEY CLUSTERED 
(
	[dayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[days_week] ON
INSERT [dbo].[days_week] ([dayID], [dayName], [keyword]) VALUES (1, N'MONDAY', N'MON')
INSERT [dbo].[days_week] ([dayID], [dayName], [keyword]) VALUES (2, N'TUESDAY', N'TUE')
INSERT [dbo].[days_week] ([dayID], [dayName], [keyword]) VALUES (3, N'WEDNESDAY', N'WED')
INSERT [dbo].[days_week] ([dayID], [dayName], [keyword]) VALUES (4, N'THURSDAY', N'THU')
INSERT [dbo].[days_week] ([dayID], [dayName], [keyword]) VALUES (5, N'FRIDAY', N'FRI')
INSERT [dbo].[days_week] ([dayID], [dayName], [keyword]) VALUES (6, N'SATURDAY', N'SAT')
SET IDENTITY_INSERT [dbo].[days_week] OFF
