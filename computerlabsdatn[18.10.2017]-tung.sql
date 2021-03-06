USE [master]
GO
/****** Object:  Database [computerlabsdatn]    Script Date: 10/18/2017 21:37:25 ******/
CREATE DATABASE [computerlabsdatn] ON  PRIMARY 
( NAME = N'sem4labs', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQL2008\MSSQL\DATA\sem4labs.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'sem4labs_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQL2008\MSSQL\DATA\sem4labs_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [computerlabsdatn] SET AUTO_CLOSE ON
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
ALTER DATABASE [computerlabsdatn] SET  ENABLE_BROKER
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
/****** Object:  Table [dbo].[days_week]    Script Date: 10/18/2017 21:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[days_week](
	[dayID] [int] IDENTITY(1,1) NOT NULL,
	[dayName] [varchar](50) NULL,
	[keyword] [varchar](50) NULL,
 CONSTRAINT [PK_days_week] PRIMARY KEY CLUSTERED 
(
	[dayID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[days_week] ON
INSERT [dbo].[days_week] ([dayID], [dayName], [keyword]) VALUES (1, N'MONDAY', N'MON')
INSERT [dbo].[days_week] ([dayID], [dayName], [keyword]) VALUES (2, N'TUESDAY', N'TUE')
INSERT [dbo].[days_week] ([dayID], [dayName], [keyword]) VALUES (3, N'WEDNESDAY', N'WED')
INSERT [dbo].[days_week] ([dayID], [dayName], [keyword]) VALUES (4, N'THURSDAY', N'THU')
INSERT [dbo].[days_week] ([dayID], [dayName], [keyword]) VALUES (5, N'FRIDAY', N'FRI')
INSERT [dbo].[days_week] ([dayID], [dayName], [keyword]) VALUES (6, N'SATURDAY', N'SAT')
SET IDENTITY_INSERT [dbo].[days_week] OFF
/****** Object:  Table [dbo].[tbl_class]    Script Date: 10/18/2017 21:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_class](
	[classID] [int] IDENTITY(1,1) NOT NULL,
	[className] [varchar](225) NULL,
	[status] [tinyint] NULL,
 CONSTRAINT [PK_tbl_class] PRIMARY KEY CLUSTERED 
(
	[classID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_class] ON
INSERT [dbo].[tbl_class] ([classID], [className], [status]) VALUES (49, N'VB2K18', 0)
INSERT [dbo].[tbl_class] ([classID], [className], [status]) VALUES (50, N'VB2K19', 1)
INSERT [dbo].[tbl_class] ([classID], [className], [status]) VALUES (54, N'VB2K20', 0)
INSERT [dbo].[tbl_class] ([classID], [className], [status]) VALUES (55, N'VB2K21', 0)
INSERT [dbo].[tbl_class] ([classID], [className], [status]) VALUES (56, N'VB2K22', 1)
INSERT [dbo].[tbl_class] ([classID], [className], [status]) VALUES (57, N'K4CDA01', 1)
INSERT [dbo].[tbl_class] ([classID], [className], [status]) VALUES (58, N'K5CDA01', 1)
INSERT [dbo].[tbl_class] ([classID], [className], [status]) VALUES (59, N'K6CDA02', 1)
INSERT [dbo].[tbl_class] ([classID], [className], [status]) VALUES (60, N'K52DH01', 1)
INSERT [dbo].[tbl_class] ([classID], [className], [status]) VALUES (61, N'K55DH01', 1)
INSERT [dbo].[tbl_class] ([classID], [className], [status]) VALUES (62, N'K56DH01', 1)
SET IDENTITY_INSERT [dbo].[tbl_class] OFF
/****** Object:  Table [dbo].[tbl_category]    Script Date: 10/18/2017 21:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_category](
	[cateID] [int] IDENTITY(1,1) NOT NULL,
	[cateName] [varchar](225) NULL,
	[status] [tinyint] NULL,
 CONSTRAINT [PK_tbl_category] PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_category] ON
INSERT [dbo].[tbl_category] ([cateID], [cateName], [status]) VALUES (1, N'Thiet bi Van Phong', 1)
INSERT [dbo].[tbl_category] ([cateID], [cateName], [status]) VALUES (2, N'Dien Lanh', 1)
INSERT [dbo].[tbl_category] ([cateID], [cateName], [status]) VALUES (3, N'May Tinh', 1)
INSERT [dbo].[tbl_category] ([cateID], [cateName], [status]) VALUES (10, N'Nghe Nhin', 1)
INSERT [dbo].[tbl_category] ([cateID], [cateName], [status]) VALUES (11, N'Ngoai vi', 1)
INSERT [dbo].[tbl_category] ([cateID], [cateName], [status]) VALUES (13, N'Thiet bi mang', 1)
INSERT [dbo].[tbl_category] ([cateID], [cateName], [status]) VALUES (14, N'Thiet bi giam sat', 1)
INSERT [dbo].[tbl_category] ([cateID], [cateName], [status]) VALUES (15, N'Thiet bi luu tru', 1)
INSERT [dbo].[tbl_category] ([cateID], [cateName], [status]) VALUES (16, N'Linh kien may tinh', 1)
INSERT [dbo].[tbl_category] ([cateID], [cateName], [status]) VALUES (17, N'TBv', 1)
SET IDENTITY_INSERT [dbo].[tbl_category] OFF
/****** Object:  Table [dbo].[tbl_labroom]    Script Date: 10/18/2017 21:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_labroom](
	[roomID] [int] IDENTITY(1,1) NOT NULL,
	[roomName] [varchar](225) NULL,
	[status] [tinyint] NULL,
	[width] [float] NULL,
	[length] [float] NULL,
	[datecreate] [date] NULL,
	[size] [int] NULL,
 CONSTRAINT [PK_tbl_labroom] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_labroom] ON
INSERT [dbo].[tbl_labroom] ([roomID], [roomName], [status], [width], [length], [datecreate], [size]) VALUES (1, N'LAB 1 - H7', 1, 60, 60, CAST(0x213D0B00 AS Date), NULL)
INSERT [dbo].[tbl_labroom] ([roomID], [roomName], [status], [width], [length], [datecreate], [size]) VALUES (2, N'LAB 2 - H8', 1, 65, 60, CAST(0x213D0B00 AS Date), NULL)
INSERT [dbo].[tbl_labroom] ([roomID], [roomName], [status], [width], [length], [datecreate], [size]) VALUES (3, N'LAB 4 - H10', 0, 43, 39, CAST(0x213D0B00 AS Date), NULL)
INSERT [dbo].[tbl_labroom] ([roomID], [roomName], [status], [width], [length], [datecreate], [size]) VALUES (8, N'LAB 3 - H9', 1, 45.3, 56.6, CAST(0x213D0B00 AS Date), NULL)
INSERT [dbo].[tbl_labroom] ([roomID], [roomName], [status], [width], [length], [datecreate], [size]) VALUES (9, N'LAB 6 - H11', 1, 34, 56, CAST(0x213D0B00 AS Date), NULL)
INSERT [dbo].[tbl_labroom] ([roomID], [roomName], [status], [width], [length], [datecreate], [size]) VALUES (10, N'LAB 7 - H12', 0, 34, 56, CAST(0x213D0B00 AS Date), NULL)
INSERT [dbo].[tbl_labroom] ([roomID], [roomName], [status], [width], [length], [datecreate], [size]) VALUES (11, N'LAB 8 - H13', 1, 450, 400, CAST(0x213D0B00 AS Date), NULL)
SET IDENTITY_INSERT [dbo].[tbl_labroom] OFF
/****** Object:  Table [dbo].[tbl_department]    Script Date: 10/18/2017 21:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_department](
	[departmentID] [int] IDENTITY(1,1) NOT NULL,
	[departmentName] [varchar](225) NULL,
 CONSTRAINT [PK_tbl_department] PRIMARY KEY CLUSTERED 
(
	[departmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_department] ON
INSERT [dbo].[tbl_department] ([departmentID], [departmentName]) VALUES (1, N'Admin')
INSERT [dbo].[tbl_department] ([departmentID], [departmentName]) VALUES (2, N'Instructors')
INSERT [dbo].[tbl_department] ([departmentID], [departmentName]) VALUES (3, N'Technical   Staff   ')
INSERT [dbo].[tbl_department] ([departmentID], [departmentName]) VALUES (4, N'Students')
SET IDENTITY_INSERT [dbo].[tbl_department] OFF
/****** Object:  Table [dbo].[tbl_type_accessory]    Script Date: 10/18/2017 21:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_type_accessory](
	[typeID] [int] IDENTITY(1,1) NOT NULL,
	[type_accessory] [varchar](225) NULL,
	[status] [tinyint] NULL,
 CONSTRAINT [PK_tbl_type_accessory] PRIMARY KEY CLUSTERED 
(
	[typeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_type_accessory] ON
INSERT [dbo].[tbl_type_accessory] ([typeID], [type_accessory], [status]) VALUES (1, N'Software', 1)
INSERT [dbo].[tbl_type_accessory] ([typeID], [type_accessory], [status]) VALUES (2, N'Hardware', 1)
SET IDENTITY_INSERT [dbo].[tbl_type_accessory] OFF
/****** Object:  Table [dbo].[tbl_shiftname]    Script Date: 10/18/2017 21:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_shiftname](
	[shiftID] [int] IDENTITY(1,1) NOT NULL,
	[starttime] [time](7) NULL,
	[endtime] [time](7) NULL,
	[shiftname] [nvarchar](50) NULL,
	[status] [tinyint] NULL,
	[shiftType] [tinyint] NULL,
 CONSTRAINT [PK_tbl_shiftname] PRIMARY KEY CLUSTERED 
(
	[shiftID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_shiftname] ON
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (1, CAST(0x0700D85EAC3A0000 AS Time), CAST(0x070026B2F5400000 AS Time), N'Shift 1', 1, 1)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (2, CAST(0x07008482A8410000 AS Time), CAST(0x0700D2D5F1470000 AS Time), N'Shift 2', 1, 1)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (3, CAST(0x070048F9F66C0000 AS Time), CAST(0x07001882BA7D0000 AS Time), N'Shift 3', 1, 1)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (4, CAST(0x07001882BA7D0000 AS Time), CAST(0x0700E80A7E8E0000 AS Time), N'Shift 4', 1, 1)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (5, CAST(0x0700E80A7E8E0000 AS Time), CAST(0x0700A8E76F4B0000 AS Time), N'Shift 5', 1, 1)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (6, CAST(0x0700B893419F0000 AS Time), CAST(0x0700881C05B00000 AS Time), N'Shift 6', 1, 1)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (7, CAST(0x0700000000000000 AS Time), CAST(0x0700000000000000 AS Time), N'Shift 7', 1, 2)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (8, CAST(0x0700000000000000 AS Time), CAST(0x0700000000000000 AS Time), N'Shift 8', 1, 2)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (9, CAST(0x07000C41DD3E0000 AS Time), CAST(0x07000C41DD3E0000 AS Time), N'Shift 9', 1, 2)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (10, CAST(0x07000C41DD3E0000 AS Time), CAST(0x07000C41DD3E0000 AS Time), N'Shift 10', 1, 2)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (11, CAST(0x07000C41DD3E0000 AS Time), CAST(0x07000C41DD3E0000 AS Time), N'Shift 11', 1, 2)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (12, CAST(0x07000C41DD3E0000 AS Time), CAST(0x07000C41DD3E0000 AS Time), N'Shift 12', 1, 2)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (13, CAST(0x07000C41DD3E0000 AS Time), CAST(0x07000C41DD3E0000 AS Time), N'Shift 13', 1, 3)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (14, CAST(0x07000C41DD3E0000 AS Time), CAST(0x07000C41DD3E0000 AS Time), N'Shift 14', 1, 3)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (15, CAST(0x07000C41DD3E0000 AS Time), CAST(0x07000C41DD3E0000 AS Time), N'Shift 15', 1, 3)
INSERT [dbo].[tbl_shiftname] ([shiftID], [starttime], [endtime], [shiftname], [status], [shiftType]) VALUES (16, CAST(0x07000C41DD3E0000 AS Time), CAST(0x07000C41DD3E0000 AS Time), N'Shift 16', 1, 3)
SET IDENTITY_INSERT [dbo].[tbl_shiftname] OFF
/****** Object:  Table [dbo].[tbl_user]    Script Date: 10/18/2017 21:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_user](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](225) NULL,
	[password] [varchar](225) NULL,
	[fullname] [nvarchar](225) NULL,
	[address] [nvarchar](225) NULL,
	[gender] [tinyint] NULL,
	[birthday] [datetime] NULL,
	[status] [tinyint] NULL,
	[departmentID] [int] NULL,
	[HOD] [tinyint] NULL,
	[Email] [varchar](225) NULL,
 CONSTRAINT [PK_tbl_member] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_user] ON
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [gender], [birthday], [status], [departmentID], [HOD], [Email]) VALUES (83, N'nguyensontung', N'123456', N'nguyen son tung', N'Hà Nội', 1, CAST(0x000084DC00000000 AS DateTime), 1, 1, 1, NULL)
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [gender], [birthday], [status], [departmentID], [HOD], [Email]) VALUES (86, N'letuantai', N'123456', N'lê tuấn tài', N'Hà Nội', 0, CAST(0x000084B000000000 AS DateTime), 1, 1, 1, N'tai@gmail.com')
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [gender], [birthday], [status], [departmentID], [HOD], [Email]) VALUES (87, N'nguyentuanloc', N'123456', N'Nguyễn Tuấn Lộc', N'Hà Nội', 0, CAST(0x000084B000000000 AS DateTime), 1, 1, 1, N'loc@gmail.com')
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [gender], [birthday], [status], [departmentID], [HOD], [Email]) VALUES (88, N'giaovien1', N'123456', N'Giáo viên 1', N'Hà Nội', 0, CAST(0x000084B000000000 AS DateTime), 1, 2, 1, N'giaovien1@gmail.com')
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [gender], [birthday], [status], [departmentID], [HOD], [Email]) VALUES (89, N'giaovien2', N'123456', N'Giáo viên 2', N'Hà Nội', 0, CAST(0x00009CF100000000 AS DateTime), 1, 2, 0, N'giaovien2@gmail.com')
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [gender], [birthday], [status], [departmentID], [HOD], [Email]) VALUES (90, N'kythuat1', N'123456', N'Kỹ thuật 1', N'Hà Nội', 0, CAST(0x00009CF100000000 AS DateTime), 1, 3, 1, N'kythuat1@gmail.com')
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [gender], [birthday], [status], [departmentID], [HOD], [Email]) VALUES (91, N'kythuat2', N'123456', N'Kỹ thuật 2', N'Hà Nội', 0, CAST(0x00009CF100000000 AS DateTime), 1, 3, 0, N'kythuat2@gmail.com')
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [gender], [birthday], [status], [departmentID], [HOD], [Email]) VALUES (92, N'hocvien1', N'123456', N'Học viên 1', N'Hà Nội', 0, CAST(0x00009CF100000000 AS DateTime), 1, 4, 1, N'hocvien1@gmail.com')
INSERT [dbo].[tbl_user] ([userID], [username], [password], [fullname], [address], [gender], [birthday], [status], [departmentID], [HOD], [Email]) VALUES (93, N'hocvien2', N'123456', N'Học viên 2', N'Hà Nội', 0, CAST(0x00009CF100000000 AS DateTime), 1, 4, 0, N'hocvien2@gmail.com')
SET IDENTITY_INSERT [dbo].[tbl_user] OFF
/****** Object:  Table [dbo].[tbl_device]    Script Date: 10/18/2017 21:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_device](
	[dID] [int] IDENTITY(1,1) NOT NULL,
	[dName] [varchar](225) NULL,
	[warranty_to] [date] NULL,
	[warranty_from] [date] NULL,
	[description] [varchar](225) NULL,
	[status] [tinyint] NULL,
	[cateID] [int] NULL,
	[roomID] [int] NULL,
	[dateAdd] [date] NULL,
 CONSTRAINT [PK_tbl_device] PRIMARY KEY CLUSTERED 
(
	[dID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_device] ON
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (1, N'May tinh 1', CAST(0x3A3E0B00 AS Date), CAST(0xCD3C0B00 AS Date), N'', 1, 3, 1, CAST(0xF2360B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (22, N'May tinh 2', CAST(0x3A3E0B00 AS Date), CAST(0xCD3C0B00 AS Date), N'', 1, 1, 1, CAST(0x82380B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (23, N'May tinh 3', CAST(0x3A3E0B00 AS Date), CAST(0xCD3C0B00 AS Date), N'', 1, 1, 1, CAST(0x82380B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (24, N'May tinh 4', CAST(0x3A3E0B00 AS Date), CAST(0xCD3C0B00 AS Date), N'', 1, 2, 1, CAST(0x82380B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (25, N'May tinh 5', CAST(0x3A3E0B00 AS Date), CAST(0xCD3C0B00 AS Date), N'', 1, 10, 2, CAST(0x82380B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (33, N'May tinh 6', CAST(0x3A3E0B00 AS Date), CAST(0xCD3C0B00 AS Date), N'', 1, 2, 1, CAST(0x85380B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (34, N'May tinh 7', CAST(0x3A3E0B00 AS Date), CAST(0xA73F0B00 AS Date), N'', 1, 1, 1, CAST(0x85380B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (47, N'May tinh 8', CAST(0x3A3E0B00 AS Date), CAST(0xCD3C0B00 AS Date), N'', 1, 3, 9, CAST(0x85380B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (48, N'May tinh 9', CAST(0x013E0B00 AS Date), CAST(0xB33C0B00 AS Date), N'', 1, 1, 1, CAST(0xB33C0B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (49, N'May tinh 10', CAST(0x203E0B00 AS Date), CAST(0xB33C0B00 AS Date), N'', 1, 10, 1, CAST(0xB33C0B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (51, N'May tinh 11', CAST(0x6A3D0B00 AS Date), CAST(0xD73E0B00 AS Date), N'', 1, 1, 1, CAST(0x6A3D0B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (52, N'May tinh 12', CAST(0x6A3D0B00 AS Date), CAST(0xB2410B00 AS Date), N'', 1, 1, 1, CAST(0x6A3D0B00 AS Date))
INSERT [dbo].[tbl_device] ([dID], [dName], [warranty_to], [warranty_from], [description], [status], [cateID], [roomID], [dateAdd]) VALUES (53, N'May tinh 13', CAST(0x6A3D0B00 AS Date), CAST(0xB2410B00 AS Date), N'', 1, 1, 1, CAST(0x6A3D0B00 AS Date))
SET IDENTITY_INSERT [dbo].[tbl_device] OFF
/****** Object:  Table [dbo].[tbl_datework]    Script Date: 10/18/2017 21:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_datework](
	[dateword] [datetime] NULL,
	[status] [tinyint] NULL,
	[datewordID] [int] IDENTITY(1,1) NOT NULL,
	[dayID] [int] NULL,
 CONSTRAINT [PK_tbl_datework] PRIMARY KEY CLUSTERED 
(
	[datewordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_datework] ON
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A75900000000 AS DateTime), 1, 345, 2)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A75A00000000 AS DateTime), 1, 346, 3)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A75B00000000 AS DateTime), 1, 347, 4)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A75C00000000 AS DateTime), 1, 348, 5)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A75D00000000 AS DateTime), 1, 349, 6)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A75F00000000 AS DateTime), 1, 350, 1)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A7C800000000 AS DateTime), 1, 351, 1)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A7C900000000 AS DateTime), 1, 352, 2)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A7CA00000000 AS DateTime), 1, 353, 3)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A7CB00000000 AS DateTime), 1, 354, 4)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A7CC00000000 AS DateTime), 1, 355, 5)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A7CD00000000 AS DateTime), 1, 356, 6)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A7F900000000 AS DateTime), 1, 357, 1)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A7FA00000000 AS DateTime), 1, 358, 2)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A7FB00000000 AS DateTime), 1, 359, 3)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A7FC00000000 AS DateTime), 1, 360, 4)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A7FD00000000 AS DateTime), 1, 361, 5)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A7FE00000000 AS DateTime), 1, 362, 6)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A80000000000 AS DateTime), 1, 363, 1)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A80100000000 AS DateTime), 1, 364, 2)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A80200000000 AS DateTime), 1, 365, 3)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A80300000000 AS DateTime), 1, 366, 4)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A80400000000 AS DateTime), 1, 367, 5)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A80500000000 AS DateTime), 1, 368, 6)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A80700000000 AS DateTime), 1, 369, 1)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A80800000000 AS DateTime), 1, 370, 2)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A80900000000 AS DateTime), 1, 371, 3)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A80A00000000 AS DateTime), 1, 372, 4)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A80B00000000 AS DateTime), 1, 373, 5)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A80C00000000 AS DateTime), 1, 374, 6)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A80E00000000 AS DateTime), 1, 375, 1)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A80F00000000 AS DateTime), 1, 376, 2)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A81000000000 AS DateTime), 1, 377, 3)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A81100000000 AS DateTime), 1, 378, 4)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A81200000000 AS DateTime), 1, 379, 5)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A81300000000 AS DateTime), 1, 380, 6)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A81500000000 AS DateTime), 1, 381, 1)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A81600000000 AS DateTime), 1, 382, 2)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A81700000000 AS DateTime), 1, 383, 3)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A81800000000 AS DateTime), 1, 384, 4)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A81900000000 AS DateTime), 1, 385, 5)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A81A00000000 AS DateTime), 1, 386, 6)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A81C00000000 AS DateTime), 1, 387, 1)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A81D00000000 AS DateTime), 1, 388, 2)
INSERT [dbo].[tbl_datework] ([dateword], [status], [datewordID], [dayID]) VALUES (CAST(0x0000A81E00000000 AS DateTime), 1, 389, 3)
SET IDENTITY_INSERT [dbo].[tbl_datework] OFF
/****** Object:  Table [dbo].[tbl_accessory]    Script Date: 10/18/2017 21:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_accessory](
	[accessID] [int] IDENTITY(1,1) NOT NULL,
	[typeID] [int] NULL,
	[accessName] [varchar](225) NULL,
	[status] [tinyint] NULL,
 CONSTRAINT [PK_tbl_accessory] PRIMARY KEY CLUSTERED 
(
	[accessID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_accessory] ON
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (1, 1, N'Photoshop', 0)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (2, 2, N'Intel Core i3', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (3, 1, N'NetBean', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (4, 1, N'DreamWear', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (7, 2, N'Teamview', 0)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (8, 1, N'SQL Sever', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (9, 1, N'My PHP', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (11, 1, N'TestAuto', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (12, 2, N'Intel Core i5', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (13, 1, N'My SQL', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (15, 2, N'Ram 4GB', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (16, 2, N'Ram 8GB', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (17, 2, N'Ram 16GB', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (18, 2, N'HDD 500GB', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (19, 2, N'HDD 1TG', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (20, 2, N'VGA Card 1GB', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (21, 2, N'VGA Card 2GB', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (22, 2, N'Intel Core i7', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (23, 2, N'Power Supply JeTek', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (24, 2, N'Power Supply SaGA', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (25, 2, N'DVD ASUS', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (26, 2, N'DVD HP', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (27, 2, N'DVD SAMSUNG', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (28, 1, N'NotePad+', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (29, 1, N'Visual C# 2010', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (30, 1, N'Eclipse ', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (31, 1, N'Dev C++', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (32, 1, N'phpMyAdmin', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (33, 1, N'HTML 5 Editor', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (34, 1, N'Dreamwear CC', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (35, 1, N'Pascal', 1)
INSERT [dbo].[tbl_accessory] ([accessID], [typeID], [accessName], [status]) VALUES (36, 1, N'Sublime text3', 1)
SET IDENTITY_INSERT [dbo].[tbl_accessory] OFF
/****** Object:  Table [dbo].[tbl_complaint]    Script Date: 10/18/2017 21:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_complaint](
	[complaintID] [int] IDENTITY(1,1) NOT NULL,
	[userSend] [int] NULL,
	[status] [tinyint] NULL,
	[datesend] [date] NULL,
	[title] [nvarchar](200) NULL,
	[userProcess] [int] NULL,
 CONSTRAINT [PK_tbl_complaint] PRIMARY KEY CLUSTERED 
(
	[complaintID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_complaint] ON
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (15, 88, 0, CAST(0x583D0B00 AS Date), N'loi hien thi man hinh', NULL)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (16, 88, 0, CAST(0x583D0B00 AS Date), N'loi hien thi man hinh', NULL)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (17, 88, 0, CAST(0x583D0B00 AS Date), N'loi hien thi man hinh', NULL)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (18, 88, 0, CAST(0x583D0B00 AS Date), N'loi hien thi man hinh', NULL)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (19, 88, 0, CAST(0x583D0B00 AS Date), N'den led hong', 91)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (20, 88, 0, CAST(0x583D0B00 AS Date), N'loi', 90)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (21, 88, 0, CAST(0x583D0B00 AS Date), N'loi', 91)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (22, 88, 0, CAST(0x583D0B00 AS Date), N'loi', NULL)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (23, 88, 0, CAST(0x583D0B00 AS Date), N'dieu khien ', 91)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (24, 88, 0, CAST(0x643D0B00 AS Date), N'lỗi', NULL)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (25, 88, 0, CAST(0x643D0B00 AS Date), N'l?i', NULL)
INSERT [dbo].[tbl_complaint] ([complaintID], [userSend], [status], [datesend], [title], [userProcess]) VALUES (26, 88, 0, CAST(0x643D0B00 AS Date), N'b? cháy ', 90)
SET IDENTITY_INSERT [dbo].[tbl_complaint] OFF
/****** Object:  Table [dbo].[tbl_device_accessory]    Script Date: 10/18/2017 21:37:27 ******/
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
 CONSTRAINT [PK_tbl_device_accessory] PRIMARY KEY CLUSTERED 
(
	[dID] ASC,
	[accessID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (1, 1, CAST(0x01380B00 AS Date), CAST(0x3E380B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (22, 2, CAST(0x82380B00 AS Date), CAST(0xCA3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (22, 7, CAST(0x82380B00 AS Date), CAST(0xCA3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (23, 2, CAST(0x82380B00 AS Date), CAST(0xCA3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (23, 7, CAST(0x82380B00 AS Date), CAST(0xCA3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (24, 3, CAST(0x82380B00 AS Date), CAST(0xCA3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (24, 8, CAST(0x82380B00 AS Date), CAST(0xCA3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (25, 3, CAST(0x82380B00 AS Date), CAST(0xCA3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (25, 8, CAST(0x82380B00 AS Date), CAST(0xCA3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (33, 3, CAST(0x85380B00 AS Date), CAST(0xCD3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (33, 8, CAST(0x85380B00 AS Date), CAST(0xCD3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (34, 3, CAST(0x85380B00 AS Date), CAST(0xCD3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (34, 7, CAST(0x85380B00 AS Date), CAST(0xCD3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (34, 8, CAST(0x85380B00 AS Date), CAST(0xCD3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (47, 3, CAST(0x85380B00 AS Date), CAST(0xCD3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (47, 9, CAST(0x85380B00 AS Date), CAST(0xCD3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (47, 11, CAST(0x85380B00 AS Date), CAST(0xCD3C0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (48, 2, CAST(0x943C0B00 AS Date), CAST(0xFB400B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (49, 9, CAST(0xB33C0B00 AS Date), CAST(0xFB400B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (51, 25, CAST(0x6A3D0B00 AS Date), CAST(0xD73E0B00 AS Date), 1)
INSERT [dbo].[tbl_device_accessory] ([dID], [accessID], [a_warranty_to], [a_warranty_from], [status]) VALUES (53, 27, CAST(0x6A3D0B00 AS Date), CAST(0xB2410B00 AS Date), 1)
/****** Object:  Table [dbo].[tbl_contact]    Script Date: 10/18/2017 21:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_contact](
	[contactID] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](225) NULL,
	[contents] [varchar](max) NULL,
	[userID] [int] NULL,
 CONSTRAINT [PK_tbl_contact] PRIMARY KEY CLUSTERED 
(
	[contactID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_workingshift]    Script Date: 10/18/2017 21:37:27 ******/
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
INSERT [dbo].[tbl_workingshift] ([id], [date_id], [user_id], [status], [create_date]) VALUES (1, 389, 90, 1, CAST(0x0000A8100155E3D4 AS DateTime))
INSERT [dbo].[tbl_workingshift] ([id], [date_id], [user_id], [status], [create_date]) VALUES (2, 388, 91, 1, CAST(0x0000A8100155EADC AS DateTime))
INSERT [dbo].[tbl_workingshift] ([id], [date_id], [user_id], [status], [create_date]) VALUES (3, 387, 91, 1, CAST(0x0000A8100155F568 AS DateTime))
INSERT [dbo].[tbl_workingshift] ([id], [date_id], [user_id], [status], [create_date]) VALUES (4, 386, 90, 1, CAST(0x0000A8100155FC70 AS DateTime))
INSERT [dbo].[tbl_workingshift] ([id], [date_id], [user_id], [status], [create_date]) VALUES (5, 385, 91, 1, CAST(0x0000A810015604A4 AS DateTime))
INSERT [dbo].[tbl_workingshift] ([id], [date_id], [user_id], [status], [create_date]) VALUES (6, 384, 91, 1, CAST(0x0000A81001560CD8 AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_workingshift] OFF
/****** Object:  Table [dbo].[tbl_schedule]    Script Date: 10/18/2017 21:37:27 ******/
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
 CONSTRAINT [PK_tbl_schedule] PRIMARY KEY CLUSTERED 
(
	[scheduleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_schedule] ON
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7655, 1, 1, 378, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7656, 2, 1, 378, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7657, 3, 1, 378, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7658, 4, 1, 378, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7659, 5, 1, 378, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7660, 6, 1, 378, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7661, 7, 1, 378, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7662, 8, 1, 378, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7663, 9, 1, 378, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7664, 10, 1, 378, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7665, 11, 1, 378, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7666, 12, 1, 378, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7667, 13, 1, 378, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7668, 14, 1, 378, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7669, 15, 1, 378, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7670, 16, 1, 378, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7671, 1, 1, 379, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7672, 2, 1, 379, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7673, 3, 1, 379, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7674, 4, 1, 379, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7675, 5, 1, 379, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7676, 6, 1, 379, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7677, 7, 1, 379, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7678, 8, 1, 379, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7679, 9, 1, 379, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7680, 10, 1, 379, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7681, 11, 1, 379, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7682, 12, 1, 379, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7683, 13, 1, 379, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7684, 14, 1, 379, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7685, 15, 1, 379, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7686, 16, 1, 379, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7687, 1, 1, 380, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7688, 2, 1, 380, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7689, 3, 1, 380, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7690, 4, 1, 380, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7691, 5, 1, 380, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7692, 6, 1, 380, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7693, 7, 1, 380, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7694, 8, 1, 380, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7695, 9, 1, 380, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7696, 10, 1, 380, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7697, 11, 1, 380, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7698, 12, 1, 380, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7699, 13, 1, 380, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7700, 14, 1, 380, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7701, 15, 1, 380, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7702, 16, 1, 380, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7703, 1, 1, 381, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7704, 2, 1, 381, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7705, 3, 1, 381, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7706, 4, 1, 381, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7707, 5, 1, 381, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7708, 6, 1, 381, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7709, 7, 1, 381, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7710, 8, 1, 381, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7711, 9, 1, 381, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7712, 10, 1, 381, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7713, 11, 1, 381, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7714, 12, 1, 381, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7715, 13, 1, 381, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7716, 14, 1, 381, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7717, 15, 1, 381, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7718, 16, 1, 381, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7719, 1, 1, 382, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7720, 2, 1, 382, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7721, 3, 1, 382, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7722, 4, 1, 382, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7723, 5, 1, 382, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7724, 6, 1, 382, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7725, 7, 1, 382, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7726, 8, 1, 382, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7727, 9, 1, 382, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7728, 10, 1, 382, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7729, 11, 1, 382, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7730, 12, 1, 382, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7731, 13, 1, 382, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7732, 14, 1, 382, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7733, 15, 1, 382, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7734, 16, 1, 382, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7735, 1, 1, 383, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7736, 2, 1, 383, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7737, 3, 1, 383, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7738, 4, 1, 383, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7739, 5, 1, 383, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7740, 6, 1, 383, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7741, 7, 1, 383, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7742, 8, 1, 383, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7743, 9, 1, 383, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7744, 10, 1, 383, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7745, 11, 1, 383, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7746, 12, 1, 383, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7747, 13, 1, 383, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7748, 14, 1, 383, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7749, 15, 1, 383, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7750, 16, 1, 383, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7751, 1, 1, 384, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7752, 2, 1, 384, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7753, 3, 1, 384, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7754, 4, 1, 384, 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7755, 5, 1, 384, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7756, 6, 1, 384, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7757, 7, 1, 384, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7758, 8, 1, 384, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7759, 9, 1, 384, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7760, 10, 1, 384, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7761, 11, 1, 384, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7762, 12, 1, 384, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7763, 13, 1, 384, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7764, 14, 1, 384, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7765, 15, 1, 384, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7766, 16, 1, 384, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7767, 1, 1, 385, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7768, 2, 1, 385, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7769, 3, 1, 385, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7770, 4, 1, 385, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7771, 5, 1, 385, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7772, 6, 1, 385, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7773, 7, 1, 385, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7774, 8, 1, 385, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7775, 9, 1, 385, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7776, 10, 1, 385, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7777, 11, 1, 385, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7778, 12, 1, 385, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7779, 13, 1, 385, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7780, 14, 1, 385, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7781, 15, 1, 385, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7782, 16, 1, 385, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7783, 1, 1, 386, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7784, 2, 1, 386, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7785, 3, 1, 386, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7786, 4, 1, 386, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7787, 5, 1, 386, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7788, 6, 1, 386, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7789, 7, 1, 386, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7790, 8, 1, 386, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7791, 9, 1, 386, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7792, 10, 1, 386, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7793, 11, 1, 386, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7794, 12, 1, 386, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7795, 13, 1, 386, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7796, 14, 1, 386, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7797, 15, 1, 386, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7798, 16, 1, 386, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7799, 1, 1, 387, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7800, 2, 1, 387, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7801, 3, 1, 387, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7802, 4, 1, 387, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7803, 5, 1, 387, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7804, 6, 1, 387, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7805, 7, 1, 387, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7806, 8, 1, 387, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7807, 9, 1, 387, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7808, 10, 1, 387, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7809, 11, 1, 387, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7810, 12, 1, 387, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7811, 13, 1, 387, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7812, 14, 1, 387, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7813, 15, 1, 387, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7814, 16, 1, 387, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7815, 1, 1, 388, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7816, 2, 1, 388, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7817, 3, 1, 388, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7818, 4, 1, 388, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7819, 5, 1, 388, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7820, 6, 1, 388, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7821, 7, 1, 388, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7822, 8, 1, 388, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7823, 9, 1, 388, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7824, 10, 1, 388, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7825, 11, 1, 388, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7826, 12, 1, 388, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7827, 13, 1, 388, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7828, 14, 1, 388, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7829, 15, 1, 388, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7830, 16, 1, 388, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7831, 1, 1, 389, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7832, 2, 1, 389, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7833, 3, 1, 389, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7834, 4, 1, 389, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7835, 5, 1, 389, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7836, 6, 1, 389, 1)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7837, 7, 1, 389, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7838, 8, 1, 389, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7839, 9, 1, 389, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7840, 10, 1, 389, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7841, 11, 1, 389, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7842, 12, 1, 389, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7843, 13, 1, 389, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7844, 14, 1, 389, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7845, 15, 1, 389, 0)
INSERT [dbo].[tbl_schedule] ([scheduleID], [shiftID], [roomID], [dateworkID], [status]) VALUES (7846, 16, 1, 389, 0)
SET IDENTITY_INSERT [dbo].[tbl_schedule] OFF
/****** Object:  Table [dbo].[tbl_request]    Script Date: 10/18/2017 21:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_request](
	[requestID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[classID] [int] NULL,
	[scheduleID] [int] NULL,
	[courseName] [varchar](225) NULL,
	[sendDate] [datetime] NULL,
	[status] [tinyint] NULL,
	[sizeStudent] [int] NULL,
 CONSTRAINT [PK_tbl_request] PRIMARY KEY CLUSTERED 
(
	[requestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_complaint_device]    Script Date: 10/18/2017 21:37:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_complaint_device](
	[complaintID] [int] NOT NULL,
	[dID] [int] NOT NULL,
	[complaint_details] [nvarchar](200) NULL,
 CONSTRAINT [PK_tbl_complaint_device] PRIMARY KEY CLUSTERED 
(
	[complaintID] ASC,
	[dID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (15, 22, N'cam dien khong len')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (16, 22, N'cam dien khong len')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (17, 23, N'cam dien khong len')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (18, 23, N'cam dien khong len')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (19, 23, N'thay cái khác')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (20, 23, N'khong bat duoc may')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (21, 23, N'hong')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (22, 33, N'cam dien khong chay')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (23, 24, N'khong bat duoc')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (24, 49, N'hỏng loa bên trái')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (25, 24, N'h?ng di?u khi?n')
INSERT [dbo].[tbl_complaint_device] ([complaintID], [dID], [complaint_details]) VALUES (26, 33, N'Qu?t b? khét')
/****** Object:  ForeignKey [FK_tbl_user_tbl_department]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_user]  WITH CHECK ADD  CONSTRAINT [FK_tbl_user_tbl_department] FOREIGN KEY([departmentID])
REFERENCES [dbo].[tbl_department] ([departmentID])
GO
ALTER TABLE [dbo].[tbl_user] CHECK CONSTRAINT [FK_tbl_user_tbl_department]
GO
/****** Object:  ForeignKey [FK_tbl_device_tbl_category]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_device]  WITH CHECK ADD  CONSTRAINT [FK_tbl_device_tbl_category] FOREIGN KEY([cateID])
REFERENCES [dbo].[tbl_category] ([cateID])
GO
ALTER TABLE [dbo].[tbl_device] CHECK CONSTRAINT [FK_tbl_device_tbl_category]
GO
/****** Object:  ForeignKey [FK_tbl_device_tbl_labroom]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_device]  WITH CHECK ADD  CONSTRAINT [FK_tbl_device_tbl_labroom] FOREIGN KEY([roomID])
REFERENCES [dbo].[tbl_labroom] ([roomID])
GO
ALTER TABLE [dbo].[tbl_device] CHECK CONSTRAINT [FK_tbl_device_tbl_labroom]
GO
/****** Object:  ForeignKey [FK_tbl_datework_days_week]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_datework]  WITH CHECK ADD  CONSTRAINT [FK_tbl_datework_days_week] FOREIGN KEY([dayID])
REFERENCES [dbo].[days_week] ([dayID])
GO
ALTER TABLE [dbo].[tbl_datework] CHECK CONSTRAINT [FK_tbl_datework_days_week]
GO
/****** Object:  ForeignKey [FK_tbl_accessory_tbl_type_accessory]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_accessory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_accessory_tbl_type_accessory] FOREIGN KEY([typeID])
REFERENCES [dbo].[tbl_type_accessory] ([typeID])
GO
ALTER TABLE [dbo].[tbl_accessory] CHECK CONSTRAINT [FK_tbl_accessory_tbl_type_accessory]
GO
/****** Object:  ForeignKey [FK_tbl_complaint_tbl_user]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_complaint]  WITH CHECK ADD  CONSTRAINT [FK_tbl_complaint_tbl_user] FOREIGN KEY([userSend])
REFERENCES [dbo].[tbl_user] ([userID])
GO
ALTER TABLE [dbo].[tbl_complaint] CHECK CONSTRAINT [FK_tbl_complaint_tbl_user]
GO
/****** Object:  ForeignKey [FK_tbl_complaint_tbl_user1]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_complaint]  WITH CHECK ADD  CONSTRAINT [FK_tbl_complaint_tbl_user1] FOREIGN KEY([userProcess])
REFERENCES [dbo].[tbl_user] ([userID])
GO
ALTER TABLE [dbo].[tbl_complaint] CHECK CONSTRAINT [FK_tbl_complaint_tbl_user1]
GO
/****** Object:  ForeignKey [FK_tbl_device_accessory_tbl_accessory]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_device_accessory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_device_accessory_tbl_accessory] FOREIGN KEY([accessID])
REFERENCES [dbo].[tbl_accessory] ([accessID])
GO
ALTER TABLE [dbo].[tbl_device_accessory] CHECK CONSTRAINT [FK_tbl_device_accessory_tbl_accessory]
GO
/****** Object:  ForeignKey [FK_tbl_device_accessory_tbl_device]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_device_accessory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_device_accessory_tbl_device] FOREIGN KEY([dID])
REFERENCES [dbo].[tbl_device] ([dID])
GO
ALTER TABLE [dbo].[tbl_device_accessory] CHECK CONSTRAINT [FK_tbl_device_accessory_tbl_device]
GO
/****** Object:  ForeignKey [FK_tbl_contact_tbl_user]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_contact]  WITH CHECK ADD  CONSTRAINT [FK_tbl_contact_tbl_user] FOREIGN KEY([userID])
REFERENCES [dbo].[tbl_user] ([userID])
GO
ALTER TABLE [dbo].[tbl_contact] CHECK CONSTRAINT [FK_tbl_contact_tbl_user]
GO
/****** Object:  ForeignKey [FK_tbl_workingshift_tbl_datework]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_workingshift]  WITH CHECK ADD  CONSTRAINT [FK_tbl_workingshift_tbl_datework] FOREIGN KEY([date_id])
REFERENCES [dbo].[tbl_datework] ([datewordID])
GO
ALTER TABLE [dbo].[tbl_workingshift] CHECK CONSTRAINT [FK_tbl_workingshift_tbl_datework]
GO
/****** Object:  ForeignKey [FK_tbl_workingshift_tbl_user]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_workingshift]  WITH CHECK ADD  CONSTRAINT [FK_tbl_workingshift_tbl_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[tbl_user] ([userID])
GO
ALTER TABLE [dbo].[tbl_workingshift] CHECK CONSTRAINT [FK_tbl_workingshift_tbl_user]
GO
/****** Object:  ForeignKey [FK_tbl_schedule_tbl_datework]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_schedule]  WITH CHECK ADD  CONSTRAINT [FK_tbl_schedule_tbl_datework] FOREIGN KEY([dateworkID])
REFERENCES [dbo].[tbl_datework] ([datewordID])
GO
ALTER TABLE [dbo].[tbl_schedule] CHECK CONSTRAINT [FK_tbl_schedule_tbl_datework]
GO
/****** Object:  ForeignKey [FK_tbl_schedule_tbl_labroom]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_schedule]  WITH CHECK ADD  CONSTRAINT [FK_tbl_schedule_tbl_labroom] FOREIGN KEY([roomID])
REFERENCES [dbo].[tbl_labroom] ([roomID])
GO
ALTER TABLE [dbo].[tbl_schedule] CHECK CONSTRAINT [FK_tbl_schedule_tbl_labroom]
GO
/****** Object:  ForeignKey [FK_tbl_schedule_tbl_shiftname]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_schedule]  WITH CHECK ADD  CONSTRAINT [FK_tbl_schedule_tbl_shiftname] FOREIGN KEY([shiftID])
REFERENCES [dbo].[tbl_shiftname] ([shiftID])
GO
ALTER TABLE [dbo].[tbl_schedule] CHECK CONSTRAINT [FK_tbl_schedule_tbl_shiftname]
GO
/****** Object:  ForeignKey [FK_tbl_request_tbl_class]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_request]  WITH CHECK ADD  CONSTRAINT [FK_tbl_request_tbl_class] FOREIGN KEY([classID])
REFERENCES [dbo].[tbl_class] ([classID])
GO
ALTER TABLE [dbo].[tbl_request] CHECK CONSTRAINT [FK_tbl_request_tbl_class]
GO
/****** Object:  ForeignKey [FK_tbl_request_tbl_schedule]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_request]  WITH CHECK ADD  CONSTRAINT [FK_tbl_request_tbl_schedule] FOREIGN KEY([scheduleID])
REFERENCES [dbo].[tbl_schedule] ([scheduleID])
GO
ALTER TABLE [dbo].[tbl_request] CHECK CONSTRAINT [FK_tbl_request_tbl_schedule]
GO
/****** Object:  ForeignKey [FK_tbl_request_tbl_user]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_request]  WITH CHECK ADD  CONSTRAINT [FK_tbl_request_tbl_user] FOREIGN KEY([userID])
REFERENCES [dbo].[tbl_user] ([userID])
GO
ALTER TABLE [dbo].[tbl_request] CHECK CONSTRAINT [FK_tbl_request_tbl_user]
GO
/****** Object:  ForeignKey [FK_tbl_complaint_device_tbl_complaint]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_complaint_device]  WITH CHECK ADD  CONSTRAINT [FK_tbl_complaint_device_tbl_complaint] FOREIGN KEY([complaintID])
REFERENCES [dbo].[tbl_complaint] ([complaintID])
GO
ALTER TABLE [dbo].[tbl_complaint_device] CHECK CONSTRAINT [FK_tbl_complaint_device_tbl_complaint]
GO
/****** Object:  ForeignKey [FK_tbl_complaint_device_tbl_device]    Script Date: 10/18/2017 21:37:27 ******/
ALTER TABLE [dbo].[tbl_complaint_device]  WITH CHECK ADD  CONSTRAINT [FK_tbl_complaint_device_tbl_device] FOREIGN KEY([dID])
REFERENCES [dbo].[tbl_device] ([dID])
GO
ALTER TABLE [dbo].[tbl_complaint_device] CHECK CONSTRAINT [FK_tbl_complaint_device_tbl_device]
GO
