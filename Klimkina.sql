USE [master]
GO
/****** Object:  Database [Sessia1]    Script Date: 18.01.2022 13:28:19 ******/
CREATE DATABASE [Sessia1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Sessia1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Sessia1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Sessia1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Sessia1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Sessia1] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sessia1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sessia1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Sessia1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Sessia1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Sessia1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Sessia1] SET ARITHABORT OFF 
GO
ALTER DATABASE [Sessia1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Sessia1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Sessia1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Sessia1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Sessia1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Sessia1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Sessia1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Sessia1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Sessia1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Sessia1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Sessia1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Sessia1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Sessia1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Sessia1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Sessia1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Sessia1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Sessia1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Sessia1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Sessia1] SET  MULTI_USER 
GO
ALTER DATABASE [Sessia1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Sessia1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Sessia1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Sessia1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Sessia1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Sessia1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Sessia1] SET QUERY_STORE = OFF
GO
USE [Sessia1]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 18.01.2022 13:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID_Employee] [int] IDENTITY(1,1) NOT NULL,
	[Full_Name] [nvarchar](50) NULL,
	[Login] [nchar](30) NULL,
	[Password] [nchar](20) NULL,
	[Role] [nchar](25) NULL,
	[Phone] [nchar](25) NULL,
	[Female] [nchar](10) NULL,
	[Photo] [image] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID_Employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pavilion]    Script Date: 18.01.2022 13:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pavilion](
	[Shopping_Center] [nchar](30) NOT NULL,
	[Pavilion] [nchar](10) NOT NULL,
	[Floor] [int] NOT NULL,
	[Status] [nchar](15) NOT NULL,
	[Area] [numeric](18, 3) NULL,
	[Cost] [numeric](18, 3) NULL,
	[Ratio] [numeric](18, 3) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rent]    Script Date: 18.01.2022 13:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rent](
	[ID_Rent] [int] IDENTITY(1,1) NOT NULL,
	[ID_Tenant] [int] NOT NULL,
	[Name] [nchar](25) NOT NULL,
	[Shopping_Center] [nchar](30) NULL,
	[XX] [nchar](20) NULL,
	[ID_Employee] [int] NULL,
	[Pavilion] [nchar](10) NULL,
	[Status] [nchar](20) NULL,
	[Start_Rent] [date] NULL,
	[End_Rent] [date] NULL,
 CONSTRAINT [PK_Rent] PRIMARY KEY CLUSTERED 
(
	[ID_Rent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shopping_Center]    Script Date: 18.01.2022 13:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shopping_Center](
	[Name] [nchar](30) NOT NULL,
	[Status] [nchar](25) NULL,
	[Qua_Pavilion] [int] NULL,
	[Sity] [nchar](20) NULL,
	[Cost] [money] NULL,
	[Ratio] [numeric](18, 2) NULL,
	[Floor] [int] NULL,
	[Image] [image] NULL,
 CONSTRAINT [PK_Shopping_Center] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tenant]    Script Date: 18.01.2022 13:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tenant](
	[ID_Tenant] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NULL,
	[Phone] [nchar](20) NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tenant] PRIMARY KEY CLUSTERED 
