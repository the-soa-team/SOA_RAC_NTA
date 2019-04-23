USE [master]
GO
/****** Object:  Database [RentACar]    Script Date: 21.04.2019 18:54:26 ******/
CREATE DATABASE [RentACar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RentACar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER\MSSQL\DATA\RentACar.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'RentACar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLSERVER\MSSQL\DATA\RentACar_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RentACar] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RentACar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RentACar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RentACar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RentACar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RentACar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RentACar] SET ARITHABORT OFF 
GO
ALTER DATABASE [RentACar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RentACar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RentACar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RentACar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RentACar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RentACar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RentACar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RentACar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RentACar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RentACar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RentACar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RentACar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RentACar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RentACar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RentACar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RentACar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RentACar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RentACar] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RentACar] SET  MULTI_USER 
GO
ALTER DATABASE [RentACar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RentACar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RentACar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RentACar] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [RentACar] SET DELAYED_DURABILITY = DISABLED 
GO
USE [RentACar]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 21.04.2019 18:54:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[Brand] [nvarchar](50) NULL,
	[Model] [nvarchar](50) NULL,
	[CarLicenceAge] [int] NULL,
	[DriverType] [nvarchar](1) NULL,
	[CarDriverAge] [int] NULL,
	[DailyKm] [float] NULL,
	[CurrentKm] [float] NULL,
	[HasAirbag] [bit] NULL,
	[LuggageValume] [int] NULL,
	[NumSeats] [int] NULL,
	[RentPrice] [money] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Cars] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 21.04.2019 18:54:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[NumCars] [int] NULL,
	[Score] [int] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 21.04.2019 18:54:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[LicenceAge] [int] NULL,
	[DriverType] [nvarchar](1) NULL,
	[DriveAge] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[TelNum] [bigint] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 21.04.2019 18:54:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyID] [int] NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[TelNum] [bigint] NULL,
	[Role] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 21.04.2019 18:54:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[CarID] [int] NULL,
	[CustomerID] [int] NULL,
	[BeginDate] [date] NULL,
	[DeliveryDate] [date] NULL,
	[CurrentKm] [float] NULL,
	[ReturnKm] [float] NULL,
	[RentPrice] [money] NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([CarID], [CompanyID], [Brand], [Model], [CarLicenceAge], [DriverType], [CarDriverAge], [DailyKm], [CurrentKm], [HasAirbag], [LuggageValume], [NumSeats], [RentPrice], [Status]) VALUES (1, 1, N'Honda', N'Cıvıc', 3, N'b', 18, 150, 158.321, 1, 500, 4, 20.0000, 1)
INSERT [dbo].[Cars] ([CarID], [CompanyID], [Brand], [Model], [CarLicenceAge], [DriverType], [CarDriverAge], [DailyKm], [CurrentKm], [HasAirbag], [LuggageValume], [NumSeats], [RentPrice], [Status]) VALUES (2, 1, N'Hyundai', N'Accent', 1, N'b', 18, 100, 210, 1, 350, 4, 18.0000, 1)
INSERT [dbo].[Cars] ([CarID], [CompanyID], [Brand], [Model], [CarLicenceAge], [DriverType], [CarDriverAge], [DailyKm], [CurrentKm], [HasAirbag], [LuggageValume], [NumSeats], [RentPrice], [Status]) VALUES (3, 1, N'Dogan', N'slx', 0, N'b', 18, 90, 800, 0, 200, 4, 5.0000, 1)
INSERT [dbo].[Cars] ([CarID], [CompanyID], [Brand], [Model], [CarLicenceAge], [DriverType], [CarDriverAge], [DailyKm], [CurrentKm], [HasAirbag], [LuggageValume], [NumSeats], [RentPrice], [Status]) VALUES (4, 1, N'Honda', N'crv', 0, N'b', 18, 100, 254.365, 1, 500, 4, 25.0000, 1)
INSERT [dbo].[Cars] ([CarID], [CompanyID], [Brand], [Model], [CarLicenceAge], [DriverType], [CarDriverAge], [DailyKm], [CurrentKm], [HasAirbag], [LuggageValume], [NumSeats], [RentPrice], [Status]) VALUES (5, 1, N'Man', N'tgx', 5, N'e', 23, 120, 578.365, 1, 0, 2, 30.0000, 1)
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([CompanyID], [Name], [City], [Address], [NumCars], [Score]) VALUES (1, N'Acar', N'İzmir', N'Akadlar Caddesi Narlıdere İzmir', 5, 80)
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [UserName], [Password], [LicenceAge], [DriverType], [DriveAge], [Email], [TelNum]) VALUES (1, N'Ezran', N'Bayantemur', N'Ezran', N'1234Ezran', 30, N'b', 5, N'ezran@gmail.com', 5394561254)
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [UserName], [Password], [LicenceAge], [DriverType], [DriveAge], [Email], [TelNum]) VALUES (2, N'Ali', N'Veli', N'Ali', N'Ali1234', 19, N'b', 1, N'Ali@gmail.com', 5394562541)
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [CompanyID], [FirstName], [LastName], [UserName], [Password], [Address], [TelNum], [Role], [Status]) VALUES (1, 1, N'Hulusi', N'Önel', N'Hulusi', N'1234hulusi', N'14 sokak no:12 Gazirmir İzmir', 5391234567, N'Admin', 1)
INSERT [dbo].[Employees] ([EmployeeID], [CompanyID], [FirstName], [LastName], [UserName], [Password], [Address], [TelNum], [Role], [Status]) VALUES (2, 1, N'Utku', N'Yılmaz', N'Utku', N'1234Utku', N'165 sokak no:3 Çinçin Ankara', 5391236985, N'Admin', 1)
INSERT [dbo].[Employees] ([EmployeeID], [CompanyID], [FirstName], [LastName], [UserName], [Password], [Address], [TelNum], [Role], [Status]) VALUES (3, 1, N'Çağdaş', N'Bacanak', N'Çağdaş', N'1234Cagdas', N'1 sokak no:7 Mamak Ankara', 5371234785, N'Employee', 1)
INSERT [dbo].[Employees] ([EmployeeID], [CompanyID], [FirstName], [LastName], [UserName], [Password], [Address], [TelNum], [Role], [Status]) VALUES (4, 1, N'Aydın', N'Bulut', N'Aydın', N'1234Aydın', N'2 sokak no:2 Konak İzmir', 5394562310, N'Employee', 1)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([TransactionID], [CarID], [CustomerID], [BeginDate], [DeliveryDate], [CurrentKm], [ReturnKm], [RentPrice]) VALUES (1, 4, 1, CAST(N'2018-03-10' AS Date), CAST(N'2018-03-15' AS Date), 200.023, 254.365, 125.0000)
SET IDENTITY_INSERT [dbo].[Transactions] OFF
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD  CONSTRAINT [FK_Cars_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Cars] CHECK CONSTRAINT [FK_Cars_Company]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Company] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Company]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Cars] FOREIGN KEY([CarID])
REFERENCES [dbo].[Cars] ([CarID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Cars]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Customers]
GO
USE [master]
GO
ALTER DATABASE [RentACar] SET  READ_WRITE 
GO
