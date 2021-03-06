USE [master]
GO
/****** Object:  Database [AkashAdhikari]    Script Date: 7/9/2022 6:36:08 PM ******/
CREATE DATABASE [AkashAdhikari]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AkashAdhikari', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AkashAdhikari.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AkashAdhikari_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AkashAdhikari_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AkashAdhikari] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AkashAdhikari].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AkashAdhikari] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AkashAdhikari] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AkashAdhikari] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AkashAdhikari] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AkashAdhikari] SET ARITHABORT OFF 
GO
ALTER DATABASE [AkashAdhikari] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AkashAdhikari] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AkashAdhikari] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AkashAdhikari] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AkashAdhikari] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AkashAdhikari] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AkashAdhikari] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AkashAdhikari] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AkashAdhikari] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AkashAdhikari] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AkashAdhikari] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AkashAdhikari] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AkashAdhikari] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AkashAdhikari] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AkashAdhikari] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AkashAdhikari] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AkashAdhikari] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AkashAdhikari] SET RECOVERY FULL 
GO
ALTER DATABASE [AkashAdhikari] SET  MULTI_USER 
GO
ALTER DATABASE [AkashAdhikari] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AkashAdhikari] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AkashAdhikari] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AkashAdhikari] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AkashAdhikari] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AkashAdhikari] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AkashAdhikari', N'ON'
GO
ALTER DATABASE [AkashAdhikari] SET QUERY_STORE = OFF
GO
USE [AkashAdhikari]
GO
/****** Object:  User [internApp]    Script Date: 7/9/2022 6:36:08 PM ******/
CREATE USER [internApp] FOR LOGIN [internApp] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [intern2021]    Script Date: 7/9/2022 6:36:08 PM ******/
CREATE USER [intern2021] FOR LOGIN [intern2021] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [intern]    Script Date: 7/9/2022 6:36:08 PM ******/
CREATE USER [intern] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Gender] [varchar](10) NULL,
	[CustomerAddress] [varchar](200) NULL,
	[CustomerEmail] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](15) NULL,
	[InsertPersonId] [int] NULL,
	[InsertDate] [smalldatetime] NULL,
	[FirstName] [varchar](100) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CustomerEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[customerId] [int] NULL,
	[InvoiceTotal] [money] NOT NULL,
	[InsertPersonId] [int] NULL,
	[InsertDate] [smalldatetime] NULL,
	[ProductDetails] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesTransaction]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesTransaction](
	[TranscationId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[SalesDate] [datetime] NULL,
	[InvoiceId] [int] NULL,
	[InsertPersonId] [int] NULL,
	[InsertDate] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TranscationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[TfInvoiceSalesDetails]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[TfInvoiceSalesDetails]
(	
@CustomerId int
)
RETURNS TABLE 
AS
RETURN 
(
select i.InvoiceId,
S.CustomerId, 
Concat(c.FirstName,' ',c.MiddleName,'',c.LastName)FullName,
I.InvoiceTotal 
from dbo.SalesTransaction 

as s
left join Invoice as I on s.InvoiceId =I.InvoiceId
inner join Customer as c on c.CustomerId =i.customerId
where I.customerId =@CustomerId
group by s.customerId,i.InvoiceId,i.InvoiceTotal,c.FirstName,
c.LastName,c.MiddleName

)
GO
/****** Object:  Table [dbo].[Person]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](100) NOT NULL,
	[InsertDate] [smalldatetime] NULL,
	[SSN] [int] NULL,
	[UserPersonId] [int] NULL,
	[Gender] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskTemplateHistory]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskTemplateHistory](
	[TaskTemplateId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[TaskName] [varchar](100) NOT NULL,
	[TaskType] [varchar](100) NOT NULL,
	[HourlyBudget] [money] NOT NULL,
	[TimeStart] [datetime2](2) NOT NULL,
	[TimeEnd] [datetime2](2) NOT NULL,
	[UserPersonId] [int] NULL,
	[InsertDate] [smalldatetime] NULL,
	[Entity] [varchar](25) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ix_TaskTemplateHistory]    Script Date: 7/9/2022 6:36:08 PM ******/
CREATE CLUSTERED INDEX [ix_TaskTemplateHistory] ON [dbo].[TaskTemplateHistory]
(
	[TimeEnd] ASC,
	[TimeStart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskTemplate]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskTemplate](
	[TaskTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[Status] [bit] NOT NULL,
	[TaskName] [varchar](100) NOT NULL,
	[TaskType] [varchar](100) NOT NULL,
	[HourlyBudget] [money] NOT NULL,
	[TimeStart] [datetime2](2) GENERATED ALWAYS AS ROW START NOT NULL,
	[TimeEnd] [datetime2](2) GENERATED ALWAYS AS ROW END NOT NULL,
	[UserPersonId] [int] NULL,
	[InsertDate] [smalldatetime] NULL,
	[Entity] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskTemplateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([TimeStart], [TimeEnd])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [dbo].[TaskTemplateHistory] )
)
GO
/****** Object:  Table [dbo].[TaskTableHistory]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskTableHistory](
	[TaskId] [int] NOT NULL,
	[TaskTemplateId] [int] NULL,
	[InsertDate] [datetime2](2) NOT NULL,
	[TimeEnd] [datetime2](2) NOT NULL,
	[UserPersonId] [int] NULL,
	[ExpaireDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [ix_TaskTableHistory]    Script Date: 7/9/2022 6:36:08 PM ******/
CREATE CLUSTERED INDEX [ix_TaskTableHistory] ON [dbo].[TaskTableHistory]
(
	[TimeEnd] ASC,
	[InsertDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[TaskTemplateId] [int] NULL,
	[InsertDate] [datetime2](2) GENERATED ALWAYS AS ROW START NOT NULL,
	[TimeEnd] [datetime2](2) GENERATED ALWAYS AS ROW END NOT NULL,
	[UserPersonId] [int] NULL,
	[ExpaireDate] [smalldatetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([InsertDate], [TimeEnd])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [dbo].[TaskTableHistory] )
)
GO
/****** Object:  Table [dbo].[PersonTask]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonTask](
	[PersonTaskId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[TaskId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NULL,
	[UserPersonId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonTaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[FnAssignedTaskSel]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[FnAssignedTaskSel]
(	
	-- Add the parameters for the function here
@TaskId  int
)
RETURNS TABLE 
AS
RETURN 
(
select concat(p.FirstName,' ',p.MiddleName,' ',p.LastName)as FullName,t.TaskId,tt.TaskName,tt.TaskType  from Person as p 
inner join PersonTask as pt on pt.PersonId = p.PersonId
inner join Task as t on t.TaskId= pt.TaskId
inner join TaskTemplate as tt on tt.TaskTemplateId =t.TaskTemplateId
where  t.TaskId =@TaskId
)
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NULL,
	[AvailableQuantity] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[InsertPersonId] [int] NULL,
	[InsertDate] [smalldatetime] NULL,
	[ExpireDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[FunctionProductName]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  FUNCTION [dbo].[FunctionProductName]
(	
@productId int
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
select ProductName from Product As P
where p.ProductId =@productId
)
GO
/****** Object:  Table [dbo].[Address]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[Address1] [varchar](200) NULL,
	[Address2] [varchar](200) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](100) NULL,
	[ZipCode] [varchar](20) NULL,
	[InserteDate] [smalldatetime] NULL,
	[UserPersonId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CheckIn] [smalldatetime] NULL,
	[CheckOut] [smalldatetime] NULL,
	[UserPersonId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[BranchId] [int] IDENTITY(1,1) NOT NULL,
	[HotelId] [int] NULL,
	[Branch] [varchar](50) NULL,
	[Location] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationId] [int] NULL,
	[Status] [bit] NULL,
	[UserPersonId] [int] NULL,
	[InsertDate] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](200) NULL,
	[website] [varchar](1000) NULL,
	[Mobile] [varchar](20) NULL,
	[Phone] [varchar](20) NULL,
	[UserPersonId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactInformation]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactInformation](
	[ContactInformationId] [int] IDENTITY(1,1) NOT NULL,
	[Website] [nvarchar](1000) NULL,
	[Phone] [varchar](25) NULL,
	[InsertedDate] [smalldatetime] NULL,
	[UserPersonId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactInformationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[PersonId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[InsertDate] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[HotelId] [int] IDENTITY(1,1) NOT NULL,
	[HotelName] [varchar](50) NOT NULL,
	[VatNumber] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HotelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewCustomer]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewCustomer](
	[NewCustomerId] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationId] [int] NULL,
	[Department] [varchar](100) NULL,
	[status] [bit] NULL,
	[UserPersonId] [int] NULL,
	[InsertDate] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NewCustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfficeStaff]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficeStaff](
	[PersonId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[InsertedDate] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfficeStaffSetting]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficeStaffSetting](
	[PersonId] [int] NOT NULL,
	[StatusFilter] [varchar](25) NOT NULL,
	[SearchFilter] [varchar](25) NOT NULL,
	[InsertedDate] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[OrganizationId] [int] IDENTITY(1,1) NOT NULL,
	[Organization] [varchar](200) NULL,
	[UserPersonId] [int] NULL,
	[InsertDate] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrganizationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganizationAddress]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganizationAddress](
	[OrganizationAddressId] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationId] [int] NULL,
	[AddressId] [int] NULL,
	[UserPersonId] [int] NULL,
	[InsertDate] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrganizationAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganizationContact]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganizationContact](
	[OrganizationContactId] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationId] [int] NULL,
	[ContactId] [int] NULL,
	[UserPersonId] [int] NULL,
	[InsertDate] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrganizationContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganizationContactInformation]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganizationContactInformation](
	[OrganizationContactId] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationId] [int] NULL,
	[ContactInformationId] [int] NULL,
	[UserPersonId] [int] NULL,
	[InsertDate] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrganizationContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganizationTask]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganizationTask](
	[OrganizationTaskId] [int] IDENTITY(1,1) NOT NULL,
	[OrganizationId] [int] NOT NULL,
	[TaskId] [int] NOT NULL,
	[InsertDate] [smalldatetime] NULL,
	[UserPersonId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrganizationTaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonAddress]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonAddress](
	[PersonAddressId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NULL,
	[AddressId] [int] NULL,
	[UserPersonId] [int] NULL,
	[InsertDate] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonContact]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonContact](
	[PersonContactId] [int] IDENTITY(1,1) NOT NULL,
	[ContactId] [int] NULL,
	[PersonId] [int] NULL,
	[UserPersonId] [int] NULL,
	[InsertDate] [smalldatetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonContactId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[RoomType] [varchar](100) NULL,
	[RoomCharge] [money] NOT NULL,
	[Available] [bit] NULL,
	[BranchId] [int] NULL,
	[UserPersonId] [int] NOT NULL,
	[Insert Date ] [smalldatetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Task1]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Task1](
	[Task1Id] [int] IDENTITY(1,1) NOT NULL,
	[TaskTemplate1Id] [int] NULL,
	[InsertDate] [smalldatetime] NULL,
	[ExpaireDate] [smalldatetime] NULL,
	[UserPersonId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Task1Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskTemplate1]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskTemplate1](
	[TaskTemplate1Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [bit] NOT NULL,
	[TaskName] [varchar](200) NULL,
	[TaskType] [varchar](50) NULL,
	[Entity] [varchar](25) NOT NULL,
	[InsertDate] [smalldatetime] NULL,
	[UserPersonId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskTemplate1Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInformation]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInformation](
	[UserInformationId] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[UserName] [varchar](250) NULL,
	[Password] [varchar](200) NULL,
	[UserPersonId] [int] NULL,
	[InsertDate] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserInformationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address] ADD  DEFAULT (getdate()) FOR [InserteDate]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT (getdate()) FOR [CheckIn]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT ((1)) FOR [UserPersonId]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[Company] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[ContactInformation] ADD  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT ((1)) FOR [InsertPersonId]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Employee] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[Invoice] ADD  DEFAULT ((1)) FOR [InsertPersonId]
GO
ALTER TABLE [dbo].[Invoice] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[NewCustomer] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[OfficeStaff] ADD  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[OfficeStaffSetting] ADD  DEFAULT ('all') FOR [StatusFilter]
GO
ALTER TABLE [dbo].[OfficeStaffSetting] ADD  DEFAULT ('details') FOR [SearchFilter]
GO
ALTER TABLE [dbo].[OfficeStaffSetting] ADD  DEFAULT (getdate()) FOR [InsertedDate]
GO
ALTER TABLE [dbo].[Organization] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[OrganizationAddress] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[OrganizationContact] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[OrganizationContactInformation] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[OrganizationTask] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[Person] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[PersonAddress] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[PersonContact] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[PersonTask] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT ((1)) FOR [InsertPersonId]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[Room] ADD  DEFAULT ((1)) FOR [UserPersonId]
GO
ALTER TABLE [dbo].[Room] ADD  DEFAULT (getdate()) FOR [Insert Date ]
GO
ALTER TABLE [dbo].[SalesTransaction] ADD  DEFAULT (getdate()) FOR [SalesDate]
GO
ALTER TABLE [dbo].[SalesTransaction] ADD  DEFAULT ((1)) FOR [InsertPersonId]
GO
ALTER TABLE [dbo].[SalesTransaction] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[Task] ADD  DEFAULT (dateadd(day,(7),getdate())) FOR [ExpaireDate]
GO
ALTER TABLE [dbo].[Task1] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[Task1] ADD  DEFAULT (dateadd(day,(7),getdate())) FOR [ExpaireDate]
GO
ALTER TABLE [dbo].[TaskTemplate] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[TaskTemplate] ADD  DEFAULT ((0)) FOR [HourlyBudget]
GO
ALTER TABLE [dbo].[TaskTemplate] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[TaskTemplate] ADD  DEFAULT ('Person') FOR [Entity]
GO
ALTER TABLE [dbo].[TaskTemplate1] ADD  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[TaskTemplate1] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[UserInformation] ADD  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([HotelId])
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FkC_Invoice] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FkC_Invoice]
GO
ALTER TABLE [dbo].[NewCustomer]  WITH CHECK ADD  CONSTRAINT [FK_NewCustomer] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[NewCustomer] CHECK CONSTRAINT [FK_NewCustomer]
GO
ALTER TABLE [dbo].[OfficeStaff]  WITH CHECK ADD  CONSTRAINT [FK_officestaff] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[OfficeStaff] CHECK CONSTRAINT [FK_officestaff]
GO
ALTER TABLE [dbo].[OfficeStaffSetting]  WITH CHECK ADD  CONSTRAINT [FK_OfficeStaffSettings] FOREIGN KEY([PersonId])
REFERENCES [dbo].[OfficeStaff] ([PersonId])
GO
ALTER TABLE [dbo].[OfficeStaffSetting] CHECK CONSTRAINT [FK_OfficeStaffSettings]
GO
ALTER TABLE [dbo].[OrganizationAddress]  WITH CHECK ADD  CONSTRAINT [FK1_OrganizationAddress] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationAddress] CHECK CONSTRAINT [FK1_OrganizationAddress]
GO
ALTER TABLE [dbo].[OrganizationAddress]  WITH CHECK ADD  CONSTRAINT [FK2_OrganizationAddress] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[OrganizationAddress] CHECK CONSTRAINT [FK2_OrganizationAddress]
GO
ALTER TABLE [dbo].[OrganizationContact]  WITH CHECK ADD  CONSTRAINT [FK1_OrganizationContact] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationContact] CHECK CONSTRAINT [FK1_OrganizationContact]
GO
ALTER TABLE [dbo].[OrganizationContact]  WITH CHECK ADD  CONSTRAINT [FK2_OrganizationContact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([ContactId])
GO
ALTER TABLE [dbo].[OrganizationContact] CHECK CONSTRAINT [FK2_OrganizationContact]
GO
ALTER TABLE [dbo].[OrganizationContactInformation]  WITH CHECK ADD  CONSTRAINT [FKCIid_OrganizationContactInformation] FOREIGN KEY([ContactInformationId])
REFERENCES [dbo].[ContactInformation] ([ContactInformationId])
GO
ALTER TABLE [dbo].[OrganizationContactInformation] CHECK CONSTRAINT [FKCIid_OrganizationContactInformation]
GO
ALTER TABLE [dbo].[OrganizationContactInformation]  WITH CHECK ADD  CONSTRAINT [FKOid_OrganizationContactInformation] FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationContactInformation] CHECK CONSTRAINT [FKOid_OrganizationContactInformation]
GO
ALTER TABLE [dbo].[OrganizationTask]  WITH CHECK ADD FOREIGN KEY([OrganizationId])
REFERENCES [dbo].[Organization] ([OrganizationId])
GO
ALTER TABLE [dbo].[OrganizationTask]  WITH CHECK ADD FOREIGN KEY([TaskId])
REFERENCES [dbo].[Task] ([TaskId])
GO
ALTER TABLE [dbo].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [FkAddress_PersonAddress] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[PersonAddress] CHECK CONSTRAINT [FkAddress_PersonAddress]
GO
ALTER TABLE [dbo].[PersonAddress]  WITH CHECK ADD  CONSTRAINT [FkPerson_PersonAddress] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonAddress] CHECK CONSTRAINT [FkPerson_PersonAddress]
GO
ALTER TABLE [dbo].[PersonContact]  WITH CHECK ADD  CONSTRAINT [FkContact_PersonContact] FOREIGN KEY([ContactId])
REFERENCES [dbo].[Contact] ([ContactId])
GO
ALTER TABLE [dbo].[PersonContact] CHECK CONSTRAINT [FkContact_PersonContact]
GO
ALTER TABLE [dbo].[PersonContact]  WITH CHECK ADD  CONSTRAINT [FkPerson_PersonContact] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonContact] CHECK CONSTRAINT [FkPerson_PersonContact]
GO
ALTER TABLE [dbo].[PersonTask]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[PersonTask]  WITH CHECK ADD FOREIGN KEY([TaskId])
REFERENCES [dbo].[Task] ([TaskId])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([BranchId])
REFERENCES [dbo].[Branch] ([BranchId])
GO
ALTER TABLE [dbo].[SalesTransaction]  WITH CHECK ADD FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([InvoiceId])
GO
ALTER TABLE [dbo].[SalesTransaction]  WITH CHECK ADD FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([InvoiceId])
GO
ALTER TABLE [dbo].[SalesTransaction]  WITH CHECK ADD  CONSTRAINT [FkC_sales] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[SalesTransaction] CHECK CONSTRAINT [FkC_sales]
GO
ALTER TABLE [dbo].[SalesTransaction]  WITH CHECK ADD  CONSTRAINT [FkP_sales] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[SalesTransaction] CHECK CONSTRAINT [FkP_sales]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD FOREIGN KEY([TaskTemplateId])
REFERENCES [dbo].[TaskTemplate] ([TaskTemplateId])
GO
ALTER TABLE [dbo].[Task1]  WITH CHECK ADD FOREIGN KEY([TaskTemplate1Id])
REFERENCES [dbo].[TaskTemplate1] ([TaskTemplate1Id])
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[UserInformation]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
/****** Object:  StoredProcedure [dbo].[SpAddressDel]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpAddressDel]
@AddressId nvarchar(20),
@UserPersonId int

AS
BEGIN TRANSACTION 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
 -- Insert statements for procedure here
		
		Delete from dbo.[Address] where 
		AddressId =@AddressId
		and
		@UserPersonId is not null


			COMMIT TRANSACTION;
		END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION;
	END CATCH
 --exec dbo.SpPersonNameDel @personId ='1'
	
	


GO
/****** Object:  StoredProcedure [dbo].[SpAddressIns]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Akash adhikari
-- Create date: 2022-05-23
-- Description:	Sp to insert PersonAdderss Details
-- =============================================
CREATE PROCEDURE	[dbo].[SpAddressIns]
@json varchar (max) OUTPUT

AS
BEGIN TRY
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRANSACTION
	
			CREATE TABLE #TEMP (
								Id int identity(1,1),
								TempAddressId int
							)
		CREATE table #json(
								id int identity(1,1),
								personId int,
								addressId int,
								organizationId int,
								newCustomerId int,
								companyId int,
								ssn varchar(25),
										mobile varchar(25),
										email varchar(200),
										[website] varchar(1000),
										[phone] varchar(20),
										[address1] [varchar](200) ,
										[address2] [varchar](200) ,
										[city] [varchar](50) ,
										[state] [varchar](100) ,
										[zipCode] [varchar](20) ,
										userName varchar(200),
										[password] varchar(200),
										[userPersonId] int					
									)
			INSERT INTO #json(	
								
								personId ,
								organizationId,
								newCustomerId,
								companyId,
								ssn,
										mobile,
										email,
										[website] ,
										[phone] ,
										[address1]  ,
										[address2] ,
										[city] ,
										[state]  ,
										[zipCode] ,
										userName,
										[password],
										[userPersonId] 
								
								)
			SELECT *  FROM OPENJSON (@JSON)
			WITH(					
								personId int,
								organizationId int,
								newCustomerId int,
								companyId int,
								ssn varchar(25),
										mobile varchar(25),
										email varchar(200),
										[website] varchar(1000),
										[phone] varchar(20),
										[address1] [varchar](200) ,
										[address2] [varchar](200) ,
										[city] [varchar](50) ,
										[state] [varchar](100) ,
										[zipCode] [varchar](20) ,
										userName varchar(200),
										[password]  varchar(200),
										[userPersonId] int

				) AS jo
				
			INSERT INTO dbo.[Address](Address1,Address2,City,[State],ZipCode,UserPersonId)
							OUTPUT
								inserted.AddressId
							INTO #TEMP(TempAddressId)
			SELECT jo.address1 ,jo.address2,jo.city,jo.[state],jo.zipCode,jo.userPersonId FROM #json as jo
		left join dbo.Person as p on p.SSN =jo.ssn
				left join dbo.UserInformation as ui on ui.UserName =jo.userName
				where P.PersonId is null and ui.UserName is null

				UPDATE  J SET J.addressId = T.TempAddressId FROM #json as j
				INNER JOIN #TEMP AS  T ON T.Id =J.id
			

				SELECT @Json = ( SELECT
									
									t.personId,
										t.addressId,
										t.organizationId,
										t.newCustomerId,
										t.companyId,
										t.ssn,
										t.email,
										t.mobile,
										t.[website] ,
										t.[phone] ,
										t.[address1]  ,
										t.[address2]  ,
										t.[city] ,
										t.[state]  ,
										t.[zipCode]  ,
										t.userName,
										t.[password],
										t.[userPersonId] 	
								FROM #json AS t
								FOR JSON AUTO
								)
						select @json

			

			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
			IF @@TRANCOUNT >0
			THROW
		END CATCH

GO
/****** Object:  StoredProcedure [dbo].[SpAuthenticationDetailsDel]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpAuthenticationDetailsDel]
@UserId nvarchar(20),
@UserPersonId int

AS
BEGIN TRY 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRANSACTION
 -- Insert statements for procedure here
		
		Delete from dbo.[AuthenticationDetails] where 
		AuthenticationId =@UserId
		and InsertPersonId =@UserPersonId


			COMMIT TRANSACTION;
		END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION;
	END CATCH
 --exec dbo.SpPersonNameDel @personId ='1'
	
	


GO
/****** Object:  StoredProcedure [dbo].[SpBookingDel]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[SpBookingDel](@Json NVARCHAR(MAX) OUTPUT)      
AS      
BEGIN      
    DECLARE @bookingId INT = (SELECT OJ.bookingId  FROM OPENJSON(@Json)      
 WITH(      
  bookingId INT      
 ) AS oj)      
      
      
 CREATE TABLE #temp(bookingId INT)      
    
 DELETE  FROM dbo.Booking   
 OUTPUT DELETED.BookingId INTO #temp(bookingId)      
 WHERE BookingId=@bookingId      
 SELECT @Json=(SELECT * FROM #temp t FOR JSON PATH)       
      
      
END 
GO
/****** Object:  StoredProcedure [dbo].[SpBookingIns]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create     PROCEDURE [dbo].[SpBookingIns](  
    @Json NVARCHAR(MAX)	OUT)  
    AS   
    BEGIN   
     SET NOCOUNT ON;  
     BEGIN TRY  
      BEGIN TRANSACTION;  
       CREATE TABLE #Temp
				(
					TempId INT PRIMARY KEY IDENTITY(1,1),
					RoomId INT,
					CustomerId INT,
					CheckOut SMALLDATETIME
					
				)
		INSERT INTO #Temp(RoomId,CustomerId,CheckOut)
		SELECT oj.RoomId,oj.CustomerId,oj.CheckOut
		FROM OPENJSON(@Json)
		WITH(
		roomId INT,
		customerId INT,
		checkOut SMALLDATETIME


		)AS oj
		CREATE TABLE #Temp1(Temp1Id INT PRIMARY KEY IDENTITY(1,1),BookingId INT)
		INSERT INTO dbo.Booking(RoomId,CustomerId,CheckOut)
		OUTPUT inserted.BookingId INTO #Temp1(BookingId)
		SELECT t.
		RoomId,t.CustomerId,t.CheckOut FROM #Temp t

		SELECT @Json=(Select t1.BookingId, t.RoomId,t.CustomerId ,t.CheckOut FROM #Temp t
		INNER JOIN #Temp1 t1  ON t.TempId=t1.Temp1Id  FOR JSON PATH, INCLUDE_NULL_VALUES)
        COMMIT TRANSACTION  
        
     END TRY  
     BEGIN CATCH  
      IF @@TRANCOUNT>1  
      ROLLBACK TRANSACTION;  
     END CATCH  
    END  
GO
/****** Object:  StoredProcedure [dbo].[SpBookingSel]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      PROCEDURE [dbo].[SpBookingSel]  (  
@Json NVARCHAR (MAX) )  
        
    AS     
    BEGIN     
     SET NOCOUNT ON;    
     BEGIN TRY    
      BEGIN TRANSACTION;    
       SELECT (SELECT  * FROM dbo.Booking b 
       FOR JSON PATH  ) AS [Json]  
        COMMIT TRANSACTION    
          
     END TRY    
     BEGIN CATCH    
      IF @@TRANCOUNT>1    
      ROLLBACK TRANSACTION;    
     END CATCH    
    END
GO
/****** Object:  StoredProcedure [dbo].[SpBookingUpd]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[SpBookingUpd](@Json NVARCHAR(MAX) OUTPUT)  
AS  
BEGIN  
    DECLARE @bookingId INT
	DECLARE @roomId INT
	DECLARE @customerId INT
	DECLARE @checkOut SMALLDATETIME
	
	SELECT @bookingId=oj.bookingId,
			@roomId=oj.roomId,
			@customerId=oj.customerId, 
			@checkOut=oj.checkOut
			FROM OPENJSON(@Json)
			WITH(
					bookingId INT,
					roomId INT,
					customerId INT,
					checkOut SMALLDATETIME

					

				) AS oj 
	
	
  
 CREATE TABLE #temp(bookingId INT)  
 Update   Booking
  Set RoomId=@roomId,
 CustomerId=@customerId,
 CheckOut=@checkOut
 
 OUTPUT inserted.BookingId INTO #temp(bookinId)  
 WHERE BookingId=@BookingId  
SELECT @Json=(SELECT r.BookingId ,  
                                r.RoomId ,  
								r.CustomerId,
								r.CheckIn,
								r.CheckOut
								
                                FROM dbo.Booking b  INNER JOIN #temp t ON b.BookingId = t.bookingId FOR JSON PATH) 
   
 
  
  
END  
GO
/****** Object:  StoredProcedure [dbo].[SpBranchDel]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [dbo].[SpBranchDel](@Json NVARCHAR(MAX) OUTPUT)    
AS    
BEGIN    
    DECLARE @branchId INT = (SELECT OJ.branchId  FROM OPENJSON(@Json)    
 WITH(    
  branchId INT    
 ) AS oj)    
    
    
 CREATE TABLE #temp(branchId INT)    
 DELETE  FROM dbo.Branch    
 OUTPUT DELETED.BranchId INTO #temp(branchId)    
 WHERE BranchId=@branchId    
 SELECT @Json=(SELECT * FROM #temp t FOR JSON PATH)     
    
    
END 
GO
/****** Object:  StoredProcedure [dbo].[SpBranchIns]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[SpBranchIns](  
    @Json NVARCHAR(MAX)	OUT)  
    AS   
    BEGIN   
     SET NOCOUNT ON;  
     BEGIN TRY  
      BEGIN TRANSACTION;  
       CREATE TABLE #Temp
				(
					TempId INT PRIMARY KEY IDENTITY(1,1),
					Branch VARCHAR(100),
					HotelId INT,
					[Location] VARCHAR(100)
				)
		INSERT INTO #Temp(Branch,HotelId,[Location])
		SELECT oj.Branch,oj.HotelId,oj.[Location]
		FROM OPENJSON(@Json)
		WITH(
		branch VARCHAR(100),
		hotelId INT,
		[location] VARCHAR(100))AS oj
		CREATE TABLE #Temp1(Temp1Id INT PRIMARY KEY IDENTITY(1,1),BranchId INT)
		INSERT INTO dbo.Branch(Branch,HotelId,[Location])
		OUTPUT inserted.BranchId INTO #Temp1(BranchId)
		SELECT t.Branch,t.HotelId,t.[Location] FROM #Temp t

		SELECT @Json=(Select t1.BranchId, t.Branch,t.HotelId ,t.[Location] FROM #Temp t
		INNER JOIN #Temp1 t1  ON t.TempId=t1.Temp1Id  FOR JSON PATH, INCLUDE_NULL_VALUES)
        COMMIT TRANSACTION  
        
     END TRY  
     BEGIN CATCH  
      IF @@TRANCOUNT>1  
      ROLLBACK TRANSACTION;  
     END CATCH  
    END  
GO
/****** Object:  StoredProcedure [dbo].[SpBranchSel]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      PROCEDURE [dbo].[SpBranchSel]  (  
@Json NVARCHAR (MAX) )  
        
    AS     
    BEGIN     
     SET NOCOUNT ON;    
     BEGIN TRY    
      BEGIN TRANSACTION;    
       SELECT (SELECT  * FROM dbo.Branch    
       FOR JSON PATH  ) AS [Json]  
        COMMIT TRANSACTION    
          
     END TRY    
     BEGIN CATCH    
      IF @@TRANCOUNT>1    
      ROLLBACK TRANSACTION;    
     END CATCH    
    END
GO
/****** Object:  StoredProcedure [dbo].[SpBranchUpd]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[SpBranchUpd](@Json NVARCHAR(MAX) OUTPUT)  
AS  
BEGIN  
    DECLARE @branchId INT
	DECLARE @branch VARCHAR(100)
	DECLARE @hotelId Int
	DECLARE @location VARCHAR(100)
	SELECT @branchId=oj.branchId,
			@branch=oj.branch,
			@hotelId=oj.hotelId, 
			@location=oj.[location]
			FROM OPENJSON(@Json)
			WITH(
					branchId INT,
					branch VARCHAR(100),
					hotelId INT,
					[location] VARCHAR(100)

				) AS oj 
	
	
  
 CREATE TABLE #temp(branchId INT)  
 Update   Branch
  Set Branch=@branch,
 HotelId=@hotelId,
 [Location]=@location
 OUTPUT inserted.BranchId INTO #temp(branchId)  
 WHERE BranchId=@branchId  
SELECT @Json=(SELECT b.BranchId ,  
                                b.Branch ,  
                                b.HotelId,
								b.[Location] FROM dbo.Branch b INNER JOIN #temp t ON b.BranchId = t.branchId FOR JSON PATH) 
   
 
  
  
END  
GO
/****** Object:  StoredProcedure [dbo].[SpCalendarSel]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpCalendarSel]
@StartDate date,
@EndDate date
AS
BEGIN TRY

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
	BEGIN TRANSACTION
	CREATE TABLE #Calendar (AccountingDate date,[day] Nvarchar(10),[Week] int,[month] nvarchar(10),[Quater] int)
	Declare @DateIndex  date
	Set @DateIndex = @StartDate
			While(@DateIndex != (select DATEADD(DAY,1,@EndDate)))
			BEGIN
			INSERT INTO #Calendar (AccountingDate ,[day] ,[Week] ,[month] ,[Quater] )
			SELECT @DateIndex  ,
			DATENAME(WEEKDAY,@DateIndex) ,
			DATENAME(WEEK,@DateIndex) ,
			DATENAME(MONTH,@DateIndex),
			DATEPART(QUARTER,@DateIndex)as[quater]
	
					set @DateIndex = DATEADD(DAY,+1,@DateIndex)
			END
			select * from #Calendar	
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION 
				PRINT'CHECK AGAIN FOR ERRORS';
		THROW;
	END CATCH



	

/****** Object:  StoredProcedure [dbo].[SpContactIns1]    Script Date: 5/20/2022 12:02:42 PM ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[SpCompanyIns]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Akash adhikari
-- Create date: 2022-05-23
-- Description:	Sp to insert PersonAdderss Details
-- =============================================
CREATE PROCEDURE	[dbo].[SpCompanyIns]
@json varchar (max) OUTPUT

AS
BEGIN TRY
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRANSACTION
	
			CREATE TABLE #TEMP (
								Id int identity(1,1),
								TempCompanyId int
							)
		CREATE table #json(
								id int identity(1,1),
										companyId int,
										organizationId int,
										organization varchar(200),
										department varchar(100),
										[status] bit,
										[website] varchar(1000),
										[phone] varchar(20),
										[address1] [varchar](200) ,
										[address2] [varchar](200) ,
										[city] [varchar](50) ,
										[state] [varchar](100) ,
										[zipCode] [varchar](20) ,
										[userPersonId] int					
									)
			INSERT INTO #json(	
										organizationId ,
										organization ,
										department ,
										[status] ,
										[website] ,
										[phone] ,
										[address1] ,
										[address2]  ,
										[city]  ,
										[state]  ,
										[zipCode]  ,
										[userPersonId] 
								
								)
			SELECT *  FROM OPENJSON (@JSON)
			WITH(	
										
										organizationId int,
										organization varchar(200),
										department varchar(100),
										[status] bit,
										[website] varchar(1000),
										[phone] varchar(20),
										[address1] [varchar](200) ,
										[address2] [varchar](200) ,
										[city] [varchar](50) ,
										[state] [varchar](100) ,
										[zipCode] [varchar](20) ,
										[userPersonId] int

				) AS jo
		
				
			INSERT INTO dbo.Company(OrganizationId,[status],[userPersonId])
							OUTPUT
								inserted.CompanyId
							INTO #TEMP(TempCompanyId)
			SELECT jo.organizationId ,jo.status,jo.userPersonId FROM #json as jo



				UPDATE  J SET J.companyId = T.TempCompanyId FROM #json as j
				INNER JOIN #TEMP AS  T ON T.Id =J.id
			

				SELECT @Json = ( SELECT
										companyId ,
										t.organizationId ,
										t.organization ,
										t.department,
										t.[status] ,
										t.[website] ,
										t.[phone] ,
										t.[address1]  ,
										t.[address2]  ,
										t.[city] ,
										t.[state]  ,
										t.[zipCode]  ,
										t.[userPersonId] 
								FROM #json AS t
								FOR JSON AUTO
								)
			
			DROP TABLE #json
			DROP TABLE #TEMP

			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
			IF @@TRANCOUNT >0
			THROW
		END CATCH

GO
/****** Object:  StoredProcedure [dbo].[SpContactDel]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpContactDel]
@ContactId nvarchar(20),
@UserPersonId int

AS
BEGIN TRANSACTION 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
 -- Insert statements for procedure here
		
		Delete from dbo.Contact where 
		ContactId =@ContactId
		and
		InsertPersonId = @UserPersonId


			COMMIT TRANSACTION;
		END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION;
	END CATCH
 --exec dbo.SpPersonNameDel @personId ='1'
	
	


GO
/****** Object:  StoredProcedure [dbo].[SpContactInformationIns]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		AKASH ADHIKARI
-- Create date: 2022-05-24
-- Description:	SP CONTACT INSERT
-- =============================================
CREATE PROCEDURE [dbo].[SpContactInformationIns] 
	-- Add the parameters for the stored procedure here
	@Json varchar(max)  output
AS
begin
	SET NOCOUNT ON;

BEGIN try
	
	SET NOCOUNT ON;
		BEGIN transaction
					CREATE TABLE #TEMP (
								Id int identity(1,1),
								TempContactId int
							)
	CREATE table #json(
										id int identity(1,1),
										personId int,
										addressId int,
										contactId int,
										organizationId int,
										newCustomerId int,
										companyId int,
										ssn varchar(25),
										[website] varchar(1000),
										[phone] varchar(25),
										[address1] [varchar](200) ,
										[address2] [varchar](200) ,
										[city] [varchar](50) ,
										[state] [varchar](100) ,
										[zipCode] [varchar](20) ,
										userName varchar(200),
										[password] varchar(200),
										[userPersonId] int					
									)
			INSERT INTO #json(	
								
										personId ,
										addressId ,
										contactId ,
										organizationId ,
										newCustomerId ,
										companyId,
										ssn,
										[website] ,
										[phone] ,
										[address1]  ,
										[address2] ,
										[city] ,
										[state] ,
										[zipCode]  ,
										userName ,
										[password],
										[userPersonId] 
								
								)
			SELECT *  FROM OPENJSON (@JSON)
			WITH(					
										personId int,
										addressId int,
										contactId int,
										organizationId int,
										newCustomerId int,
										companyId int,
										ssn varchar(25),
										[website] varchar(1000),
										[phone] varchar(25),
										[address1] [varchar](200) ,
										[address2] [varchar](200) ,
										[city] [varchar](50) ,
										[state] [varchar](100) ,
										[zipCode] [varchar](20) ,
										userName varchar(200),
										[password] varchar(200),
										[userPersonId] int

				) AS jo
		INSERT INTO DBO.ContactInformation(
								Phone,website,UserPersonId
		
							)

									OUTPUT 
									inserted.ContactInformationId
								into  #TEMP(TempContactId)
		SELECT jo.phone,jo.website,jo.userPersonId FROM #JSON   as jo

		--where not exists(select p.SSN from Person as p  where p.ssn = jo.ssn)
		--and not exists (select u.UserName from dbo.[UserInformation] as u where  u.UserName =jo.userName)
				
				update j  set j.ContactId =T.TempContactId from #json as j 
						INNER JOIN #TEMP  AS T ON J.Id =T.id 
							SELECT @Json = ( SELECT
									
									t.personId,
										t.addressId,
										t.contactId,
										t.organizationId,
										t.newCustomerId,
										t.companyId,
										t.ssn,
										t.[website] ,
										t.[phone] ,
										t.[address1]  ,
										t.[address2]  ,
										t.[city] ,
										t.[state]  ,
										t.[zipCode]  ,
										t.userName,
										t.[password],
										t.[userPersonId] 	
								FROM #json AS t
								FOR JSON AUTO
								)
					drop table #TEMP
					drop table #json
				COMMIT TRANSACTION
			
			END TRY
	
	BEGIN CATCH
		ROLLBACK TRANSACTION
		IF @@TRANCOUNT > 0
		THROW
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[SpContactIns]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		AKASH ADHIKARI
-- Create date: 2022-05-24
-- Description:	SP CONTACT INSERT
-- =============================================
CREATE PROCEDURE [dbo].[SpContactIns] 
	-- Add the parameters for the stored procedure here
	@Json varchar(max)  output
AS
begin
	SET NOCOUNT ON;

BEGIN try
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		BEGIN transaction
		--				CREATE TABLE #temp(
		--				TempcontactId int
		--				)
		--	INSERT INTO Contact(
		--	Email,
		--	Mobile,
		--	InsertPersonId
		--	)
						
		--				OUTPUT
		--						inserted.ContactId
		--					INTO #temp
		--	SELECT * FROM OPENJSON(@JsonContactInsert)
		--	WITH
		--	(
		--				email  varchar(200) ,
		--				mobile varchar(20),
		--				insertPersonId int

		--	)
		--COMMIT TRANSACTION
		--DROP TABLE #temp
					CREATE TABLE #TEMP (
								Id int identity(1,1),
								TempContactId int
							)
	CREATE table #json(
								id int identity(1,1),
								personId int,
								addressId int,
								contactId int,
								ssn varchar(25),
										mobile varchar(25),
										email varchar(200),
										[website] varchar(1000),
										[phone] varchar(20),
										[address1] [varchar](200) ,
										[address2] [varchar](200) ,
										[city] [varchar](50) ,
										[state] [varchar](100) ,
										[zipCode] [varchar](20) ,
										userName varchar(200),
										[password] varchar(200),
										[userPersonId] int					
									)
			INSERT INTO #json(	
								
								personId ,
								addressId,
								ssn,
										mobile,
										email,
										[website] ,
										[phone] ,
										[address1]  ,
										[address2] ,
										[city] ,
										[state]  ,
										[zipCode] ,
										userName,
										[password],
										[userPersonId] 
								
								)
			SELECT *  FROM OPENJSON (@JSON)
			WITH(					
								personId int,
								addressId int,
								ssn varchar(25),
										mobile varchar(25),
										email varchar(200),
										[website] varchar(1000),
										[phone] varchar(20),
										[address1] [varchar](200) ,
										[address2] [varchar](200) ,
										[city] [varchar](50) ,
										[state] [varchar](100) ,
										[zipCode] [varchar](20) ,
										userName varchar(200),
										[password]  varchar(200),
										[userPersonId] int

				) AS jo
		INSERT INTO DBO.Contact(
								Email, Mobile,Phone,website,UserPersonId
		
							)

									OUTPUT 
									inserted.ContactId
								into  #TEMP(TempContactId)
		SELECT jo.email,jo.mobile,jo.phone,jo.website,jo.userPersonId FROM #JSON   as jo
		left join dbo.Person as p on p.SSN =jo.ssn
				left join dbo.UserInformation as ui on ui.UserName =jo.userName
				where P.PersonId is null and ui.UserName is null
		--where not exists(select p.SSN from Person as p  where p.ssn = jo.ssn)
		--and not exists (select u.UserName from dbo.[UserInformation] as u where  u.UserName =jo.userName)
				
				update j  set j.ContactId =T.TempContactId from #json as j 
						INNER JOIN #TEMP  AS T ON J.Id =T.id 
							SELECT @Json = ( SELECT
									
									t.personId,
										t.addressId,
										t.contactId,
										t.ssn,
										t.email,
										t.mobile,
										t.[website] ,
										t.[phone] ,
										t.[address1]  ,
										t.[address2]  ,
										t.[city] ,
										t.[state]  ,
										t.[zipCode]  ,
										t.userName,
										t.[password],
										t.[userPersonId] 	
								FROM #json AS t
								FOR JSON AUTO
								)
select @Json
				COMMIT TRANSACTION
			
			END TRY
	
	BEGIN CATCH
		ROLLBACK TRANSACTION
		IF @@TRANCOUNT > 0
		THROW
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[SpCreateInvoice]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SpCreateInvoice] @customerId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	INSERT INTO Invoice (
	customerId,
	InvoiceTotal
)
	select s.CustomerId,sum(Quantity* UnitPrice) from SalesTransaction as s
	inner join Customer as c on c.CustomerId =s.CustomerId
	inner join product as p on p.ProductId =s.ProductId
	where @customerId =s.CustomerId 
	group by s.CustomerId
	Update SalesTransaction
		SET InvoiceId = SCOPE_IDENTITY()
		where @customerId = SalesTransaction.CustomerId AND SalesTransaction.InvoiceId Is Null
		--(select max(InvoiceId) from Invoice where CustomerId=@CustomerId)
	
	
end
GO
/****** Object:  StoredProcedure [dbo].[SpCustomerDel]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[SpCustomerDel](@Json NVARCHAR(MAX) OUTPUT)      
AS      
BEGIN      
    DECLARE @customerId INT = (SELECT oj.customerId  FROM OPENJSON(@Json)      
 WITH(      
  customerId INT      
 ) AS oj)      
      
      
 CREATE TABLE #temp(customerId INT)      
    
 DELETE  FROM dbo.Customer   
 OUTPUT DELETED.CustomerId INTO #temp(customerId)      
 WHERE CustomerId=@customerId      
 SELECT @Json=(SELECT * FROM #temp t FOR JSON PATH)       
      
      
END 
GO
/****** Object:  StoredProcedure [dbo].[SpCustomerIns]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[SpCustomerIns](  
    @Json NVARCHAR(MAX)	OUT)  
    AS   
    BEGIN   
     SET NOCOUNT ON;  
     BEGIN TRY  
      BEGIN TRANSACTION;  
       CREATE TABLE #Temp
				(
					TempId INT PRIMARY KEY IDENTITY(1,1),
					FirstName VARCHAR(100),
					MiddleName VARCHAR(100),
					LastName VARCHAR(100),
					[email] VARCHAR(100)
					
				)
		INSERT INTO #Temp(FirstName,MiddleName,LastName,email)
		SELECT oj.FirstName,oj.MiddleName,oj.LastName,oj.[email]
		FROM OPENJSON(@Json)
		WITH(
		firstName VARCHAR(100),
		middleName VARCHAR(100),
		lastName VARCHAR(100),
		[email] VARCHAR(100)


		)AS oj
		CREATE TABLE #Temp1(Temp1Id INT PRIMARY KEY IDENTITY(1,1),CustomerId INT)
		INSERT INTO dbo.Customer(FirstName,MiddleName,LastName,CustomerEmail)
		OUTPUT inserted.CustomerId INTO #Temp1(CustomerId)
		SELECT t.FirstName,t.MiddleName,t.LastName,t.email FROM #Temp t

		SELECT @Json=(Select t1.CustomerId, t.FirstName,t.MiddleName ,t.LastName,t.email FROM #Temp t
		INNER JOIN #Temp1 t1  ON t.TempId=t1.Temp1Id  FOR JSON PATH, INCLUDE_NULL_VALUES)
        COMMIT TRANSACTION  
        
     END TRY  
     BEGIN CATCH  
      IF @@TRANCOUNT>1  
      ROLLBACK TRANSACTION;  
	  THROW;
     END CATCH  
    END  
GO
/****** Object:  StoredProcedure [dbo].[SpCustomerSel]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      PROCEDURE [dbo].[SpCustomerSel]  (  
@Json NVARCHAR (MAX) )  
        
    AS     
    BEGIN     
     SET NOCOUNT ON;    
     BEGIN TRY    
      BEGIN TRANSACTION;    
       SELECT (SELECT  * FROM dbo.Customer    
       FOR JSON PATH  ) AS [Json]  
        COMMIT TRANSACTION    
          
     END TRY    
     BEGIN CATCH    
      IF @@TRANCOUNT>1    
      ROLLBACK TRANSACTION;    
     END CATCH    
    END
GO
/****** Object:  StoredProcedure [dbo].[SpCustomerUpd]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[SpCustomerUpd](@Json NVARCHAR(MAX) OUTPUT)  
AS  
BEGIN  
    DECLARE @customerId INT
	DECLARE @firstName VARCHAR(100)
	DECLARE @middleName VARCHAR(100)
	DECLARE @lastName VARCHAR(100)
	DECLARE @address VARCHAR(100)
	DECLARE @CustomerEmail VARCHAR(100)
	
	SELECT @customerId=oj.customerId,
			@firstName=oj.firstName,
			@middleName=oj.middleName, 
			@lastName=oj.lastName,
			@address=oj.[address],
			@CustomerEmail = OJ.customerEmail
			FROM OPENJSON(@Json)
			WITH(
					customerId INT,
					firstName VARCHAR(100),
					middleName VARCHAR(100),
					lastName VARCHAR(100),
					[address] VARCHAR(100),
					CustomerEmail VARCHAR(50)

				) AS oj 
	
	
  
 CREATE TABLE #temp(customerId INT)  
 Update   Customer
  Set FirstName=@firstName,
 MiddleName=@middleName,
 LastName=@lastName,
 [CustomerAddress]=@address,
 CustomerEmail = @CustomerEmail
 OUTPUT inserted.CustomerId INTO #temp(customerId)  
 WHERE CustomerId=@customerId  
SELECT @Json=(SELECT c.CustomerId ,  
                                c.FirstName ,  
								c.MiddleName,
								c.LastName,
								c.[CustomerAddress],
								c.CustomerEmail
                                FROM dbo.Customer c INNER JOIN #temp t ON c.CustomerId = t.customerId FOR JSON PATH) 
   
 
  
  
END  
GO
/****** Object:  StoredProcedure [dbo].[SpDetailedEntitySel]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpDetailedEntitySel]
(
    @Json NVARCHAR (MAX)
)
AS
    BEGIN
        SET NOCOUNT ON;



        BEGIN TRY
            



                BEGIN TRANSACTION;
					
					DECLARE @Entity  varchar(25)=  json_value(@json,'$.entity')
					DECLARE @EntityId  varchar(25)= ISNULL(json_value(@json,'$.entityId'),'ALL')
					DECLARE @TableName varchar(25) =json_value(@json,'$.dataRequest') 
					DECLARE @Status varchar(25) =json_value(@json,'$.status') 
					DECLARE @EnableUserSettings varchar(25) = json_value(@json,'$.enableUserSettings') 
					DECLARE @UserPersonId varchar(25) = json_value(@json,'$.userPersonId') 
					DECLARE @SearchType varchar(25) = (select jo.searchType from openjson(@json) with(searchType varchar(25)) jo) 

					
		        
					



					


				
---------------------------------------------------------------------------------------------------------------------------------------------------
							
								IF @EnableUserSettings = 'true'
								
								
										SET @SearchType = (select oss.SearchFilter from OfficeStaffSetting as oss where oss.PersonId=@UserPersonId )
									
										
										
	

						
---------------------------------------------------------------------------------------------------------------------------------------------------
--DECLARE @SQL1 VARCHAR(MAX)='select e.*  from '+ @Entity+ ' as e inner join '+@Entity+@TableName+' as et on e.'+@Entity+
--				'Id=et.'+@Entity+'Id INNER JOIN '+@TableName+' AS t on t.'+@TableName+'Id=et.'+@TableName+ 'Id WHERE e.'+@Entity+'Id in (' +@EntityId+')'
					
--DECLARE @SQL2 VARCHAR(MAX)='select e.*  ,t.* from '+ @Entity+ ' as e inner join '+@Entity+@TableName+' as et on e.'+@Entity+
--					'Id=et.'+@Entity+'Id INNER JOIN '+@TableName+' AS t on t.'+@TableName+'Id=et.'+@TableName+ 'Id WHERE e.'+@Entity+'Id in (' +@EntityId+')'
					


--					BEGIN
--							IF @SearchType = 'basic' and @Status = 'all'
--							begin
--								execute (@SQL1)
--							end
--							if @SearchType = 'Detail' and @Status ='all'
--							begin 
--									execute (@SQL2)
--							end
									
							
										
								
--					END

				
-----------------------------------------------------------------------------------------------------------------------------------------------------


			 
--					DECLARE @SQL VARCHAR(MAX)='select e.'+@Entity+'Id'+' ,t.* from '+ @Entity+ ' as e inner join '+@Entity+@TableName+' as et on e.'+@Entity+
--					'Id=et.'+@Entity+'Id INNER JOIN '+@TableName+' AS t on t.'+@TableName+'Id=et.'+@TableName+ 'Id WHERE e.'+@Entity+'Id in (' +@EntityId+')'
					
--						select @SQL
--						execute(@SQL)
--			---------------------------------------------------------------------------------------------------------------------
--select @SearchType
--		DECLARE @SQL VARCHAR(MAX)
--		SET @SQL = CASE
--						WHEN @SearchType = 'detail'
--							THEN
--					'select e.*  ,t.* from '+ @Entity+ ' as e inner join '+@Entity+@TableName+' as et on e.'+@Entity+
--					'Id=et.'+@Entity+'Id INNER JOIN '+@TableName+' AS t on t.'+@TableName+'Id=et.'+@TableName+ 'Id WHERE e.'+@Entity+'Id in (' +@EntityId+')'
					
--						WHEN @SearchType = 'basic'
--							THEN
--							'select e.*  from '+ @Entity+ ' as e inner join '+@Entity+@TableName+' as et on e.'+@Entity+
--					'Id=et.'+@Entity+'Id INNER JOIN '+@TableName+' AS t on t.'+@TableName+'Id=et.'+@TableName+ 'Id WHERE e.'+@Entity+'Id in (' +@EntityId+')'
--						else 
--							'select '''
							

--end
--execute(@SQL)
------------------------------------------------------------------------------------------------------------------------------------------------
								
		--						DECLARE @SQL VARCHAR(MAX)
		--SET @SQL =  'SELECT '+CASE WHEN @SearchType = 'basic'

-------------------------------------------------------------------------------------------------------------------------------


DECLARE @SQL VARCHAR(MAX) 
SET @SQL = 'SELECT '+CASE 
							WHEN @SearchType='basic ' AND @Entity = 'Organization'
									THEN ' e.OrganizationId ,e.Organization,z.NewCustomerId'								
											+CASE 
													WHEN @TableName ='Address' 
														THEN ' t.Address1,t.City'
													else ''
													end
											+case
													when @TableName = 'ContactInformation'
														then 'c.Website '
													else ''
													end
							WHEN @SearchType='basic' AND @Entity = 'Person'
									THEN ' e.FirstName,e.LastName,e.MiddleName,z.PersonId '								
											+CASE
												WHEN @TableName ='Address'
													THEN ' ,t.Address1,t.City  '
													else ''
												end
											+
											CASE
												WHEN @TableName ='Contact'
													THEN 't.Email '
													else ''
												end

									else '*' 
								end
		+ ' from dbo.'+@Entity
						+ CASE 
							WHEN  @Entity = 'Person' and (@TableName= 'Contact' or @TableName='Address')
								THEN 
									' as e inner join '+@Entity+@TableName+' as et on e.'+@Entity+'Id =et.'+@Entity+'Id INNER JOIN '+@TableName+
									' as t on t.'+@TableName+'Id=et.'+@TableName+'Id '
									+ 'Inner Join Employee as z on z.PersonId =e.'+@Entity+'Id'
								else ''
							end
							+ CASE 
							WHEN  @Entity = 'Organization' and (@TableName= 'ContactInformation' or @TableName='Address')
								THEN 
								' as e inner join '+@Entity+@TableName+' as et on e.'+@Entity+'Id =et.'+@Entity+'Id INNER JOIN '+@TableName+
									' as t on t.'+@TableName+'Id=et.'+@TableName+'Id ' 
									+ 'inner join NewCustomer as z on z.OrganizationId=e.'+@Entity+'Id'
								else ''
							end

						

		Declare @whereClause varchar(max)=' where z.' +@entity +'Id' + case when @entityId='All' then  '= z.' +@entity +'Id'  else  'IN ( ' + @entityId +') ' END + ' AND z.status= '+ Case when @status = 'Active'  THEN  '1' when @status = 'InActive'  THEN '0' Else + 'z.status' End


			
			 set @SQL=@SQL + @whereClause
			 exec  (@SQL)
				

	
									
						--	+ case 
						--	when @TableName = 'Address' and @Entity = 'Person'
						--			then ''+@Entity+@TableName+' as et on et.'+@Entity+'Id=et.'+@Entity+'Id  inner join '
						--			+@TableName+' as t on t.'+@TableName+'Id=et.'+@TableName
							
						--	else''
						--	end
						--	+
						--	case 
						--	when @TableName = 'Contact' and @Entity = 'Person'
						--			then ''+@Entity+@TableName+' as et on et.'+@Entity+'Id=et.'+@Entity+'Id inner join '
						--			+@TableName+' as t on t.'+@TableName+'Id=et.'+@TableName
							
						--	else''
						--	end
						--+ case 
						--	when @TableName = 'Address' and @Entity = 'Organization'
						--			then ''+@Entity+@TableName+' as et on et.'+@Entity+'Id=et.'+@Entity+'Id  inner join '
						--			+@TableName+' as t on t.'+@TableName+'Id=et.'+@TableName
							
						--	else''
						--	end
						--	+
						--	case 
						--	when @TableName = 'ContactInformation' and @Entity = 'Organization'
						--			then ''+@Entity+@TableName+' as et on et.'+@Entity+'Id=et.'+@Entity+'Id inner join '
						--			+@TableName+' as t on t.'+@TableName+'Id=et.'+@TableName
							
						--	else''
						--	end
					--execute (@SQL)
					--select @Status
					print @SQL



                COMMIT TRANSACTION;
            
        END TRY
        BEGIN CATCH
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION;

            THROW;
        END CATCH;
    END;





GO
/****** Object:  StoredProcedure [dbo].[SpEmployeeIns]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SpEmployeeIns]
@json nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		BEGIN TRY
				BEGIN TRANSACTION
				INSERT INTO Employee(
				PersonId,
				[Status]
				
				
				)
			SELECT * FROM OPENJSON(@json)
			with(
			personId int,
			[status] bit
			)as jo
			where  jo.personId not in(select e.PersonId from Employee as e)
			and jo.personId not in(select o.PersonId from OfficeStaff as o) 
			
			commit transaction
		end try
		begin catch
		rollback transaction;
		throw;
		end catch 
END
GO
/****** Object:  StoredProcedure [dbo].[SpEntitySel]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpEntitySel]
(
    @Json NVARCHAR (MAX)
)
AS
    BEGIN
        SET NOCOUNT ON;



        BEGIN TRY
            BEGIN



                BEGIN TRANSACTION;
					
					DECLARE @Entity  varchar(25)=  (select jo.entity from openjson(@json) with(entity varchar(25)) jo)
					DECLARE @EntityId  varchar(25)= (select jo.entityId from openjson(@json) with(entityId varchar(25)) jo)
					DECLARE @TableName varchar(25) =(select jo.dataRequest from openjson(@json) with(dataRequest varchar(25)) jo) 

					CREATE TABLE #TEMP(
							id int identity(1,1),
							entityId varchar(25)
					
								)
					insert into #TEMP(entityId)
							select * from string_split(@EntityId,',')
		--SELECT  P.FirstName,P.MiddleName,P.LastName FROM PERSON AS P 
		----------------------------------------------------------------------------------------------------------------------------------------
		--				IF @Entity = 'Person'
		--					DECLARE @SQL1 VARCHAR(MAX) = 

		--	IF @EnableUserSettings = 'true'
			

					DECLARE @SQL VARCHAR(MAX)='select e.'+@Entity+'Id'+' ,t.* from '+ @Entity+ ' as e inner join '+@Entity+@TableName+' as et on e.'+@Entity+
					'Id=et.'+@Entity+'Id INNER JOIN '+@TableName+' AS t on t.'+@TableName+'Id=et.'+@TableName+ 'Id WHERE e.'+@Entity+'Id in (' +@EntityId+')'
					
					
								
					
						select @SQL
						execute(@SQL)
					

                COMMIT TRANSACTION;
            END;
        END TRY
        BEGIN CATCH
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION;

            THROW;
        END CATCH;
    END;





GO
/****** Object:  StoredProcedure [dbo].[SpEntityTsk]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SpEntityTsk]
    @Entity varchar(200), 
	@EntityId  varchar(20)
AS
BEGIN
--BEGIN TRY 
--    SET NOCOUNT ON;
--	BEGIN TRANSACTION
--    DECLARE @ReturnTable NVARCHAR(500)
--    SET @ReturnTable = N'SELECT * FROM dbo.' + @Entity + ' c Where c.'+@Entity + CAST(@EntityId as nvarchar)
--EXECUTE (  @ReturnTable)
--	COMMIT TRANSACTION
--END TRY
BEGIN TRY
SET NOCOUNT ON; 
				CREATE TABLE #TEMP (
				ID INT IDENTITY(1,1), 
				TempEntityId int)

				INSERT INTO #TEMP(TempEntityId)
				SELECT * FROM string_split(@EntityId,',')  AS T

		BEGIN TRANSACTION

			IF @Entity ='Person '
				BEGIN
					SELECT CONCAT(P.FirstName,'',p.MiddleName,'',P.LastName)FullName, P.SSN,A.Address1,A.City,C.Email,C.Mobile
					FROM PersonName AS P
					INNER JOIN PersonAddress AS PA ON PA.PersonId= P.PersonId
					INNER JOIN PersonContact AS PC ON PC.PersonId = P.PersonId
					INNER JOIN [Address] AS A ON A.AddressId =PA.AddressId
					INNER JOIN Contact AS C ON C.ContactId =PC.ContactId
					WHERE P.PersonId  in(select t.TempEntityId from #TEMP as t )
					if @@ROWCOUNT =0
					begin 
						print 'no row found in  person '
					end
				END
		IF @Entity ='NewCustomer'
		begin 
			select CustomerName,status,Department from dbo.NewCustomer
			where NewCustomerId in (select t.TempEntityId from #TEMP as t )

		end
		
		else 
		begin 
			print'no such table exists'
		 end

		 drop table #TEMP
		COMMIT TRANSACTION
END TRY
	BEGIN CATCH
		
		ROLLBACK TRANSACTION
	
	END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SpHotelDel]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SpHotelDel](@Json NVARCHAR(MAX) OUTPUT)  
AS  
BEGIN  
    DECLARE @hotelId INT = (SELECT OJ.hotelId  FROM OPENJSON(@Json)  
 WITH(  
  hotelId INT  
 ) AS oj)  
  
  CREATE table #BranchId (branchId INT )

  INSERT INTO #BranchId(branchId)
  SELECT b.BranchId FROM Branch b  WHERE b.HotelId =@hotelId

  CREATE TABLE #RoomId(roomId INT )
   INSERT INTO	 #RoomId(roomId)
   SELECT r.RoomId FROM Room r WHERE r.BranchId IN (SELECT bi.branchId FROM #BranchId bi)	

   CREATE TABLE #BookingId(bookingId int)
   INSERT INTO #BookingId (bookingId)
   SELECT b.BookingId FROM Booking b WHERE b.RoomId IN (SELECT ri.roomId FROM #RoomId ri)

   DELETE  FROM Booking 
   WHERE BookingId IN (SELECT bi.bookingId FROM #BookingId bi )
   DELETE  FROM Room 
   WHERE RoomId IN (SELECT ri.RoomId FROM #RoomId ri )

   DELETE FROM   Branch 
   WHERE BranchId IN (SELECT bi.branchId FROM #BranchId bi)










  
 CREATE TABLE #temp(hotelId INT)  
 DELETE  FROM dbo.Hotel  
 OUTPUT DELETED.HotelId INTO #temp(hotelId)  
 WHERE HotelId=@hotelId  
 SELECT @Json=(SELECT * FROM #temp t FOR JSON PATH)   
  
  
END  
GO
/****** Object:  StoredProcedure [dbo].[SpHotelIns]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [dbo].[SpHotelIns](  
    @Json NVARCHAR(MAX) OUTPUT)  
    AS   
    BEGIN   
     SET NOCOUNT ON;  
     BEGIN TRY  
      BEGIN TRANSACTION; 
	  CREATE TABLE #TEMP
	  (
		TempId INT PRIMARY KEY IDENTITY(1,1),
		HotelName VARCHAR(100),
		VatNumber VARCHAR(100)
		)
       INSERT INTO #TEMP(HotelName,VatNumber)  
       SELECT HotelName,VatNumber  
       FROM OPENJSON(@Json)  
        WITH(  
        hotelName VARCHAR(100),  
        vatNumber VARCHAR(100)  
        )  
		 CREATE TABLE #Temp1(Temp1Id INT PRIMARY KEY IDENTITY(1,1),HotelId INT )  
            INSERT INTO dbo.Hotel(HotelName,VatNumber)  
            OUTPUT inserted.HotelId INTO #Temp1 (HotelId)  
            SELECT t.HotelName,t.VatNumber FROM #Temp t  


			select @Json=(Select t1.HotelId,t.HotelName,t.VatNumber FROM #temp1 As t1
			INNER JOIN #TEMP as t ON t.TempId=t1.Temp1Id
			 For json path, INCLUDE_NULL_VALUES)  
        COMMIT TRANSACTION  
        
     END TRY  
     BEGIN CATCH  
      IF @@TRANCOUNT>1  
      ROLLBACK TRANSACTION;  
     END CATCH  
    END  
GO
/****** Object:  StoredProcedure [dbo].[SpHotelSel]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [dbo].[SpHotelSel]  (
@Json	NVARCHAR (MAX))
      
    AS   
    BEGIN   
     SET NOCOUNT ON;  
     BEGIN TRY  
      BEGIN TRANSACTION;  
       SELECT (SELECT  * FROM dbo.Hotel  
       FOR JSON PATH  ) AS [Json]
        COMMIT TRANSACTION  
        
     END TRY  
     BEGIN CATCH  
      IF @@TRANCOUNT>1  
      ROLLBACK TRANSACTION;  
     END CATCH  
    END
GO
/****** Object:  StoredProcedure [dbo].[SpHotelUpd]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[SpHotelUpd](@Json NVARCHAR(MAX) OUTPUT)  
AS  
BEGIN  
    DECLARE @hotelId INT
	DECLARE @hotelName VARCHAR(100)
	DECLARE @vatNumber VARCHAR(100)
	SELECT @hotelId=oj.hotelId,
			@hotelName=oj.hotelName,
			@vatNumber=oj.vatNumber 
			FROM OPENJSON(@Json)
			WITH(
					hotelId INT,
					hotelName VARCHAR(100),
					vatNumber VARCHAR(100)

				) AS oj 
	
	
  
 CREATE TABLE #temp(hotelId INT)  
 Update   Hotel 
  Set HotelName=@hotelName,
 VatNumber=@vatNumber
 OUTPUT inserted.HotelId INTO #temp(hotelId)  
 WHERE HotelId=@hotelId  
SELECT @Json=(SELECT h.HotelId ,  
                                h.HotelName ,  
                                h.VatNumber FROM dbo.Hotel h INNER JOIN #temp t ON h.HotelId = t.hotelId FOR JSON PATH) 
   
 
  
  
END  
GO
/****** Object:  StoredProcedure [dbo].[SpJsonFormatDataSel]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SpJsonFormatDataSel]



AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
			
			CREATE TABLE #Temp(
						id int identity (1,1),
						[name] varchar(25),
						[type] varchar(25),
						display varchar(25)
					)

			insert into #Temp
			values
			('FirstName','string','First Name'),
			('MiddleName','string','Middle Name'),
			('LastName', 'string','LastName'),
			('SSN', 'string','Social Security Number'),
			('Address1','string','Permanent Address'),
			('Address2','string','Temporary address'),
			('City','string','City'),
			('Email','string','Email'),
			('UserPersonId','int','User Person Id'),
			('Status','bit','Status'),
			('InsertDate','date','Inserte Date')


	CREATE TABLE #MAIN(
				id int identity(1,1),
				firstName varchar(100),
				middleName varchar(100),
				lastName varchar(100),
				ssn varchar(25),
				[address] varchar (250),
				city varchar(100),
				emailAddress varchar(100),
				insertedDate smallDatetime ,
				personId int,
				[name] varchar(250),
				[status] bit
				)

		INSERT INTO  #MAIN(
					
				firstName ,
				middleName ,
				lastName ,
				ssn ,
				[address] ,
				city ,
				emailAddress ,
				insertedDate  ,
				personId ,
				[name]  
		
					)
			SELECT P.FirstName,P.MiddleName,P.LastName,P.SSN,CONCAT(A.Address1,'-',A.Address2),A.City,C.Email,P.InsertDate,PA.UserPersonId,
			CONCAT(P.FirstName,' ',P.MiddleName,' ',P.LastName)

			
			FROM Person AS P
			INNER JOIN PersonAddress AS PA ON PA.PersonId =P.PersonId
			INNER JOIN PersonContact AS PC ON PC.PersonId= P.PersonId
			INNER JOIN Contact AS C ON C.ContactId =PC.ContactId
			INNER JOIN [Address] AS A  ON A.AddressId =PA.AddressId
			order by newid()

			declare @DataCount int =( select  count (id) from #main)
			declare @entity varchar(25) ='Person'
			DECLARE @Columns varchar(max) =( select t.[name], t.[type], t.display from #Temp as t  for json path,WITHOUT_ARRAY_WRAPPER )
			
			DECLARE @DATA VARCHAR (MAX) =(select top 5 m.firstName,m.middleName,m.lastName,m.ssn,m.[address],m.city,m.emailAddress,m.insertedDate,
			m.personId,m.name from #MAIN as m order by newid()for json path,WITHOUT_ARRAY_WRAPPER )
			
			DECLARE @DIRECTORY  VARCHAR(MAX) = (SELECT 
						(select	(SELECT @DataCount)datacount,(SELECT @entity)ENTITY,
						( select t.[name], t.[type], t.display from #Temp as t for json auto )COLUMNS,
						(select top 5 m.firstName,m.middleName,m.lastName,m.ssn,m.[address],m.city,m.emailAddress,m.insertedDate,
			m.personId,m.name from #MAIN as m order by newid()for json auto )as[data]
			for json path) as directory for json path ,WITHOUT_ARRAY_WRAPPER
			)  
			select @DIRECTORY

			--DECLARE @DIRECTORY  VARCHAR(MAX) = (SELECT 
			--			(select	(SELECT @DataCount)datacount,(SELECT @entity)ENTITY,(SELECT @Columns)COLUMNS,(SELECT @DATA)as[data]
			--for json path) 
			--) 
			--select @DIRECTORY


												

			
		
END


--execute  [dbo].[SpJsonFormatDataSel]
GO
/****** Object:  StoredProcedure [dbo].[SpNewCustomerIns]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Akash adhikari
-- Create date: 2022-05-23
-- Description:	Sp to insert PersonAdderss Details
-- =============================================
CREATE PROCEDURE	[dbo].[SpNewCustomerIns]
@json varchar (max) OUTPUT

AS
BEGIN TRY
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRANSACTION
	
			CREATE TABLE #TEMP (
								Id int identity(1,1),
								TempNewCustomerId int
							)
		CREATE table #json(
								id int identity(1,1),
										newCustomerId int,
										organizationId int,
										organization varchar(200),
										department varchar(100),
										[status] bit,
										[website] varchar(1000),
										[phone] varchar(20),
										[address1] [varchar](200) ,
										[address2] [varchar](200) ,
										[city] [varchar](50) ,
										[state] [varchar](100) ,
										[zipCode] [varchar](20) ,
										[userPersonId] int					
									)
			INSERT INTO #json(	
										organizationId ,
										organization ,
										department ,
										[status] ,
										[website] ,
										[phone] ,
										[address1] ,
										[address2]  ,
										[city]  ,
										[state]  ,
										[zipCode]  ,
										[userPersonId] 
								
								)
			SELECT *  FROM OPENJSON (@JSON)
			WITH(	
										
										organizationId int,
										organization varchar(200),
										department varchar(100),
										[status] bit,
										[website] varchar(1000),
										[phone] varchar(20),
										[address1] [varchar](200) ,
										[address2] [varchar](200) ,
										[city] [varchar](50) ,
										[state] [varchar](100) ,
										[zipCode] [varchar](20) ,
										[userPersonId] int

				) AS jo
		
				
			INSERT INTO dbo.NewCustomer(OrganizationId,Department,[status],[userPersonId])
							OUTPUT
								inserted.NewCustomerId
							INTO #TEMP(TempNewCustomerId)
			SELECT jo.organizationId , jo.department,jo.status,jo.userPersonId FROM #json as jo



				UPDATE  J SET J.NewCustomerId = T.TempNewCustomerId FROM #json as j
				INNER JOIN #TEMP AS  T ON T.Id =J.id
			

				SELECT @Json = ( SELECT
										t.newCustomerId,
										t.organizationId ,
										t.organization ,
										t.department,
										t.[status] ,
										t.[website] ,
										t.[phone] ,
										t.[address1]  ,
										t.[address2]  ,
										t.[city] ,
										t.[state]  ,
										t.[zipCode]  ,
										t.[userPersonId] 
								FROM #json AS t
								FOR JSON AUTO
								)
			
			DROP TABLE #json
			DROP TABLE #TEMP

			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
			IF @@TRANCOUNT >0
			THROW
		END CATCH

GO
/****** Object:  StoredProcedure [dbo].[SpOfficeStaffIns]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SpOfficeStaffIns]
@json nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		BEGIN TRY
				BEGIN TRANSACTION
				INSERT INTO OfficeStaff(
				PersonId,
				Status
				
				)
			SELECT * FROM OPENJSON(@json)
			with(
			personId int,
			[status] bit 
			) as jo
			where jo.personId not in (select e.PersonId from Employee as e)
			and jo.personId not in(select os.PersonId from OfficeStaff as os)

			commit transaction;
		end try
		begin catch
		if @@trancount<0
		rollback transaction;
		throw;
		end catch 
END
GO
/****** Object:  StoredProcedure [dbo].[SpOfficeStaffSettingIns]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SpOfficeStaffSettingIns]
@json nvarchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		BEGIN TRY
				BEGIN TRANSACTION
				INSERT INTO OfficeStaffSetting(
				PersonId,
				StatusFilter,
				SearchFilter
				
				
				)
			SELECT * FROM OPENJSON(@json)
			with(
			personId int,
			statusFilter varchar(25),
			searchFilter varchar(25)
			) as jo
			

			commit transaction;
		end try
		begin catch
		if @@trancount<0
		rollback transaction;
		throw;
		end catch 
END
GO
/****** Object:  StoredProcedure [dbo].[SpOrganizationAddressIns]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpOrganizationAddressIns] 
@Json nvarchar(max)
	-- Add the parameters for the stored procedure here

AS 
BEGIN  TRY

	SET NOCOUNT ON;
	BEGIN TRANSACTION
						CREATE TABLE #Json(
											id int identity(1,1),
											addressId int,
											organizationId int,
											userPersonId int
										)
						INSERT INTO #Json (
											addressId,
											organizationId,
											userPersonId
											)
						SELECT jo.addressId,jo.organizationId,jo.userPersonId 
						FROM OPENJSON(@Json)
							WITH(
								addressId int,
								organizationId int,
								userPersonId int

							)AS jo
		
						INSERT INTO dbo.OrganizationAddress
									(
										AddressId,
										OrganizationId,
										UserPersonId
						            )
						SELECT J.addressId,J.organizationId,J.userPersonId FROM #Json AS J
				DROP TABLE #Json

			COMMIT TRANSACTION
END TRY
BEGIN CATCH
			ROLLBACK TRANSACTION 
				PRINT'CHECK AGAIN FOR ERRORS';
		THROW;
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SpOrganizationContactInformationIns]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpOrganizationContactInformationIns] 
@Json nvarchar(max)
	-- Add the parameters for the stored procedure here

AS 
BEGIN  TRY
	SET NOCOUNT ON;
	BEGIN TRANSACTION
					
					CREATE TABLE #Json 
					(
									id int identity(1,1),
									contactId int,
									organizationId int,
									userPersonId int
					)
					INSERT INTO #Json
					(
						contactId,organizationId,userPersonId
					)

					select jo.contactId,jo.organizationId,jo.userPersonId from openjson(@Json)
					with
					(
						contactId int,
						organizationId int,
						userPersonId int
					) as jo

					INSERT INTO dbo.OrganizationContactInformation
					(
									ContactInformationId,
									OrganizationId,
									UserPersonId
					)
					select j.contactId,j.organizationId,j.userPersonId from #Json as j
				drop table #Json

			COMMIT TRANSACTION
END TRY
BEGIN CATCH
			ROLLBACK TRANSACTION
			IF @@TRANCOUNT >0
	
		THROW;
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SpOrganizationIns]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Akash adhikari
-- Create date: 2022-05-23
-- Description:	Sp to insert PersonAdderss Details
-- =============================================
CREATE PROCEDURE	[dbo].[SpOrganizationIns]
@json varchar (max) OUTPUT

AS
BEGIN TRY
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRANSACTION
	
			CREATE TABLE #TEMP (
								Id int identity(1,1),
								TempOrganizationId int
							)
			CREATE table #json	(
										id int identity(1,1),
										organizationId int,
										organization varchar(200),
										department varchar(100),
										[status] bit,
										[website] varchar(1000),
										[phone] varchar(20),
										[address1] [varchar](200) ,
										[address2] [varchar](200) ,
										[city] [varchar](50) ,
										[state] [varchar](100) ,
										[zipCode] [varchar](20) ,
										[userPersonId] int					
								)
			INSERT INTO #json		(			
										organization ,
										department ,
										[status] ,
										[website] ,
										[phone] ,
										[address1]  ,
										[address2] ,
										[city]  ,
										[state]  ,
										[zipCode]  ,
										[userPersonId] 
								
									)
			SELECT *  FROM OPENJSON (@JSON)
				WITH		(
			
									organization varchar(200),
										department varchar(100),
										[status] bit,
										[website] varchar(1000),
										[phone] varchar(20),
										[address1] [varchar](200) ,
										[address2] [varchar](200) ,
										[city] [varchar](50) ,
										[state] [varchar](100) ,
										[zipCode] [varchar](20) ,
										[userPersonId] int	

						) AS jo
				
				INSERT INTO dbo.Organization(Organization,UserPersonId)
							
						OUTPUT
								inserted.OrganizationId
						INTO #TEMP(TempOrganizationId)

		SELECT jo.organization , jo.userPersonId FROM #json as jo

				UPDATE  J SET J.organizationId = T.TempOrganizationId 
					FROM #json as j
				INNER JOIN #TEMP AS  T ON T.Id =J.id
			

				SELECT @Json = ( SELECT
										t.organizationId ,
										t.organization ,
										t.department,
										t.[status] ,
										t.[website] ,
										t.[phone] ,
										t.[address1]  ,
										t.[address2]  ,
										t.[city] ,
										t.[state]  ,
										t.[zipCode]  ,
										t.[userPersonId] 	 

									FROM #json AS t
									FOR JSON AUTO
								)

			drop table #json
			drop table #TEMP
			

			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			ROLLBACK TRANSACTION
			IF @@TRANCOUNT >0
			THROW
		END CATCH

GO
/****** Object:  StoredProcedure [dbo].[SpOrganizationTaskIns]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpOrganizationTaskIns] 
@Json NVARCHAR(MAX) 
	-- Add the parameters for the stored procedure here,

AS
BEGIN  TRY 
	SET NOCOUNT ON;
	BEGIN TRANSACTION
			
			INSERT INTO dbo.OrganizationTask(
											OrganizationId,
											TaskId,
											UserPersonId
										)
			SELECT jo.entityId,jo.taskId,jo.userPersonId FROM OPENJSON(@Json)
			WITH
				(
					entityId int,
					taskId int,
					userPersonId int
				) as jo
			
				
		
			
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
				ROLLBACK TRANSACTION ;
				PRINT'CHECK AGAIN FOR ERRORS';
		THROW;
	END CATCH

/****** Object:  StoredProcedure [dbo].[SpPersonAuthenticationInsert]    Script Date: 5/20/2022 12:02:42 PM ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[SpOrganizationTsk]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Akash Adhikari
-- Create date: 2022-05-24
-- Description:Sp to insert all person data
-- =============================================
CREATE PROCEDURE [dbo].[SpOrganizationTsk]
@Entity varchar(25),
@json varchar(max)
AS
BEGIN TRY
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
		
		IF @Entity ='NewCustomer'
		begin
		EXECUTE SpOrganizationIns @json =@json output

		EXECUTE SpNewCustomerIns @json = @json output

			--EXECUTE SpCompanyIns @json =@json output
		EXECUTE SpAddressIns @json =@json output


		 execute [SpOrganizationAddressIns] @json = @json
		 execute  SpContactInformationIns @json = @json output

		EXECUTE [SpOrganizationContactInformationIns]  @json = @json 
		
		end
		
			ELSE IF @Entity ='Company'
			begin
					EXECUTE SpOrganizationIns @json =@json output

		EXECUTE SpCompanyIns @json = @json output

			--EXECUTE SpCompanyIns @json =@json output
		EXECUTE SpAddressIns @json =@json output


		 execute [SpOrganizationAddressIns] @json = @json
		 execute  SpContactInformationIns @json = @json output

		EXECUTE [SpOrganizationContactInformationIns]  @json = @json 
			end
		
	--	EXECUTE SpOrganizationContactIns @json = @json
	else 
	begin
	print 'GIVEN ENTITY IS NOT VALID'
	end




	
	COMMIT TRANSACTION
END TRY
 
BEGIN CATCH
IF @@TRANCOUNT > 0
ROLLBACK TRANSACTION;
THROW
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SpPasswordUpd]    Script Date: 7/9/2022 6:36:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SpPasswordUpd] @Json nvarchar(max) output

AS
	BEGIN TRY

			BEGIN TRANSACTION
				CREATE TABLE #Temp (
								Id int Identity(1,1),
								username varchar(250),
								newPassword varchar(500),
								oldPassword varchar(500)

								)
				INSERT INTO #Temp(
				username,
				newPassword
				)
			SELECT * FROM OPENJSON(@Json) 
				WITH(
					username varchar(250),
					newPassword varchar(500)
				) as jo
				SELECT * FROM #TEMP
				

								update dbo.UserInformation
								SET [Password]= t.newPassword
																OUTPUT
										deleted.[password]
										INTO #Temp(oldPassword)
								FROM
								dbo.UserInformation as a
								INNER JOIN #Temp AS t on  t.username =a.UserName
									WHERE a.UserName IN( SELECT t.username FROM #Temp)

					SELECT p.PersonId ,t.username,t.oldPassword,t.newPassword FROM Person AS p
					INNER JOIN UserInformation AS a on a.PersonId =p.PersonId
					INNER JOIN #Temp as t on t.username = a.UserName
				
					for json auto

			COMMIT TRANSACTION
		
	END TRY

	BEGIN CATCH

		IF @@TRANCOUNT > 0
	ROLLBACK TRANSACTION;
	THROW
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SpPersonAddressDel]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SpPersonAddressDel]
@PersonId nvarchar(20),
@UserPersonId int

AS
BEGIN TRANSACTION 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
 -- Insert statements for procedure here
		
		Delete from dbo.[PersonAddress] where 
		PersonId =@PersonId
		and
		InsertPersonId = @UserPersonId


			COMMIT TRANSACTION;
		END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION;
	END CATCH
 --exec dbo.SpPersonNameDel @personId ='1'
	
	


GO
/****** Object:  StoredProcedure [dbo].[SpPersonAddressIns]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpPersonAddressIns] 
@JSON NVARCHAR(MAX)
	-- Add the parameters for the stored procedure here,

AS
BEGIN  TRY 
	SET NOCOUNT ON;
	BEGIN TRANSACTION
	INSERT INTO dbo.PersonAddress (
					PersonId,
					AddressId,
					UserPersonId
	)
	
			SELECT jo.personId, jo.addressId,jo.userPersonId FROM OPENJSON(@JSON)
			WITH (
			
				personId int,
				addressId int,
				userPersonId int
			) as jo
			select @json

			
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
				ROLLBACK TRANSACTION 
				PRINT'CHECK AGAIN FOR ERRORS';
		THROW;
	END CATCH

/****** Object:  StoredProcedure [dbo].[SpPersonAuthenticationInsert]    Script Date: 5/20/2022 12:02:42 PM ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[SpPersonBetweenDateSel]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SpPersonBetweenDateSel]
@StartDate date ,
@EndDate Date
AS
BEGIN Transaction

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
		SELECT STRING_AGG(names.FirstName,',')as namelist FROM dbo.Person AS names
		WHERE  names.InsertDate BETWEEN @StartDate AND @EndDate
		
		for json auto
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		THROW;
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[SpPersonContactDel]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SpPersonContactDel]
@PersonId nvarchar(20),
@UserPersonId int

AS
BEGIN TRANSACTION 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
 -- Insert statements for procedure here
		
		Delete from dbo.[PersonContact] where 
		PersonId =@PersonId
		and
		  @UserPersonId IS NOT NULL


			COMMIT TRANSACTION;
		END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION;
	END CATCH
 --exec dbo.SpPersonNameDel @personId ='1'
	
	


GO
/****** Object:  StoredProcedure [dbo].[SpPersonContactIns]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpPersonContactIns] 
@JSON nvarchar(max)
	-- Add the parameters for the stored procedure here

AS 
BEGIN  TRY
	SET NOCOUNT ON;
	BEGIN TRANSACTION
	INSERT INTO dbo.PersonContact(
					ContactId,
					PersonId,
					UserPersonId
	)
		SELECT jo.contactId,jo.personId,jo.userPersonId FROM OPENJSON(@JSON)
		WITH
		(
		contactId int,
		personId int,
		userPersonId int
		) as jo

			COMMIT TRANSACTION
END TRY
BEGIN CATCH
			ROLLBACK TRANSACTION 
				PRINT'CHECK AGAIN FOR ERRORS';
		THROW;
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SpPersonDel]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SpPersonDel]
@PersonId nvarchar(20),
@UserPersonId int

AS
BEGIN TRANSACTION 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRY
 -- Insert statements for procedure here
		
		Delete from Person where 
		PersonId =@PersonId 
		AND
		 @UserPersonId IS NOT NULL


			COMMIT TRANSACTION;
		END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION;
	END CATCH
 --exec dbo.SpPersonNameDel @personIn ='1'
	



GO
/****** Object:  StoredProcedure [dbo].[SpPersonIns]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		AKASH ADHIKARI
-- Create date: 2022-05-23
-- Description:	SP TO INSERT PERSON
-- =============================================
CREATE PROCEDURE [dbo].[SpPersonIns]
@Json VARCHAR(MAX) output
AS
BEGIN TRY

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		BEGIN TRANSACTION
		select 1,'asdfds'
		CREATE TABLE #TEMP (
								Id int identity(1,1),
								TempPersonId int
							)
		CREATE table #json(
								id int identity(1,1),
								personId int,
								[firstName] [varchar](200) ,
								[middleName] [varchar](50) ,
								[lastName] [varchar](200) ,
								gender varchar(25),
								[ssn] [int] NULL,
										[address1] [varchar](200) ,
										[address2] [varchar](200) ,
										[city] [varchar](50) ,
										[state] [varchar](100) ,
										[zipCode] [varchar](20) ,
										[email] [varchar](200) ,
										[mobile] [varchar](20) ,
										website varchar(200),
										phone varchar(25),
										[userName] [varchar](200) NOT NULL,
										[password] [varchar](200) NOT NULL,
								[userPersonId] int

					)
			INSERT INTO #json(	
								[firstName]  ,
								[middleName] ,
								[lastName] ,
								gender,
								[ssn]  ,
										[address1]  ,
										[address2] ,
										[city] ,
										[state]  ,
										[zipCode]  ,
										[email]  ,
										[mobile]  ,
										website,
										phone,
										[userName]  ,
										[password]  ,
								[userPersonId] )
			SELECT *  FROM OPENJSON (@JSON)
			WITH(
								[firstName] [varchar](100) ,
								[middleName] [varchar](50) ,
								[lastName] [varchar](100) ,
								gender varchar(25),
								[ssn] [int] ,
										[address1] [varchar](200) ,
										[address2] [varchar](200) ,
										[city] [varchar](50) ,
										[state] [varchar](100) ,
										[zipCode] [varchar](20) ,
										[email] [varchar](200) ,
										website varchar(1000),
										phone varchar(25),
										[mobile] [varchar](20) ,
										[userName] [varchar](200) ,
										[password] [varchar](200) ,
								[userPersonId] int

					
				) AS jo
				--alter table dbo.PersonName add UserPersonId int
				
				--							MERGE dbo.PersonName AS Target
				--						USING #json	AS Source
				--						ON Source.personId = Target.PersonId
				--						WHEN NOT MATCHED BY Target THEN
				--							INSERT ([FirstName],[MiddleName],[LastName],[SSN] ,InsertPersonId) 
				--							VALUES (Source.firstName,Source.middleName, Source.lastName,source.ssn,source.InsertPersonId);

			INSERT INTO dbo.Person ([FirstName],[MiddleName],[LastName],[SSN] ,Gender,[UserPersonId])
						OUTPUT
							inserted.PersonId
						INTO #TEMP(TempPersonId)
			SELECT jo.firstName,jo.middleName,jo.lastName,jo.ssn,jo.gender,jo.userPersonId FROM #json as jo
							left join dbo.Person as p on p.SSN =jo.ssn
				left join dbo.UserInformation as ui on ui.UserName =jo.userName
				where P.PersonId is null and ui.UserName is null

				UPDATE  J SET J.PersonId = T.TempPersonId FROM #json as j
				INNER JOIN #TEMP AS  T ON T.Id =J.id
			

				SELECT @Json = ( SELECT
								t.personId ,
								t.firstName  ,
								[middleName]  ,
								[lastName] ,
								[ssn] [int] ,
										[address1] ,
										[address2]  ,
										[city]  ,
										[state]  ,
										[zipCode]  ,
										[email]  ,
										[mobile]  ,
										[userName]  ,
										[password]  ,
								[userPersonId] 

								FROM #json AS t
								FOR JSON AUTO
								)
				COMMIT TRANSACTION

		END TRY
		

		BEGIN CATCH
		IF @@TRANCOUNT >0
			ROLLBACK TRANSACTION
			THROW
		END CATCH

		


GO
/****** Object:  StoredProcedure [dbo].[SpPersonListTsk]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SpPersonListTsk]
@PersonList varchar(200),
@UserPersonId int
AS
BEGIN TRY
SET NOCOUNT ON;
		CREATE TABLE #Temp(
		TempPersonId VARCHAR
		)
		INSERT INTO #Temp
		SELECT  VALUE FROM string_split(@PersonList, ',')
		
			BEGIN TRANSACTION
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
		
		
		EXECUTE SpPersonAddressDel TempPersonId ,@UserPersonId
		EXECUTE SpUserDel  TempPersonId ,@userPersonId
		EXECUTE SpPersonContactDel TempPersonId,@UserPersonId
		EXECUTE SpPersonDel TempPersonId ,@UserPersonId
		Execute SpAddressDel  TempPersonId ,@UserPersonID
		Execute SpContactDel  TempPersonId , @UserPersonID
		Execute SpAuthenticationDetailsDel TempPersonId ,@UserPersonID

		
				COMMIT TRANSACTION
				DROP TABLE #TEMP
		END TRY
				
	BEGIN CATCH
			ROLLBACK TRANSACTION;
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SpPersonTaskIns]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpPersonTaskIns] 
@Json NVARCHAR(MAX) 
	-- Add the parameters for the stored procedure here,

AS
BEGIN  TRY 
	SET NOCOUNT ON;
	BEGIN TRANSACTION
			
			INSERT INTO dbo.PersonTask(
											PersonId,
											TaskId,
											UserPersonId
										)
			SELECT jo.entityId,jo.taskId, jo.userPersonId FROM OPENJSON(@Json)
			WITH
				(
					entityId int,
					taskId int,
					userPersonId int
				) as jo
			
				
		
			
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
				ROLLBACK TRANSACTION ;
				PRINT'CHECK AGAIN FOR ERRORS';
		THROW;
	END CATCH

/****** Object:  StoredProcedure [dbo].[SpPersonAuthenticationInsert]    Script Date: 5/20/2022 12:02:42 PM ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[SpProcedureTsk]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpProcedureTsk]
(
    @Json NVARCHAR (MAX))
AS
    BEGIN
        SET NOCOUNT ON;



        BEGIN TRY

                BEGIN TRANSACTION;
				DECLARE @Entity varchar(25) = json_value(@json,'$.entity')
				DECLARE @EntityId varchar(25) = json_value(@json,'$.entityId')
				declare @UserPersonId int = json_value(@json,'$.userPersonId')

				
				IF @UserPersonId IS NOT NULL
					BEGIN

							IF @ENTITY ='Person'
										BEGIN
										SELECT (select count(t.TaskId) from task as t
																	inner join PersonTask as pt on pt.TaskId =t.TaskId
																	inner join TaskTemplate as tt on tt.TaskTemplateId =t.TaskTemplateId) as totalcount ,
													(  select t.TaskId ,pt.PersonId, tt.TaskTemplateId,t.InsertDate from task as t
																	inner join PersonTask as pt on pt.TaskId =t.TaskId
																	inner join TaskTemplate as tt on tt.TaskTemplateId =t.TaskTemplateId
																	
																for json path)as [data] 

													from Task as t
													inner join PersonTask as pt on pt.TaskId =t.TaskId
																
													WHERE pt.PersonId in  (select( @EntityId))

															

																						


										END
							else IF @ENTITY ='Organization'
											BEGIN
											 SELECT (select count(t.TaskId) from task as t
																	inner join OrganizationTask as ot on ot.TaskId =t.TaskId
																	inner join TaskTemplate as tt on tt.TaskTemplateId =t.TaskTemplateId) as totalcount ,
													(  select t.TaskId ,ot.organizationId, tt.TaskTemplateId,t.InsertDate from task as t
																	inner join OrganizationTask as ot on ot.TaskId =t.TaskId
																	inner join TaskTemplate as tt on tt.TaskTemplateId =t.TaskTemplateId
																	
																for json path)as [data] 

													from Task as t
																
													WHERE t.TaskId in (select( @EntityId))
											END
					END
				ELSE 
					BEGIN
						RAISERROR('Please pass UserPersonId.',16,1)
					END


                COMMIT TRANSACTION;

        END TRY
        BEGIN CATCH
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION;

            THROW;
        END CATCH;
    END;





GO
/****** Object:  StoredProcedure [dbo].[SpRoomDel]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[SpRoomDel](@Json NVARCHAR(MAX) OUTPUT)      
AS      
BEGIN      
    DECLARE @roomId INT = (SELECT OJ.roomId  FROM OPENJSON(@Json)      
 WITH(      
  roomId INT      
 ) AS oj)      
      
      
 CREATE TABLE #temp(roomId INT)      
 DELETE FROM Booking     
 WHERE RoomId = @roomId   
 DELETE  FROM dbo.Room    
 OUTPUT DELETED.RoomId INTO #temp(roomId)      
 WHERE RoomId=@roomId      
 SELECT @Json=(SELECT * FROM #temp t FOR JSON PATH)       
      
      
END 
GO
/****** Object:  StoredProcedure [dbo].[SpRoomIns]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE     PROCEDURE [dbo].[SpRoomIns](  
    @Json NVARCHAR(MAX)	OUT)  
    AS   
    BEGIN   
     SET NOCOUNT ON;  
     BEGIN TRY  
      BEGIN TRANSACTION;  
       CREATE TABLE #Temp
				(
					TempId INT PRIMARY KEY IDENTITY(1,1),
					RoomType VARCHAR(100),
					RoomCharge Money,
					Available BIT,
					BranchId INT
					
				)
		INSERT INTO #Temp(RoomType,RoomCharge,Available,BranchId)
		SELECT oj.RoomType,oj.RoomCharge,oj.Available,oj.BranchId
		FROM OPENJSON(@Json)
		WITH(
		roomType VARCHAR(100),
		roomCharge Money,
		available BIT,
		branchId INT


		)AS oj
		CREATE TABLE #Temp1(Temp1Id INT PRIMARY KEY IDENTITY(1,1),RoomId INT)
		INSERT INTO dbo.Room(RoomType,RoomCharge,Available,BranchId)
		OUTPUT inserted.RoomId INTO #Temp1(RoomId)
		SELECT t.
		RoomType,t.RoomCharge,t.Available,t.BranchId FROM #Temp t

		SELECT @Json=(Select t1.RoomId, t.RoomType,t.RoomCharge ,t.Available,t.BranchId FROM #Temp t
		INNER JOIN #Temp1 t1  ON t.TempId=t1.Temp1Id  FOR JSON PATH, INCLUDE_NULL_VALUES)
        COMMIT TRANSACTION  
        
     END TRY  
     BEGIN CATCH  
      IF @@TRANCOUNT>1  
      ROLLBACK TRANSACTION;  
     END CATCH  
    END  
GO
/****** Object:  StoredProcedure [dbo].[SpRoomSel]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      PROCEDURE [dbo].[SpRoomSel]  (  
@Json NVARCHAR (MAX) )  
        
    AS     
    BEGIN     
     SET NOCOUNT ON;    
     BEGIN TRY    
      BEGIN TRANSACTION;    
       SELECT (SELECT  * FROM dbo.Room  
       FOR JSON PATH  ) AS [Json]  
        COMMIT TRANSACTION    
          
     END TRY    
     BEGIN CATCH    
      IF @@TRANCOUNT>1    
      ROLLBACK TRANSACTION;    
     END CATCH    
    END
GO
/****** Object:  StoredProcedure [dbo].[SpRoomUpd]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   PROCEDURE [dbo].[SpRoomUpd](@Json NVARCHAR(MAX) OUTPUT)  
AS  
BEGIN  
    DECLARE @roomId INT
	DECLARE @roomType VARCHAR(100)
	DECLARE @roomCharge Money
	DECLARE @available BIT
	DECLARE @branchId INT
	SELECT @roomId=oj.roomId,
			@roomType=oj.roomType,
			@roomCharge=oj.roomCharge, 
			@available=oj.available,
			@branchId=oj.branchId
			FROM OPENJSON(@Json)
			WITH(
					roomId INT,
					roomType VARCHAR(100),
					roomCharge Money,
					available VARCHAR(100),
					branchId INT
					

				) AS oj 
	
	
  
 CREATE TABLE #temp(roomId INT)  
 Update   Room
  Set RoomType=@roomType,
 RoomCharge=@roomCharge,
 Available=@available,
 BranchId=@branchId
 OUTPUT inserted.RoomId INTO #temp(roomId)  
 WHERE RoomId=@roomId  
SELECT @Json=(SELECT r.RoomId ,  
                                r.RoomType ,  
								r.RoomCharge,
								r.Available
								
                                FROM dbo.Room r INNER JOIN #temp t ON r.RoomId = t.roomId FOR JSON PATH) 
   
 
  
  
END  
GO
/****** Object:  StoredProcedure [dbo].[SpSigneUpTsk]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Akash Adhikari
-- Create date: 2022-05-24
-- Description:Sp to insert all person data
-- =============================================
CREATE PROCEDURE [dbo].[SpSigneUpTsk]
@json varchar(max)
AS
BEGIN TRY
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION

		EXECUTE SpPersonIns @json =@json output
		EXECUTE SpAddressIns @json = @json output
			
		execute SpPersonAddressIns @json =@json
		EXECUTE SpContactIns @json =@json output
		EXECUTE SpPersonContactIns @json = @json 
		select @json
		EXECUTE SpUserIns @json = @json
	



	
	COMMIT TRANSACTION
END TRY
 
BEGIN CATCH
IF @@TRANCOUNT > 0
ROLLBACK TRANSACTION;
THROW
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SpTaskIns]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpTaskIns]
@Json varchar(max) OUTPUT
AS
BEGIN
SET NOCOUNT ON;
	BEGIN TRY
	BEGIN TRANSACTION
			
			CREATE TABLE #TEMP
				(
					id int identity(1,1),
					taskId int
				)
			CREATE TABLE #Json1
				(
					id int identity(1,1),
					entityId varchar(25),
					taskTemplateId varchar(25),
					userPersonId int default(1)
				)
			CREATE TABLE #Json2
				(
					id int identity (1,1),
					taskId int,
					entityId int ,
					taskTemplateId int,
					userPersonId int
				)

				INSERT INTO #Json1
						(
					entityId ,
					taskTemplateId ,
					userPersonId 	
						)
				SELECT jo.entityId,jo.taskTemplateId,jo.userPersonId FROM openjson(@json)
				WITH(
					entityId varchar(25),
					taskTemplateId varchar(25),
					userPersonId int
				) AS JO

				INSERT INTO #Json2
				(
					entityId,
					taskTemplateId,
					userPersonId
				)
				SELECT
						A.value as entityId,
						B.value as tasktemplateId,
						userPersonId
						FROM #Json1 AS J2
CROSS APPLY STRING_SPLIT(J2.entityid,',') as A
CROSS APPLY STRING_SPLIT(J2.tasktemplateId,',') as B	


		

		INSERT INTO [dbo].[Task](
					TaskTemplateId,
					UserPersonId
			)

			OUTPUT  inserted.TaskId  into #TEMP(taskId)

		SELECT X.taskTemplateId,X.userPersonId   FROM #Json2  AS X

		update j2 set j2.taskId =t.taskId       from #Json2 as j2 
		inner join  #TEMP as t on t.id =j2.id
	SELECT @Json

		SELECT @Json = (SELECT 
						J2.taskId,
						J2.entityId,
						J2.taskTemplateId,
						J2.userPersonId
							
						FROM #Json2 AS J2  
						FOR JSON AUTO
						)

				SELECT @Json	

	COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
	IF @@TRANCOUNT>0
	ROLLBACK TRANSACTION;
	THROW;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SpTaskTemplateIns]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		AKASH ADHIKARI
-- Create date: 2022-05-23
-- Description:	SP TO INSERT PERSON
-- =============================================
CREATE PROCEDURE [dbo].[SpTaskTemplateIns]
@Json VARCHAR(MAX) 
AS
BEGIN TRY

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		BEGIN TRANSACTION
		
		CREATE TABLE #TEMP (
								Id int identity(1,1),
								TempTaskTemplateId int
							)
		CREATE table #json(
								Id int identity(1,1),
								[status] [bit] ,
								[taskName] [varchar](100) ,
								[taskType] [varchar](100) ,
								[hourlyBudget] [money] ,
								entity varchar(25),
								userPersonId int

					)
			INSERT INTO #json(
							status,
							taskName,taskType,hourlyBudget,entity,userPersonId
								)
			SELECT *  FROM OPENJSON (@JSON)
			WITH(
								[status] [bit] ,
								[taskName] [varchar](100) ,
								[taskType] [varchar](100) ,
								[hourlyBudget] [money] ,
								entity varchar(25),
								userPersonId int
					
				) AS jo
				--alter table dbo.PersonName add UserPersonId int
				
				--							MERGE dbo.PersonName AS Target
				--						USING #json	AS Source
				--						ON Source.personId = Target.PersonId
				--						WHEN NOT MATCHED BY Target THEN
				--							INSERT ([FirstName],[MiddleName],[LastName],[SSN] ,InsertPersonId) 
				--							VALUES (Source.firstName,Source.middleName, Source.lastName,source.ssn,source.InsertPersonId);

			INSERT INTO dbo.TaskTemplate ( [Status],TaskName,TaskType,HourlyBudget,Entity,UserPersonId)

			SELECT jo.[status], jo.taskName,jo.taskType,jo.hourlyBudget ,jo.entity ,jo.userPersonId FROM #json as jo
 
			  where not exists (select   jo.taskName
                      from TaskTemplate as  tt
                      where tt.TaskName = jo.taskName)
					

			


				COMMIT TRANSACTION

		END TRY
		

		BEGIN CATCH
		IF @@TRANCOUNT >0
			ROLLBACK TRANSACTION;
			THROW;
		END CATCH

		


GO
/****** Object:  StoredProcedure [dbo].[SpTaskTsk]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Akash Adhikari
-- Create date: 2022-05-24
-- Description:Sp to insert all person data
-- =============================================
CREATE PROCEDURE [dbo].[SpTaskTsk]

@entity varchar(25),
@json varchar(max)
AS
BEGIN TRY
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION

	if(@Entity='Person')
	BEGIN
			EXEC dbo.SpTaskIns @Json=@Json OUTPUT
			EXEC dbo.SpPersonTaskIns @Json=@Json
	
			create table #temp1(

		personId int,
		taskTemplateId int,
		taskId int,
		userPersonId int
		)
		insert into #temp1(
		personId,
		taskTemplateId ,
		taskId ,
		userPersonId 
		)
		select j.entityId,j.taskTemplateId,j.taskId,j.userPersonId from openjson(@json) 
		with(
		entityId int,
		taskTemplateId int,
		taskId int,
		userPersonId int
		)
		as j
		select * from #temp1
		drop table #temp1
	END
	
	IF(@Entity='Organization')
		BEGIN

	EXEC dbo.SpTaskIns @Json=@Json OUTPUT
	EXEC [dbo].[SpOrganizationTaskIns] @Json=@Json

		

		create table #temp2(
		organizationId int,
		taskTemplateId int,
		taskId int,
		userPersonId int
		)
		insert into #temp2(

		organizationId ,
		taskTemplateId ,
		taskId ,
		userPersonId 
		)
		select j.entityId,j.taskTemplateId,j.taskId,j.userPersonId from openjson(@json) 
		with(
		entityId int,
		taskTemplateId int,
		taskId int,
		userPersonId int
		)
		as j
	
	select * from #temp2
	drop table #temp2
	END

	COMMIT TRANSACTION;
END TRY
 
BEGIN CATCH
IF @@TRANCOUNT > 0
ROLLBACK TRANSACTION;
THROW;
END CATCH

--execute [dbo].[SpTaskTsk]
--@entity ='organization',
--@json= N'[
--{
--"entityId":"1,2,3,4,5,6",
--"taskTemplateId" :"7,8,9",
--"userPersonId":"1"

--}
--]'
GO
/****** Object:  StoredProcedure [dbo].[SpUserIns]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		AKASH ADHIKARI
-- Create date: 2022-05-23
-- Description:	SP TO INSERT USER DETAILS
-- =============================================
CREATE PROCEDURE [dbo].[SpUserIns]
	-- Add the parameters for the stored procedure here
			@json nvarchar(max) 
AS
 begin
 set nocount on;
	begin try
		 begin transaction

				 insert into dbo.UserInformation( PersonId,UserName,[Password],UserPersonId)
				 select* from openjson(@json)
				 with (
				 personId int,
				 userName varchar(50),
				 [password] nvarchar(25),
				 userPersonId varchar(15)
				 )
				 

		commit transaction
	end try

	begin catch
		rollback transaction
	end catch

 end
GO
/****** Object:  StoredProcedure [dbo].[zzSpAddressIns]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[zzSpAddressIns] 
@Address1  varchar(200),
@Address2 varchar(200),
@City varchar (50),
@State varchar (100),
@ZipCode varchar(20),
@InsertPersonId int,
@LatestAddressId  int Output
	-- Add the parameters for the stored procedure here

AS
BEGIN TRY
	SET NOCOUNT ON;
	 BEGIN TRANSACTION
	INSERT INTO dbo.Address(
					Address1  ,
					Address2 ,
					City ,
					[State] ,
					ZipCode ,
					InsertPersonId

	)
            VALUES (
						@Address1  ,
						@Address2 ,
						@City ,
						@State ,
						@ZipCode ,
						@InsertPersonId

			)

		COMMIT TRANSACTION
					SELECT @LatestAddressId  =SCOPE_IDENTITY()
	END TRY

	BEGIN CATCH 
		ROLLBACK TRANSACTION
		PRINT'CHECK AGAIN FOR ERRORS';
		THROW ;
	END CATCH


/****** Object:  StoredProcedure [dbo].[SpAddressIns1]    Script Date: 5/20/2022 12:02:42 PM ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[zzSpAddressIns1]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[zzSpAddressIns1] 
@Address1  varchar(200),
@Address2 varchar(200),
@City varchar (50),
@State varchar (100),
@ZipCode varchar(20),
@InsertPersonId int,
@LatestAddressId  int Output
	-- Add the parameters for the stored procedure here

AS
BEGIN TRY
	SET NOCOUNT ON;
			BEGIN TRANSACTION 
	
							CREATE TABLE #OUTPUT(
							AddressId int
							)

	INSERT INTO dbo.Address(
					Address1  ,
					Address2 ,
					City ,
					[State] ,
					ZipCode ,
					InsertPersonId

	)
					OUTPUT
							INSERTED.AddressId
							INTO #OUTPUT


					SELECT	@Address1  ,
						@Address2 ,
						@City ,
						@State ,
						@ZipCode ,
						@InsertPersonId
				COMMIT TRANSACTION
						SELECT @LatestAddressId  =A.AddressId from dbo.[Address] as A
				END TRY
				
				BEGIN CATCH
					ROLLBACK TRANSACTION
					PRINT'CHECK AGAIN FOR ERRORS';
					THROW ;
				END CATCH


/****** Object:  StoredProcedure [dbo].[SpAuthenticationIns1]    Script Date: 5/20/2022 12:02:42 PM ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[zzSpAuthenticationIns]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[zzSpAuthenticationIns] 
@UserId varchar(200),
@Password varchar (200),
@InsertPersonId int,
@LatestAuthentication int output
	-- Add the parameters for the stored procedure here

AS
BEGIN  TRY
	SET NOCOUNT ON;
		BEGIN TRANSACTION
	INSERT INTO dbo.AuthenticationDetails(
					UserId  ,
					[Password],
					InsertPersonId
	)
            VALUES (
						@UserId,
						@Password,
						@InsertPersonId 
			)
		COMMIT TRANSACTION
			select @LatestAuthentication =SCOPE_IDENTITY()
		END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION 
		PRINT'CHECK AGAIN FOR ERRORS';
		THROW;
	END CATCH

/****** Object:  StoredProcedure [dbo].[SpCalendarSel]    Script Date: 5/20/2022 12:02:42 PM ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[zzSpAuthenticationIns1]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[zzSpAuthenticationIns1] 
@UserId varchar(200),
@Password varchar (200),
@InsertPersonId int,
@LatestAuthentication int output
	-- Add the parameters for the stored procedure here

AS
BEGIN   TRANSACTION

	SET NOCOUNT ON;
				BEGIN TRY
							CREATE TABLE #OUTPUT(
										AuthenticationId int
									)
	
	INSERT INTO Dbo.AuthenticationDetails(
					UserId  ,
					[Password],
					InsertPersonId
	)
							OUTPUT
									inserted.AuthenticationId
									INTO #OUTPUT
						
            VALUES (
						@UserId,
						@Password,
						@InsertPersonId 
			)
			COMMIT TRANSACTION
			select @LatestAuthentication = O.AuthenticationId FROM #OUTPUT AS O
			DROP TABLE #OUTPUT
		END TRY
			BEGIN CATCH
				ROLLBACK TRANSACTION
				PRINT'CHECK AGAIN FOR ERRORS';
				THROW;
			END CATCH

/****** Object:  StoredProcedure [dbo].[SpAuthenticationInsert]    Script Date: 5/20/2022 12:02:42 PM ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[zzSpContactIns]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[zzSpContactIns] 
@Email  varchar(200) ,
@Mobile varchar(20) ,
@InsertPersonId int ,
@latestContactId int output
	-- Add the parameters for the stored procedure here

AS
BEGIN  TRY
	SET NOCOUNT ON;
	BEGIN TRANSACTION


	create table #output(
		contactId int 
	)
	INSERT INTO Contact(
	Email,
	Mobile,
	InsertPersonId
	)
	output
	inserted.contactId
	into #output 
     select @Email,@Mobile,@InsertPersonId
		
		select @latestContactId=o.contactId from #output as o
	COMMIT TRANSACTION
		drop table #output
	END TRY
	
	BEGIN CATCH
				ROLLBACK TRANSACTION 
				PRINT'CHECK AGAIN FOR ERRORS';
		THROW;
	END CATCH





GO
/****** Object:  StoredProcedure [dbo].[zzSpContactIns1]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[zzSpContactIns1] 
@Email  varchar(200) ,
@Mobile varchar(20) ,
@InsertPersonId int ,
@latestContactId int output
	-- Add the parameters for the stored procedure here

AS
BEGIN   TRY
	SET NOCOUNT ON;
	BEGIN TRANSACTION


	create table #output(
		contactId int 
	)
	INSERT INTO Contact(
	Email,
	Mobile,
	InsertPersonId
	)
	output
	inserted.contactId
	into #output 
     select @Email,@Mobile,@InsertPersonId
		
		select @latestContactId=o.contactId from #output as o
	COMMIT TRANSACTION
		drop table #output
	END TRY
	BEGIN CATCH
			ROLLBACK TRANSACTION 
				PRINT'CHECK AGAIN FOR ERRORS';
		THROW;
	END CATCH

/****** Object:  StoredProcedure [dbo].[SpContactInsert]    Script Date: 5/20/2022 12:02:42 PM ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[zzSpPersonAddressIns]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[zzSpPersonAddressIns] 
@PersonId Int,
@AddressId int,
@InsertPersonId int
	-- Add the parameters for the stored procedure here

AS
BEGIN  TRY 
	SET NOCOUNT ON;
	BEGIN TRANSACTION
	INSERT INTO dbo.PersonAddress (
					PersonId,
					AddressId,
					InsertPersonId
	)
            VALUES (
						@PersonId,
						@AddressId,
						@InsertPersonId 
			)
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
				ROLLBACK TRANSACTION 
				PRINT'CHECK AGAIN FOR ERRORS';
		THROW;
	END CATCH

/****** Object:  StoredProcedure [dbo].[SpPersonAuthenticationInsert]    Script Date: 5/20/2022 12:02:42 PM ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[zzSpPersonContactIns]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[zzSpPersonContactIns] 
@ContactId int,
@PersonId Int,
@InsertPersonId int
	-- Add the parameters for the stored procedure here

AS 
BEGIN  TRY
	SET NOCOUNT ON;
	BEGIN TRANSACTION
	INSERT INTO dbo.PersonContact(
					ContactId,
					PersonId,

					InsertPersonId
	)
            VALUES (
						@ContactId,
						@PersonId,
						@InsertPersonId 
			)
			COMMIT TRANSACTION
END TRY
BEGIN CATCH
			ROLLBACK TRANSACTION 
				PRINT'CHECK AGAIN FOR ERRORS';
		THROW;
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[zzSpPersonIns]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[zzSpPersonIns] 
@FirstName varchar(100) ,
@MiddleName varchar(50) ,
@LastName varchar(100)  ,
@SSN int ,
@InsertPersonId int ,
@latestId int output
	-- Add the parameters for the stored procedure here

AS
BEGIN  TRY
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	INSERT INTO PersonName(
	FirstName,
	MiddleName,
	LastName,
	SSN,
	InsertPersonId
	)
            VALUES (
				@FirstName ,
				@MiddleName,
				@LastName  ,
				@SSN,
				@InsertPersonId
			)
	COMMIT TRANSACTION
	SELECT @latestId = SCOPE_IDENTITY()
END TRY
	BEGIN CATCH
	    			ROLLBACK TRANSACTION 
				PRINT'CHECK AGAIN FOR ERRORS';
		THROW;
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[zzSpPersonIns1]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[zzSpPersonIns1]
@FirstName varchar(100) ,
@MiddleName varchar(50) ,
@LastName varchar(100)  ,
@SSN int ,
@InsertPersonId int ,
@latestPersonId int output
AS
BEGIN TRY
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRANSACTION

	CREATE table #PersonID(
	PersonId int
	)
		INSERT INTO PersonName(
			FirstName,
			MiddleName,
			LastName,
			SSN,
			InsertPersonId
			
			)
		OUTPUT
				INSERTED.PersonId
				INTO #PersonID

					select	@FirstName ,
						@MiddleName,
						@LastName  ,
						@SSN,
						@InsertPersonId
			COMMIT TRANSACTION
			select @LatestPersonId = P.PersonId from #PersonId P
			DROP TABLE #PersonID
	END TRY
	BEGIN CATCH
				ROLLBACK TRANSACTION 
				PRINT'CHECK AGAIN FOR ERRORS';
		THROW;
	END CATCH


GO
/****** Object:  StoredProcedure [dbo].[zzSpSigneUpFormTsk]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   PROCEDURE [dbo].[zzSpSigneUpFormTsk]
(
@FirstName varchar(150),
@MiddleName Varchar(150),
@LastName varchar(150),
@SSN varchar(20),
@Email varchar(150),
@Mobile Varchar(150),
@Address1 varchar(150),
@Address2 varchar(150),
@City varchar(150),
@State varchar(150),
@ZipCode varchar(150),
@UserId varchar(150),
@insertPersonId int,
@Password varchar(150)


)
As 
 BEGIN TRY
	BEGIN TRANSACTION
	DECLARE @PersonId Int
	DECLARE @AddressId INT
	DECLARE @ContactId INT
	DECLARE @UserID1 INT

	EXEC dbo.SpPersonIns  @FirstName,@MiddleName,@LastName,@SSN, @InsertPersonId, @PersonId OUTPUT

	EXEC dbo.SpAddressIns  @Address1,@Address2,@City,@State,@ZipCode,@insertPersonId, @AddressId OUTPUT

	EXEC dbo.SpPersonAddressIns @PersonId,@AddressId,@insertPersonId

	EXEC dbo.SpContactIns @Email,@Mobile,@insertPersonId,@ContactId OUTPUT

	EXEC dbo.SpPersonContactIns @PersonId,@ContactId,@insertPersonId
	EXEC dbo.SpAuthenticationIns @UserId,@Password,@insertPersonId,@UserID1 OUTPUT
	EXEC dbo.SpPersonAuthenticationIns @PersonId ,@UserID1,@InsertPersonId

	


	COMMIT TRANSACTION

	END Try

 BEGIN CATCH
 If @@TRANCOUNT >0
	
			ROLLBACK TRANSACTION 
				PRINT'CHECK AGAIN FOR ERRORS';
		THROW;
	END CATCH

GO
/****** Object:  StoredProcedure [dbo].[zzSpSigneUpFormTsk1]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[zzSpSigneUpFormTsk1]
(
@FirstName varchar(150),
@MiddleName Varchar(150),
@LastName varchar(150),
@SSN varchar(20),
@Email varchar(150),
@Mobile Varchar(150),
@Address1 varchar(150),
@Address2 varchar(150),
@City varchar(150),
@State varchar(150),
@ZipCode varchar(150),
@UserId varchar(150),
@insertPersonId int,
@Password varchar(150)


)
As 
IF (SELECT COUNT(*) FROM dbo.Contact as c WHERE c.Email= @Email) < 1 
and ((SELECT COUNT(*) FROM dbo.PersonName as p WHERE P.SSN= @SSN)<1)

 BEGIN TRY
	BEGIN TRANSACTION
	DECLARE @PersonId Int
	DECLARE @AddressId INT
	DECLARE @ContactId INT
	DECLARE @UserID1 INT

	EXEC dbo.SpPersonIns1  @FirstName,@MiddleName,@LastName,@SSN, @InsertPersonId, @PersonId OUTPUT

	EXEC dbo.SpAddressIns1  @Address1,@Address2,@City,@State,@ZipCode,@insertPersonId, @AddressId OUTPUT

	EXEC dbo.SpPersonAddressIns @PersonId,@AddressId,@insertPersonId

	EXEC dbo.SpContactIns1 @Email,@Mobile,@insertPersonId,@ContactId OUTPUT

	EXEC dbo.SpPersonContactIns @PersonId,@ContactId,@insertPersonId
	EXEC dbo.SpAuthenticationIns1 @UserId,@Password,@insertPersonId,@UserID1 OUTPUT
	EXEC dbo.SpPersonAuthenticationIns @PersonId ,@UserID1,@InsertPersonId

	


	COMMIT TRANSACTION

	END Try

 BEGIN CATCH
 If @@TRANCOUNT >0
	ROLLBACK TRANSACTION
			ROLLBACK TRANSACTION 
				PRINT'CHECK AGAIN FOR ERRORS';
		THROW;
	END CATCH
GO
/****** Object:  StoredProcedure [dbo].[zzzzzSpEmployeeIns]    Script Date: 7/9/2022 6:36:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		AKASH ADHIKARI
-- Create date: 2022-05-23
-- Description:	SP TO INSERT PERSON
-- =============================================
CREATE PROCEDURE [dbo].[zzzzzSpEmployeeIns]
@Json VARCHAR(MAX) output
AS
BEGIN TRY

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		BEGIN TRANSACTION
		CREATE TABLE #TEMP (
								Id int identity(1,1),
								TempEmployeeId int
							)
		CREATE table #json(
								id int identity(1,1),
								employeeId int,
								personId int,
								[firstName] [varchar](100) NOT NULL,
								[middleName] [varchar](50) NULL,
								[lastName] [varchar](100) NOT NULL,
								[ssn] [int] NULL,
										[address1] [varchar](200) ,
										[address2] [varchar](200) ,
										[city] [varchar](50) ,
										[state] [varchar](100) ,
										[zipCode] [varchar](20) ,
										[email] [varchar](200) NOT NULL,
										[mobile] [varchar](20) NOT NULL,
										[userId] [varchar](200) NOT NULL,
										[password] [varchar](200) NOT NULL,
								[userPersonId] int

					)
			INSERT INTO #json(	
								personId,
								[firstName]  ,
								[middleName] ,
								[lastName] ,
								[ssn]  ,
										[address1]  ,
										[address2] ,
										[city] ,
										[state]  ,
										[zipCode]  ,
										[email]  ,
										[mobile]  ,
										[userId]  ,
										[password]  ,
								[userPersonId] )
			SELECT *  FROM OPENJSON (@JSON)
			WITH(
								personId int,
								[firstName] [varchar](100) ,
								[middleName] [varchar](50) ,
								[lastName] [varchar](100) ,
								[ssn] [int] ,
										[address1] [varchar](200) ,
										[address2] [varchar](200) ,
										[city] [varchar](50) ,
										[state] [varchar](100) ,
										[zipCode] [varchar](20) ,
										[email] [varchar](200) ,
										[mobile] [varchar](20) ,
										[userId] [varchar](200) ,
										[password] [varchar](200) ,
								[userPersonId] int

					
				) AS jo
				--alter table dbo.PersonName add UserPersonId int
				
				--							MERGE dbo.PersonName AS Target
				--						USING #json	AS Source
				--						ON Source.personId = Target.PersonId
				--						WHEN NOT MATCHED BY Target THEN
				--							INSERT ([FirstName],[MiddleName],[LastName],[SSN] ,InsertPersonId) 
				--							VALUES (Source.firstName,Source.middleName, Source.lastName,source.ssn,source.InsertPersonId);


			INSERT INTO dbo.Employee (PersonId,[FirstName],[MiddleName],[LastName],[SSN] ,[UserPersonId])
					OUTPUT
								inserted.EmployeeId
							INTO #TEMP(TempEmployeeId)
			SELECT jo.PersonId, jo.firstName,jo.middleName,jo.lastName,jo.ssn,jo.UserPersonId FROM #json as jo

				UPDATE  J SET J.PersonId = T.TempEmployeeId FROM #json as j
				INNER JOIN #TEMP AS  T ON T.Id =J.id
			

				SELECT @Json = ( SELECT
								t.employeeId,
								t.personId ,
								t.firstName  ,
								[middleName]  ,
								[lastName] ,
								[ssn] [int] ,
										[address1] ,
										[address2]  ,
										[city]  ,
										[state]  ,
										[zipCode]  ,
										[email]  ,
										[mobile]  ,
										[userId]  ,
										[password]  ,
								[userPersonId] 

								FROM #json AS t
								FOR JSON AUTO
								)
				COMMIT TRANSACTION

		END TRY
		

		BEGIN CATCH
		IF @@TRANCOUNT >0
			ROLLBACK TRANSACTION
			THROW
		END CATCH

		


GO
USE [master]
GO
ALTER DATABASE [AkashAdhikari] SET  READ_WRITE 
GO