(
	[ID_Tenant] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Login], [Password], [Role], [Phone], [Female], [Photo]) VALUES (1, N'Elizor@gmai.com', N'yntiRS                        ', N'Администратор       ', N'+7(1070)628 29 16        ', N'Мужской                  ', N'1         ', NULL)
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Login], [Password], [Role], [Phone], [Female], [Photo]) VALUES (2, N'Vladlena@gmai.com', N'07i7Lb                        ', N'Менеджер А          ', N'+7(334)1460151           ', N'Женский                  ', N'2         ', NULL)
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Login], [Password], [Role], [Phone], [Female], [Photo]) VALUES (3, N'Adam@gmai.com', N'7SP9CV                        ', N'Менеджер С          ', N'+7(8560)519-32-99        ', N'Мужской                  ', N'3         ', NULL)
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Login], [Password], [Role], [Phone], [Female], [Photo]) VALUES (4, N'Kar@gmai.com', N'6QF1WB                        ', N'Удален              ', N'+7(824)893-24-03         ', N'Мужской                  ', N'4         ', NULL)
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Login], [Password], [Role], [Phone], [Female], [Photo]) VALUES (5, N'Yli@gmai.com', N'GwffgE                        ', N'Администратор       ', N'+7(6402)701-31-09        ', N'Мужской                  ', N'5         ', NULL)
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Login], [Password], [Role], [Phone], [Female], [Photo]) VALUES (6, N'Vasilisa@gmai.com', N'd7iKKV                        ', N'Администратор       ', N'+7(92)920-74-47          ', N'Женский                  ', N'6         ', NULL)
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Login], [Password], [Role], [Phone], [Female], [Photo]) VALUES (7, N'Galina@gmai.com', N'8KC7wJ                        ', N'Менеджер А          ', N'+7 (405) 088 73 89       ', N'Женский                  ', N'7         ', NULL)
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Login], [Password], [Role], [Phone], [Female], [Photo]) VALUES (8, N'Miron@gmai.com', N'x58OAN                        ', N'Администратор       ', N'+7(6010)195-02-09        ', N'Мужской                  ', N'8         ', NULL)
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Login], [Password], [Role], [Phone], [Female], [Photo]) VALUES (9, N'Vseslava@gmai.com', N'fhDSBf                        ', N'Менеджер С          ', N'+7(078)429-57-86         ', N'Женский                  ', N'9         ', NULL)
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Login], [Password], [Role], [Phone], [Female], [Photo]) VALUES (10, N'Victoria@gmai.com', N'9mlPQJ                        ', N'Удален              ', N'+7(6394)904-01-61        ', N'Женский                  ', N'10        ', NULL)
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Login], [Password], [Role], [Phone], [Female], [Photo]) VALUES (11, N'Anisa@gmai.com', N'Wh4OYm                        ', N'Менеджер А          ', N'+7(22)3264959            ', N'Мужской                  ', N'11        ', NULL)
INSERT [dbo].[Employee] ([ID_Employee], [Full_Name], [Login], [Password], [Role], [Phone], [Female], [Photo]) VALUES (12, N'Feafan@gmai.com', N'Kc1PeS                        ', N'Менеджер С          ', N'+7(789)762-30-28         ', N'Мужской                  ', N'12        ', NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Мега Белая Дача               ', N'88А       ', 1, N'Свободен       ', CAST(75.000 AS Numeric(18, 3)), CAST(3308.000 AS Numeric(18, 3)), CAST(0.100 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Авиапарк                      ', N'40А       ', 3, N'Забронировано  ', CAST(96.000 AS Numeric(18, 3)), CAST(690.000 AS Numeric(18, 3)), CAST(1.100 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Мега Белая Дача               ', N'76Б       ', 2, N'Удален         ', CAST(199.000 AS Numeric(18, 3)), CAST(4938.000 AS Numeric(18, 3)), CAST(0.900 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Рио                           ', N'61А       ', 1, N'Арендован      ', CAST(186.000 AS Numeric(18, 3)), CAST(2115.000 AS Numeric(18, 3)), CAST(0.900 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Гранд                         ', N'58В       ', 4, N'Арендован      ', CAST(98.000 AS Numeric(18, 3)), CAST(1306.000 AS Numeric(18, 3)), CAST(1.900 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Лужайка                       ', N'7А        ', 2, N'Забронировано  ', CAST(187.000 AS Numeric(18, 3)), CAST(2046.000 AS Numeric(18, 3)), CAST(1.000 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Кунцево Плаза                 ', N'13Б       ', 1, N'Забронировано  ', CAST(141.000 AS Numeric(18, 3)), CAST(1131.000 AS Numeric(18, 3)), CAST(0.100 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Мозаика                       ', N'60В       ', 2, N'Забронировано  ', CAST(94.000 AS Numeric(18, 3)), CAST(361.000 AS Numeric(18, 3)), CAST(0.300 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Гранд                         ', N'56А       ', 1, N'Арендован      ', CAST(148.000 AS Numeric(18, 3)), CAST(1163.000 AS Numeric(18, 3)), CAST(0.600 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Гранд                         ', N'63Г       ', 2, N'Забронировано  ', CAST(153.000 AS Numeric(18, 3)), CAST(3486.000 AS Numeric(18, 3)), CAST(0.700 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Бутово Молл                   ', N'8Г        ', 1, N'Арендован      ', CAST(122.000 AS Numeric(18, 3)), CAST(2451.000 AS Numeric(18, 3)), CAST(1.500 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Гранд                         ', N'94В       ', 3, N'Свободен       ', CAST(132.000 AS Numeric(18, 3)), CAST(4825.000 AS Numeric(18, 3)), CAST(2.000 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Шоколад                       ', N'87Г       ', 1, N'Забронировано  ', CAST(174.000 AS Numeric(18, 3)), CAST(793.000 AS Numeric(18, 3)), CAST(1.500 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'АфиМолл Сити                  ', N'93В       ', 1, N'Арендован      ', CAST(165.000 AS Numeric(18, 3)), CAST(4937.000 AS Numeric(18, 3)), CAST(0.800 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Европейский                   ', N'10А       ', 3, N'Забронировано  ', CAST(168.000 AS Numeric(18, 3)), CAST(1353.000 AS Numeric(18, 3)), CAST(1.700 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Шереметьевский                ', N'53Г       ', 1, N'Арендован      ', CAST(99.000 AS Numeric(18, 3)), CAST(3924.000 AS Numeric(18, 3)), CAST(1.000 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Шереметьевский                ', N'73В       ', 2, N'Свободен       ', CAST(116.000 AS Numeric(18, 3)), CAST(3418.000 AS Numeric(18, 3)), CAST(0.000 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Мега Химки                    ', N'89Б       ', 1, N'Свободен       ', CAST(92.000 AS Numeric(18, 3)), CAST(562.000 AS Numeric(18, 3)), CAST(0.400 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Москва                        ', N'44Г       ', 2, N'Забронирован   ', CAST(66.600 AS Numeric(18, 3)), NULL, CAST(1.000 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Вегас Кунцево                 ', N'65А       ', 2, N'Забронирован   ', CAST(95.000 AS Numeric(18, 3)), CAST(1381.000 AS Numeric(18, 3)), CAST(1.700 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Город Лефортово               ', N'16Г       ', 2, N'Удален         ', CAST(150.000 AS Numeric(18, 3)), CAST(747.000 AS Numeric(18, 3)), CAST(0.800 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Золотой Вавилон Ростокино     ', N'61Б       ', 1, N'Свободен       ', CAST(58.000 AS Numeric(18, 3)), CAST(1032.000 AS Numeric(18, 3)), CAST(1.700 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Шереметьевский                ', N'34Б       ', 4, N'Забронировано  ', CAST(102.000 AS Numeric(18, 3)), CAST(4715.000 AS Numeric(18, 3)), CAST(0.300 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Шереметьевский                ', N'91Г       ', 3, N'Арендован      ', CAST(171.000 AS Numeric(18, 3)), CAST(1021.000 AS Numeric(18, 3)), CAST(1.200 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Ашан Сити Капитолий           ', N'70Г       ', 1, N'Забронировано  ', CAST(83.000 AS Numeric(18, 3)), CAST(2246.000 AS Numeric(18, 3)), CAST(1.400 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Черемушки                     ', N'10А       ', 1, N'Забронирован   ', CAST(187.000 AS Numeric(18, 3)), CAST(2067.000 AS Numeric(18, 3)), CAST(0.000 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Филион                        ', N'80Г       ', 1, N'Забронировано  ', CAST(117.000 AS Numeric(18, 3)), CAST(1049.000 AS Numeric(18, 3)), CAST(1.300 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Весна                         ', N'2Б        ', 1, N'Удален         ', CAST(176.000 AS Numeric(18, 3)), CAST(1673.000 AS Numeric(18, 3)), CAST(1.700 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Гудзон                        ', N'41А       ', 1, N'Свободен       ', CAST(108.000 AS Numeric(18, 3)), CAST(344.000 AS Numeric(18, 3)), CAST(0.000 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Калейдоскоп                   ', N'16Г       ', 2, N'Арендован      ', CAST(125.000 AS Numeric(18, 3)), CAST(1037.000 AS Numeric(18, 3)), CAST(1.300 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Золотой Вавилон Ростокино     ', N'13Б       ', 2, N'Свободен       ', CAST(161.500 AS Numeric(18, 3)), CAST(2775.700 AS Numeric(18, 3)), CAST(0.400 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Хорошо                        ', N'83Г       ', 2, N'Арендован      ', CAST(85.500 AS Numeric(18, 3)), CAST(4584.000 AS Numeric(18, 3)), CAST(0.300 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Щука                          ', N'9Г        ', 1, N'Забронировано  ', CAST(131.000 AS Numeric(18, 3)), CAST(2477.000 AS Numeric(18, 3)), CAST(1.500 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Атриум                        ', N'49Г       ', 1, N'Арендован      ', CAST(164.000 AS Numeric(18, 3)), CAST(2728.000 AS Numeric(18, 3)), CAST(0.900 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Принц Плаза                   ', N'1Г        ', 1, N'Удален         ', CAST(157.000 AS Numeric(18, 3)), CAST(1963.000 AS Numeric(18, 3)), CAST(1.600 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Золотой Вавилон Ростокино     ', N'37А       ', 3, N'Арендован      ', CAST(187.000 AS Numeric(18, 3)), CAST(3173.000 AS Numeric(18, 3)), CAST(0.300 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Золотой Вавилон Ростокино     ', N'38Г       ', 4, N'Арендован      ', CAST(97.000 AS Numeric(18, 3)), CAST(1364.000 AS Numeric(18, 3)), CAST(0.500 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Реутов Парк                   ', N'27В       ', 1, N'Забронировано  ', CAST(96.000 AS Numeric(18, 3)), CAST(3134.000 AS Numeric(18, 3)), CAST(0.100 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'ЕвроПарк                      ', N'67Б       ', 1, N'Удален         ', CAST(55.000 AS Numeric(18, 3)), CAST(4442.000 AS Numeric(18, 3)), CAST(0.800 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'ГУМ                           ', N'86Г       ', 1, N'Свободен       ', CAST(58.000 AS Numeric(18, 3)), CAST(3707.000 AS Numeric(18, 3)), CAST(0.500 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Райкин Плаза                  ', N'98А       ', 3, N'Забронировано  ', CAST(172.500 AS Numeric(18, 3)), CAST(4951.000 AS Numeric(18, 3)), CAST(1.100 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Новинский пассаж              ', N'11Г       ', 2, N'Арендован      ', CAST(194.000 AS Numeric(18, 3)), CAST(827.000 AS Numeric(18, 3)), CAST(0.600 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Фестиваль                     ', N'42В       ', 1, N'Свободен       ', CAST(166.000 AS Numeric(18, 3)), CAST(4216.000 AS Numeric(18, 3)), CAST(0.700 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Красный Кит                   ', N'55А       ', 2, N'Забронировано  ', CAST(127.000 AS Numeric(18, 3)), CAST(703.000 AS Numeric(18, 3)), CAST(1.000 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Фестиваль                     ', N'6Б        ', 2, N'Свободен       ', CAST(119.000 AS Numeric(18, 3)), CAST(3262.000 AS Numeric(18, 3)), CAST(1.900 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Отрада                        ', N'15А       ', 1, N'Забронировано  ', CAST(90.000 AS Numeric(18, 3)), CAST(1569.000 AS Numeric(18, 3)), CAST(1.300 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Фестиваль                     ', N'27Б       ', 3, N'Арендован      ', CAST(132.000 AS Numeric(18, 3)), CAST(627.000 AS Numeric(18, 3)), CAST(0.400 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Фестиваль                     ', N'65Б       ', 4, N'Удален         ', CAST(60.000 AS Numeric(18, 3)), CAST(3052.000 AS Numeric(18, 3)), CAST(0.600 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Времена Года                  ', N'26А       ', 1, N'Свободен       ', CAST(95.000 AS Numeric(18, 3)), CAST(670.000 AS Numeric(18, 3)), CAST(1.700 AS Numeric(18, 3)))
INSERT [dbo].[Pavilion] ([Shopping_Center], [Pavilion], [Floor], [Status], [Area], [Cost], [Ratio]) VALUES (N'Времена Года                  ', N'53В       ', 3, N'Арендован      ', CAST(132.000 AS Numeric(18, 3)), CAST(510.000 AS Numeric(18, 3)), CAST(1.200 AS Numeric(18, 3)))
GO
SET IDENTITY_INSERT [dbo].[Rent] ON 

INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (1, 2, N'Мега                     ', N'Белая                         ', N'Дача                ', 2, N'88А       ', N'Открыт              ', CAST(N'2019-01-24' AS Date), CAST(N'2020-11-17' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (2, 2, N'Авиапарк                 ', N'                              ', N'                    ', 7, N'40А       ', N'Ожидание            ', CAST(N'2019-11-21' AS Date), CAST(N'2020-04-18' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (3, 5, N'Рио                      ', N'                              ', N'                    ', 11, N'61А       ', N'Закрыт              ', CAST(N'2018-11-12' AS Date), CAST(N'2019-06-28' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (4, 1, N'Гранд                    ', N'                              ', N'                    ', 2, N'58В       ', N'Закрыт              ', CAST(N'2018-10-18' AS Date), CAST(N'2019-09-16' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (5, 5, N'Лужайка                  ', N'                              ', N'                    ', 7, N'7А        ', N'Ожидание            ', CAST(N'2019-12-19' AS Date), CAST(N'2020-06-26' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (6, 2, N'Кунцево                  ', N'Плаза                         ', N'                    ', 11, N'13Б       ', N'Ожидание            ', CAST(N'2019-12-16' AS Date), CAST(N'2020-05-12' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (7, 4, N'Мозаика                  ', N'                              ', N'                    ', 2, N'60В       ', N'Ожидание            ', CAST(N'2019-12-06' AS Date), CAST(N'2020-10-16' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (8, 2, N'Гранд                    ', N'                              ', N'                    ', 11, N'56А       ', N'Закрыт              ', CAST(N'2018-09-03' AS Date), CAST(N'2019-02-10' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (9, 2, N'Гранд                    ', N'                              ', N'                    ', 2, N'63Г       ', N'Ожидание            ', CAST(N'2019-11-04' AS Date), CAST(N'2020-06-27' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (10, 4, N'Бутово                   ', N'Молл                          ', N'                    ', 7, N'8Г        ', N'Закрыт              ', CAST(N'2018-11-08' AS Date), CAST(N'2019-01-16' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (11, 1, N'Гранд                    ', N'                              ', N'                    ', 2, N'94В       ', N'Открыт              ', CAST(N'2019-06-07' AS Date), CAST(N'2020-03-18' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (12, 1, N'Шоколад                  ', N'                              ', N'                    ', 2, N'87Г       ', N'Ожидание            ', CAST(N'2019-11-15' AS Date), CAST(N'2020-06-20' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (13, 5, N'АфиМолл                  ', N'Сити                          ', N'                    ', 11, N'93В       ', N'Закрыт              ', CAST(N'2018-10-09' AS Date), CAST(N'2019-09-22' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (14, 5, N'Европейский              ', N'                              ', N'                    ', 7, N'10А       ', N'Ожидание            ', CAST(N'2019-11-24' AS Date), CAST(N'2020-07-17' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (15, 1, N'Шереметьевский           ', N'                              ', N'                    ', 7, N'53Г       ', N'Закрыт              ', CAST(N'2018-07-20' AS Date), CAST(N'2019-06-07' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (16, 3, N'Шереметьевский           ', N'                              ', N'                    ', 11, N'73В       ', N'Открыт              ', CAST(N'2019-02-04' AS Date), NULL)
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (17, 2, N'Мега                     ', N'Химки                         ', N'                    ', 2, N'89Б       ', N'Открыт              ', CAST(N'2019-08-06' AS Date), CAST(N'2020-08-20' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (18, 1, N'Золотой                  ', N'Вавилон                       ', N'Ростокино           ', 7, N'61Б       ', N'Открыт              ', CAST(N'2019-05-23' AS Date), CAST(N'2020-05-13' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (19, 3, N'Шереметьевский           ', N'                              ', N'                    ', 2, N'34Б       ', N'Ожидание            ', CAST(N'2019-12-16' AS Date), CAST(N'2020-03-16' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (20, 3, N'Шереметьевский           ', N'                              ', N'                    ', 11, N'91Г       ', N'Закрыт              ', CAST(N'2018-08-24' AS Date), CAST(N'2019-08-04' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (21, 5, N'Ашан                     ', N'Сити                          ', N'Капитолий           ', 2, N'70Г       ', N'Ожидание            ', CAST(N'2019-11-09' AS Date), CAST(N'2020-08-17' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (22, 4, N'Европейский              ', N'                              ', N'                    ', 7, N'10А       ', N'Ожидание            ', CAST(N'2019-12-02' AS Date), CAST(N'2020-07-24' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (23, 2, N'Филион                   ', N'                              ', N'                    ', 11, N'80Г       ', N'Ожидание            ', CAST(N'2019-11-23' AS Date), CAST(N'2020-08-06' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (24, 4, N'Гудзон                   ', N'                              ', N'                    ', 7, N'41А       ', N'Открыт              ', CAST(N'2019-05-02' AS Date), CAST(N'2020-06-24' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (25, 3, N'Кунцево                  ', N'Плаза                         ', N'                    ', 2, N'13Б       ', N'Ожидание            ', CAST(N'2019-12-08' AS Date), CAST(N'2020-08-17' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (26, 3, N'Хорошо                   ', N'                              ', N'                    ', 7, N'83Г       ', N'Закрыт              ', CAST(N'2018-11-14' AS Date), CAST(N'2019-04-19' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (27, 4, N'Щука                     ', N'                              ', N'                    ', 11, N'9Г        ', N'Ожидание            ', CAST(N'2019-12-26' AS Date), CAST(N'2020-09-13' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (28, 1, N'Атриум                   ', N'                              ', N'                    ', 2, N'49Г       ', N'Закрыт              ', CAST(N'2018-09-16' AS Date), CAST(N'2019-02-12' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (29, 3, N'Золотой                  ', N'Вавилон                       ', N'Ростокино           ', 2, N'37А       ', N'Закрыт              ', CAST(N'2018-10-18' AS Date), CAST(N'2019-06-22' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (30, 4, N'Золотой                  ', N'Вавилон                       ', N'Ростокино           ', 2, N'38Г       ', N'Закрыт              ', CAST(N'2018-06-23' AS Date), CAST(N'2019-08-26' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (31, 3, N'Реутов                   ', N'Парк                          ', N'                    ', 11, N'27В       ', N'Ожидание            ', CAST(N'2019-12-18' AS Date), CAST(N'2020-05-23' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (32, 5, N'ГУМ                      ', N'                              ', N'                    ', 7, N'86Г       ', N'Открыт              ', CAST(N'2019-04-01' AS Date), CAST(N'2020-12-19' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (33, 4, N'Райкин                   ', N'Плаза                         ', N'                    ', 11, N'98А       ', N'Ожидание            ', CAST(N'2019-11-22' AS Date), CAST(N'2020-08-15' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (34, 3, N'Новинский                ', N'пассаж                        ', N'                    ', 11, N'11Г       ', N'Закрыт              ', CAST(N'2018-10-08' AS Date), CAST(N'2019-07-21' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (35, 2, N'Фестиваль                ', N'                              ', N'                    ', 2, N'42В       ', N'Открыт              ', CAST(N'2019-04-07' AS Date), CAST(N'2020-03-05' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (36, 1, N'Красный                  ', N'Кит                           ', N'                    ', 7, N'55А       ', N'Ожидание            ', CAST(N'2019-11-07' AS Date), CAST(N'2020-03-08' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (37, 3, N'Фестиваль                ', N'                              ', N'                    ', 2, N'6Б        ', N'Открыт              ', CAST(N'2019-07-15' AS Date), CAST(N'2020-04-25' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (38, 1, N'Отрада                   ', N'                              ', N'                    ', 2, N'15А       ', N'Ожидание            ', NULL, CAST(N'2020-12-02' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (39, 4, N'Фестиваль                ', N'                              ', N'                    ', 11, N'27Б       ', N'Закрыт              ', CAST(N'2018-08-05' AS Date), CAST(N'2019-06-14' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (40, 2, N'Времена                  ', N'Года                          ', N'                    ', 11, N'26А       ', N'Открыт              ', CAST(N'2019-08-19' AS Date), CAST(N'2020-09-02' AS Date))
INSERT [dbo].[Rent] ([ID_Rent], [ID_Tenant], [Name], [Shopping_Center], [XX], [ID_Employee], [Pavilion], [Status], [Start_Rent], [End_Rent]) VALUES (41, 4, N'Времена                  ', N'Года                          ', N'                    ', 7, N'53В       ', N'Закрыт              ', CAST(N'2018-09-20' AS Date), CAST(N'2019-02-12' AS Date))
SET IDENTITY_INSERT [dbo].[Rent] OFF
GO
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N' Армада                       ', N'План                     ', 0, N'Ростов-на-Дону      ', 9172489.0000, CAST(0.90 AS Numeric(18, 2)), 1, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N' Весна                        ', N'Удален                   ', 3, N'Нижний Новгород     ', 4687701.0000, CAST(0.80 AS Numeric(18, 2)), 1, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N' Гудзон                       ', N'Реализация               ', 3, N'Екатеринбург        ', 7414460.0000, CAST(0.00 AS Numeric(18, 2)), 1, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Авиапарк                      ', N'Строительсто             ', 9, N'Санкт-Петербург     ', 3297976.0000, CAST(0.10 AS Numeric(18, 2)), 3, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Атриум                        ', N'Реализация               ', 4, N'г. Казань           ', 5059779.0000, CAST(0.20 AS Numeric(18, 2)), 1, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'АфиМолл Сити                  ', N'Реализация               ', 9, N'Санкт-Петербург     ', 8729160.0000, CAST(0.90 AS Numeric(18, 2)), 3, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Ашан Сити Капитолий           ', N'Строительсто             ', 4, N'Екатеринбург        ', 5309117.0000, CAST(1.90 AS Numeric(18, 2)), 1, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Бутово Молл                   ', N'План                     ', 0, N'Москва              ', 5327641.0000, CAST(1.70 AS Numeric(18, 2)), 1, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Вегас                         ', N'План                     ', 0, N'Нижний Новгород     ', 7567411.0000, NULL, 3, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Вегас Кунцево                 ', N'Реализация               ', 12, N'Москва              ', 3878254.0000, CAST(0.20 AS Numeric(18, 2)), 4, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Времена Года                  ', N'Реализация               ', 15, N'Екатеринбург        ', 2650484.0000, CAST(1.70 AS Numeric(18, 2)), 3, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Гагаринский                   ', N'План                     ', 0, N'Екатеринбург        ', 1508807.0000, CAST(1.60 AS Numeric(18, 2)), 1, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Город Лефортово               ', N'Удален                   ', 12, N'Новосибирск         ', 1966214.0000, CAST(1.70 AS Numeric(18, 2)), 4, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Гранд                         ', N'Строительсто             ', 20, N'Ростов-на-Дону      ', 2573981.0000, CAST(0.10 AS Numeric(18, 2)), 4, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'ГУМ                           ', N'Реализация               ', 5, N'Санкт-Петербург     ', 6731491.0000, CAST(1.90 AS Numeric(18, 2)), 1, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'ЕвроПарк                      ', N'Удален                   ', 20, N'Новосибирск         ', 9391338.0000, CAST(0.70 AS Numeric(18, 2)), 4, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Европейский                   ', N'Строительсто             ', 9, N'Москва              ', 5690500.0000, CAST(0.70 AS Numeric(18, 2)), 3, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Золотой Вавилон Ростокино     ', N'Реализация               ', 16, N'Екатеринбург        ', 1632702.0000, CAST(1.80 AS Numeric(18, 2)), 4, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Калейдоскоп                   ', N'Реализация               ', 10, N'Новосибирск         ', 7847659.0000, CAST(0.70 AS Numeric(18, 2)), 2, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Красный Кит                   ', N'Строительсто             ', 9, N'Казань              ', 1912149.0000, CAST(1.10 AS Numeric(18, 2)), 3, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Кунцево Плаза                 ', N'Строительсто             ', 8, N'Челябинск           ', 6797653.0000, CAST(1.10 AS Numeric(18, 2)), 2, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Лужайка                       ', N'Строительсто             ', 10, N'Казань              ', 4603336.0000, CAST(0.80 AS Numeric(18, 2)), 2, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Мега Белая Дача               ', N'Удален                   ', 16, N'Новосибирск         ', 9006645.0000, CAST(1.70 AS Numeric(18, 2)), 4, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Мега Химки                    ', N'Реализация               ', 3, N'Нижний Новгород     ', 3373234.0000, CAST(0.40 AS Numeric(18, 2)), 1, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Мегаполис                     ', N'План                     ', 0, N'Челябинск           ', 2175218.5000, CAST(0.50 AS Numeric(18, 2)), 2, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Метрополис                    ', N'План                     ', 0, N'Санкт-Петербург     ', 8117913.0000, CAST(0.00 AS Numeric(18, 2)), 2, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Мозаика                       ', N'Строительсто             ', 20, N'Самара              ', 1429419.0000, CAST(0.00 AS Numeric(18, 2)), 4, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Москва                        ', N'Реализация               ', 12, N'Москва              ', 4226505.0000, CAST(0.30 AS Numeric(18, 2)), 3, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Наш Гипермаркет               ', N'План                     ', 0, N'Ростов-на-Дону      ', 1088735.0000, CAST(1.20 AS Numeric(18, 2)), 4, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Новинский пассаж              ', N'Реализация               ', 8, N'Екатеринбург        ', 3158957.0000, CAST(1.70 AS Numeric(18, 2)), 2, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Новомосковский                ', N'План                     ', 0, N'Казань              ', 7161962.8500, CAST(0.40 AS Numeric(18, 2)), 1, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Облака                        ', N'План                     ', 0, N'Санкт-Петербург     ', 1688905.0000, CAST(0.60 AS Numeric(18, 2)), 3, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Океания                       ', N'План                     ', 0, N'Самара              ', 5192089.0000, CAST(1.80 AS Numeric(18, 2)), 2, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Отрада                        ', N'Строительсто             ', 4, N'Санкт-Петербург     ', 6760316.0000, CAST(0.90 AS Numeric(18, 2)), 1, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Принц Плаза                   ', N'Реализация               ', 8, N'Самара              ', 1786688.0000, CAST(1.50 AS Numeric(18, 2)), 2, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Райкин Плаза                  ', N'Строительсто             ', 12, N'Санкт-Петербург     ', 8498470.0000, CAST(1.80 AS Numeric(18, 2)), 3, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Реутов Парк                   ', N'Строительсто             ', 4, N'Ростов-на-Дону      ', 1995904.0000, CAST(1.50 AS Numeric(18, 2)), 1, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Ривьера                       ', N'План                     ', 0, N'Москва              ', 8260042.0000, CAST(0.50 AS Numeric(18, 2)), 4, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Рига Молл                     ', N'План                     ', 0, N'Ростов-на-Дону      ', 9788316.0000, NULL, 3, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Рио                           ', N'Реализация               ', 5, N'Екатеринбург        ', 1888653.0000, CAST(0.50 AS Numeric(18, 2)), 1, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Твой дом                      ', N'План                     ', 0, N'Челябинск           ', 6810865.0000, CAST(1.70 AS Numeric(18, 2)), 4, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Три Кита                      ', N'План                     ', 0, N'Казань              ', 3089700.0000, CAST(1.70 AS Numeric(18, 2)), 1, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Фестиваль                     ', N'Удален                   ', 16, N'Новосибирск         ', 1828013.0000, NULL, 4, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Филион                        ', N'Строительсто             ', 8, N'Москва              ', 5343904.0000, CAST(0.30 AS Numeric(18, 2)), 2, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Ханой-Москва                  ', N'План                     ', 0, N'Самара              ', 9580221.0000, CAST(0.30 AS Numeric(18, 2)), 4, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Хорошо                        ', N'Реализация               ', -20, N'Ростов-на-Дону      ', 8306576.0000, CAST(1.90 AS Numeric(18, 2)), 4, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Черемушки                     ', N'Реализация               ', 15, N'Новосибирск         ', 7344604.0000, CAST(1.00 AS Numeric(18, 2)), 3, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Шереметьевский                ', N'Строительсто             ', 16, N'Новосибирск         ', 2941379.0000, CAST(1.00 AS Numeric(18, 2)), 4, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Шоколад                       ', N'Строительсто             ', 12, N'Челябинск           ', 2217279.0000, CAST(1.10 AS Numeric(18, 2)), 3, NULL)
INSERT [dbo].[Shopping_Center] ([Name], [Status], [Qua_Pavilion], [Sity], [Cost], [Ratio], [Floor], [Image]) VALUES (N'Щука                          ', N'Строительсто             ', 5, N'Нижний Новгород     ', 5428485.0000, CAST(0.40 AS Numeric(18, 2)), 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Tenant] ON 

INSERT [dbo].[Tenant] ([ID_Tenant], [Name], [Phone], [Address]) VALUES (1, N'AG Marine           ', N'+7(495)526-14-53    ', N'Москва, Бабаевская улица д.16')
INSERT [dbo].[Tenant] ([ID_Tenant], [Name], [Phone], [Address]) VALUES (2, N'Art-elle            ', N'+7(495)250-58-94    ', N'Санкт-Петербург, Амбарная улица д.25 корп.1')
INSERT [dbo].[Tenant] ([ID_Tenant], [Name], [Phone], [Address]) VALUES (3, N'Atlantis            ', N'+7(495)424-11-65    ', N'Новосибирск, Улица Каменская д.16')
INSERT [dbo].[Tenant] ([ID_Tenant], [Name], [Phone], [Address]) VALUES (4, N'Corporate Travel    ', N'+7(495)245-39-05    ', N'Екатеринбург, Улица Антона Валека д.56')
INSERT [dbo].[Tenant] ([ID_Tenant], [Name], [Phone], [Address]) VALUES (5, N'GallaDance          ', N'+7(495)316-77-94    ', N'Нижний Новгород, Улица Ларина д. 34')
SET IDENTITY_INSERT [dbo].[Tenant] OFF
GO
USE [master]
GO
ALTER DATABASE [Sessia1] SET  READ_WRITE 
GO
