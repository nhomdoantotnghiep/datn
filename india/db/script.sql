USE [master]
GO
/****** Object:  Database [computerlabsdatn]    Script Date: 10/12/2017 17:28:15 ******/
CREATE DATABASE [computerlabsdatn] ON  PRIMARY 
( NAME = N'computerlabsdatn', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\computerlabsdatn.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'computerlabsdatn_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\computerlabsdatn_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[days_week]    Script Date: 10/12/2017 17:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
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
/****** Object:  Table [dbo].[tbl_class]    Script Date: 10/12/2017 17:28:15 ******/
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
/****** Object:  Table [dbo].[tbl_category]    Script Date: 10/12/2017 17:28:15 ******/
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
/****** Object:  Table [dbo].[tbl_labroom]    Script Date: 10/12/2017 17:28:15 ******/
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
/****** Object:  Table [dbo].[tbl_department]    Script Date: 10/12/2017 17:28:15 ******/
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
/****** Object:  Table [dbo].[tbl_type_accessory]    Script Date: 10/12/2017 17:28:15 ******/
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
/****** Object:  Table [dbo].[tbl_shiftname]    Script Date: 10/12/2017 17:28:15 ******/
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
/****** Object:  Table [dbo].[tbl_workingshift]    Script Date: 10/12/2017 17:28:15 ******/
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
/****** Object:  Table [dbo].[tbl_device]    Script Date: 10/12/2017 17:28:15 ******/
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
/****** Object:  Table [dbo].[tbl_user]    Script Date: 10/12/2017 17:28:15 ******/
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
/****** Object:  Table [dbo].[tbl_datework]    Script Date: 10/12/2017 17:28:15 ******/
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
/****** Object:  Table [dbo].[tbl_accessory]    Script Date: 10/12/2017 17:28:15 ******/
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
/****** Object:  Table [dbo].[tbl_complaint]    Script Date: 10/12/2017 17:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_complaint](
	[complaintID] [int] IDENTITY(1,1) NOT NULL,
	[userSend] [int] NULL,
	[status] [tinyint] NULL,
	[datesend] [date] NULL,
	[title] [varchar](225) NULL,
	[userProcess] [int] NULL,
 CONSTRAINT [PK_tbl_complaint] PRIMARY KEY CLUSTERED 
(
	[complaintID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_device_accessory]    Script Date: 10/12/2017 17:28:15 ******/
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
/****** Object:  Table [dbo].[tbl_contact]    Script Date: 10/12/2017 17:28:15 ******/
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
/****** Object:  Table [dbo].[tbl_schedule]    Script Date: 10/12/2017 17:28:15 ******/
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
/****** Object:  Table [dbo].[tbl_request]    Script Date: 10/12/2017 17:28:15 ******/
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
 CONSTRAINT [PK_tbl_request] PRIMARY KEY CLUSTERED 
(
	[requestID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_complaint_device]    Script Date: 10/12/2017 17:28:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_complaint_device](
	[complaintID] [int] NOT NULL,
	[dID] [int] NOT NULL,
	[complaint_details] [varchar](225) NULL,
 CONSTRAINT [PK_tbl_complaint_device] PRIMARY KEY CLUSTERED 
(
	[complaintID] ASC,
	[dID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_tbl_device_tbl_category]    Script Date: 10/12/2017 17:28:15 ******/
ALTER TABLE [dbo].[tbl_device]  WITH CHECK ADD  CONSTRAINT [FK_tbl_device_tbl_category] FOREIGN KEY([cateID])
REFERENCES [dbo].[tbl_category] ([cateID])
GO
ALTER TABLE [dbo].[tbl_device] CHECK CONSTRAINT [FK_tbl_device_tbl_category]
GO
/****** Object:  ForeignKey [FK_tbl_device_tbl_labroom]    Script Date: 10/12/2017 17:28:15 ******/
ALTER TABLE [dbo].[tbl_device]  WITH CHECK ADD  CONSTRAINT [FK_tbl_device_tbl_labroom] FOREIGN KEY([roomID])
REFERENCES [dbo].[tbl_labroom] ([roomID])
GO
ALTER TABLE [dbo].[tbl_device] CHECK CONSTRAINT [FK_tbl_device_tbl_labroom]
GO
/****** Object:  ForeignKey [FK_tbl_user_tbl_department]    Script Date: 10/12/2017 17:28:15 ******/
ALTER TABLE [dbo].[tbl_user]  WITH CHECK ADD  CONSTRAINT [FK_tbl_user_tbl_department] FOREIGN KEY([departmentID])
REFERENCES [dbo].[tbl_department] ([departmentID])
GO
ALTER TABLE [dbo].[tbl_user] CHECK CONSTRAINT [FK_tbl_user_tbl_department]
GO
/****** Object:  ForeignKey [FK_tbl_datework_days_week]    Script Date: 10/12/2017 17:28:15 ******/
ALTER TABLE [dbo].[tbl_datework]  WITH CHECK ADD  CONSTRAINT [FK_tbl_datework_days_week] FOREIGN KEY([dayID])
REFERENCES [dbo].[days_week] ([dayID])
GO
ALTER TABLE [dbo].[tbl_datework] CHECK CONSTRAINT [FK_tbl_datework_days_week]
GO
/****** Object:  ForeignKey [FK_tbl_accessory_tbl_type_accessory]    Script Date: 10/12/2017 17:28:15 ******/
ALTER TABLE [dbo].[tbl_accessory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_accessory_tbl_type_accessory] FOREIGN KEY([typeID])
REFERENCES [dbo].[tbl_type_accessory] ([typeID])
GO
ALTER TABLE [dbo].[tbl_accessory] CHECK CONSTRAINT [FK_tbl_accessory_tbl_type_accessory]
GO
/****** Object:  ForeignKey [FK_tbl_complaint_tbl_user]    Script Date: 10/12/2017 17:28:15 ******/
ALTER TABLE [dbo].[tbl_complaint]  WITH CHECK ADD  CONSTRAINT [FK_tbl_complaint_tbl_user] FOREIGN KEY([userSend])
REFERENCES [dbo].[tbl_user] ([userID])
GO
ALTER TABLE [dbo].[tbl_complaint] CHECK CONSTRAINT [FK_tbl_complaint_tbl_user]
GO
/****** Object:  ForeignKey [FK_tbl_complaint_tbl_user1]    Script Date: 10/12/2017 17:28:15 ******/
ALTER TABLE [dbo].[tbl_complaint]  WITH CHECK ADD  CONSTRAINT [FK_tbl_complaint_tbl_user1] FOREIGN KEY([userProcess])
REFERENCES [dbo].[tbl_user] ([userID])
GO
ALTER TABLE [dbo].[tbl_complaint] CHECK CONSTRAINT [FK_tbl_complaint_tbl_user1]
GO
/****** Object:  ForeignKey [FK_tbl_device_accessory_tbl_accessory]    Script Date: 10/12/2017 17:28:15 ******/
ALTER TABLE [dbo].[tbl_device_accessory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_device_accessory_tbl_accessory] FOREIGN KEY([accessID])
REFERENCES [dbo].[tbl_accessory] ([accessID])
GO
ALTER TABLE [dbo].[tbl_device_accessory] CHECK CONSTRAINT [FK_tbl_device_accessory_tbl_accessory]
GO
/****** Object:  ForeignKey [FK_tbl_device_accessory_tbl_device]    Script Date: 10/12/2017 17:28:15 ******/
ALTER TABLE [dbo].[tbl_device_accessory]  WITH CHECK ADD  CONSTRAINT [FK_tbl_device_accessory_tbl_device] FOREIGN KEY([dID])
REFERENCES [dbo].[tbl_device] ([dID])
GO
ALTER TABLE [dbo].[tbl_device_accessory] CHECK CONSTRAINT [FK_tbl_device_accessory_tbl_device]
GO
/****** Object:  ForeignKey [FK_tbl_contact_tbl_user]    Script Date: 10/12/2017 17:28:15 ******/
ALTER TABLE [dbo].[tbl_contact]  WITH CHECK ADD  CONSTRAINT [FK_tbl_contact_tbl_user] FOREIGN KEY([userID])
REFERENCES [dbo].[tbl_user] ([userID])
GO
ALTER TABLE [dbo].[tbl_contact] CHECK CONSTRAINT [FK_tbl_contact_tbl_user]
GO
/****** Object:  ForeignKey [FK_tbl_schedule_tbl_datework]    Script Date: 10/12/2017 17:28:15 ******/
ALTER TABLE [dbo].[tbl_schedule]  WITH CHECK ADD  CONSTRAINT [FK_tbl_schedule_tbl_datework] FOREIGN KEY([dateworkID])
REFERENCES [dbo].[tbl_datework] ([datewordID])
GO
ALTER TABLE [dbo].[tbl_schedule] CHECK CONSTRAINT [FK_tbl_schedule_tbl_datework]
GO
/****** Object:  ForeignKey [FK_tbl_schedule_tbl_labroom]    Script Date: 10/12/2017 17:28:15 ******/
ALTER TABLE [dbo].[tbl_schedule]  WITH CHECK ADD  CONSTRAINT [FK_tbl_schedule_tbl_labroom] FOREIGN KEY([roomID])
REFERENCES [dbo].[tbl_labroom] ([roomID])
GO
ALTER TABLE [dbo].[tbl_schedule] CHECK CONSTRAINT [FK_tbl_schedule_tbl_labroom]
GO
/****** Object:  ForeignKey [FK_tbl_schedule_tbl_shiftname]    Script Date: 10/12/2017 17:28:15 ******/
ALTER TABLE [dbo].[tbl_schedule]  WITH CHECK ADD  CONSTRAINT [FK_tbl_schedule_tbl_shiftname] FOREIGN KEY([shiftID])
REFERENCES [dbo].[tbl_shiftname] ([shiftID])
GO
ALTER TABLE [dbo].[tbl_schedule] CHECK CONSTRAINT [FK_tbl_schedule_tbl_shiftname]
GO
/****** Object:  ForeignKey [FK_tbl_request_tbl_class]    Script Date: 10/12/2017 17:28:15 ******/
ALTER TABLE [dbo].[tbl_request]  WITH CHECK ADD  CONSTRAINT [FK_tbl_request_tbl_class] FOREIGN KEY([classID])
REFERENCES [dbo].[tbl_class] ([classID])
GO
ALTER TABLE [dbo].[tbl_request] CHECK CONSTRAINT [FK_tbl_request_tbl_class]
GO
/****** Object:  ForeignKey [FK_tbl_request_tbl_schedule]    Script Date: 10/12/2017 17:28:15 ******/
ALTER TABLE [dbo].[tbl_request]  WITH CHECK ADD  CONSTRAINT [FK_tbl_request_tbl_schedule] FOREIGN KEY([scheduleID])
REFERENCES [dbo].[tbl_schedule] ([scheduleID])
GO
ALTER TABLE [dbo].[tbl_request] CHECK CONSTRAINT [FK_tbl_request_tbl_schedule]
GO
/****** Object:  ForeignKey [FK_tbl_request_tbl_user]    Script Date: 10/12/2017 17:28:15 ******/
ALTER TABLE [dbo].[tbl_request]  WITH CHECK ADD  CONSTRAINT [FK_tbl_request_tbl_user] FOREIGN KEY([userID])
REFERENCES [dbo].[tbl_user] ([userID])
GO
ALTER TABLE [dbo].[tbl_request] CHECK CONSTRAINT [FK_tbl_request_tbl_user]
GO
/****** Object:  ForeignKey [FK_tbl_complaint_device_tbl_complaint]    Script Date: 10/12/2017 17:28:15 ******/
ALTER TABLE [dbo].[tbl_complaint_device]  WITH CHECK ADD  CONSTRAINT [FK_tbl_complaint_device_tbl_complaint] FOREIGN KEY([complaintID])
REFERENCES [dbo].[tbl_complaint] ([complaintID])
GO
ALTER TABLE [dbo].[tbl_complaint_device] CHECK CONSTRAINT [FK_tbl_complaint_device_tbl_complaint]
GO
/****** Object:  ForeignKey [FK_tbl_complaint_device_tbl_device]    Script Date: 10/12/2017 17:28:15 ******/
ALTER TABLE [dbo].[tbl_complaint_device]  WITH CHECK ADD  CONSTRAINT [FK_tbl_complaint_device_tbl_device] FOREIGN KEY([dID])
REFERENCES [dbo].[tbl_device] ([dID])
GO
ALTER TABLE [dbo].[tbl_complaint_device] CHECK CONSTRAINT [FK_tbl_complaint_device_tbl_device]
GO
