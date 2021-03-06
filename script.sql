USE [master]
GO
/****** Object:  Database [CutieShop]    Script Date: 25/4/2018 2:18:55 PM ******/
CREATE DATABASE [CutieShop]
GO
ALTER DATABASE [CutieShop] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CutieShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CutieShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CutieShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CutieShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CutieShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CutieShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [CutieShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CutieShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CutieShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CutieShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CutieShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CutieShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CutieShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CutieShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CutieShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CutieShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CutieShop] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [CutieShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CutieShop] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CutieShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CutieShop] SET  MULTI_USER 
GO
ALTER DATABASE [CutieShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CutieShop] SET ENCRYPTION ON
GO
ALTER DATABASE [CutieShop] SET QUERY_STORE = ON
GO
ALTER DATABASE [CutieShop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [CutieShop]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ISOLATE_SECURITY_POLICY_CARDINALITY = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_PROCEDURE_EXECUTION_STATISTICS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_QUERY_EXECUTION_STATISTICS = OFF;
GO
USE [CutieShop]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_diagramobjects]    Script Date: 25/4/2018 2:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE FUNCTION [dbo].[fn_diagramobjects]() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	
GO
/****** Object:  Table [dbo].[Accessory]    Script Date: 25/4/2018 2:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessory](
	[ProductID] [varchar](36) NOT NULL,
	[Color] [varchar](7) NOT NULL,
	[Smell] [nvarchar](50) NULL,
	[OriginID] [varchar](36) NOT NULL,
	[MaterialID] [varchar](36) NOT NULL,
 CONSTRAINT [PK_Accessory] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Auth]    Script Date: 25/4/2018 2:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auth](
	[Password] [varchar](max) NULL,
	[Username] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cage]    Script Date: 25/4/2018 2:18:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cage](
	[ProductID] [varchar](36) NOT NULL,
	[Color] [varchar](7) NOT NULL,
	[MaterialID] [varchar](36) NOT NULL,
	[Width] [int] NOT NULL,
	[Height] [int] NOT NULL,
	[OriginID] [varchar](36) NOT NULL,
 CONSTRAINT [PK_Cage] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 25/4/2018 2:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Username] [varchar](50) NOT NULL,
	[RoleID] [varchar](36) NULL,
	[Email] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmpRole]    Script Date: 25/4/2018 2:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmpRole](
	[RoleID] [varchar](36) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_EmpRole] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Food]    Script Date: 25/4/2018 2:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Food](
	[ProductID] [varchar](36) NOT NULL,
	[NutritionID] [varchar](36) NOT NULL,
	[OriginID] [varchar](36) NOT NULL,
 CONSTRAINT [PK_Food] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 25/4/2018 2:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[InvoiceID] [varchar](36) NOT NULL,
	[Sum] [int] NULL,
	[BranchAddress] [nvarchar](100) NULL,
	[Username] [varchar](50) NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetails]    Script Date: 25/4/2018 2:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetails](
	[InvoiceDetailID] [varchar](36) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[Quantity] [int] NULL,
	[Price] [int] NULL,
	[Total] [int] NULL,
	[InvoiceID] [varchar](36) NOT NULL,
 CONSTRAINT [PK_InvoiceDetails] PRIMARY KEY CLUSTERED 
(
	[InvoiceDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 25/4/2018 2:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[MaterialID] [varchar](36) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nutrition]    Script Date: 25/4/2018 2:18:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nutrition](
	[NutritionID] [varchar](36) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Nutrition] PRIMARY KEY CLUSTERED 
(
	[NutritionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OnlineOrder]    Script Date: 25/4/2018 2:18:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineOrder](
	[OnlineOrderID] [varchar](36) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[PostCode] [varchar](10) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[PhoneNo] [varchar](20) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[StatusID] [varchar](36) NOT NULL,
 CONSTRAINT [PK_OnlineOrder] PRIMARY KEY CLUSTERED 
(
	[OnlineOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OnlineOrderProduct]    Script Date: 25/4/2018 2:18:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OnlineOrderProduct](
	[OnlineOrderID] [varchar](36) NOT NULL,
	[ProductID] [varchar](36) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_OnlineOrderProduct] PRIMARY KEY CLUSTERED 
(
	[OnlineOrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Origin]    Script Date: 25/4/2018 2:18:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Origin](
	[OriginID] [varchar](36) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Origin] PRIMARY KEY CLUSTERED 
(
	[OriginID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pet]    Script Date: 25/4/2018 2:18:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pet](
	[ProductID] [varchar](36) NOT NULL,
	[SizeID] [varchar](36) NOT NULL,
	[LifeSpan] [int] NOT NULL,
	[CubQuantity] [int] NOT NULL,
	[IsFurDrop] [bit] NOT NULL,
	[EatingRoutine] [int] NOT NULL,
	[PetTypeID] [varchar](36) NOT NULL,
 CONSTRAINT [PK_Pet] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PetType]    Script Date: 25/4/2018 2:18:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetType](
	[PetTypeID] [varchar](36) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PetType] PRIMARY KEY CLUSTERED 
(
	[PetTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 25/4/2018 2:18:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policy](
	[Name] [nvarchar](50) NOT NULL,
	[MinimumValue] [int] NULL,
	[MaximumValue] [int] NULL,
 CONSTRAINT [PK_Policy] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25/4/2018 2:18:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [varchar](36) NOT NULL,
	[ImgUrl] [varchar](255) NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [int] NOT NULL,
	[VendorID] [varchar](36) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductForPetType]    Script Date: 25/4/2018 2:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductForPetType](
	[ProductID] [varchar](36) NOT NULL,
	[PetTypeID] [varchar](36) NOT NULL,
 CONSTRAINT [PK_ProductForPet] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[PetTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 25/4/2018 2:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ProductID] [varchar](36) NOT NULL,
	[StartDayOfWeek] [int] NOT NULL,
	[EndDayOfWeek] [int] NOT NULL,
	[StartHour] [time](7) NOT NULL,
	[EndHour] [time](7) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceOnlineOrder]    Script Date: 25/4/2018 2:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceOnlineOrder](
	[ServiceOnlineOrderID] [varchar](36) NOT NULL,
	[PetID] [varchar](36) NOT NULL,
	[DateBegin] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ServiceOnlineOrder] PRIMARY KEY CLUSTERED 
(
	[ServiceOnlineOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 25/4/2018 2:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[SessionID] [varchar](36) NOT NULL,
	[Username] [varchar](50) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Size]    Script Date: 25/4/2018 2:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeID] [varchar](36) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 25/4/2018 2:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [varchar](36) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 25/4/2018 2:18:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Toy]    Script Date: 25/4/2018 2:19:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Toy](
	[ProductID] [varchar](36) NOT NULL,
	[Color] [varchar](7) NOT NULL,
	[OriginID] [varchar](36) NOT NULL,
	[MaterialID] [varchar](36) NOT NULL,
 CONSTRAINT [PK_Toy] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 25/4/2018 2:19:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [varchar](50) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[BirthDate] [datetime2](7) NULL,
	[Address] [nvarchar](max) NULL,
	[District] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Email] [varchar](max) NULL,
	[FacebookID] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPoint]    Script Date: 25/4/2018 2:19:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPoint](
	[Username] [varchar](50) NOT NULL,
	[Value] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPointHistory]    Script Date: 25/4/2018 2:19:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPointHistory](
	[Username] [varchar](50) NOT NULL,
	[ChangedValue] [int] NULL,
	[OnlineOrderID] [varchar](36) NOT NULL,
 CONSTRAINT [PK__UserPoin__536C85E5291B87EF] PRIMARY KEY CLUSTERED 
(
	[Username] ASC,
	[OnlineOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendor]    Script Date: 25/4/2018 2:19:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendor](
	[VendorID] [varchar](36) NOT NULL,
	[VendorName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Vendor] PRIMARY KEY CLUSTERED 
(
	[VendorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accessory] ([ProductID], [Color], [Smell], [OriginID], [MaterialID]) VALUES (N'0cdd1337-370f-4a4b-9da2-812405be7a75', N'yellow', N'none', N'619e2cd8-6ae2-4b3c-b108-f76983ebdaba', N'8175f2c0-ff12-4060-aef6-f7cd6ffbfb65')
INSERT [dbo].[Accessory] ([ProductID], [Color], [Smell], [OriginID], [MaterialID]) VALUES (N'b824d3ae-e760-4527-9790-0f019103dfbc', N'pink', N'none', N'619e2cd8-6ae2-4b3c-b108-f76983ebdaba', N'8175f2c0-ff12-4060-aef6-f7cd6ffbfb65')
INSERT [dbo].[Accessory] ([ProductID], [Color], [Smell], [OriginID], [MaterialID]) VALUES (N'b89bdbbc-dea5-45eb-8a69-c0825728bc67', N'blue', N'none', N'533e0ffa-73f0-415e-bb13-7b4581866562', N'8175f2c0-ff12-4060-aef6-f7cd6ffbfb65')
INSERT [dbo].[Accessory] ([ProductID], [Color], [Smell], [OriginID], [MaterialID]) VALUES (N'bc28934a-cf3b-4907-8cc2-ee09cf5daac7', N'yellow', N'banana', N'd980c475-06b2-439b-9a2a-eeef3a0bf9b7', N'5b9db3ca-ab72-4359-8575-d76ddc88f1f2')
INSERT [dbo].[Accessory] ([ProductID], [Color], [Smell], [OriginID], [MaterialID]) VALUES (N'e76dadd9-1b77-4efd-a128-34ca24555776', N'grey', N'none', N'd980c475-06b2-439b-9a2a-eeef3a0bf9b7', N'0781070d-653a-4b02-83c6-ee1ab4575d53')
INSERT [dbo].[Cage] ([ProductID], [Color], [MaterialID], [Width], [Height], [OriginID]) VALUES (N'4e29de71-dbb6-4e6d-a2b2-01de650b4b0a', N'Full', N'8175f2c0-ff12-4060-aef6-f7cd6ffbfb65', 35, 35, N'533e0ffa-73f0-415e-bb13-7b4581866562')
INSERT [dbo].[Cage] ([ProductID], [Color], [MaterialID], [Width], [Height], [OriginID]) VALUES (N'99d66558-3c4b-4ce8-9163-9a7f95abf597', N'full', N'8175f2c0-ff12-4060-aef6-f7cd6ffbfb65', 40, 40, N'533e0ffa-73f0-415e-bb13-7b4581866562')
INSERT [dbo].[Cage] ([ProductID], [Color], [MaterialID], [Width], [Height], [OriginID]) VALUES (N'9d3b3cbf-4c45-46ec-9ebd-8359037ff86b', N'Blue', N'8175f2c0-ff12-4060-aef6-f7cd6ffbfb65', 50, 35, N'd980c475-06b2-439b-9a2a-eeef3a0bf9b7')
INSERT [dbo].[Cage] ([ProductID], [Color], [MaterialID], [Width], [Height], [OriginID]) VALUES (N'b899dad4-ba98-48f5-8939-96140d6d6968', N'grey', N'0781070d-653a-4b02-83c6-ee1ab4575d53', 100, 80, N'd980c475-06b2-439b-9a2a-eeef3a0bf9b7')
INSERT [dbo].[Food] ([ProductID], [NutritionID], [OriginID]) VALUES (N'667e380f-cd0d-4e5a-80de-b625bcd7c53b', N'1eb4c286-5f7b-44fb-afdd-4d613e58c4fd', N'619e2cd8-6ae2-4b3c-b108-f76983ebdaba')
INSERT [dbo].[Food] ([ProductID], [NutritionID], [OriginID]) VALUES (N'886dc400-d63d-4c0f-a7fc-2efeb1a390d9', N'1eb4c286-5f7b-44fb-afdd-4d613e58c4fd', N'397d2980-83fc-4186-a177-fbb6c7841ce8')
INSERT [dbo].[Food] ([ProductID], [NutritionID], [OriginID]) VALUES (N'a3a91fec-ceb3-4aa5-9518-4b8c33e36075', N'80d3d6e6-f25c-4e05-88f4-1286b252e5b9', N'397d2980-83fc-4186-a177-fbb6c7841ce8')
INSERT [dbo].[Food] ([ProductID], [NutritionID], [OriginID]) VALUES (N'd79e51d6-c8ae-4fc8-85ca-ce706014214e', N'80d3d6e6-f25c-4e05-88f4-1286b252e5b9', N'397d2980-83fc-4186-a177-fbb6c7841ce8')
INSERT [dbo].[Food] ([ProductID], [NutritionID], [OriginID]) VALUES (N'eef71449-5689-4cdb-89de-f9f1afa4e328', N'97fba1c8-4aca-458c-bcc2-0fec3d780e5e', N'533e0ffa-73f0-415e-bb13-7b4581866562')
INSERT [dbo].[Material] ([MaterialID], [Name]) VALUES (N'0781070d-653a-4b02-83c6-ee1ab4575d53', N'Metal')
INSERT [dbo].[Material] ([MaterialID], [Name]) VALUES (N'5b9db3ca-ab72-4359-8575-d76ddc88f1f2', N'Rock')
INSERT [dbo].[Material] ([MaterialID], [Name]) VALUES (N'715655a9-37d6-49c1-b91d-10c70248474e', N'Wood')
INSERT [dbo].[Material] ([MaterialID], [Name]) VALUES (N'8175f2c0-ff12-4060-aef6-f7cd6ffbfb65', N'Plastic')
INSERT [dbo].[Nutrition] ([NutritionID], [Name]) VALUES (N'1eb4c286-5f7b-44fb-afdd-4d613e58c4fd', N'Protein')
INSERT [dbo].[Nutrition] ([NutritionID], [Name]) VALUES (N'80d3d6e6-f25c-4e05-88f4-1286b252e5b9', N'Carbonhydrat')
INSERT [dbo].[Nutrition] ([NutritionID], [Name]) VALUES (N'97fba1c8-4aca-458c-bcc2-0fec3d780e5e', N'Vitamin')
INSERT [dbo].[Origin] ([OriginID], [Name]) VALUES (N'397d2980-83fc-4186-a177-fbb6c7841ce8', N'Việt Nam')
INSERT [dbo].[Origin] ([OriginID], [Name]) VALUES (N'533e0ffa-73f0-415e-bb13-7b4581866562', N'Mỹ ')
INSERT [dbo].[Origin] ([OriginID], [Name]) VALUES (N'619e2cd8-6ae2-4b3c-b108-f76983ebdaba', N'Thái Lan')
INSERT [dbo].[Origin] ([OriginID], [Name]) VALUES (N'd980c475-06b2-439b-9a2a-eeef3a0bf9b7', N'Trung Quốc')
INSERT [dbo].[Pet] ([ProductID], [SizeID], [LifeSpan], [CubQuantity], [IsFurDrop], [EatingRoutine], [PetTypeID]) VALUES (N'2ef8520d-1341-4e4b-9e00-9e2b576c4080', N'9a61c2bf-362c-4600-9f85-68e77d8f4699', 5, 4, 0, 3, N'1e60b912-8769-4833-8515-efd3425fb13a')
INSERT [dbo].[Pet] ([ProductID], [SizeID], [LifeSpan], [CubQuantity], [IsFurDrop], [EatingRoutine], [PetTypeID]) VALUES (N'4dd91c0b-e826-4263-98cc-68a92099d8be', N'669ecd01-00fc-431e-b7c2-ed3f7b58971a', 12, 6, 1, 4, N'1570a2ed-b5f1-4fb8-862a-05dd34172996')
INSERT [dbo].[Pet] ([ProductID], [SizeID], [LifeSpan], [CubQuantity], [IsFurDrop], [EatingRoutine], [PetTypeID]) VALUES (N'72c9a551-6617-4085-a687-a44caf24cc96', N'669ecd01-00fc-431e-b7c2-ed3f7b58971a', 11, 6, 1, 4, N'1570a2ed-b5f1-4fb8-862a-05dd34172996')
INSERT [dbo].[Pet] ([ProductID], [SizeID], [LifeSpan], [CubQuantity], [IsFurDrop], [EatingRoutine], [PetTypeID]) VALUES (N'7c9dbf10-dc8c-453e-9c9e-6ee229ec8c12', N'de1b27a6-6af3-4f47-be6a-1e91f3fba47b', 3, 8, 1, 3, N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[Pet] ([ProductID], [SizeID], [LifeSpan], [CubQuantity], [IsFurDrop], [EatingRoutine], [PetTypeID]) VALUES (N'8199e544-9a0c-4b8a-8d10-e295f437e23d', N'9a61c2bf-362c-4600-9f85-68e77d8f4699', 5, 4, 0, 3, N'1e60b912-8769-4833-8515-efd3425fb13a')
INSERT [dbo].[Pet] ([ProductID], [SizeID], [LifeSpan], [CubQuantity], [IsFurDrop], [EatingRoutine], [PetTypeID]) VALUES (N'854227e6-e533-4ff8-a87a-50e6eb8e8977', N'de1b27a6-6af3-4f47-be6a-1e91f3fba47b', 3, 8, 1, 3, N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[Pet] ([ProductID], [SizeID], [LifeSpan], [CubQuantity], [IsFurDrop], [EatingRoutine], [PetTypeID]) VALUES (N'85533e90-36b9-4fe9-a9ae-51176945aa35', N'9a61c2bf-362c-4600-9f85-68e77d8f4699', 7, 3, 1, 3, N'061ee6c3-9092-487b-af5b-00aeafa892fa')
INSERT [dbo].[Pet] ([ProductID], [SizeID], [LifeSpan], [CubQuantity], [IsFurDrop], [EatingRoutine], [PetTypeID]) VALUES (N'b916d70c-70fe-4381-ac84-acc17d246271', N'9a61c2bf-362c-4600-9f85-68e77d8f4699', 9, 4, 1, 3, N'260f6bf0-4d11-4815-bbc5-6ffd4810faab')
INSERT [dbo].[Pet] ([ProductID], [SizeID], [LifeSpan], [CubQuantity], [IsFurDrop], [EatingRoutine], [PetTypeID]) VALUES (N'bcbfdef0-608c-4c93-b966-62d8b598894f', N'9a61c2bf-362c-4600-9f85-68e77d8f4699', 9, 4, 1, 3, N'260f6bf0-4d11-4815-bbc5-6ffd4810faab')
INSERT [dbo].[Pet] ([ProductID], [SizeID], [LifeSpan], [CubQuantity], [IsFurDrop], [EatingRoutine], [PetTypeID]) VALUES (N'be037781-24ee-4b0b-9ef0-a2285ae5b47a', N'9a61c2bf-362c-4600-9f85-68e77d8f4699', 7, 6, 1, 3, N'061ee6c3-9092-487b-af5b-00aeafa892fa')
INSERT [dbo].[Pet] ([ProductID], [SizeID], [LifeSpan], [CubQuantity], [IsFurDrop], [EatingRoutine], [PetTypeID]) VALUES (N'e76b56f0-1d82-4e17-ba1d-030b4e759be9', N'9a61c2bf-362c-4600-9f85-68e77d8f4699', 11, 5, 1, 4, N'1570a2ed-b5f1-4fb8-862a-05dd34172996')
INSERT [dbo].[Pet] ([ProductID], [SizeID], [LifeSpan], [CubQuantity], [IsFurDrop], [EatingRoutine], [PetTypeID]) VALUES (N'e78af96e-4a60-4642-bceb-b955ec6d99a2', N'de1b27a6-6af3-4f47-be6a-1e91f3fba47b', 3, 8, 1, 3, N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[PetType] ([PetTypeID], [Name]) VALUES (N'061ee6c3-9092-487b-af5b-00aeafa892fa', N'Thỏ')
INSERT [dbo].[PetType] ([PetTypeID], [Name]) VALUES (N'1570a2ed-b5f1-4fb8-862a-05dd34172996', N'Chó ')
INSERT [dbo].[PetType] ([PetTypeID], [Name]) VALUES (N'1e60b912-8769-4833-8515-efd3425fb13a', N'Bò Sát')
INSERT [dbo].[PetType] ([PetTypeID], [Name]) VALUES (N'260f6bf0-4d11-4815-bbc5-6ffd4810faab', N'Mèo')
INSERT [dbo].[PetType] ([PetTypeID], [Name]) VALUES (N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d', N'Bọ ú')
INSERT [dbo].[PetType] ([PetTypeID], [Name]) VALUES (N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d', N'Hamster')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'0cdd1337-370f-4a4b-9da2-812405be7a75', N'https://vn-test-11.slatic.net/p/8/ro-mom-cho-hinh-mo-vit-ngo-nginh-size-m-7015-00453851-d0b15b1f03b39d073e9b03090a154f75-catalog_233.jpg', N'Rọ mõm', N'rọ mõm cho chó', 120000, N'1124e4fe-0783-47ce-9cd2-9dcdc24f3d5a')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'12cb1d1d-1218-4ee2-ab96-139d4bccc63d', N'https://cdn.shopify.com/s/files/1/1371/9935/products/Pet-Dog-Cat-Bathing-Cleaner-360-Degree-Shower-Tool-Kit-Dog-Cleaning-Washing-Bath-Sprayers-Pet_1200x.jpg?v=1514815391', N'Tắm chó, mèo nhỏ', N'tắm cho chó, mèo nhỏ', 200000, N'ef2edaf8-6729-4b35-a0ed-d7f2772fc16c')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'1a529985-4bb1-4e3a-8664-3c46bb36fd08', N'http://hoangtushop.com/files/sanpham/130/1/jpg/lot-chuong-cat-sans-thom-bich-01kg.jpg', N'cát sand bi', N'cát lót hút ẩm tôt2', 20000, N'1124e4fe-0783-47ce-9cd2-9dcdc24f3d5a')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'2ef8520d-1341-4e4b-9e00-9e2b576c4080', N'http://lolipet.net/wp-content/uploads/Leopard_Gecko44.99_-89.99__54640_zoom.jpg', N'Thằn lằn', N'thằn lằn ', 410000, N'e3132056-fc09-441f-8b5c-ecccfd6e33ba')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'4dd91c0b-e826-4263-98cc-68a92099d8be', N'https://www.thukieng.com/wp-content/uploads/2017/02/ban-cho-husky-con-6-300x300.jpg', N'Husky', N'chó kéo xe ', 12000000, N'e3132056-fc09-441f-8b5c-ecccfd6e33ba')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'4e29de71-dbb6-4e6d-a2b2-01de650b4b0a', N'http://www.pet-house.com.vn/res/product/album/32423A36.JPG', N'Lồng 3 tầng', N'lồng hamster', 400000, N'1124e4fe-0783-47ce-9cd2-9dcdc24f3d5a')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'667e380f-cd0d-4e5a-80de-b625bcd7c53b', N'https://i5.walmartimages.com/asr/de239231-faea-4ff1-be16-347c9af6573b_1.7ef0d389054e74e6f4bf42f94bcd3604.jpeg?odnHeight=450&odnWidth=450&odnBg=FFFFFF', N'Đồ ăn cho Chó', N'đồ ăn cho chó', 200000, N'eef71449-5689-4cdb-89de-f9f1afa4e328')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'69f21647-453d-4f2b-9043-56688f1c92c4', N'http://www.hamsterbentre.mov.mn/files/sanpham/18/1/jpg/wheel-go-lon.jpg', N'Wheel gỗ lớn', N'bánh xe cho hamster, nhím', 160000, N'1124e4fe-0783-47ce-9cd2-9dcdc24f3d5a')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'7109903b-b73b-4a4d-8e71-8257ea720988', N'https://babblepie.files.wordpress.com/2013/02/photo31.jpg', N'Thiết kế lồng nuôi hamster', N'thiết kế lồng cho hamster', 50000, N'ef2edaf8-6729-4b35-a0ed-d7f2772fc16c')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'72c9a551-6617-4085-a687-a44caf24cc96', N'http://a57.foxnews.com/images.foxnews.com/content/fox-news/lifestyle/2018/03/08/corgi-got-fat-shamed-and-internet-could-not-handle-it/_jcr_content/par/featured_image/media-0.img.jpg/931/524/1520540975471.jpg?ve=1&tl=1&text=big-top-image', N'Corgi', N'chó mông bự ', 35000000, N'e3132056-fc09-441f-8b5c-ecccfd6e33ba')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'78567413-de81-4817-a194-260fd30c4087', N'https://cdn.shopify.com/s/files/1/1371/9935/products/Pet-Dog-Cat-Bathing-Cleaner-360-Degree-Shower-Tool-Kit-Dog-Cleaning-Washing-Bath-Sprayers-Pet_1200x.jpg?v=1514815391', N'Tắm chó lớn ', N'tắm cho chó cỡ bự', 500000, N'ef2edaf8-6729-4b35-a0ed-d7f2772fc16c')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'7c9dbf10-dc8c-453e-9c9e-6ee229ec8c12', N'https://www.petxinh.net/wp-content/uploads/2014/11/1319585093_bang.vn_hamster-winter-white-soc-13017726251370046784_574_0.jpg', N'WW ', N'winter white', 75000, N'e3132056-fc09-441f-8b5c-ecccfd6e33ba')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'8199e544-9a0c-4b8a-8d10-e295f437e23d', N'http://thegioicontrung.info/hinhanh_fckeditor/image/tac%20ke-%20chuong%20nuoi%2003.jpg', N'Tắc kè hoa', N'tắc kè đổi màu', 2000000, N'e3132056-fc09-441f-8b5c-ecccfd6e33ba')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'854227e6-e533-4ff8-a87a-50e6eb8e8977', N'https://bizweb.dktcdn.net/100/165/948/products/15977393-940114952784077-8856659676215338518-n.jpg?v=1484720393243', N'Bear mắt kính', N'bear mắt kính', 110000, N'e3132056-fc09-441f-8b5c-ecccfd6e33ba')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'85533e90-36b9-4fe9-a9ae-51176945aa35', N'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Alaska_schwarz.jpg/300px-Alaska_schwarz.jpg', N'Thỏ Đen', N'thỏ dth', 350000, N'e3132056-fc09-441f-8b5c-ecccfd6e33ba')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'886dc400-d63d-4c0f-a7fc-2efeb1a390d9', N'http://chuothamsterhanoi.com/wp-content/uploads/2015/12/sau-say-kho.png', N'Sâu rang', N'đồ ăn cho loại gặp nhấm', 20000, N'eef71449-5689-4cdb-89de-f9f1afa4e328')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'8d387990-3ecd-440c-9ee3-2a061fd5cbc9', N'http://hamstermiendathua.vn/media/k2/items/cache/8835fed4de3847a26822c5cc338a0cab_XL.jpg', N'Ống chui ', N'ống chui cho hamster', 75000, N'1124e4fe-0783-47ce-9cd2-9dcdc24f3d5a')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'99d66558-3c4b-4ce8-9163-9a7f95abf597', N'http://farm8.staticflickr.com/7160/6592388841_59758950d5.jpg', N'Lồng phi thuyền', N'lồng hamster', 799000, N'1124e4fe-0783-47ce-9cd2-9dcdc24f3d5a')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'9d3b3cbf-4c45-46ec-9ebd-8359037ff86b', N'http://hamstermiendathua.vn/media/k2/items/cache/0692a4e584defe6544ca2abbf7dd2502_XL.jpg', N'Lồng thú gặp nhấm', N'lồng cho thỏ, bọ, nhím', 550000, N'1124e4fe-0783-47ce-9cd2-9dcdc24f3d5a')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'a3a91fec-ceb3-4aa5-9518-4b8c33e36075', N'http://shophamster.com/uploads/products/20130403155535.png', N'Đồ ăn hamster loại A', N'đồ ăn cho hamster', 65000, N'eef71449-5689-4cdb-89de-f9f1afa4e328')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'aafb1ec2-13d1-4c97-ad2d-8803b856489c', N'https://www.petxinh.net/wp-content/uploads/2016/04/07a.jpg', N'cát tắm hamster', N'cát tắm cho hamster', 15000, N'1124e4fe-0783-47ce-9cd2-9dcdc24f3d5a')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'afa237d5-02bc-4859-a0e9-f791c1d690dc', N'http://chuothamsterthuanchung.com/profiles/chuothamsterthuanchungcom/uploads/attach/p1413190895_wheelchaydiabaysieutocchohamster.png', N'Wheel đĩa', N'bánh xe đĩa cho hamster', 300000, N'1124e4fe-0783-47ce-9cd2-9dcdc24f3d5a')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'b3978f1f-b3f9-4c98-a87b-94b8b8936d5d', N'https://i.ytimg.com/vi/iPCpH6z9Fmg/maxresdefault.jpg', N'Tắm hamster', N'tắm cho hamster', 50000, N'ef2edaf8-6729-4b35-a0ed-d7f2772fc16c')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'b824d3ae-e760-4527-9790-0f019103dfbc', N'http://shophamstergiare.com/wp-content/uploads/2016/04/nha-tam-tam-giac.png', N'Nhà tắm hamster', N'nhà tắm hamster', 50000, N'1124e4fe-0783-47ce-9cd2-9dcdc24f3d5a')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'b899dad4-ba98-48f5-8939-96140d6d6968', N'https://s1.storage.5giay.vn/image/2017/05/20170521_dc3a071754f6f0aacb31dfc3f375f407_1495343218.jpg', N'Chuồng chó sắt lớn ', N'chuồng chó', 600000, N'1124e4fe-0783-47ce-9cd2-9dcdc24f3d5a')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'b89bdbbc-dea5-45eb-8a69-c0825728bc67', N'https://1.bp.blogspot.com/-ulBiw4M6FYI/VlwhfsPyCBI/AAAAAAAAAKc/BISz09SaJlg/s640/binh-nuoc-chen-thuc-an-vat-dung-cho-nhim-canh-nhim-kieng-4.jpg', N'bình nước bi', N'bình nước cho thú gặp nhấm', 30000, N'1124e4fe-0783-47ce-9cd2-9dcdc24f3d5a')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'b916d70c-70fe-4381-ac84-acc17d246271', N'https://blogcachnuoi.com/wp-content/uploads/2017/08/cach-nuoi-meo-anh-long-dai-1.jpg', N'Mèo anh', N'mèo anh', 4000000, N'e3132056-fc09-441f-8b5c-ecccfd6e33ba')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'b98dc641-b8fb-4281-9e8a-5ee12f04f0ab', N'https://www.petxinh.net/wp-content/uploads/2014/07/nhimkieng-4-201405-00171.jpg', N'Nhím', N'nhím', 230000, N'e3132056-fc09-441f-8b5c-ecccfd6e33ba')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'bc28934a-cf3b-4907-8cc2-ee09cf5daac7', N'http://hamstermiendathua.vn/media/k2/items/cache/0555bbe9368a05bff51437bdc1ff702e_S.jpg', N'Đá mài răng hamster', N'đá mài răng', 15000, N'1124e4fe-0783-47ce-9cd2-9dcdc24f3d5a')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'bcbfdef0-608c-4c93-b966-62d8b598894f', N'https://www.thukieng.com/wp-content/uploads/2016/01/c%C3%A1ch-nu%C3%B4i-m%C3%A8o-ba-t%C6%B0.jpg', N'Mèo ba tư', N'mèo ba tư', 8000000, N'e3132056-fc09-441f-8b5c-ecccfd6e33ba')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'be037781-24ee-4b0b-9ef0-a2285ae5b47a', N'https://www.petxinh.net/wp-content/uploads/2017/10/21991bddc437146cf5d63b298660e4bc.jpg', N'Thỏ hà lan', N'neatherland rabit', 350000, N'e3132056-fc09-441f-8b5c-ecccfd6e33ba')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'bfd70020-46d0-43be-881a-9321f658e352', N'http://hamsterhanoi.mov.mn/files/sanpham/54/1/jpg/cat-buddy-thai.jpg', N'cát buddy lót chuồng', N'cát buddy', 50000, N'1124e4fe-0783-47ce-9cd2-9dcdc24f3d5a')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'c1f4eb4e-acff-45d4-b752-b042fae75170', N'https://1.bp.blogspot.com/-aZuuD-kIjK0/VsV_N9SqGpI/AAAAAAAABeQ/F4UQALMULjw/s640/cach-nuoi-bo-u-chuot-lang-guinea-pig-tu-a-z-1.jpg', N'Bọ ú lông ngắn', N'bọ ú lông ngắn', 650000, N'e3132056-fc09-441f-8b5c-ecccfd6e33ba')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'c2208c49-0b78-4cd9-9f27-2e114bfdbc16', N'http://hoangphucwood.vn/wp-content/uploads/2016/10/nha-go-thu-cung-chuong-cho-meo-pets-house-p4-1.jpg', N'Chuồng chó gỗ nhỏ', N'chuồng chó ', 800000, N'1124e4fe-0783-47ce-9cd2-9dcdc24f3d5a')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'c83969ea-00bd-4858-9568-a5e599bd6ce8', N'https://i.ytimg.com/vi/NqZEInKbrv8/maxresdefault.jpg', N'Bọ ú lông dài', N'bọ ú lông dài', 700000, N'e3132056-fc09-441f-8b5c-ecccfd6e33ba')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'd089f52f-ed2d-4cb1-99af-5fde7cfc5dc6', N'https://cdn.shopify.com/s/files/1/1371/9935/products/Pet-Dog-Cat-Bathing-Cleaner-360-Degree-Shower-Tool-Kit-Dog-Cleaning-Washing-Bath-Sprayers-Pet_1200x.jpg?v=1514815391', N'Tắm chó, mèo trung', N'tắm cho chó, mèo cỡ trung', 300000, N'ef2edaf8-6729-4b35-a0ed-d7f2772fc16c')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'd79e51d6-c8ae-4fc8-85ca-ce706014214e', N'http://hoangtushop.com/files/sanpham/128/1/jpg/thuc-an-cho-hamster-loai-thuong.jpg', N'Đồ ăn hamster loại B', N'đồ ăn cho hamster', 35000, N'eef71449-5689-4cdb-89de-f9f1afa4e328')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'dd17050e-1732-4011-9c67-263dea57a8c8', N'http://viennengo.net/files/upload/SAN-PHAM/MUN-CUA/MUN-CUA-06.jpg', N'mùn cưa ', N'lót chuồng', 25000, N'1124e4fe-0783-47ce-9cd2-9dcdc24f3d5a')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'e76b56f0-1d82-4e17-ba1d-030b4e759be9', N'http://cdn3-www.dogtime.com/assets/uploads/gallery/poodle-dog-breed-pictures/puppy-6.jpg', N'Poodle', N'chó thợ lăn', 7000000, N'e3132056-fc09-441f-8b5c-ecccfd6e33ba')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'e76dadd9-1b77-4efd-a128-34ca24555776', N'http://www.xaluan.com/images/news/Image/2017/06/06/25936787bafa29.img.jpg', N'Xích chó', N'xích chó', 120000, N'1124e4fe-0783-47ce-9cd2-9dcdc24f3d5a')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'e78af96e-4a60-4642-bceb-b955ec6d99a2', N'https://i.ytimg.com/vi/NWZAwpJ-ZkA/maxresdefault.jpg', N'Robo isabel', N'robo isabel', 170000, N'e3132056-fc09-441f-8b5c-ecccfd6e33ba')
INSERT [dbo].[Product] ([ProductID], [ImgUrl], [Name], [Description], [Price], [VendorID]) VALUES (N'eef71449-5689-4cdb-89de-f9f1afa4e328', N'https://img.chewy.com/is/catalog/99967_MAIN._AC_SL1500_V1462999359_.jpg', N'Đồ ăn cho Mèo ', N'đồ ăn cho mèo', 200000, N'eef71449-5689-4cdb-89de-f9f1afa4e328')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'0cdd1337-370f-4a4b-9da2-812405be7a75', N'1570a2ed-b5f1-4fb8-862a-05dd34172996')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'12cb1d1d-1218-4ee2-ab96-139d4bccc63d', N'1570a2ed-b5f1-4fb8-862a-05dd34172996')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'12cb1d1d-1218-4ee2-ab96-139d4bccc63d', N'260f6bf0-4d11-4815-bbc5-6ffd4810faab')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'1a529985-4bb1-4e3a-8664-3c46bb36fd08', N'061ee6c3-9092-487b-af5b-00aeafa892fa')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'1a529985-4bb1-4e3a-8664-3c46bb36fd08', N'260f6bf0-4d11-4815-bbc5-6ffd4810faab')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'1a529985-4bb1-4e3a-8664-3c46bb36fd08', N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'1a529985-4bb1-4e3a-8664-3c46bb36fd08', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'2ef8520d-1341-4e4b-9e00-9e2b576c4080', N'1e60b912-8769-4833-8515-efd3425fb13a')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'4dd91c0b-e826-4263-98cc-68a92099d8be', N'1570a2ed-b5f1-4fb8-862a-05dd34172996')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'4e29de71-dbb6-4e6d-a2b2-01de650b4b0a', N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'4e29de71-dbb6-4e6d-a2b2-01de650b4b0a', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'667e380f-cd0d-4e5a-80de-b625bcd7c53b', N'1570a2ed-b5f1-4fb8-862a-05dd34172996')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'69f21647-453d-4f2b-9043-56688f1c92c4', N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'69f21647-453d-4f2b-9043-56688f1c92c4', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'7109903b-b73b-4a4d-8e71-8257ea720988', N'061ee6c3-9092-487b-af5b-00aeafa892fa')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'7109903b-b73b-4a4d-8e71-8257ea720988', N'1e60b912-8769-4833-8515-efd3425fb13a')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'7109903b-b73b-4a4d-8e71-8257ea720988', N'260f6bf0-4d11-4815-bbc5-6ffd4810faab')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'7109903b-b73b-4a4d-8e71-8257ea720988', N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'7109903b-b73b-4a4d-8e71-8257ea720988', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'72c9a551-6617-4085-a687-a44caf24cc96', N'1570a2ed-b5f1-4fb8-862a-05dd34172996')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'78567413-de81-4817-a194-260fd30c4087', N'1570a2ed-b5f1-4fb8-862a-05dd34172996')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'7c9dbf10-dc8c-453e-9c9e-6ee229ec8c12', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'8199e544-9a0c-4b8a-8d10-e295f437e23d', N'1e60b912-8769-4833-8515-efd3425fb13a')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'854227e6-e533-4ff8-a87a-50e6eb8e8977', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'85533e90-36b9-4fe9-a9ae-51176945aa35', N'061ee6c3-9092-487b-af5b-00aeafa892fa')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'886dc400-d63d-4c0f-a7fc-2efeb1a390d9', N'1e60b912-8769-4833-8515-efd3425fb13a')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'886dc400-d63d-4c0f-a7fc-2efeb1a390d9', N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'886dc400-d63d-4c0f-a7fc-2efeb1a390d9', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'8d387990-3ecd-440c-9ee3-2a061fd5cbc9', N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'8d387990-3ecd-440c-9ee3-2a061fd5cbc9', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'99d66558-3c4b-4ce8-9163-9a7f95abf597', N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'99d66558-3c4b-4ce8-9163-9a7f95abf597', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'9d3b3cbf-4c45-46ec-9ebd-8359037ff86b', N'061ee6c3-9092-487b-af5b-00aeafa892fa')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'9d3b3cbf-4c45-46ec-9ebd-8359037ff86b', N'1e60b912-8769-4833-8515-efd3425fb13a')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'9d3b3cbf-4c45-46ec-9ebd-8359037ff86b', N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'9d3b3cbf-4c45-46ec-9ebd-8359037ff86b', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'a3a91fec-ceb3-4aa5-9518-4b8c33e36075', N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'a3a91fec-ceb3-4aa5-9518-4b8c33e36075', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'aafb1ec2-13d1-4c97-ad2d-8803b856489c', N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'aafb1ec2-13d1-4c97-ad2d-8803b856489c', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'afa237d5-02bc-4859-a0e9-f791c1d690dc', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'b3978f1f-b3f9-4c98-a87b-94b8b8936d5d', N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'b3978f1f-b3f9-4c98-a87b-94b8b8936d5d', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'b824d3ae-e760-4527-9790-0f019103dfbc', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'b899dad4-ba98-48f5-8939-96140d6d6968', N'1570a2ed-b5f1-4fb8-862a-05dd34172996')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'b89bdbbc-dea5-45eb-8a69-c0825728bc67', N'061ee6c3-9092-487b-af5b-00aeafa892fa')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'b89bdbbc-dea5-45eb-8a69-c0825728bc67', N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'b89bdbbc-dea5-45eb-8a69-c0825728bc67', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'b916d70c-70fe-4381-ac84-acc17d246271', N'260f6bf0-4d11-4815-bbc5-6ffd4810faab')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'bc28934a-cf3b-4907-8cc2-ee09cf5daac7', N'061ee6c3-9092-487b-af5b-00aeafa892fa')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'bc28934a-cf3b-4907-8cc2-ee09cf5daac7', N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'bc28934a-cf3b-4907-8cc2-ee09cf5daac7', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'bcbfdef0-608c-4c93-b966-62d8b598894f', N'260f6bf0-4d11-4815-bbc5-6ffd4810faab')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'be037781-24ee-4b0b-9ef0-a2285ae5b47a', N'061ee6c3-9092-487b-af5b-00aeafa892fa')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'bfd70020-46d0-43be-881a-9321f658e352', N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'bfd70020-46d0-43be-881a-9321f658e352', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'c1f4eb4e-acff-45d4-b752-b042fae75170', N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'c2208c49-0b78-4cd9-9f27-2e114bfdbc16', N'1570a2ed-b5f1-4fb8-862a-05dd34172996')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'c83969ea-00bd-4858-9568-a5e599bd6ce8', N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'd089f52f-ed2d-4cb1-99af-5fde7cfc5dc6', N'1570a2ed-b5f1-4fb8-862a-05dd34172996')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'd089f52f-ed2d-4cb1-99af-5fde7cfc5dc6', N'260f6bf0-4d11-4815-bbc5-6ffd4810faab')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'd79e51d6-c8ae-4fc8-85ca-ce706014214e', N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'd79e51d6-c8ae-4fc8-85ca-ce706014214e', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'dd17050e-1732-4011-9c67-263dea57a8c8', N'b1b937de-c60d-48e8-a7ad-a7121d9e4d8d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'e76b56f0-1d82-4e17-ba1d-030b4e759be9', N'1570a2ed-b5f1-4fb8-862a-05dd34172996')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'e76dadd9-1b77-4efd-a128-34ca24555776', N'1570a2ed-b5f1-4fb8-862a-05dd34172996')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'e78af96e-4a60-4642-bceb-b955ec6d99a2', N'fe87aac0-4b9b-4a42-8d7a-f5652e49613d')
INSERT [dbo].[ProductForPetType] ([ProductID], [PetTypeID]) VALUES (N'eef71449-5689-4cdb-89de-f9f1afa4e328', N'260f6bf0-4d11-4815-bbc5-6ffd4810faab')
INSERT [dbo].[Service] ([ProductID], [StartDayOfWeek], [EndDayOfWeek], [StartHour], [EndHour]) VALUES (N'12cb1d1d-1218-4ee2-ab96-139d4bccc63d', 0, 6, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time))
INSERT [dbo].[Service] ([ProductID], [StartDayOfWeek], [EndDayOfWeek], [StartHour], [EndHour]) VALUES (N'7109903b-b73b-4a4d-8e71-8257ea720988', 0, 6, CAST(N'08:00:00' AS Time), CAST(N'17:00:00' AS Time))
INSERT [dbo].[Service] ([ProductID], [StartDayOfWeek], [EndDayOfWeek], [StartHour], [EndHour]) VALUES (N'78567413-de81-4817-a194-260fd30c4087', 0, 6, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time))
INSERT [dbo].[Service] ([ProductID], [StartDayOfWeek], [EndDayOfWeek], [StartHour], [EndHour]) VALUES (N'b3978f1f-b3f9-4c98-a87b-94b8b8936d5d', 0, 6, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time))
INSERT [dbo].[Service] ([ProductID], [StartDayOfWeek], [EndDayOfWeek], [StartHour], [EndHour]) VALUES (N'd089f52f-ed2d-4cb1-99af-5fde7cfc5dc6', 0, 6, CAST(N'08:00:00' AS Time), CAST(N'20:00:00' AS Time))
INSERT [dbo].[Size] ([SizeID], [Name]) VALUES (N'669ecd01-00fc-431e-b7c2-ed3f7b58971a', N'Lớn')
INSERT [dbo].[Size] ([SizeID], [Name]) VALUES (N'9a61c2bf-362c-4600-9f85-68e77d8f4699', N'Trung bình')
INSERT [dbo].[Size] ([SizeID], [Name]) VALUES (N'de1b27a6-6af3-4f47-be6a-1e91f3fba47b', N'Nhỏ')
SET IDENTITY_INSERT [dbo].[sysdiagrams] ON 

INSERT [dbo].[sysdiagrams] ([name], [principal_id], [diagram_id], [version], [definition]) VALUES (N'DBDiagram', 1, 1, 1, 0xD0CF11E0A1B11AE1000000000000000000000000000000003E000300FEFF0900060000000000000000000000010000000100000000000000001000004200000001000000FEFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFF44000000030000000400000005000000060000000700000008000000090000000A0000000B0000000C0000000D0000000E0000000F00000010000000FEFFFFFF12000000130000001400000015000000160000001700000018000000190000001A0000001B0000001C0000001D0000001E0000001F000000200000002100000022000000230000002400000025000000260000002700000028000000290000002A0000002B0000002C0000002D0000002E0000002F000000300000003100000032000000330000003400000035000000360000003700000038000000390000003A0000003B0000003C0000003D0000003E0000003F0000004000000041000000FEFFFFFFFEFFFFFF6C000000FEFFFFFF460000004700000048000000490000004A0000004B0000004C0000004D0000004E0000004F000000500000005100000052000000530000005400000055000000560000005700000058000000590000005A0000005B0000005C0000005D0000005E0000005F000000600000006100000062000000630000006400000065000000660000006700000068000000690000006A0000006B000000FEFFFFFF6D0000006E0000006F000000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52006F006F007400200045006E00740072007900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000016000500FFFFFFFFFFFFFFFF020000000000000000000000000000000000000000000000000000000000000010BF434128DBD3014300000040080000000000006600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000201FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000020000005A1D0000000000006F000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040002010100000004000000FFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000110000001460000000000000010043006F006D0070004F0062006A0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000012000201FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000000000005F00000000000000000430000A1E100C05000080680000000F00FFFF68000000007D00005D830000F23B00008EDD0000B374010041D2FFFF1FECFFFFDE805B10F195D011B0A000AA00BDCB5C000008003000000000020000030000003C006B0000000900000000000000D9E6B0E91C81D011AD5100A0C90F5739F43B7F847F61C74385352986E1D552F8A0327DB2D86295428D98273C25A2DA2D00002800430000000000000053444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C00002800430000000000000051444DD2011FD1118E63006097D2DF4834C9D2777977D811907000065B840D9C5C000000681C000000DC011500003400A509000007000080010000009A020000008000000A0000805363684772696400903300002E1C010041757468202864626F29000000003800A50900000700008002000000A2020000008000000E0000805363684772696400EC1300008E250100456D706C6F796565202864626F29000000003800A50900000700008003000000A0020000008000000D0000805363684772696400EC1300003C3B0100456D70526F6C65202864626F2909000000003800A50900000700008004000000A0020000008000000D00008053636847726964009033000064C80000496E766F696365202864626F2909000000003C00A50900000700008005000000AE0200000080000014000080536368477269640090330000AEAB0000496E766F69636544657461696C73202864626F2900003400A509000007000080060000009E020000008000000C000080536368477269640078D3FFFF36F7FFFF506F6C696379202864626F2900003800A50900000700008007000000A0020000008000000D000080536368477269640090330000EE2E010053657373696F6E202864626F2909000000003400A509000007000080090000009A020000008000000A0000805363684772696400903300006AE0000055736572202864626F29000000003800A5090000070000800A000000A4020000008000000F0000805363684772696400CA5300002E1C010055736572506F696E74202864626F290000004000A5090000070000800B000000B202000000800000160000805363684772696400CA53000008E8000055736572506F696E74486973746F7279202864626F29000000008000A50900000700008010000000520000000180000055000080436F6E74726F6C00771D0000EB2E010052656C6174696F6E736869702027464B5F456D706C6F7965655F456D70526F6C65202864626F2927206265747765656E2027456D70526F6C65202864626F292720616E642027456D706C6F796565202864626F292700000000002800B50100000700008011000000310000005900000002800000436F6E74726F6C00BD1F0000C535010000007800A5090000070000801200000062000000018000004F000080436F6E74726F6C0048290000471F010052656C6174696F6E736869702027464B5F456D706C6F7965655F41757468202864626F2927206265747765656E202741757468202864626F292720616E642027456D706C6F796565202864626F29270000002800B50100000700008013000000310000005300000002800000436F6E74726F6C001B2700009526010000007000A50900000700008014000000620000000180000047000080436F6E74726F6C005A3C000038FA000052656C6174696F6E736869702027464B5F557365725F41757468202864626F2927206265747765656E202741757468202864626F292720616E64202755736572202864626F29270000002800B50100000700008015000000310000004B00000002800000436F6E74726F6C00353E00003B0B010000007800A5090000070000801700000052000000018000004D000080436F6E74726F6C001B3D00003CD4000052656C6174696F6E736869702027464B5F496E766F6963655F55736572202864626F2927206265747765656E202755736572202864626F292720616E642027496E766F696365202864626F292700000000002800B50100000700008018000000310000005100000002800000436F6E74726F6C00613F0000B1DD000000008C00A50900000700008019000000520000000180000061000080436F6E74726F6C001B3D00007CBC000052656C6174696F6E736869702027464B5F496E766F69636544657461696C735F496E766F696365202864626F2927206265747765656E2027496E766F696365202864626F292720616E642027496E766F69636544657461696C73202864626F292700000000002800B5010000070000801A000000310000006500000002800000436F6E74726F6C00613F00002CC1000000007C00A5090000070000801B000000620000000180000051000080436F6E74726F6C00B13D0000ADF8000052656C6174696F6E736869702027464B5F55736572506F696E745F55736572202864626F2927206265747765656E202755736572202864626F292720616E64202755736572506F696E74202864626F292705000000002800B5010000070000801C000000310000005500000002800000436F6E74726F6C00EE3600009819010000008800A5090000070000801D00000052000000018000005F000080436F6E74726F6C00EC4800004DEC000052656C6174696F6E736869702027464B5F55736572506F696E74486973746F72795F55736572202864626F2927206265747765656E202755736572202864626F292720616E64202755736572506F696E74486973746F7279202864626F29270000002800B5010000070000801E000000310000006300000002800000436F6E74726F6C001A49000093EE000000007800A5090000070000801F00000052000000018000004D000080436F6E74726F6C001B3D00001423010052656C6174696F6E736869702027464B5F53657373696F6E5F41757468202864626F2927206265747765656E202741757468202864626F292720616E64202753657373696F6E202864626F2927004F0000002800B50100000700008020000000310000005100000002800000436F6E74726F6C00AA340000B029010000003C00A50900000700008021000000A802000000800000110000805363684772696400EC130000A8DE00004F6E6C696E654F72646572202864626F29626F2900004000A50900000700008022000000B6020000008000001800008053636847726964001CF3FFFF08E800004F6E6C696E654F7264657250726F64756374202864626F2900003800A50900000700008023000000A0020000008000000D0000805363684772696400FA320000D06B000050726F64756374202864626F2909000000004000A50900000700008024000000B6020000008000001800008053636847726964005613000090C90000536572766963654F6E6C696E654F72646572202864626F2900003400A509000007000080250000009E020000008000000C0000805363684772696400EC13000080060100537461747573202864626F2900003400A509000007000080270000009E020000008000000C0000805363684772696400345300008070000056656E646F72202864626F2900008000A50900000700008028000000520000000180000055000080436F6E74726F6C00472900004DEC000052656C6174696F6E736869702027464B5F4F6E6C696E654F726465725F55736572202864626F2927206265747765656E202755736572202864626F292720616E6420274F6E6C696E654F72646572202864626F292700000000002800B50100000700008029000000310000005900000002800000436F6E74726F6C00A0280000DDEB000000009C00A5090000070000802A000000520000000180000071000080436F6E74726F6C004C0900004DEC000052656C6174696F6E736869702027464B5F4F6E6C696E654F7264657250726F647563745F4F6E6C696E654F72646572202864626F2927206265747765656E20274F6E6C696E654F72646572202864626F292720616E6420274F6E6C696E654F7264657250726F64756374202864626F292700000000002800B5010000070000802B000000310000007500000002800000436F6E74726F6C003A050000DDEB000000009400A5090000070000802C000000620000000180000069000080436F6E74726F6C0059FDFFFFA27C000052656C6174696F6E736869702027464B5F4F6E6C696E654F7264657250726F647563745F50726F64756374202864626F2927206265747765656E202750726F64756374202864626F292720616E6420274F6E6C696E654F7264657250726F64756374202864626F292700000000002800B5010000070000802D000000310000006D00000002800000436F6E74726F6C007B01000084A7000000009C00A5090000070000802F000000520000000180000071000080436F6E74726F6C00771D00007CD4000052656C6174696F6E736869702027464B5F536572766963654F6E6C696E654F726465725F4F6E6C696E654F72646572202864626F2927206265747765656E20274F6E6C696E654F72646572202864626F292720616E642027536572766963654F6E6C696E654F72646572202864626F292700000000002800B50100000700008030000000310000007500000002800000436F6E74726F6C00BD1F00007CD9000000007C00A50900000700008031000000520000000180000051000080436F6E74726F6C00564800002F74000052656C6174696F6E736869702027464B5F50726F647563745F56656E646F72202864626F2927206265747765656E202756656E646F72202864626F292720616E64202750726F64756374202864626F2927626F2900002800B50100000700008032000000310000005500000002800000436F6E74726F6C0001490000BF73000000008400A50900000700008033000000520000000180000059000080436F6E74726F6C00771D000034FA000052656C6174696F6E736869702027464B5F4F6E6C696E654F726465725F537461747573202864626F2927206265747765656E2027537461747573202864626F292720616E6420274F6E6C696E654F72646572202864626F292700000000002800B50100000700008034000000310000005D00000002800000436F6E74726F6C00BD1F00000B01010000003800A50900000700008035000000A4020000008000000F000080536368477269640084030000A84800004163636573736F7279202864626F290000003400A509000007000080360000009A020000008000000A000080536368477269640056130000CC8D000043616765202864626F29000000003400A509000007000080370000009A020000008000000A000080536368477269640078D3FFFF40830000466F6F64202864626F29000000003800A50900000700008038000000A2020000008000000E000080536368477269640084030000066300004D6174657269616C202864626F29000000003800A50900000700008039000000A4020000008000000F000080536368477269640078D3FFFFEE9800004E7574726974696F6E202864626F290000003400A5090000070000803A0000009E020000008000000C000080536368477269640078D3FFFF807000004F726967696E202864626F2900003400A5090000070000803B00000098020000008000000900008053636847726964006243000016260000506574202864626F2920286400003800A5090000070000803C000000A0020000008000000D0000805363684772696400282300009222000050657454797065202864626F2909000000003800A5090000070000803E000000A0020000008000000D00008053636847726964006E730000AEAB000053657276696365202864626F2909000000003400A5090000070000803F0000009A020000008000000A000080536368477269640062430000C012000053697A65202864626F29000000003400A5090000070000804000000098020000008000000900008053636847726964001CF3FFFFC6750000546F79202864626F2900000000008000A50900000700008042000000620000000180000057000080436F6E74726F6C00E01800004650000052656C6174696F6E736869702027464B5F4163636573736F72795F50726F64756374202864626F2927206265747765656E202750726F64756374202864626F292720616E6420274163636573736F7279202864626F29270000002800B50100000700008043000000310000005B00000002800000436F6E74726F6C008D2C0000C35A000000007800A5090000070000804400000062000000018000004D000080436F6E74726F6C00D4E8FFFFC574000052656C6174696F6E736869702027464B5F466F6F645F50726F64756374202864626F2927206265747765656E202750726F64756374202864626F292720616E642027466F6F64202864626F292700000000002800B50100000700008045000000310000005100000002800000436F6E74726F6C00CB1000001587000000007800A5090000070000804600000062000000018000004D000080436F6E74726F6C00B22800008776000052656C6174696F6E736869702027464B5F436167655F50726F64756374202864626F2927206265747765656E202750726F64756374202864626F292720616E64202743616765202864626F29273C716400002800B50100000700008047000000310000005100000002800000436F6E74726F6C00E8220000D57D000000007400A5090000070000804800000062000000018000004B000080436F6E74726F6C001B3D0000EE3A000052656C6174696F6E736869702027464B5F5065745F50726F64756374202864626F2927206265747765656E202750726F64756374202864626F292720616E642027506574202864626F29272900002800B50100000700008049000000310000004F00000002800000436F6E74726F6C00613F0000A64E000000007C00A5090000070000804A000000620000000180000053000080436F6E74726F6C001B3D0000A27C000052656C6174696F6E736869702027464B5F536572766963655F50726F64756374202864626F2927206265747765656E202750726F64756374202864626F292720616E64202753657276696365202864626F29272900002800B5010000070000804B000000310000005700000002800000436F6E74726F6C001A3F00003AAA000000007400A5090000070000804C00000062000000018000004B000080436F6E74726F6C00780800000373000052656C6174696F6E736869702027464B5F546F795F50726F64756374202864626F2927206265747765656E202750726F64756374202864626F292720616E642027546F79202864626F29276400002800B5010000070000804D000000310000004F00000002800000436F6E74726F6C00791B0000C77A000000007800A5090000070000804E00000062000000018000004D000080436F6E74726F6C00C3FCFFFFEC69000052656C6174696F6E736869702027464B5F546F795F4D6174657269616C202864626F2927206265747765656E20274D6174657269616C202864626F292720616E642027546F79202864626F29270A008000002800B5010000070000804F000000310000005100000002800000436F6E74726F6C00B4FEFFFFB771000000007800A5090000070000805000000062000000018000004F000080436F6E74726F6C00A50D0000EC69000052656C6174696F6E736869702027464B5F436167655F4D6174657269616C202864626F2927206265747765656E20274D6174657269616C202864626F292720616E64202743616765202864626F29276400002800B50100000700008051000000310000005300000002800000436F6E74726F6C00FC1300002376000000008400A50900000700008052000000520000000180000059000080436F6E74726F6C000F0D0000FB56000052656C6174696F6E736869702027464B5F4163636573736F72795F4D6174657269616C202864626F2927206265747765656E20274D6174657269616C202864626F292720616E6420274163636573736F7279202864626F292700000000002800B50100000700008053000000310000005D00000002800000436F6E74726F6C00550F0000CF5E000000007C00A50900000700008054000000520000000180000051000080436F6E74726F6C0003DDFFFF9D8C000052656C6174696F6E736869702027464B5F466F6F645F4E7574726974696F6E202864626F2927206265747765656E20274E7574726974696F6E202864626F292720616E642027466F6F64202864626F292729272900002800B50100000700008055000000310000005500000002800000436F6E74726F6C0049DFFFFF7793000000007400A5090000070000805600000052000000018000004B000080436F6E74726F6C0003DDFFFF6677000052656C6174696F6E736869702027464B5F466F6F645F4F726967696E202864626F2927206265747765656E20274F726967696E202864626F292720616E642027466F6F64202864626F29272900002800B50100000700008057000000310000004F00000002800000436F6E74726F6C005CD5FFFF027E000000007400A5090000070000805800000062000000018000004B000080436F6E74726F6C00D4E8FFFF5B75000052656C6174696F6E736869702027464B5F436167655F4F726967696E202864626F2927206265747765656E20274F726967696E202864626F292720616E64202743616765202864626F29270000002800B50100000700008059000000310000004F00000002800000436F6E74726F6C000DE7FFFF4C96000000008000A5090000070000805A000000620000000180000055000080436F6E74726F6C00D4E8FFFFF74F000052656C6174696F6E736869702027464B5F4163636573736F72795F4F726967696E202864626F2927206265747765656E20274F726967696E202864626F292720616E6420274163636573736F7279202864626F292700000000002800B5010000070000805B000000310000005900000002800000436F6E74726F6C00CBF1FFFF6666000000007400A5090000070000805C000000620000000180000049000080436F6E74726F6C00D4E8FFFF9973000052656C6174696F6E736869702027464B5F546F795F4F726967696E202864626F2927206265747765656E20274F726967696E202864626F292720616E642027546F79202864626F2927007D0000002800B5010000070000805D000000310000004D00000002800000436F6E74726F6C00CBF1FFFF6A74000000007400A5090000070000805E00000052000000018000004B000080436F6E74726F6C0084380000AB25000052656C6174696F6E736869702027464B5F5065745F50657454797065202864626F2927206265747765656E202750657454797065202864626F292720616E642027506574202864626F29272900002800B5010000070000805F000000310000004F00000002800000436F6E74726F6C00073A0000F127000000004000A50900000700008062000000B402000000800000170000805363684772696400282300005235000050726F64756374466F7250657454797065202864626F290000009000A50900000700008063000000520000000180000067000080436F6E74726F6C00B32C00007829000052656C6174696F6E736869702027464B5F50726F64756374466F72506574547970655F50657454797065202864626F2927206265747765656E202750657454797065202864626F292720616E64202750726F64756374466F7250657454797065202864626F29273F00002800B50100000700008064000000310000006B00000002800000436F6E74726F6C00EC1B00001430000000009000A50900000700008065000000620000000180000067000080436F6E74726F6C00CF2C0000343C000052656C6174696F6E736869702027464B5F50726F64756374466F72506574547970655F50726F64756374202864626F2927206265747765656E202750726F64756374202864626F292720616E64202750726F64756374466F7250657454797065202864626F29270000002800B50100000700008066000000310000006B00000002800000436F6E74726F6C00421C00001A40000000007000A50900000700008067000000520000000180000045000080436F6E74726F6C00ED4C0000A619000052656C6174696F6E736869702027464B5F5065745F53697A65202864626F2927206265747765656E202753697A65202864626F292720616E642027506574202864626F292700000000002800B50100000700008068000000310000004900000002800000436F6E74726F6C00304700008D200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002143341208000000881600009D090000785634120700000014010000410075007400680020002800640062006F0029000000563FDCDB5B3FEAE9693F0000803F0000803FD7D6563FDCDB5B3FEAE9693F0000803FACD21C0EACD21C0EB8D21C0EB8D21C0EC4D21C0EC4D21C0ED0D21C0ED0D21C0EDCD21C0EDCD21C0EE8D21C0EE8D21C0EF4D21C0EF4D21C0E00D31C0E00D31C0E0CD31C0E0CD31C0E18D31C0E18D31C0E24D31C0E24D31C0E30D31C0E30D31C0E3CD31C0E3CD31C0E48D31C0E48D31C0E54D31C0E54D31C0E60D31C0E60D31C0E6CD31C0E6CD31C0E78D31C0E78D31C0E84D31C0E84D31C0E90D31C0E90D31C0E9CD31C0E9CD31C0EA8D31C0EA8D31C0EB4D31C0EB4D3000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600009D09000000000000020000000200000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005200000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000500000041007500740068000000214334120800000088160000180C000078563412070000001401000045006D0070006C006F0079006500650020002800640062006F00290000002E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000180C000000000000030000000300000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000900000045006D0070006C006F0079006500650000002143341208000000881600009D09000078563412070000001401000045006D00700052006F006C00650020002800640062006F002900000065722E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600009D09000000000000020000000200000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000800000045006D00700052006F006C0065000000214334120800000088160000930E000078563412070000001401000049006E0076006F0069006300650020002800640062006F002900000065722E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000930E000000000000040000000400000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000800000049006E0076006F0069006300650000002143341208000000881600008913000078563412070000001401000049006E0076006F00690063006500440065007400610069006C00730020002800640062006F002900000044617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000022290000AB170000000000002D010000080000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600008913000000000000060000000600000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000F00000049006E0076006F00690063006500440065007400610069006C0073000000214334120800000088160000180C000078563412070000001401000050006F006C0069006300790020002800640062006F0029000000727665722E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000180C000000000000030000000300000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000700000050006F006C006900630079000000214334120800000088160000180C0000785634120700000014010000530065007300730069006F006E0020002800640062006F002900000065722E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000180C000000000000030000000300000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000008000000530065007300730069006F006E000000214334120800000088160000FA1A0000785634120700000014010000550073006500720020002800640062006F0029000000716C5365727665722E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C000000340000000000000000000000222900007D1E0000000000002D0100000B0000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000FA1A000000000000090000000900000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005200000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000005000000550073006500720000002143341208000000881600009D090000785634120700000014010000550073006500720050006F0069006E00740020002800640062006F00290000002000460069006C00650073002000280078003800360029002F004D006900630072006F0073006F00660074002000530051004C0020005300650072007600650072002F003100340030002F0054006F006F006C0073002F00420069006E006E002F004D0061006E006100670065006D0065006E007400530074007500640069006F002F0045007800740065006E00730069006F006E0073002F004100700070006C00690063006100740069006F006E002F004D006900630072006F0073006F00660074002E00530071006C005300000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600009D09000000000000020000000200000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000A000000550073006500720050006F0069006E0074000000214334120800000088160000180C0000785634120700000014010000550073006500720050006F0069006E00740048006900730074006F007200790020002800640062006F0029000000280078003800360029002F004D006900630072006F0073006F00660074002000530051004C0020005300650072007600650072002F003100340030002F0054006F006F006C0073002F00420069006E006E002F004D0061006E006100670065006D0065006E007400530074007500640069006F002F004900440045002F00500072006900760061007400650041007300730065006D0062006C006900650073002F004D006900630072006F0073006F00660074002E00530071006C0053006500000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000180C000000000000030000000300000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000011000000550073006500720050006F0069006E00740048006900730074006F0072007900000002000B000E1F00003C3B01000E1F0000A63101000000000002000000F0F0F00000000000000000000000000000000000010000001100000000000000BD1F0000C5350100810C00005801000032000000010000020000810C000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61130046004B005F0045006D0070006C006F007900650065005F0045006D00700052006F006C00650004000B0090330000DE20010044320000DE200100443200006A2B0100742A00006A2B01000200000002000000F0F0F000000000000000000000000000000000000100000013000000000000001B270000952601007A0A0000580100002E0000000100000200007A0A000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61100046004B005F0045006D0070006C006F007900650065005F00410075007400680004000B00B23E00002E1C0100B23E00009D190100863D00009D190100863D000064FB00000200000002000000F0F0F00000000000000000000000000000000000010000001500000000000000353E00003B0B0100C60700005801000032000000010000020000C607000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D610C0046004B005F0055007300650072005F00410075007400680002000B00B23E00006AE00000B23E0000F7D600000000000002000000F0F0F00000000000000000000000000000000000010000001800000000000000613F0000B1DD00001F09000058010000110000000100000200001F09000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D610F0046004B005F0049006E0076006F006900630065005F00550073006500720002000B00B23E000064C80000B23E000037BF00000000000002000000F0F0F00000000000000000000000000000000000010000001A00000000000000613F00002CC10000320E0000580100004B000000010000020000320E000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61190046004B005F0049006E0076006F00690063006500440065007400610069006C0073005F0049006E0076006F0069006300650004000B00483F000064FB0000483F0000E9180100EC5E0000E9180100EC5E00002E1C01000200000002000000F0F0F00000000000000000000000000000000000010000001C00000000000000EE360000981901005D0A000058010000320000000100000200005D0A000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61110046004B005F00550073006500720050006F0069006E0074005F00550073006500720002000B00184A0000E4ED0000CA530000E4ED00000000000002000000F0F0F00000000000000000000000000000000000010000001E000000000000001A49000093EE0000320E00005801000016000000010000020000320E000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61180046004B005F00550073006500720050006F0069006E00740048006900730074006F00720079005F00550073006500720002000B00B23E0000CB250100B23E0000EE2E01000000000002000000F0F0F00000000000000000000000000000000000010000002000000000000000AA340000B02901005909000058010000320000000100000200005909000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D610F0046004B005F00530065007300730069006F006E005F004100750074006800214334120800000087160000471E00007856341207000000140100004F006E006C0069006E0065004F00720064006500720020002800640062006F0029000000656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000009230000000000002D0100000D0000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000087160000471E0000000000000B0000000B00000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000C0000004F006E006C0069006E0065004F007200640065007200000021433412080000005C170000180C00007856341207000000140100004F006E006C0069006E0065004F007200640065007200500072006F00640075006300740020002800640062006F0029000000735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB0700005505000000000000010000005C170000180C000000000000030000000300000002000000020000001C0100006D0B0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006E00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000130000004F006E006C0069006E0065004F007200640065007200500072006F006400750063007400000021433412080000008816000089130000785634120700000014010000500072006F00640075006300740020002800640062006F0029000000000000000000000000000000000000000000000000000000000000000000000000000000000000001F73C33A002F0080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000022290000AB170000000000002D010000080000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600008913000000000000060000000600000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000008000000500072006F00640075006300740000002143341208000000D8160000180C000078563412070000001401000053006500720076006900630065004F006E006C0069006E0065004F00720064006500720020002800640062006F0029000000693F0000803F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001A72C63900380080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000D8160000180C000000000000030000000300000002000000020000001C010000220B00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006E00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000001300000053006500720076006900630065004F006E006C0069006E0065004F0072006400650072000000214334120800000088160000180C000078563412070000001401000053007400610074007500730020002800640062006F00290000005B3FEAE9693F0000803F0000803FD7D6563FDCDB5B3FEAE9693F0000803F0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000AD729D390035008000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000180C000000000000030000000300000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000700000053007400610074007500730000002143341208000000881600009D090000785634120700000014010000560065006E0064006F00720020002800640062006F0029000000727665722E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600009D09000000000000020000000200000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000007000000560065006E0064006F007200000002000B0090330000E4ED0000732A0000E4ED00000000000002000000F0F0F00000000000000000000000000000000000010000002900000000000000A0280000DDEB0000B70B0000580100001E000000010000020000B70B000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61130046004B005F004F006E006C0069006E0065004F0072006400650072005F00550073006500720002000B00EC130000E4ED0000780A0000E4ED00000000000002000000F0F0F00000000000000000000000000000000000010000002B000000000000003A050000DDEB0000F01300005801000032000000010000020000F013000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61210046004B005F004F006E006C0069006E0065004F007200640065007200500072006F0064007500630074005F004F006E006C0069006E0065004F00720064006500720004000B00F03C0000597F0000F03C00008BA90000D4FEFFFF8BA90000D4FEFFFF08E800000000000002000000F0F0F00000000000000000000000000000000000010000002D000000000000007B01000084A700009311000058010000320000000100000200009311000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D611D0046004B005F004F006E006C0069006E0065004F007200640065007200500072006F0064007500630074005F00500072006F00640075006300740002000B000E1F0000A8DE00000E1F0000A8D500000200000002000000F0F0F00000000000000000000000000000000000010000003000000000000000BD1F00007CD90000B61300005801000032000000010000020000B613000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61210046004B005F0053006500720076006900630065004F006E006C0069006E0065004F0072006400650072005F004F006E006C0069006E0065004F00720064006500720002000B0034530000C675000082490000C67500000000000002000000F0F0F0000000000000000000000000000000000001000000320000000000000001490000BF730000B40A00005801000032000000010000020000B40A000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61110046004B005F00500072006F0064007500630074005F00560065006E0064006F00720002000B000E1F0000800601000E1F0000EFFC00000000000002000000F0F0F00000000000000000000000000000000000010000003400000000000000BD1F00000B010100BB0C00005801000032000000010000020000BB0C000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61150046004B005F004F006E006C0069006E0065004F0072006400650072005F005300740061007400750073002143341208000000881600000E1100007856341207000000140100004100630063006500730073006F007200790020002800640062006F0029000000616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000E11000000000000050000000500000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000A0000004100630063006500730073006F0072007900000021433412080000008816000089130000785634120700000014010000430061006700650020002800640062006F0029000000716C5365727665722E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000022290000AB170000000000002D010000080000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600008913000000000000060000000600000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005200000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000500000043006100670065000000214334120800000088160000180C000078563412070000001401000046006F006F00640020002800640062006F0029000000716C5365727665722E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000180C000000000000030000000300000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005200000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000500000046006F006F00640000002143341208000000881600009D0900007856341207000000140100004D006100740065007200690061006C0020002800640062006F00290000002E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600009D09000000000000020000000200000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005A00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000090000004D006100740065007200690061006C0000002143341208000000881600009D0900007856341207000000140100004E007500740072006900740069006F006E0020002800640062006F0029000000616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600009D09000000000000020000000200000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000A0000004E007500740072006900740069006F006E0000002143341208000000881600009D0900007856341207000000140100004F0072006900670069006E0020002800640062006F0029000000727665722E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600009D09000000000000020000000200000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005600000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F000000070000004F0072006900670069006E0000002143341208000000881600000416000078563412070000001401000050006500740020002800640062006F00290000002E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C00000034000000000000000000000022290000F1190000000000002D010000090000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000416000000000000070000000700000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000400000050006500740000002143341208000000881600009D090000785634120700000014010000500065007400540079007000650020002800640062006F002900000065722E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600009D09000000000000020000000200000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000008000000500065007400540079007000650000002143341208000000881600000E110000785634120700000014010000530065007200760069006300650020002800640062006F002900000065722E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600000E11000000000000050000000500000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005800000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000008000000530065007200760069006300650000002143341208000000881600009D090000785634120700000014010000530069007A00650020002800640062006F0029000000716C5365727665722E4D616E6167656D656E742E44617461546F6F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600009D09000000000000020000000200000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005200000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000005000000530069007A0065000000214334120800000088160000930E000078563412070000001401000054006F00790020002800640062006F00290000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB07000055050000000000000100000088160000930E000000000000040000000400000002000000020000001C010000F50A00000000000001000000391300007A05000000000000010000000100000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000005000000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F0000000400000054006F007900000004000B00FA320000D8720000DE2B0000D8720000DE2B0000725100000C1A0000725100000200000002000000F0F0F000000000000000000000000000000000000100000043000000000000008D2C0000C35A0000630C00005801000032000000010000020000630C000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D61140046004B005F004100630063006500730073006F00720079005F00500072006F00640075006300740004000B00FA3200005C760000922C00005C760000922C00001C89000000EAFFFF1C8900000200000002000000F0F0F00000000000000000000000000000000000010000004500000000000000CB100000158700009309000058010000320000000100000200009309000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D610F0046004B005F0046006F006F0064005F00500072006F00640075006300740004000B00FA3200001E780000462D00001E780000462D0000C2970000DE290000C29700000200000002000000F0F0F00000000000000000000000000000000000010000004700000000000000E8220000D57D0000AF0900005801000021000000010000020000AF09000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D610F0046004B005F0043006100670065005F00500072006F00640075006300740004000B00B23E0000D06B0000B23E00009E410000844E00009E410000844E00001A3C00000200000002000000F0F0F00000000000000000000000000000000000010000004900000000000000613F0000A64E0000AC080000580100002E000000010000020000AC08000058010000020000000000050000800800008001000000150001000000900144420100065461686F6D610E0046004B005F005000650074005F00500072006F00640075006300740004000B00B23E0000597F0000B23E00008BA90000907E00008BA90000907E0000AEAB00000200000002000000F0F0F00000000000000000000000000000000000010000004B000000000000001A3F00003AAA0000D00A00005801000032000000010000020000D00A000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61120046004B005F0053006500720076006900630065005F00500072006F00640075006300740004000B00FA3200009A740000DE2B00009A740000DE2B0000CE7C0000A4090000CE7C00000200000002000000F0F0F00000000000000000000000000000000000010000004D00000000000000791B0000C77A0000E60800005801000032000000010000020000E608000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D610E0046004B005F0054006F0079005F00500072006F00640075006300740004000B007A0D0000A36C00007A0D0000BE7300003EFEFFFFBE7300003EFEFFFFC67500000000000002000000F0F0F00000000000000000000000000000000000010000004F00000000000000B4FEFFFFB77100000309000058010000320000000100000200000309000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D610F0046004B005F0054006F0079005F004D006100740065007200690061006C0004000B003C0F0000A36C00003C0F0000BE730000781E0000BE730000781E0000CC8D00000000000002000000F0F0F00000000000000000000000000000000000010000005100000000000000FC13000023760000CD0900005801000032000000010000020000CD09000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61100046004B005F0043006100670065005F004D006100740065007200690061006C0002000B00A60E000006630000A60E0000B65900000000000002000000F0F0F00000000000000000000000000000000000010000005300000000000000550F0000CF5E0000810C00005801000024000000010000020000810C000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61150046004B005F004100630063006500730073006F00720079005F004D006100740065007200690061006C0002000B009ADEFFFFEE9800009ADEFFFF588F00000000000002000000F0F0F0000000000000000000000000000000000001000000550000000000000049DFFFFF77930000060A00005801000032000000010000020000060A000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61110046004B005F0046006F006F0064005F004E007500740072006900740069006F006E0002000B009ADEFFFF1D7A00009ADEFFFF408300000000000002000000F0F0F000000000000000000000000000000000000100000057000000000000005CD5FFFF027E00008F08000058010000320000000100000200008F08000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D610E0046004B005F0046006F006F0064005F004F0072006900670069006E0004000B0000EAFFFFF276000068F0FFFFF276000068F0FFFFC297000056130000C29700000000000002000000F0F0F000000000000000000000000000000000000100000059000000000000000DE7FFFF4C960000AC0800005801000032000000010000020000AC08000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D610E0046004B005F0043006100670065005F004F0072006900670069006E0004000B0000EAFFFF6E7300001CF1FFFF6E7300001CF1FFFF7251000084030000725100000000000002000000F0F0F00000000000000000000000000000000000010000005B00000000000000CBF1FFFF66660000600B00005801000023000000010000020000600B000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D61130046004B005F004100630063006500730073006F00720079005F004F0072006900670069006E0004000B0000EAFFFF307500001CF1FFFF307500001CF1FFFFCE7C00001CF3FFFFCE7C00000000000002000000F0F0F00000000000000000000000000000000000010000005D00000000000000CBF1FFFF6A740000E20700005801000032000000010000020000E207000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D610D0046004B005F0054006F0079005F004F0072006900670069006E0002000B00B03900004227000062430000422700000000000002000000F0F0F00000000000000000000000000000000000010000005F00000000000000073A0000F12700000309000058010000320000000100000200000309000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D610E0046004B005F005000650074005F0050006500740054007900700065002143341208000000881600009D090000785634120700000014010000500072006F00640075006300740046006F007200500065007400540079007000650020002800640062006F00290000006F6C735D204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D657461446174614F626A65637453746F72653A3A53796E6368726F6E697A6528636C617373204D6963726F736F66742E53716C5365727665722E4D616E6167656D656E742E44617461546F6F6C732E4D657461446174612E4D65746144617461547970652C737472696E675B5D2C6F626A6563745B5D2C6F626A6563745B5D2C6F626A656374000000000000000000000100000005000000540000002C0000002C0000002C0000003400000000000000000000002229000065150000000000002D010000070000000C000000070000001C0100000609000062070000480300001A040000DF020000EC04000027060000B103000027060000CB070000550500000000000001000000881600009D09000000000000020000000200000002000000020000001C010000F50A0000000000000100000039130000C007000000000000020000000200000002000000020000001C010000060900000100000000000000391300003403000000000000000000000000000002000000020000001C010000060900000000000000000000D13100000923000000000000000000000D00000004000000040000001C01000006090000AA0A00009006000078563412040000006C00000001000000010000000B000000000000000100000002000000030000000400000005000000060000000700000008000000090000000A00000004000000640062006F00000012000000500072006F00640075006300740046006F0072005000650074005400790070006500000002000B004A2E00002F2C00004A2E0000523500000000000002000000F0F0F00000000000000000000000000000000000010000006400000000000000EC1B000014300000AF1100005801000032000000010000020000AF11000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611C0046004B005F00500072006F00640075006300740046006F00720050006500740054007900700065005F00500065007400540079007000650004000B00F03C0000D06B0000F03C00009E4100004A2E00009E4100004A2E0000EF3E00000000000002000000F0F0F00000000000000000000000000000000000010000006600000000000000421C00001A4000005911000058010000620000000100000200005911000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D611C0046004B005F00500072006F00640075006300740046006F00720050006500740054007900700065005F00500072006F00640075006300740002000B00844E00005D1C0000844E0000162600000000000002000000F0F0F00000000000000000000000000000000000010000006800000000000000304700008D200000A50600005801000032000000010000020000A506000058010000020000000000FFFFFF000800008001000000150001000000900144420100065461686F6D610B0046004B005F005000650074005F00530069007A00650000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000FEFFFFFFFEFFFFFF0400000005000000060000000700000008000000090000000A0000000B0000000C0000000D0000000E0000000F000000100000001100000012000000130000001400000015000000160000001700000018000000190000001A0000001B0000001C0000001D0000001E0000001F000000FEFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0100FEFF030A0000FFFFFFFF00000000000000000000000000000000170000004D6963726F736F66742044445320466F726D20322E300010000000456D626564646564204F626A6563740000000000F439B271000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B0000004E61BC00000000000000000000000000000000000000000000000000000000000000000000000000000000000000DBE6B0E91C81D011AD5100A0C90F573900000200009F2D4128DBD301020200001048450000000000000000000000000000000000180200004400610074006100200053006F0075007200630065003D0063007500740069006500730068006F0070002E00640061007400610062006100730065002E00770069006E0064006F00770073002E006E00650074003B0049006E0069007400690061006C00200043006100740061006C006F0067003D0043007500740069006500530068006F0070003B005000650072007300690073007400200053006500630075007200690074007900200049006E0066006F003D0054007200750065003B0055007300650072002000490044003D00730068006F007000610064006D0069006E003B004D0075006C007400690070006C00650041006300740069007600650052006500730075000300440064007300530074007200650061006D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000160002000300000006000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000045000000444C00000000000053006300680065006D00610020005500440056002000440065006600610075006C0074000000000000000000000000000000000000000000000000000000000026000200FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000020000001600000000000000440053005200450046002D0053004300480045004D0041002D0043004F004E00540045004E0054005300000000000000000000000000000000000000000000002C0002010500000007000000FFFFFFFF00000000000000000000000000000000000000000000000000000000000000000000000003000000060700000000000053006300680065006D00610020005500440056002000440065006600610075006C007400200050006F007300740020005600360000000000000000000000000036000200FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000002000000012000000000000000C00000041D2FFFF1FECFFFF0100260000007300630068005F006C006100620065006C0073005F00760069007300690062006C0065000000010000000B0000001E000000000000000000000000000000000000006400000000000000000000000000000000000000000000000000010000000100000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000020000000200000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000030000000300000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000040000000400000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000050000000500000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000060000000600000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000070000000700000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000090000000900000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000000A0000000A00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000000B0000000B00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C003100360038003000000010000000100000000000000038000000016F696401000000640062006F00000046004B005F0045006D0070006C006F007900650065005F0045006D00700052006F006C00650000000000000000000000C402000000001100000011000000100000000800000001B38624A0B386240000000000000000AD070000000000120000001200000000000000320000000169637201000000640062006F00000046004B005F0045006D0070006C006F007900650065005F00410075007400680000000000000000000000C402000000001300000013000000120000000800000001B8862420B886240000000000000000AD0700000000001400000014000000000000002A0000000100000001000000640062006F00000046004B005F0055007300650072005F00410075007400680000000000000000000000C402000000001500000015000000140000000800000001B3862420B386240000000000000000AD07000000000017000000170000000000000030000000014F770001000000640062006F00000046004B005F0049006E0076006F006900630065005F00550073006500720000000000000000000000C402000000001800000018000000170000000800000001B1862420B186240000000000000000AD070000000000190000001900000000000000440000000100000001000000640062006F00000046004B005F0049006E0076006F00690063006500440065007400610069006C0073005F0049006E0076006F0069006300650000000000000000000000C402000000001A0000001A000000190000000800000001B4862420B486240000000000000000AD0700000000001B0000001B00000000000000340000000169637201000000640062006F00000046004B005F00550073006500720050006F0069006E0074005F00550073006500720000000000000000000000C402000000001C0000001C0000001B0000000800000001B28624A0B286240000000000000000AD0700000000001D0000001D00000000000000420000000100000001000000640062006F00000046004B005F00550073006500720050006F0069006E00740048006900730074006F00720079005F00550073006500720000000000000000000000C402000000001E0000001E0000001D0000000800000001B48624A0B486240000000000000000AD0700000000001F0000001F0000000000000030000000014F770001000000640062006F00000046004B005F00530065007300730069006F006E005F00410075007400680000000000000000000000C4020000000020000000200000001F0000000800000001452916F04529160000000000000000AD070000000000210000002100000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000220000002200000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003900320035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000230000002300000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000240000002400000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800350030000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000250000002500000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000270000002700000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000280000002800000000000000380000000169637201000000640062006F00000046004B005F004F006E006C0069006E0065004F0072006400650072005F00550073006500720000000000000000000000C4020000000029000000290000002800000008000000014A2916304A29160000000000000000AD0700000000002A0000002A000000000000005400000001B0356101000000640062006F00000046004B005F004F006E006C0069006E0065004F007200640065007200500072006F0064007500630074005F004F006E006C0069006E0065004F00720064006500720000000000000000000000C402000000002B0000002B0000002A00000008000000015BD20CF05BD20C0000000000000000AD0700000000002C0000002C000000000000004C000000014D696301000000640062006F00000046004B005F004F006E006C0069006E0065004F007200640065007200500072006F0064007500630074005F00500072006F00640075006300740000000000000000000000C402000000002D0000002D0000002C0000000800000001852916088529160000000000000000AD0700000000002F0000002F00000000000000540000000100000001000000640062006F00000046004B005F0053006500720076006900630065004F006E006C0069006E0065004F0072006400650072005F004F006E006C0069006E0065004F00720064006500720000000000000000000000C4020000000030000000300000002F0000000800000001842916C88429160000000000000000AD070000000000310000003100000000000000340000000100000001000000640062006F00000046004B005F00500072006F0064007500630074005F00560065006E0064006F00720000000000000000000000C402000000003200000032000000310000000800000001842916888429160000000000000000AD0700000000003300000033000000000000003C0000000169637201000000640062006F00000046004B005F004F006E006C0069006E0065004F0072006400650072005F0053007400610074007500730000000000000000000000C402000000003400000034000000330000000800000001842916488429160000000000000000AD070000000000350000003500000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000360000003600000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000370000003700000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000380000003800000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000390000003900000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000003A0000003A00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000003B0000003B00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000003C0000003C00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000003E0000003E00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000003F0000003F00000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C0031003600380030000000400000004000000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000004200000042000000000000003A0000000169637201000000640062006F00000046004B005F004100630063006500730073006F00720079005F00500072006F00640075006300740000000000000000000000C402000000004300000043000000420000000800000001842916088429160000000000000000AD07000000000044000000440000000000000030000000014F770001000000640062006F00000046004B005F0046006F006F0064005F00500072006F00640075006300740000000000000000000000C402000000004500000045000000440000000800000001872916888729160000000000000000AD07000000000046000000460000000000000030000000014F770001000000640062006F00000046004B005F0043006100670065005F00500072006F00640075006300740000000000000000000000C402000000004700000047000000460000000800000001892916088929160000000000000000AD0700000000004800000048000000000000002E000000014F770001000000640062006F00000046004B005F005000650074005F00500072006F00640075006300740000000000000000000000C402000000004900000049000000480000000800000001822916488229160000000000000000AD0700000000004A0000004A00000000000000360000000100000001000000640062006F00000046004B005F0053006500720076006900630065005F00500072006F00640075006300740000000000000000000000C402000000004B0000004B0000004A0000000800000001882916088829160000000000000000AD0700000000004C0000004C000000000000002E0000000100000001000000640062006F00000046004B005F0054006F0079005F00500072006F00640075006300740000000000000000000000C402000000004D0000004D0000004C0000000800000001852916C88529160000000000000000AD0700000000004E0000004E0000000000000030000000014F770001000000640062006F00000046004B005F0054006F0079005F004D006100740065007200690061006C0000000000000000000000C402000000004F0000004F0000004E0000000800000001812916C88129160000000000000000AD070000000000500000005000000000000000320000000169637201000000640062006F00000046004B005F0043006100670065005F004D006100740065007200690061006C0000000000000000000000C402000000005100000051000000500000000800000001852916888529160000000000000000AD0700000000005200000052000000000000003C000000018D6E0001000000640062006F00000046004B005F004100630063006500730073006F00720079005F004D006100740065007200690061006C0000000000000000000000C402000000005300000053000000520000000800000001852916488529160000000000000000AD07000000000054000000540000000000000034000000016F696401000000640062006F00000046004B005F0046006F006F0064005F004E007500740072006900740069006F006E0000000000000000000000C402000000005500000055000000540000000800000001882916C88829160000000000000000AD0700000000005600000056000000000000002E0000000100000001000000640062006F00000046004B005F0046006F006F0064005F004F0072006900670069006E0000000000000000000000C402000000005700000057000000560000000800000001822916888229160000000000000000AD0700000000005800000058000000000000002E0000000100000001000000640062006F00000046004B005F0043006100670065005F004F0072006900670069006E0000000000000000000000C402000000005900000059000000580000000800000001882916888829160000000000000000AD0700000000005A0000005A00000000000000380000000169637201000000640062006F00000046004B005F004100630063006500730073006F00720079005F004F0072006900670069006E0000000000000000000000C402000000005B0000005B0000005A0000000800000001872916C88729160000000000000000AD0700000000005C0000005C000000000000002C0000000100000001000000640062006F00000046004B005F0054006F0079005F004F0072006900670069006E0000000000000000000000C402000000005D0000005D0000005C0000000800000001882916488829160000000000000000AD0700000000005E0000005E000000000000002E0000000100000001000000640062006F00000046004B005F005000650074005F00500065007400540079007000650000000000000000000000C402000000005F0000005F0000005E0000000800000001832916888329160000000000000000AD070000000000620000006200000000000000000000000000000000000000D00200000600280000004100630074006900760065005400610062006C00650056006900650077004D006F006400650000000100000008000400000031000000200000005400610062006C00650056006900650077004D006F00640065003A00300000000100000008003A00000034002C0030002C003200380034002C0030002C0032003300310030002C0031002C0031003800390030002C0035002C0031003200360030000000200000005400610062006C00650056006900650077004D006F00640065003A00310000000100000008001E00000032002C0030002C003200380034002C0030002C0032003800300035000000200000005400610062006C00650056006900650077004D006F00640065003A00320000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00330000000100000008001E00000032002C0030002C003200380034002C0030002C0032003300310030000000200000005400610062006C00650056006900650077004D006F00640065003A00340000000100000008003E00000034002C0030002C003200380034002C0030002C0032003300310030002C00310032002C0032003700330030002C00310031002C00310036003800300000006300000063000000000000004A000000014D696301000000640062006F00000046004B005F00500072006F00640075006300740046006F00720050006500740054007900700065005F00500065007400540079007000650000000000000000000000C402000000006400000064000000630000000800000001471316B04713160000000000000000AD0F00000100006500000065000000000000004A000000014D696301000000640062006F00000046004B005F00500072006F00640075006300740046006F00720050006500740054007900700065005F00500072006F00640075006300740000000000000000000000C402000000006600000066000000650000000800000001E1AF0580E1AF050000000000000000AD0F0000010000670000006700000000000000280000000190FF1501000000640062006F00000046004B005F005000650074005F00530069007A00650000000000000000000000C402000000006800000068000000670000000800000001471316F04713160000000000000000AD0F0000010000A0000000120000000100000002000000580000005D00000014000000010000000900000024000000210000001F0000000100000007000000250000002400000010000000030000000200000024000000250000001900000004000000050000002400000025000000280000000900000021000000760000007D00000017000000090000000400000024000000250000001B000000090000000A00000027000000240000001D000000090000000B000000770000005C0000002F000000210000002400000024000000270000002A00000021000000220000007C0000006100000065000000230000006200000020000000250000002C0000002300000022000000210000002600000042000000230000003500000060000000670000004400000023000000370000006C0000005D000000460000002300000036000000720000006B00000048000000230000003B00000026000000250000004A000000230000003E00000027000000240000004C0000002300000040000000660000006100000033000000250000002100000024000000250000003100000027000000230000005A0000006B0000004E00000038000000400000002100000024000000500000003800000036000000270000002400000052000000380000003500000024000000250000005400000039000000370000002400000025000000560000003A000000370000002500000024000000580000003A000000360000005F0000006A0000005A0000003A0000003500000053000000660000005C0000003A000000400000005900000060000000630000003C0000006200000025000000240000005E0000003C0000003B000000590000004C000000670000003F0000003B00000025000000240000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006C00740053006500740073003D00460061006C00730065003B0043006F006E006E006500630074002000540069006D0065006F00750074003D00330030003B0054007200750073007400530065007200760065007200430065007200740069006600690063006100740065003D00460061006C00730065003B005000610063006B00650074002000530069007A0065003D0034003000390036003B004100700070006C00690063006100740069006F006E0020004E0061006D0065003D0022004D006900630072006F0073006F00660074002000530051004C00200053006500720076006500720020004D0061006E006100670065006D0065006E0074002000530074007500640069006F00220000000080050014000000440042004400690061006700720061006D000000000226000800000054006F007900000008000000640062006F000000000226000A000000530069007A006500000008000000640062006F00000000022600100000005300650072007600690063006500000008000000640062006F00000000022600100000005000650074005400790070006500000008000000640062006F0000000002260008000000500065007400000008000000640062006F000000000226000E0000004F0072006900670069006E00000008000000640062006F00000000022600140000004E007500740072006900740069006F006E00000008000000640062006F00000000022600120000004D006100740065007200690061006C00000008000000640062006F000000000226000A00000046006F006F006400000008000000640062006F000000000226000A0000004300610067006500000008000000640062006F00000000022600140000004100630063006500730073006F0072007900000008000000640062006F000000000226000E000000560065006E0064006F007200000008000000640062006F000000000226000E000000530074006100740075007300000008000000640062006F000000000226002600000053006500720076006900630065004F006E006C0069006E0065004F007200640065007200000008000000640062006F0000000002260010000000500072006F006400750063007400000008000000640062006F00000000022600260000004F006E006C0069006E0065004F007200640065007200500072006F006400750063007400000008000000640062006F00000000022600180000004F006E006C0069006E0065004F007200640065007200000008000000640062006F0000000002260022000000550073006500720050006F0069006E00740048006900730074006F0072007900000008000000640062006F0000000002260014000000550073006500720050006F0069006E007400000008000000640062006F000000000226000A0000005500730065007200000008000000640062006F0000000002260010000000530065007300730069006F006E00000008000000640062006F000000000226000E00000050006F006C00690063007900000008000000640062006F000000000226001E00000049006E0076006F00690063006500440065007400610069006C007300000008000000640062006F000000000226001000000049006E0076006F00690063006500000008000000640062006F000000000226001000000045006D00700052006F006C006500000008000000640062006F000000000226001200000045006D0070006C006F00790065006500000008000000640062006F000000000226000A0000004100750074006800000008000000640062006F0000000002240024000000500072006F00640075006300740046006F0072005000650074005400790070006500000008000000640062006F00000001000000D68509B3BB6BF2459AB8371664F0327008004E0000007B00310036003300340043004400440037002D0030003800380038002D0034003200450033002D0039004600410032002D004200360044003300320035003600330042003900310044007D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010003000000000000000C0000000B000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000062885214)
SET IDENTITY_INSERT [dbo].[sysdiagrams] OFF
INSERT [dbo].[Toy] ([ProductID], [Color], [OriginID], [MaterialID]) VALUES (N'69f21647-453d-4f2b-9043-56688f1c92c4', N'Pink', N'397d2980-83fc-4186-a177-fbb6c7841ce8', N'715655a9-37d6-49c1-b91d-10c70248474e')
INSERT [dbo].[Toy] ([ProductID], [Color], [OriginID], [MaterialID]) VALUES (N'8d387990-3ecd-440c-9ee3-2a061fd5cbc9', N'Full', N'533e0ffa-73f0-415e-bb13-7b4581866562', N'8175f2c0-ff12-4060-aef6-f7cd6ffbfb65')
INSERT [dbo].[Toy] ([ProductID], [Color], [OriginID], [MaterialID]) VALUES (N'afa237d5-02bc-4859-a0e9-f791c1d690dc', N'blue', N'619e2cd8-6ae2-4b3c-b108-f76983ebdaba', N'8175f2c0-ff12-4060-aef6-f7cd6ffbfb65')
INSERT [dbo].[Vendor] ([VendorID], [VendorName]) VALUES (N'1124e4fe-0783-47ce-9cd2-9dcdc24f3d5a', N'vật dụng pet ')
INSERT [dbo].[Vendor] ([VendorID], [VendorName]) VALUES (N'e3132056-fc09-441f-8b5c-ecccfd6e33ba', N'Trại thú ABC')
INSERT [dbo].[Vendor] ([VendorID], [VendorName]) VALUES (N'eef71449-5689-4cdb-89de-f9f1afa4e328', N'Thức ăn pet')
INSERT [dbo].[Vendor] ([VendorID], [VendorName]) VALUES (N'ef2edaf8-6729-4b35-a0ed-d7f2772fc16c', N'CutieShop')
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_principal_name]    Script Date: 25/4/2018 2:19:03 PM ******/
ALTER TABLE [dbo].[sysdiagrams] ADD  CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([MaterialID])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_Material]
GO
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_Origin] FOREIGN KEY([OriginID])
REFERENCES [dbo].[Origin] ([OriginID])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_Origin]
GO
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_Product]
GO
ALTER TABLE [dbo].[Cage]  WITH CHECK ADD  CONSTRAINT [FK_Cage_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([MaterialID])
GO
ALTER TABLE [dbo].[Cage] CHECK CONSTRAINT [FK_Cage_Material]
GO
ALTER TABLE [dbo].[Cage]  WITH CHECK ADD  CONSTRAINT [FK_Cage_Origin] FOREIGN KEY([OriginID])
REFERENCES [dbo].[Origin] ([OriginID])
GO
ALTER TABLE [dbo].[Cage] CHECK CONSTRAINT [FK_Cage_Origin]
GO
ALTER TABLE [dbo].[Cage]  WITH CHECK ADD  CONSTRAINT [FK_Cage_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Cage] CHECK CONSTRAINT [FK_Cage_Product]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Auth] FOREIGN KEY([Username])
REFERENCES [dbo].[Auth] ([Username])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Auth]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_EmpRole] FOREIGN KEY([RoleID])
REFERENCES [dbo].[EmpRole] ([RoleID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_EmpRole]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_Nutrition] FOREIGN KEY([NutritionID])
REFERENCES [dbo].[Nutrition] ([NutritionID])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_Nutrition]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_Origin] FOREIGN KEY([OriginID])
REFERENCES [dbo].[Origin] ([OriginID])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_Origin]
GO
ALTER TABLE [dbo].[Food]  WITH CHECK ADD  CONSTRAINT [FK_Food_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Food] CHECK CONSTRAINT [FK_Food_Product]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_User] FOREIGN KEY([Username])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_User]
GO
ALTER TABLE [dbo].[InvoiceDetails]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceDetails_Invoice] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[Invoice] ([InvoiceID])
GO
ALTER TABLE [dbo].[InvoiceDetails] CHECK CONSTRAINT [FK_InvoiceDetails_Invoice]
GO
ALTER TABLE [dbo].[OnlineOrder]  WITH CHECK ADD  CONSTRAINT [FK_OnlineOrder_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[OnlineOrder] CHECK CONSTRAINT [FK_OnlineOrder_Status]
GO
ALTER TABLE [dbo].[OnlineOrder]  WITH CHECK ADD  CONSTRAINT [FK_OnlineOrder_User] FOREIGN KEY([Username])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[OnlineOrder] CHECK CONSTRAINT [FK_OnlineOrder_User]
GO
ALTER TABLE [dbo].[OnlineOrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OnlineOrderProduct_OnlineOrder] FOREIGN KEY([OnlineOrderID])
REFERENCES [dbo].[OnlineOrder] ([OnlineOrderID])
GO
ALTER TABLE [dbo].[OnlineOrderProduct] CHECK CONSTRAINT [FK_OnlineOrderProduct_OnlineOrder]
GO
ALTER TABLE [dbo].[OnlineOrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OnlineOrderProduct_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OnlineOrderProduct] CHECK CONSTRAINT [FK_OnlineOrderProduct_Product]
GO
ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [FK_Pet_PetType] FOREIGN KEY([PetTypeID])
REFERENCES [dbo].[PetType] ([PetTypeID])
GO
ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [FK_Pet_PetType]
GO
ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [FK_Pet_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [FK_Pet_Product]
GO
ALTER TABLE [dbo].[Pet]  WITH CHECK ADD  CONSTRAINT [FK_Pet_Size] FOREIGN KEY([SizeID])
REFERENCES [dbo].[Size] ([SizeID])
GO
ALTER TABLE [dbo].[Pet] CHECK CONSTRAINT [FK_Pet_Size]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Vendor] FOREIGN KEY([VendorID])
REFERENCES [dbo].[Vendor] ([VendorID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Vendor]
GO
ALTER TABLE [dbo].[ProductForPetType]  WITH CHECK ADD  CONSTRAINT [FK_ProductForPetType_PetType] FOREIGN KEY([PetTypeID])
REFERENCES [dbo].[PetType] ([PetTypeID])
GO
ALTER TABLE [dbo].[ProductForPetType] CHECK CONSTRAINT [FK_ProductForPetType_PetType]
GO
ALTER TABLE [dbo].[ProductForPetType]  WITH CHECK ADD  CONSTRAINT [FK_ProductForPetType_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[ProductForPetType] CHECK CONSTRAINT [FK_ProductForPetType_Product]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Product]
GO
ALTER TABLE [dbo].[ServiceOnlineOrder]  WITH CHECK ADD  CONSTRAINT [FK_ServiceOnlineOrder_OnlineOrder] FOREIGN KEY([ServiceOnlineOrderID])
REFERENCES [dbo].[OnlineOrder] ([OnlineOrderID])
GO
ALTER TABLE [dbo].[ServiceOnlineOrder] CHECK CONSTRAINT [FK_ServiceOnlineOrder_OnlineOrder]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Auth] FOREIGN KEY([Username])
REFERENCES [dbo].[Auth] ([Username])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Auth]
GO
ALTER TABLE [dbo].[Toy]  WITH CHECK ADD  CONSTRAINT [FK_Toy_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([MaterialID])
GO
ALTER TABLE [dbo].[Toy] CHECK CONSTRAINT [FK_Toy_Material]
GO
ALTER TABLE [dbo].[Toy]  WITH CHECK ADD  CONSTRAINT [FK_Toy_Origin] FOREIGN KEY([OriginID])
REFERENCES [dbo].[Origin] ([OriginID])
GO
ALTER TABLE [dbo].[Toy] CHECK CONSTRAINT [FK_Toy_Origin]
GO
ALTER TABLE [dbo].[Toy]  WITH CHECK ADD  CONSTRAINT [FK_Toy_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Toy] CHECK CONSTRAINT [FK_Toy_Product]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Auth] FOREIGN KEY([Username])
REFERENCES [dbo].[Auth] ([Username])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Auth]
GO
ALTER TABLE [dbo].[UserPoint]  WITH CHECK ADD  CONSTRAINT [FK_UserPoint_User] FOREIGN KEY([Username])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[UserPoint] CHECK CONSTRAINT [FK_UserPoint_User]
GO
ALTER TABLE [dbo].[UserPointHistory]  WITH CHECK ADD  CONSTRAINT [FK_UserPointHistory_User] FOREIGN KEY([Username])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[UserPointHistory] CHECK CONSTRAINT [FK_UserPointHistory_User]
GO
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 25/4/2018 2:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_alterdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 25/4/2018 2:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_creatediagram]
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 25/4/2018 2:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_dropdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 25/4/2018 2:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagramdefinition]
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 25/4/2018 2:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagrams]
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 25/4/2018 2:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_renamediagram]
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 25/4/2018 2:19:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_upgraddiagrams]
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
	
GO
EXEC sys.sp_addextendedproperty @name=N'microsoft_database_tools_support', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysdiagrams'
GO
USE [master]
GO
ALTER DATABASE [CutieShop] SET  READ_WRITE 
GO
