USE [master]
GO
/****** Object:  Database [SWVL_DB]    Script Date: 5/30/2023 2:24:11 PM ******/
CREATE DATABASE [SWVL_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWVL_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SWVL_DB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SWVL_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\SWVL_DB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SWVL_DB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWVL_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWVL_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWVL_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWVL_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWVL_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWVL_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWVL_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWVL_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWVL_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWVL_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWVL_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWVL_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWVL_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWVL_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWVL_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWVL_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SWVL_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWVL_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWVL_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWVL_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWVL_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWVL_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWVL_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWVL_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [SWVL_DB] SET  MULTI_USER 
GO
ALTER DATABASE [SWVL_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWVL_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWVL_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWVL_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SWVL_DB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWVL_DB', N'ON'
GO
USE [SWVL_DB]
GO
/****** Object:  Table [dbo].[tbl_Booking]    Script Date: 5/30/2023 2:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Booking](
	[C_ID] [int] NOT NULL,
	[R_ID] [int] NOT NULL,
	[B_Payment] [nvarchar](25) NOT NULL,
	[B_Seats] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[C_ID] ASC,
	[R_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Customer]    Script Date: 5/30/2023 2:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Customer](
	[C_ID] [int] IDENTITY(1,1) NOT NULL,
	[C_Name] [nvarchar](25) NOT NULL,
	[C_Address] [nvarchar](25) NOT NULL,
	[C_Phone_Number] [nvarchar](25) NOT NULL,
	[C_Email] [nvarchar](25) NOT NULL,
	[C_Ssn] [bigint] NOT NULL,
	[C_BD] [date] NOT NULL,
	[R_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[C_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Driver]    Script Date: 5/30/2023 2:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Driver](
	[D_ID] [int] IDENTITY(1,1) NOT NULL,
	[D_name] [nvarchar](25) NOT NULL,
	[D_Address] [nvarchar](25) NOT NULL,
	[D_Phone_Number] [nvarchar](25) NOT NULL,
	[D_Email] [nvarchar](25) NOT NULL,
	[D_Ssn] [bigint] NOT NULL,
	[D_Experience] [int] NOT NULL,
	[D_Salary] [int] NOT NULL,
	[D_License] [nvarchar](25) NOT NULL,
	[D_Shift_Time] [time](7) NOT NULL,
	[V_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[D_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Ride]    Script Date: 5/30/2023 2:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Ride](
	[R_ID] [int] IDENTITY(1,1) NOT NULL,
	[R_Pickup] [nvarchar](25) NOT NULL,
	[R_Dropoff] [nvarchar](25) NOT NULL,
	[R_Destination] [nvarchar](25) NOT NULL,
	[R_Time] [time](7) NOT NULL,
 CONSTRAINT [Users_PK] PRIMARY KEY CLUSTERED 
(
	[R_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Vehicles]    Script Date: 5/30/2023 2:24:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Vehicles](
	[V_ID] [int] IDENTITY(1,1) NOT NULL,
	[V_License] [nvarchar](25) NOT NULL,
	[V_Brand] [nvarchar](25) NOT NULL,
	[V_PlateNumber] [nvarchar](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[V_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (3, 1, N'Cash', 2)
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (4, 2, N'Credit', 1)
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (5, 3, N'Cash', 3)
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (6, 4, N'Credit', 2)
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (7, 5, N'Cash', 1)
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (8, 6, N'Credit', 4)
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (9, 7, N'Cash', 2)
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (10, 8, N'Credit', 3)
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (11, 9, N'Cash', 2)
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (12, 10, N'Credit', 1)
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (13, 11, N'Cash', 4)
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (14, 12, N'Credit', 2)
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (15, 13, N'Cash', 1)
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (16, 14, N'Credit', 3)
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (17, 15, N'Cash', 2)
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (18, 16, N'Cash', 3)
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (19, 17, N'Credit', 2)
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (20, 18, N'Cash', 1)
INSERT [dbo].[tbl_Booking] ([C_ID], [R_ID], [B_Payment], [B_Seats]) VALUES (21, 19, N'Credit', 4)
SET IDENTITY_INSERT [dbo].[tbl_Customer] ON 

INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (3, N'Ali Ahmed', N'Cairo', N'01011112222', N'ali.ahmed@gmail.com', 123456789, CAST(N'1995-01-01' AS Date), 1)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (4, N'Fatma Mohamed', N'Giza', N'01111112222', N'fatma.mohamed@yahoo.com', 234567890, CAST(N'1990-05-10' AS Date), 2)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (5, N'Omar Mahmoud', N'Alexandria', N'01211112222', N'omar.mahmoud@hotmail.com', 345678901, CAST(N'1998-07-15' AS Date), 3)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (6, N'Nada Ali', N'Cairo', N'01011113333', N'nada.ali@gmail.com', 456789012, CAST(N'1993-12-25' AS Date), 4)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (7, N'Khaled Hassan', N'Cairo', N'01111113333', N'khaled.hassan@yahoo.com', 567890123, CAST(N'1985-08-20' AS Date), 5)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (8, N'Sara Samir', N'Giza', N'01211113333', N'sara.samir@hotmail.com', 678901234, CAST(N'2000-03-08' AS Date), 6)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (9, N'Ahmed Mohamed', N'Alexandria', N'01011114444', N'ahmed.mohamed@gmail.com', 789012345, CAST(N'1991-11-11' AS Date), 7)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (10, N'Yara Ahmed', N'Cairo', N'01111114444', N'yara.ahmed@yahoo.com', 890123456, CAST(N'1997-02-28' AS Date), 8)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (11, N'Hassan Ali', N'Alexandria', N'01211114444', N'hassan.ali@hotmail.com', 901234567, CAST(N'1988-09-15' AS Date), 9)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (12, N'Noura Ahmed', N'Cairo', N'01011115555', N'noura.ahmed@gmail.com', 12345678, CAST(N'1994-06-03' AS Date), 10)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (13, N'Nadine Salem', N'Giza', N'01112829828', N'nadinesalem@yahoo.com', 92918199, CAST(N'1999-02-17' AS Date), 11)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (14, N'Omar Ali', N'Alexandria', N'01111115555', N'omar.ali@gmail.com', 123450987, CAST(N'1992-04-12' AS Date), 11)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (15, N'Sara Ahmed', N'Giza', N'01011116666', N'sara.ahmed@yahoo.com', 234560987, CAST(N'1996-09-30' AS Date), 12)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (16, N'Ahmed Hassan', N'Cairo', N'01111116666', N'ahmed.hassan@hotmail.com', 345670987, CAST(N'1987-02-18' AS Date), 13)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (17, N'Nadia Mohamed', N'Alexandria', N'01211116666', N'nadia.mohamed@gmail.com', 456780987, CAST(N'1999-11-22' AS Date), 14)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (18, N'Khaled Samir', N'Cairo', N'01011117777', N'khaled.samir@yahoo.com', 567890987, CAST(N'1992-07-01' AS Date), 15)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (19, N'Mona Hassan', N'Giza', N'01111117777', N'mona.hassan@hotmail.com', 678900987, CAST(N'1989-12-03' AS Date), 16)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (20, N'Youssef Ali', N'Alexandria', N'01211117777', N'youssef.ali@gmail.com', 789010987, CAST(N'1994-03-17' AS Date), 17)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (21, N'Nour Ahmed', N'Cairo', N'01011118888', N'nour.ahmed@yahoo.com', 890120987, CAST(N'1998-06-20' AS Date), 18)
INSERT [dbo].[tbl_Customer] ([C_ID], [C_Name], [C_Address], [C_Phone_Number], [C_Email], [C_Ssn], [C_BD], [R_ID]) VALUES (22, N'Khaled Omar', N'Alexandria', N'01111118888', N'khaled.omar@hotmail.com', 901230987, CAST(N'1984-10-05' AS Date), 19)
SET IDENTITY_INSERT [dbo].[tbl_Customer] OFF
SET IDENTITY_INSERT [dbo].[tbl_Driver] ON 

INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (9, N'Ahmed Ezz', N' Brazil', N'0109292901', N'Redasaada.com', 1818191018, 10, 7000, N'11029100293', CAST(N'08:30:11' AS Time), 2)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (23, N'Ahmed Ezz', N' Brazil', N'010929901', N'Redasada.com', 181819101, 10, 7000, N'11029100293', CAST(N'08:30:11' AS Time), 1)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (24, N'Amr Diab', N' Shehab', N'01117489172', N'Tamalymaakhotmail.com', 191917839, 8, 4000, N'19192810090', CAST(N'10:30:11' AS Time), 2)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (25, N'Tamer Hosny', N'Mohamed thakeb', N'015181919', N'heyady1989gmail.com', 198582012, 5, 9000, N'88391837719', CAST(N'07:30:11' AS Time), 3)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (26, N'Karim abd el Aziz', N' geziret el arab', N'010027361999', N'Aboaliyahoo.com', 18192710007, 10, 9000, N'645932745041', CAST(N'04:30:11' AS Time), 4)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (27, N'Ahmed Helmy', N' Mohy el din abo el ezz', N'015557281919', N'Zakichanhotmail.com', 1992628100, 7, 9000, N'76325604276542', CAST(N'02:30:11' AS Time), 5)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (28, N'Emad Meteeb', N' Mossadak', N'0122775553', N'Mimoyahoo.com', 9191910929, 6, 6000, N'68053267841846', CAST(N'01:30:11' AS Time), 6)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (29, N'Abo Treka', N' Lazoghly', N'011119908', N' Tikaahotmail.com', 9191919182, 9, 12000, N'19830465719347586', CAST(N'12:30:11' AS Time), 7)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (30, N'taher Mohamed', N' Ahmed Oraby', N'0100282829', N'Tahermgmail.com', 838738290, 4, 5000, N'281927301739264', CAST(N'11:30:11' AS Time), 8)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (31, N'Ahmed Ramzy', N' Shagaret el dor', N'012288383', N'ramzyyahoo.com', 99182828, 8, 9500, N'91734589230127', CAST(N'06:30:11' AS Time), 9)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (32, N'Ahmed Dash', N' Street nine', N'0100818181', N'Excuemyfrenchhotmail.com', 919191823, 4, 8000, N'8192378629174018329', CAST(N'04:30:11' AS Time), 10)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (33, N'Mohamed Hany', N' Taha Hussein', N'0111122221', N'Hanyyahoo.com', 828910198, 6, 2500, N'29374560127835', CAST(N'09:30:11' AS Time), 11)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (34, N'Amir Eid', N' Om kalthoum', N'010090292', N'marbotbastek98yahoo.com', 992839819, 3, 1500, N'92834619982645', CAST(N'08:37:11' AS Time), 12)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (35, N'Mohamed Hamaki', N' Omar tosson', N'0108887532', N'wahdawahdayahoo.com', 776425890, 8, 2000, N'98643217899448', CAST(N'08:20:11' AS Time), 13)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (36, N'Kahraba', N' Heidar basha', N'0199228329', N'Kikoyahoo.com', 918181990, 3, 4500, N'29173821950638135', CAST(N'08:20:11' AS Time), 14)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (37, N'Khaled Anwar', N'Roxy', N'0100918192', N'Anwar56gmail.com', 9191828100, 6, 2000, N'19273916491639', CAST(N'08:15:11' AS Time), 15)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (38, N'Ahmed Malek', N' El korba', N'011182829108', N'hamadahotmail.com', 56381927919, 7, 1500, N'10918291730183', CAST(N'08:28:11' AS Time), 16)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (39, N'Zizo', N' Talaat Harb', N'010092929', N'Zizogmail.com', 981818828, 9, 4000, N'192730173012383', CAST(N'08:39:11' AS Time), 17)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (40, N'Shikabala', N' Port Saeid', N'0111282882', N'Shikogmail.com', 98837282913, 4, 3000, N'92182739210272', CAST(N'08:40:11' AS Time), 18)
INSERT [dbo].[tbl_Driver] ([D_ID], [D_name], [D_Address], [D_Phone_Number], [D_Email], [D_Ssn], [D_Experience], [D_Salary], [D_License], [D_Shift_Time], [V_ID]) VALUES (41, N'Chiko', N' Hegaz', N'0122670554', N'Shahirhotmail.com', 766686316799, 6, 2500, N'753389645437', CAST(N'08:46:11' AS Time), 19)
SET IDENTITY_INSERT [dbo].[tbl_Driver] OFF
SET IDENTITY_INSERT [dbo].[tbl_Ride] ON 

INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (1, N'Cairo', N'Giza', N'Maadi', CAST(N'14:30:00' AS Time))
INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (2, N'Alexandria', N'October', N'Smart Village ', CAST(N'12:15:00' AS Time))
INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (3, N'Giza', N'Cairo', N'El Rehab', CAST(N'11:00:00' AS Time))
INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (4, N'Cairo', N'Alexandria', N'Borg El Arab', CAST(N'08:45:00' AS Time))
INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (5, N'Cairo', N'Alexandria', N'El Alamein', CAST(N'16:20:00' AS Time))
INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (6, N'Cairo', N'Alexandria', N'Dahab', CAST(N'09:00:00' AS Time))
INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (7, N'Alexandria', N'Cairo', N'Masr El Gedida', CAST(N'13:30:00' AS Time))
INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (8, N'Giza', N'Cairo', N'Sheraton', CAST(N'17:45:00' AS Time))
INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (9, N'Cairo', N'Alexandria', N'Semouha', CAST(N'18:00:00' AS Time))
INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (10, N'Cairo', N'Giza', N'Hurghada', CAST(N'10:15:00' AS Time))
INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (11, N'Alexandria', N'Cairo', N'Zamalek', CAST(N'11:45:00' AS Time))
INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (12, N'Giza', N'Tagamoa', N'Downtown', CAST(N'08:30:00' AS Time))
INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (13, N'Cairo', N'Alexandria', N'Taba', CAST(N'14:00:00' AS Time))
INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (14, N'Cairo', N'Alexandria', N'Nuweiba', CAST(N'15:10:00' AS Time))
INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (15, N'Alexandria', N'Cairo', N'Fayoum', CAST(N'16:20:00' AS Time))
INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (16, N'Cairo', N'Giza', N'Suez', CAST(N'13:00:00' AS Time))
INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (17, N'Alexandria', N'Semouha', N'October', CAST(N'14:00:00' AS Time))
INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (18, N'Giza', N'Cairo', N'Maadi', CAST(N'12:30:00' AS Time))
INSERT [dbo].[tbl_Ride] ([R_ID], [R_Pickup], [R_Dropoff], [R_Destination], [R_Time]) VALUES (19, N'Cairo', N'Alexandria', N'West el Balad', CAST(N'15:45:00' AS Time))
SET IDENTITY_INSERT [dbo].[tbl_Ride] OFF
SET IDENTITY_INSERT [dbo].[tbl_Vehicles] ON 

INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (1, N'15678309321754', N'Toyota', N'1824NN')
INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (2, N'34851249846373', N'Hyundai', N'5021ALB')
INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (3, N'56923648123072', N'Ford', N'2084ASA')
INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (4, N'30974836282846', N'Toyota', N'4524C')
INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (5, N'24571292736453', N'Ford', N'2643SYD')
INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (6, N'34561927353742', N'Hyundai', N'1111RMY')
INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (7, N'59728263542635', N'Toyota', N'1113HAB')
INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (8, N'23786426920937', N'Ford', N'666OMR')
INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (9, N'67229975347124', N'Hyundai', N'2143WE')
INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (10, N'72639914238403', N'Toyota', N'873SLMA')
INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (11, N'1276368909367', N'Hyundai', N'235AMIR')
INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (12, N'5368264739986', N'Hyundai', N'6324AHI')
INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (13, N'6892735628635', N'Hyundai', N'4258AHI')
INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (14, N'38725482384937', N'Ford', N'2639Tim')
INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (15, N'91827355376435', N'Toyota', N'73535HI')
INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (16, N'83725623467219', N'Toyota', N'4444RED')
INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (17, N'389277466754344', N'Ford', N'5352AMI')
INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (18, N'924617640828476', N'Ford', N'2636EL')
INSERT [dbo].[tbl_Vehicles] ([V_ID], [V_License], [V_Brand], [V_PlateNumber]) VALUES (19, N'45203846977835', N'Toyota', N'4736BHA')
SET IDENTITY_INSERT [dbo].[tbl_Vehicles] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_Cust__5D1915F95A7984D1]    Script Date: 5/30/2023 2:24:11 PM ******/
ALTER TABLE [dbo].[tbl_Customer] ADD UNIQUE NONCLUSTERED 
(
	[C_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_Cust__A213D05428BD4104]    Script Date: 5/30/2023 2:24:11 PM ******/
ALTER TABLE [dbo].[tbl_Customer] ADD UNIQUE NONCLUSTERED 
(
	[C_Phone_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__tbl_Cust__FEE04F9C0D1C80B3]    Script Date: 5/30/2023 2:24:11 PM ******/
ALTER TABLE [dbo].[tbl_Customer] ADD UNIQUE NONCLUSTERED 
(
	[C_Ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_Driv__C52D58762CC95E14]    Script Date: 5/30/2023 2:24:11 PM ******/
ALTER TABLE [dbo].[tbl_Driver] ADD UNIQUE NONCLUSTERED 
(
	[D_Phone_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__tbl_Driv__C9F627E07A5AAFA5]    Script Date: 5/30/2023 2:24:11 PM ******/
ALTER TABLE [dbo].[tbl_Driver] ADD UNIQUE NONCLUSTERED 
(
	[D_Ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_Driv__FEB4BB3A05D5A4C6]    Script Date: 5/30/2023 2:24:11 PM ******/
ALTER TABLE [dbo].[tbl_Driver] ADD UNIQUE NONCLUSTERED 
(
	[D_Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tbl_Vehi__4F00882CEDB68890]    Script Date: 5/30/2023 2:24:11 PM ******/
ALTER TABLE [dbo].[tbl_Vehicles] ADD UNIQUE NONCLUSTERED 
(
	[V_PlateNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_Booking]  WITH CHECK ADD  CONSTRAINT [Fk_Booking_Customer] FOREIGN KEY([C_ID])
REFERENCES [dbo].[tbl_Customer] ([C_ID])
GO
ALTER TABLE [dbo].[tbl_Booking] CHECK CONSTRAINT [Fk_Booking_Customer]
GO
ALTER TABLE [dbo].[tbl_Booking]  WITH CHECK ADD  CONSTRAINT [Fk_Booking_Ride] FOREIGN KEY([R_ID])
REFERENCES [dbo].[tbl_Ride] ([R_ID])
GO
ALTER TABLE [dbo].[tbl_Booking] CHECK CONSTRAINT [Fk_Booking_Ride]
GO
ALTER TABLE [dbo].[tbl_Customer]  WITH CHECK ADD  CONSTRAINT [Fk_Ride] FOREIGN KEY([R_ID])
REFERENCES [dbo].[tbl_Ride] ([R_ID])
GO
ALTER TABLE [dbo].[tbl_Customer] CHECK CONSTRAINT [Fk_Ride]
GO
ALTER TABLE [dbo].[tbl_Driver]  WITH CHECK ADD  CONSTRAINT [Fk_Vehicles] FOREIGN KEY([V_ID])
REFERENCES [dbo].[tbl_Vehicles] ([V_ID])
GO
ALTER TABLE [dbo].[tbl_Driver] CHECK CONSTRAINT [Fk_Vehicles]
GO
USE [master]
GO
ALTER DATABASE [SWVL_DB] SET  READ_WRITE 
GO
