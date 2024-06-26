USE [master]
GO
/****** Object:  Database [MNODotNetTraining]    Script Date: 20/05/2024 10:28:44 pm ******/
CREATE DATABASE [MNODotNetTraining] ON  PRIMARY 
( NAME = N'MNODotNetTraining', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MNODotNetTraining.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MNODotNetTraining_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\MNODotNetTraining_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MNODotNetTraining].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MNODotNetTraining] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MNODotNetTraining] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MNODotNetTraining] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MNODotNetTraining] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MNODotNetTraining] SET ARITHABORT OFF 
GO
ALTER DATABASE [MNODotNetTraining] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MNODotNetTraining] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MNODotNetTraining] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MNODotNetTraining] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MNODotNetTraining] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MNODotNetTraining] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MNODotNetTraining] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MNODotNetTraining] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MNODotNetTraining] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MNODotNetTraining] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MNODotNetTraining] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MNODotNetTraining] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MNODotNetTraining] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MNODotNetTraining] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MNODotNetTraining] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MNODotNetTraining] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MNODotNetTraining] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MNODotNetTraining] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MNODotNetTraining] SET  MULTI_USER 
GO
ALTER DATABASE [MNODotNetTraining] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MNODotNetTraining] SET DB_CHAINING OFF 
GO
USE [MNODotNetTraining]
GO
/****** Object:  Table [dbo].[tbl_blog]    Script Date: 20/05/2024 10:28:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_blog](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[BlogTitle] [varchar](50) NOT NULL,
	[BlogAuthor] [varchar](50) NOT NULL,
	[BlogContent] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_blog] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_pizza]    Script Date: 20/05/2024 10:28:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pizza](
	[PizzaId] [int] IDENTITY(1,1) NOT NULL,
	[PizzaName] [varchar](50) NOT NULL,
	[PizzaPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_tbl_pizza] PRIMARY KEY CLUSTERED 
(
	[PizzaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_pizzaExtra]    Script Date: 20/05/2024 10:28:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pizzaExtra](
	[PizzaExtraId] [int] IDENTITY(1,1) NOT NULL,
	[PizzaExtraName] [varchar](50) NOT NULL,
	[PizzaExtraPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_tbl_pizzaExtra] PRIMARY KEY CLUSTERED 
(
	[PizzaExtraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_pizzaOrder]    Script Date: 20/05/2024 10:28:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pizzaOrder](
	[PizzaOrderId] [int] IDENTITY(1,1) NOT NULL,
	[PizzaOrderInvoiceNum] [varchar](50) NOT NULL,
	[PizzaId] [int] NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_tbl_pizzaOrder] PRIMARY KEY CLUSTERED 
(
	[PizzaOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_pizzaOrderDetail]    Script Date: 20/05/2024 10:28:45 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pizzaOrderDetail](
	[PizzaOrderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[PizzaOrderInvoiceNum] [varchar](50) NOT NULL,
	[PizzaExtraId] [int] NOT NULL,
 CONSTRAINT [PK_tbl_pizzaOrderDetail] PRIMARY KEY CLUSTERED 
(
	[PizzaOrderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_blog] ON 

INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (1, N'Test Title', N'Test Author', N'Test Content')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (2, N'Test Title', N'Test Author', N'Test Content')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (3, N'Test Title', N'Test Author', N'Test Content')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (4, N'Test Title', N'Test Author', N'Test Content')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (5, N'Test Title', N'Test Author', N'Test Content')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (6, N'Test Title', N'Test Author', N'Test Content')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (7, N'Test Title', N'Test Author', N'Test Content')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (8, N'Test Title', N'Test Author', N'Test Content')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (9, N'Test Title', N'Test Author', N'Test Content')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (10, N'Test Title', N'Test Author', N'Test Content')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (14, N'Title 1', N'Author 1', N'Content 1')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (16, N'Hello World', N'Mg Mg', N'About Content')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (17, N'A Day in the Life of Abed Salama', N'Nathan Thrall', N'About Gaza')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (18, N'A Living Remedy', N'Nicole Chung', N'Even grief provides a living remedy')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (19, N'After Sappho', N'Selby Wynn Schwartz', N'Sappho’s own writing')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (20, N'All Souls', N'Saskia Hamilton', N'Saskia Hamilton’s latest poetry collection')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (1006, N'A School', N'Mg Mg', N'Unforgeable day of school')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (1009, N'Hello World', N'Mg Mg', N'Code with helloworld')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (1015, N'Hello Web Developer', N'Mosh Job', N'Build your project with coffee.')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (1017, N'Hi Mg', N'Hi aut', N'hi content')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (1018, N'title abcd', N'author efgh', N'content ijklmnopqrst')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (1019, N'mm gg ooss', N'm dk od owef', N'cjoie voie      nviev')
INSERT [dbo].[tbl_blog] ([BlogID], [BlogTitle], [BlogAuthor], [BlogContent]) VALUES (1020, N'aabbcc', N'bbdd', N'bbbb')
SET IDENTITY_INSERT [dbo].[tbl_blog] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_pizza] ON 

INSERT [dbo].[tbl_pizza] ([PizzaId], [PizzaName], [PizzaPrice]) VALUES (1, N'Bismark Pizza', CAST(20.19 AS Decimal(18, 2)))
INSERT [dbo].[tbl_pizza] ([PizzaId], [PizzaName], [PizzaPrice]) VALUES (2, N'Brooklyn Style Pizza', CAST(15.23 AS Decimal(18, 2)))
INSERT [dbo].[tbl_pizza] ([PizzaId], [PizzaName], [PizzaPrice]) VALUES (3, N'Buffalo Style Pizza', CAST(20.45 AS Decimal(18, 2)))
INSERT [dbo].[tbl_pizza] ([PizzaId], [PizzaName], [PizzaPrice]) VALUES (4, N'California Pizza', CAST(18.12 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[tbl_pizza] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_pizzaExtra] ON 

INSERT [dbo].[tbl_pizzaExtra] ([PizzaExtraId], [PizzaExtraName], [PizzaExtraPrice]) VALUES (1, N'Cheese', CAST(1.25 AS Decimal(18, 2)))
INSERT [dbo].[tbl_pizzaExtra] ([PizzaExtraId], [PizzaExtraName], [PizzaExtraPrice]) VALUES (2, N'Mushrooms', CAST(1.10 AS Decimal(18, 2)))
INSERT [dbo].[tbl_pizzaExtra] ([PizzaExtraId], [PizzaExtraName], [PizzaExtraPrice]) VALUES (3, N'Onions', CAST(0.35 AS Decimal(18, 2)))
INSERT [dbo].[tbl_pizzaExtra] ([PizzaExtraId], [PizzaExtraName], [PizzaExtraPrice]) VALUES (4, N'Peppers', CAST(0.90 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[tbl_pizzaExtra] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_pizzaOrder] ON 

INSERT [dbo].[tbl_pizzaOrder] ([PizzaOrderId], [PizzaOrderInvoiceNum], [PizzaId], [TotalPrice]) VALUES (1, N'20240516171456', 0, CAST(21.64 AS Decimal(18, 2)))
INSERT [dbo].[tbl_pizzaOrder] ([PizzaOrderId], [PizzaOrderInvoiceNum], [PizzaId], [TotalPrice]) VALUES (2, N'20240516222103', 0, CAST(17.58 AS Decimal(18, 2)))
INSERT [dbo].[tbl_pizzaOrder] ([PizzaOrderId], [PizzaOrderInvoiceNum], [PizzaId], [TotalPrice]) VALUES (3, N'20240516222502', 1, CAST(21.79 AS Decimal(18, 2)))
INSERT [dbo].[tbl_pizzaOrder] ([PizzaOrderId], [PizzaOrderInvoiceNum], [PizzaId], [TotalPrice]) VALUES (4, N'20240516232956', 3, CAST(24.05 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[tbl_pizzaOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_pizzaOrderDetail] ON 

INSERT [dbo].[tbl_pizzaOrderDetail] ([PizzaOrderDetailsId], [PizzaOrderInvoiceNum], [PizzaExtraId]) VALUES (9, N'20240516171456', 2)
INSERT [dbo].[tbl_pizzaOrderDetail] ([PizzaOrderDetailsId], [PizzaOrderInvoiceNum], [PizzaExtraId]) VALUES (10, N'20240516171456', 3)
INSERT [dbo].[tbl_pizzaOrderDetail] ([PizzaOrderDetailsId], [PizzaOrderInvoiceNum], [PizzaExtraId]) VALUES (11, N'20240516222103', 1)
INSERT [dbo].[tbl_pizzaOrderDetail] ([PizzaOrderDetailsId], [PizzaOrderInvoiceNum], [PizzaExtraId]) VALUES (12, N'20240516222103', 2)
INSERT [dbo].[tbl_pizzaOrderDetail] ([PizzaOrderDetailsId], [PizzaOrderInvoiceNum], [PizzaExtraId]) VALUES (13, N'20240516222502', 1)
INSERT [dbo].[tbl_pizzaOrderDetail] ([PizzaOrderDetailsId], [PizzaOrderInvoiceNum], [PizzaExtraId]) VALUES (14, N'20240516222502', 3)
INSERT [dbo].[tbl_pizzaOrderDetail] ([PizzaOrderDetailsId], [PizzaOrderInvoiceNum], [PizzaExtraId]) VALUES (15, N'20240516232956', 1)
INSERT [dbo].[tbl_pizzaOrderDetail] ([PizzaOrderDetailsId], [PizzaOrderInvoiceNum], [PizzaExtraId]) VALUES (16, N'20240516232956', 2)
INSERT [dbo].[tbl_pizzaOrderDetail] ([PizzaOrderDetailsId], [PizzaOrderInvoiceNum], [PizzaExtraId]) VALUES (17, N'20240516232956', 3)
INSERT [dbo].[tbl_pizzaOrderDetail] ([PizzaOrderDetailsId], [PizzaOrderInvoiceNum], [PizzaExtraId]) VALUES (18, N'20240516232956', 4)
SET IDENTITY_INSERT [dbo].[tbl_pizzaOrderDetail] OFF
GO
USE [master]
GO
ALTER DATABASE [MNODotNetTraining] SET  READ_WRITE 
GO
