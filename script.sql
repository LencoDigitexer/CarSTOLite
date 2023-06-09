USE [master]
GO
/****** Object:  Database [CarSTO]    Script Date: 16.03.2023 1:42:50 ******/
CREATE DATABASE [CarSTO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarSTO', FILENAME = N'C:\Users\addmi\CarSTO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarSTO_log', FILENAME = N'C:\Users\addmi\CarSTO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CarSTO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarSTO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarSTO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarSTO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarSTO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarSTO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarSTO] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarSTO] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CarSTO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarSTO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarSTO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarSTO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarSTO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarSTO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarSTO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarSTO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarSTO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CarSTO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarSTO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarSTO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarSTO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarSTO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarSTO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarSTO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarSTO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarSTO] SET  MULTI_USER 
GO
ALTER DATABASE [CarSTO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarSTO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarSTO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarSTO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarSTO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarSTO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CarSTO] SET QUERY_STORE = OFF
GO
USE [CarSTO]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 16.03.2023 1:42:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Gosnomer] [nvarchar](100) NULL,
	[Nazvanie] [nvarchar](max) NOT NULL,
	[Marka] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 16.03.2023 1:42:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderList] [nvarchar](max) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[DeliveryDate] [date] NOT NULL,
	[PickupPointId] [int] NOT NULL,
	[Client] [nvarchar](max) NOT NULL,
	[Code] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 16.03.2023 1:42:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 16.03.2023 1:42:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NumberPoint] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[Street] [nvarchar](max) NOT NULL,
	[NumberStreet] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 16.03.2023 1:42:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 16.03.2023 1:42:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Patronymic] [nvarchar](100) NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Role] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([Id], [Gosnomer], [Nazvanie], [Marka]) VALUES (32, N'123go123', N'Крутая машина', N'lada')
INSERT [dbo].[Car] ([Id], [Gosnomer], [Nazvanie], [Marka]) VALUES (33, N'123ААП123', N'Сломано крыло левое', N'Ферари')
SET IDENTITY_INSERT [dbo].[Car] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (1, N'А112Т4, 2, G598Y6, 2', CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 18, N'Поляков Степан Егорович', N'401', N'Новый ')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (2, N'F746E6, 3, D830R5, 3', CAST(N'2022-05-16' AS Date), CAST(N'2022-05-22' AS Date), 20, N'Леонова Алиса Кирилловна', N'402', N'Новый ')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (3, N'D648N7, 10, F735B6, 10', CAST(N'2022-05-17' AS Date), CAST(N'2022-05-23' AS Date), 20, N'Яковлев Платон Константинович', N'403', N'Завершен')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (4, N'F937G4, 1, E324U7, 1', CAST(N'2022-05-18' AS Date), CAST(N'2022-05-24' AS Date), 22, N'Ковалева Ева Яковлевна', N'404', N'Новый ')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (5, N'N483G5, 10, D038G6, 10', CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), 22, N'', N'405', N'Новый ')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (6, N'G480F5, 2, C324S5, 2', CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), 16, N'', N'406', N'Новый ')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (7, N'V312R4, 1, J4DF5E, 1', CAST(N'2022-05-21' AS Date), CAST(N'2022-05-27' AS Date), 16, N'', N'407', N'Завершен')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (8, N'G522B5, 3, K432G6, 3', CAST(N'2022-05-22' AS Date), CAST(N'2022-05-28' AS Date), 18, N'', N'408', N'Завершен')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (9, N'F047J7, 1, S374B5, 1', CAST(N'2022-05-23' AS Date), CAST(N'2022-05-29' AS Date), 24, N'', N'409', N'Новый ')
INSERT [dbo].[Order] ([Id], [OrderList], [OrderDate], [DeliveryDate], [PickupPointId], [Client], [Code], [Status]) VALUES (10, N'N836R5, 5, D927K3, 5', CAST(N'2022-05-24' AS Date), CAST(N'2022-05-30' AS Date), 24, N'', N'410', N'Завершен')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[PickupPoint] ON 

INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (2, N'344288', N' г. Дубна', N' ул. Чехова', N'1')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (3, N'614164', N' г.Дубна', N'  ул. Степная', N'30')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (4, N'394242', N' г. Дубна', N' ул. Коммунистическая', N'43')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (5, N'660540', N' г. Дубна', N' ул. Солнечная', N'25')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (6, N'125837', N' г. Дубна', N' ул. Шоссейная', N'40')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (7, N'125703', N' г. Дубна', N' ул. Партизанская', N'49')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (8, N'625283', N' г. Дубна', N' ул. Победы', N'46')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (9, N'614611', N' г. Дубна', N' ул. Молодежная', N'50')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (10, N'454311', N' г.Дубна', N' ул. Новая', N'19')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (11, N'660007', N' г.Дубна', N' ул. Октябрьская', N'19')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (12, N'603036', N' г. Дубна', N' ул. Садовая', N'4')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (13, N'450983', N' г.Дубна', N' ул. Комсомольская', N'26')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (14, N'394782', N' г. Дубна', N' ул. Чехова', N'3')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (15, N'603002', N' г. Дубна', N' ул. Дзержинского', N'28')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (16, N'450558', N' г. Дубна', N' ул. Набережная', N'30')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (17, N'394060', N' г.Дубна', N' ул. Фрунзе', N'43')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (18, N'410661', N' г. Дубна', N' ул. Школьная', N'50')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (19, N'625590', N' г. Дубна', N' ул. Коммунистическая', N'20')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (20, N'625683', N' г. Дубна', N' ул. 8 Марта', N'')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (21, N'400562', N' г. Дубна', N' ул. Зеленая', N'32')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (22, N'614510', N' г. Дубна', N' ул. Маяковского', N'47')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (23, N'410542', N' г. Дубна', N' ул. Светлая', N'46')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (24, N'620839', N' г. Дубна', N' ул. Цветочная', N'8')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (25, N'443890', N' г. Дубна', N' ул. Коммунистическая', N'1')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (26, N'603379', N' г. Дубна', N' ул. Спортивная', N'46')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (27, N'603721', N' г. Дубна', N' ул. Гоголя', N'41')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (28, N'410172', N' г. Дубна', N' ул. Северная', N'13')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (29, N'420151', N' г. Дубна', N' ул. Вишневая', N'32')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (30, N'125061', N' г. Дубна', N' ул. Подгорная', N'8')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (31, N'630370', N' г. Дубна', N' ул. Шоссейная', N'24')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (32, N'614753', N' г. Дубна', N' ул. Полевая', N'35')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (33, N'426030', N' г. Дубна', N' ул. Маяковского', N'44')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (34, N'450375', N' г. Дубна', N'ул. Клубная', N'44')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (35, N'625560', N' г. Дубна', N' ул. Некрасова', N'12')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (36, N'630201', N' г. Дубна', N' ул. Комсомольская', N'17')
INSERT [dbo].[PickupPoint] ([Id], [NumberPoint], [City], [Street], [NumberStreet]) VALUES (37, N'190949', N' г. Дубна', N' ул. Мичурина', N'26')
SET IDENTITY_INSERT [dbo].[PickupPoint] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Автомеханик')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (6, N'Пахомова', N'Аиша', N'Анатольевна', N'm4ic8j5qgstw@gmail.com', N'2L6KZG', 1)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (7, N'Жуков', N'Роман', N'Богданович', N'd43zfg9tlsyv@gmail.com', N'uzWC67', 1)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (8, N'Киселева', N'Анастасия', N'Максимовна', N'8ohgisf6k45w@outlook.com', N'8ntwUp', 1)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (9, N'Григорьева', N'Арина', N'Арсентьевна', N'hi1brwj46czx@mail.com', N'YOyhfR', 2)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (10, N'Иванов', N'Лев', N'Михайлович', N'fvkbcamhlj52@gmail.com', N'RSbvHv', 2)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (11, N'Григорьев', N'Лев', N'Давидович', N'9qxnce8jwruv@gmail.com', N'rwVDh9', 2)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (12, N'Поляков', N'Степан', N'Егорович', N'dotiex942p1r@gmail.com', N'LdNyos', 3)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (13, N'Леонова', N'Алиса', N'Кирилловна', N'n0bmi2h1xral@tutanota.com', N'gynQMT', 3)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (14, N'Яковлев', N'Платон', N'Константинович', N'sfm3t278kdvz@yahoo.com', N'AtnDjr', 3)
INSERT [dbo].[User] ([Id], [Surname], [Name], [Patronymic], [Login], [Password], [Role]) VALUES (15, N'Ковалева', N'Ева', N'Яковлевна', N'ilb8rdut0v7e@mail.com', N'JlFRCZ', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Product__3C991142713BF910]    Script Date: 16.03.2023 1:42:50 ******/
ALTER TABLE [dbo].[Car] ADD UNIQUE NONCLUSTERED 
(
	[Gosnomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([PickupPointId])
REFERENCES [dbo].[PickupPoint] ([Id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([Role])
REFERENCES [dbo].[Role] ([Id])
GO
USE [master]
GO
ALTER DATABASE [CarSTO] SET  READ_WRITE 
GO
