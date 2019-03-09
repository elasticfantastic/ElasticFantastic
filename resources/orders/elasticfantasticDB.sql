/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.1742)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [ElasticFantastic]    Script Date: 2019-02-18 11:18:03 ******/
CREATE DATABASE [ElasticFantastic]
GO
ALTER DATABASE [ElasticFantastic] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ElasticFantastic].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ElasticFantastic] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ElasticFantastic] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ElasticFantastic] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ElasticFantastic] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ElasticFantastic] SET ARITHABORT OFF 
GO
ALTER DATABASE [ElasticFantastic] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ElasticFantastic] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ElasticFantastic] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ElasticFantastic] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ElasticFantastic] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ElasticFantastic] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ElasticFantastic] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ElasticFantastic] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ElasticFantastic] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ElasticFantastic] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ElasticFantastic] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ElasticFantastic] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ElasticFantastic] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ElasticFantastic] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ElasticFantastic] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ElasticFantastic] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ElasticFantastic] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ElasticFantastic] SET RECOVERY FULL 
GO
ALTER DATABASE [ElasticFantastic] SET  MULTI_USER 
GO
ALTER DATABASE [ElasticFantastic] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ElasticFantastic] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ElasticFantastic] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ElasticFantastic] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ElasticFantastic] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ElasticFantastic', N'ON'
GO
ALTER DATABASE [ElasticFantastic] SET QUERY_STORE = OFF
GO
USE [ElasticFantastic]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ElasticFantastic]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 2019-02-18 11:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 2019-02-18 11:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ssn] [varchar](50) NOT NULL,
	[name] [varchar](60) NULL,
	[street] [varchar](100) NULL,
	[zip] [varchar](50) NULL,
	[city] [varchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ssn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orderr]    Script Date: 2019-02-18 11:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orderr](
	[orderNbr] [int] IDENTITY(1,1) NOT NULL,  
	[time] [datetime] NOT NULL,
	[customerSSN] [varchar](50) NULL,
 CONSTRAINT [PK_Orderr] PRIMARY KEY CLUSTERED
(
	[orderNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2019-02-18 11:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productNbr] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](50) NOT NULL,
	[price] [decimal](18, 3) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
GO
/****** Object:  Table [dbo].[OrderLine]    Script Date: 2019-02-18 11:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLine](
	[orderNbr] [int] NOT NULL,
	[productNbr] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	    CONSTRAINT FK_OrderLine FOREIGN KEY (orderNbr) REFERENCES Orderr(orderNbr),
		constraint fk_order_line2 foreign key (productNbr) REFERENCES Product(productNbr),
 CONSTRAINT [PK_OrderLine] PRIMARY KEY CLUSTERED
(
	[orderNbr] ASC,
	[productNbr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16010313-3906', N'Phelan Gonzalez', N'P.O. Box 618, 4980 Magna Ave', N'51656', N'Labrecque')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16020628-2741', N'Savannah Sutton', N'3269 Dignissim Rd.', N'43428', N'Oria')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16020904-7232', N'Forrest Boyle', N'Ap #115-9920 Libero. Avenue', N'73577', N'Ruvo del Monte')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16030424-4783', N'Nita Evans', N'Ap #577-7721 Volutpat Rd.', N'8573 ZM', N'Maunath Bhanjan')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16030520-6468', N'Brielle Schwartz', N'Ap #531-5497 Mi. Avenue', N'50472-590', N'Avellino')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16030714-8189', N'Kane Langley', N'671 Ante, Road', N'52540', N'Bernau')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16031128-8567', N'Channing Cummings', N'4951 Felis St.', N'22189', N'Namen')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16040617-2759', N'Tallulah Michael', N'Ap #174-6875 Pharetra. Rd.', N'3033', N'Vedrin')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16040806-0788', N'Brandon Parrish', N'P.O. Box 799, 7736 Et, St.', N'5800', N'Anantapur')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16041207-1680', N'Keegan Fleming', N'270-1583 Tortor. Street', N'25217', N'West Jordan')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16050529-8018', N'Freya Steele', N'Ap #491-6077 Nisi. Ave', N'N7R 5C0', N'Salamanca')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16051013-7797', N'Abra Wolfe', N'P.O. Box 325, 2335 Tortor Ave', N'65905', N'Oklahoma City')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16060624-2188', N'Hillary Robbins', N'4418 Cras Rd.', N'71510', N'Mazzano Romano')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16060930-3458', N'Vladimir Livingston', N'7726 Arcu. Street', N'9697', N'Oldenzaal')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16071024-1506', N'Yael Cortez', N'Ap #526-5854 Dui. St.', N'80579', N'Kapuskasing')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16080919-1919', N'Rowan Bradshaw', N'129-6894 Cras St.', N'2292 KP', N'Castle Douglas')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16081117-7849', N'Connor Mueller', N'240 A Avenue', N'4372 ZZ', N'Villanova d''Albenga')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16081216-2816', N'Talon Meyer', N'Ap #620-7254 Sem, St.', N'70787', N'Les Bulles')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16090310-6821', N'Jada Buckley', N'2742 Neque Av.', N'40804', N'Vernon')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16090412-0714', N'Sigourney Zamora', N'7946 Amet Ave', N'148819', N'Albano di Lucania')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16091208-6162', N'Baker Ramos', N'968-8345 Mattis St.', N'02177', N'Aizwal')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16100322-0769', N'Alec Nielsen', N'113-643 Vitae St.', N'8071', N'Athus')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16100808-4814', N'Denton Carpenter', N'Ap #379-2209 Aliquam Rd.', N'6262', N'Wittenberg')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16100823-4294', N'Ayanna Simpson', N'475-5856 Ligula. St.', N'848592', N'Sunset Point')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16101116-3753', N'Megan Delaney', N'Ap #217-4546 Vitae Ave', N'40160', N'Calmar')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16110503-3458', N'Octavia Rosario', N'343 Morbi Rd.', N'023397', N'Poggiorsini')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16120223-5741', N'Buffy Potter', N'9629 Ipsum. Street', N'08173', N'Sedgewick')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16120225-7505', N'Illana Lindsey', N'P.O. Box 705, 9070 Arcu. Rd.', N'92-690', N'Gembloux')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16120514-2241', N'Aladdin Williamson', N'719-6231 Leo. Street', N'P5E 4G1', N'São Luís')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16131003-4978', N'Hayden Johnson', N'1961 Aliquet Ave', N'34690', N'Moricone')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16131116-7462', N'Lucas Terrell', N'Ap #983-1857 Imperdiet Ave', N'OB3P 6UB', N'Sambalpur')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16140118-1720', N'Tate Stokes', N'Ap #136-7582 Integer St.', N'76216', N'Loksbergen')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16141001-6537', N'Autumn Gibbs', N'497-8415 Vivamus Av.', N'57910', N'Villers-le-Peuplier')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16141109-9649', N'Richard Miles', N'340-7654 Ut Street', N'24617', N'Loverval')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16141127-3947', N'Rylee Mccarthy', N'P.O. Box 286, 1090 Venenatis Road', N'82108', N'Grimma')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16150912-4283', N'Declan Carver', N'Ap #446-3238 Consequat Rd.', N'1100', N'Vaux-sous-ChŽvremont')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16150930-0230', N'Sage Moore', N'Ap #689-4795 Faucibus. Ave', N'79703', N'Lelystad')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16160125-1059', N'Geoffrey Jones', N'717-3834 Vestibulum Road', N'98148-669', N'Laives/Leifers')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16160708-0759', N'Catherine Ruiz', N'4820 Lacus. Rd.', N'9742', N'Margate')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16170404-6802', N'Kyle Burt', N'4239 Aliquam Street', N'20609', N'Jalandhar (Jullundur)')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16170510-9922', N'Fletcher Heath', N'Ap #209-882 Lacinia Road', N'K3J 3P7', N'IJlst')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16170613-6486', N'Dawn Mcdowell', N'P.O. Box 554, 4047 Euismod Av.', N'5479', N'Bulnes')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16171228-4726', N'Sierra Graves', N'5225 Amet, Street', N'VJ5R 6TW', N'Amelia')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16180604-5561', N'Maisie Jenkins', N'884-7570 Pede. St.', N'86244', N'Hull')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16180802-2600', N'Mary Cain', N'6773 Sodales Ave', N'6589', N'Papasidero')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16180921-4073', N'Shaeleigh Colon', N'Ap #583-3348 Proin St.', N'931085', N'Caprino Bergamasco')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16181103-8320', N'Amaya Bowen', N'Ap #532-6070 Est Av.', N'23334', N'Jambes')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16200521-2077', N'Zelenia Thomas', N'P.O. Box 968, 1563 Magnis Road', N'49239', N'Alcobendas')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16200912-5119', N'Fredericka Justice', N'P.O. Box 475, 8351 Cras Av.', N'2261', N'Camborne')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16200915-4051', N'Shellie Dean', N'927-9632 Dapibus St.', N'96260-233', N'Llanwrtwd Wells')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16201029-6495', N'Wylie Beach', N'P.O. Box 450, 4932 Est Avenue', N'12816', N'Kieldrecht')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16211024-3173', N'Angela Pope', N'P.O. Box 578, 599 Urna. Road', N'17887', N'Evere')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16211121-5675', N'Lois Dunlap', N'116-4780 Eu St.', N'73258', N'Lustin')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16220921-4606', N'Maile Langley', N'983 Eu St.', N'338047', N'Campbelltown')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16230816-1229', N'Jade Foreman', N'Ap #527-5014 Suspendisse St.', N'88211', N'Portofino')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16230925-7760', N'Kylee Leonard', N'253-7118 Velit. Avenue', N'R9X 1K6', N'Ludvika')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16240120-4090', N'Mercedes Navarro', N'Ap #722-5639 Sed Road', N'45404', N'Gonnosnò')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16240318-0561', N'Marcia Robertson', N'Ap #958-6895 Nam Rd.', N'6198', N'Hexham')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16240406-3758', N'Ivan Baird', N'789-3183 Nisi Rd.', N'76812-758', N'Jette')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16241013-6812', N'Myra Vance', N'Ap #770-5699 Est Street', N'41207', N'Newport')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16250629-6421', N'Ayanna Johnston', N'P.O. Box 753, 7706 Libero St.', N'01128-603', N'Marzi')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16250718-4261', N'Bernard Mosley', N'Ap #945-2432 Sapien, Avenue', N'5785', N'Quinta Normal')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16250808-7265', N'Alana Oneill', N'3986 Nec Avenue', N'29478', N'TrognŽe')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16251019-1063', N'Burton Wiley', N'P.O. Box 405, 1196 Amet Rd.', N'5415', N'Burnaby')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16251224-0645', N'Ciaran Barker', N'545-7525 Sed Rd.', N'453688', N'Gatineau')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16280128-3868', N'Sarah Dalton', N'Ap #884-1004 Suspendisse Av.', N'2654 YK', N'Przemysl')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16290514-6359', N'Gannon Tran', N'810-383 Nec Rd.', N'23109', N'Gloucester')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16290517-8790', N'Rigel Brennan', N'583-7504 Amet Ave', N'B3B 0Y6', N'Zutendaal')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16300106-8216', N'Jerome Tyler', N'P.O. Box 982, 845 Nulla. Av.', N'41016', N'Sanquhar')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16310721-1793', N'Jared Contreras', N'Ap #554-6236 In Av.', N'7420', N'Ragogna')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16330326-3267', N'Silas Matthews', N'561-1442 Congue. Road', N'84365-987', N'Chiaromonte')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16330413-7874', N'Upton Collier', N'512-4900 Erat. Rd.', N'08652-223', N'Aserrí')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16340724-4056', N'Dane Bruce', N'6769 Et Av.', N'2320', N'Poole')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16340823-4122', N'Hu Cervantes', N'P.O. Box 656, 5859 Tempor St.', N'2028', N'Mansfield-et-Pontefract')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16340909-2586', N'Ethan White', N'758-8667 Non, Ave', N'EC5D 8KV', N'Livorno')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16341013-8949', N'Brendan Byrd', N'Ap #194-7057 Nascetur Rd.', N'V4J 7Y1', N'Maple Creek')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16350327-9394', N'Dorian Snider', N'6347 Mollis Rd.', N'89469', N'Las Vegas')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16350328-4816', N'Merrill Holmes', N'605-1744 Tempor Rd.', N'50027', N'Louisville')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16350507-5386', N'Camilla Tyler', N'4838 Leo. Avenue', N'62486', N'Bousval')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16351112-4053', N'Garth Davenport', N'Ap #948-5770 Vulputate, Rd.', N'D12 3RM', N'Burin')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16351113-3377', N'Keefe Gross', N'807-8574 Nunc Avenue', N'S9Y 8X1', N'Beveren')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16351217-0840', N'Akeem Gray', N'P.O. Box 995, 5159 Dui Av.', N'54141-517', N'Bury St. Edmunds')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16360509-4188', N'Mia Russell', N'P.O. Box 139, 4206 Nibh Av.', N'J6G 4L6', N'Windermere')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16370110-8783', N'Berk Haynes', N'P.O. Box 147, 6076 Inceptos Rd.', N'14776', N'Wevelgem')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16370706-8494', N'Abraham Watkins', N'681-7534 Augue. Ave', N'2395', N'Ortacesus')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16380611-0429', N'Alan Curtis', N'P.O. Box 643, 3036 Purus St.', N'83623', N'Bolinne')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16391123-2951', N'Maryam Cooper', N'Ap #351-3979 Ullamcorper Rd.', N'02343', N'Dorval')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16410816-9675', N'Martena Luna', N'Ap #885-5142 Malesuada Street', N'W50 4ZY', N'Gandhidham')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16421119-8215', N'Danielle Zamora', N'9303 Tellus Rd.', N'3563', N'Whyalla')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16430601-4129', N'Lara Landry', N'952-9626 Tempus Ave', N'39841', N'Cawdor')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16430622-3134', N'Cruz Holden', N'P.O. Box 883, 7062 Nunc St.', N'108160', N'Sh?diac')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16440112-2421', N'Dante Dennis', N'Ap #102-9286 Non, Ave', N'T6K 8A3', N'Valmacca')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16450228-0862', N'Trevor Ayala', N'P.O. Box 539, 1710 Eget Ave', N'2445', N'Avadi')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16460108-4272', N'Uriel Shannon', N'Ap #340-1772 Lorem St.', N'29241', N'Denderbelle')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16460111-7742', N'Zephania Larson', N'P.O. Box 377, 3325 Cras Avenue', N'67567', N'Lens')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16460311-1776', N'Zeus Rivas', N'3579 Sit Road', N'06187', N'Marano Lagunare')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16460611-8182', N'Haley Randall', N'P.O. Box 166, 2213 Cursus. Rd.', N'62977', N'Beverley')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16460711-8835', N'Oleg Farmer', N'Ap #258-3470 Nascetur Ave', N'324990', N'Kawartha Lakes')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16471128-7849', N'Graham Reilly', N'P.O. Box 420, 4297 Sed St.', N'65819', N'Columbia')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16480119-6306', N'Flynn Knapp', N'370-4830 Dui. Road', N'70114', N'Antakya')
GO
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16480515-3055', N'Abbot Warren', N'Ap #770-784 Malesuada. Av.', N'6538', N'Township of Minden Hills')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16481020-2863', N'Cody Lester', N'Ap #378-5156 Egestas St.', N'6418', N'Asti')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16481022-7704', N'Flavia Thompson', N'7103 Egestas. Rd.', N'433561', N'Cuccaro Vetere')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16490107-8669', N'Linus Vaughan', N'Ap #752-1253 In St.', N'404014', N'Ottignies-Louvain-la-Neuve')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16490108-8692', N'Winter Walsh', N'1528 Libero Rd.', N'187766', N'Eberswalde-Finow')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16491204-7190', N'Zeph Holloway', N'Ap #565-2260 Ac, St.', N'65-322', N'Baltimore')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16500130-5324', N'Kato Gould', N'737 Odio Rd.', N'79680', N'Sambalpur')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16500926-9852', N'Amery Huffman', N'345-6851 Duis Ave', N'40507', N'Vorselaar')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16510113-7593', N'Moana Hess', N'Ap #424-5065 Purus Ave', N'31601', N'San Costantino Calabro')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16530306-5352', N'Erica Kent', N'6549 Tincidunt Rd.', N'27621', N'Grand-Hallet')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16530326-8998', N'Ishmael Pennington', N'Ap #277-1846 Duis Rd.', N'91935', N'Chishtian Mandi')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16530619-5453', N'Brenda Dennis', N'6479 Sed Avenue', N'404600', N'Bedollo')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16531120-8770', N'Kimberly Wilkins', N'994-317 Convallis, Street', N'960044', N'Gibsons')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16540320-8969', N'Jena Nicholson', N'419-6286 Nulla Ave', N'79910', N'Campomarino')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16540613-3883', N'Barbara Gross', N'669-5632 In St.', N'05763', N'Caplan')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16550812-8070', N'Blair Holmes', N'Ap #911-7239 Quisque Ave', N'90-672', N'Khammam')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16561122-5573', N'Wayne Mendoza', N'881-2017 Aliquam Rd.', N'83625-730', N'Fontanellato')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16570502-7760', N'Joelle Dillon', N'162-5690 Semper Av.', N'C8B 5Z1', N'Nocera Umbra')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16570626-1772', N'Yolanda Kemp', N'234-9191 Dui. Street', N'73407', N'Montague')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16570728-3973', N'Vera Dawson', N'575-1114 Ante Rd.', N'835813', N'Castelló')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16581007-0937', N'Brent Terry', N'P.O. Box 132, 9823 Metus Street', N'929671', N'Ganganagar')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16591115-1545', N'Eagan Kent', N'230-8704 Maecenas St.', N'7385', N'Kulti-Barakar')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16600701-5701', N'Jason Cruz', N'221-9125 Non Rd.', N'1573 NE', N'Gangtok')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16600705-5632', N'Jesse Pugh', N'P.O. Box 319, 9760 Nonummy. Ave', N'4235', N'Lumaco')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16620201-6140', N'Nichole Gardner', N'Ap #125-4418 Sem Rd.', N'4558', N'New Orleans')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16621126-0523', N'Robin Molina', N'Ap #479-5406 Purus Road', N'12958', N'Alken')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16640906-4273', N'Henry Hoffman', N'Ap #938-4398 Convallis, Av.', N'42687', N'Bourges')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16641210-9453', N'Alika Harrison', N'864-2397 Orci. Rd.', N'20899', N'Cochrane')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16641218-4092', N'Silas Booth', N'Ap #726-5206 Vivamus Street', N'46417', N'Eyemouth')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16650612-4640', N'Shafira Reynolds', N'9992 Nascetur Rd.', N'4430', N'Beaufays')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16650909-6050', N'Sandra Conner', N'7297 Sit Ave', N'2060 MH', N'Solingen')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16651126-3250', N'Nash Stevens', N'Ap #588-9945 Ipsum Ave', N'61-309', N'Fort Collins')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16660119-1247', N'Leila Marquez', N'Ap #887-4792 Donec Rd.', N'11917', N'Greater Sudbury')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16660912-2723', N'Elliott English', N'P.O. Box 772, 3020 Placerat, Ave', N'X1E 7XG', N'Pramaggiore')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16661102-4768', N'Duncan Ochoa', N'271-9069 Nisl Avenue', N'04554', N'Itterbeek')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16670605-0447', N'Bethany Coleman', N'Ap #886-539 Consectetuer, Rd.', N'11800', N'Essex')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16681213-8458', N'Zelenia Holcomb', N'326-4151 Facilisis, Street', N'29584', N'Neubrandenburg')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16690226-0741', N'Talon Simon', N'Ap #931-4690 Rutrum Street', N'O3 5DZ', N'Lompret')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16690518-7388', N'Lucian Herrera', N'P.O. Box 205, 7395 In Rd.', N'30708', N'Meridian')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16690913-6779', N'Hop Robles', N'P.O. Box 973, 241 Donec Rd.', N'1793', N'Joondalup')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16700125-9675', N'Dylan Fulton', N'3161 Ipsum St.', N'20518', N'Novoli')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16700519-7624', N'Idona Foreman', N'823-2554 Lectus St.', N'80470', N'Serramonacesca')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16711207-2850', N'Ramona Simmons', N'Ap #232-3094 Pede, Rd.', N'512840', N'Reno')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16720104-6245', N'Mariko Cameron', N'P.O. Box 982, 1254 Gravida Road', N'93069-881', N'Barry')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16720307-4328', N'Aaron Shaffer', N'P.O. Box 511, 4453 Sagittis Avenue', N'127539', N'Spokane')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16720408-1488', N'Porter Norris', N'918-7211 Euismod St.', N'97885', N'Chhindwara')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16720605-6165', N'Christen Campos', N'P.O. Box 880, 8647 Elit Street', N'21-752', N'Provo')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16730316-9119', N'Curran Talley', N'9277 Maecenas Street', N'66270', N'Narcao')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16730816-2135', N'Roth Silva', N'548 Amet Avenue', N'46274', N'Titagarh')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16741106-2008', N'Sydnee Holland', N'Ap #193-4444 Neque. Av.', N'CL81 8AF', N'Lincoln')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16751217-6715', N'Colin Castillo', N'559-9555 Gravida Rd.', N'30-701', N'Bolton')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16760321-5075', N'Fuller Chambers', N'P.O. Box 142, 4750 Cursus Rd.', N'4284', N'Grand Rapids')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16760520-1735', N'Julian Donovan', N'P.O. Box 145, 605 Duis Rd.', N'50-339', N'Rockford')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16761030-0753', N'Linus Baird', N'P.O. Box 693, 2255 Tristique Road', N'0891 PI', N'Marchienne-au-Pont')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16770402-4699', N'Benedict Farley', N'P.O. Box 756, 3228 Interdum St.', N'89337', N'Tiverton')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16770625-1324', N'Maris Hicks', N'P.O. Box 948, 3298 Pede, St.', N'36-185', N'Izmit')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16780713-2274', N'Sandra Flowers', N'Ap #221-4144 Nisi. Rd.', N'7151', N'Cowdenbeath')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16780806-3361', N'Karleigh Mcdowell', N'2876 Semper, Rd.', N'68136-675', N'Haut-Ittre')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16790603-0940', N'Hyatt Cooke', N'Ap #191-8032 Dictum. Road', N'985078', N'Whittlesey')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16790906-0977', N'Dolan Britt', N'P.O. Box 624, 2357 Donec Road', N'3326', N'Navsari')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16800310-5957', N'Jolie Preston', N'Ap #930-9481 Lorem Av.', N'382707', N'Rimbey')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16811107-4632', N'Carolyn Osborn', N'524 Aliquet Avenue', N'61699', N'Bad Kreuznach')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16811221-8733', N'Noah Stuart', N'751-6476 Quam Avenue', N'81156', N'Casperia')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16820115-5606', N'Summer Cash', N'Ap #827-9483 Sit Av.', N'8797', N'Chillán Viejo')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16820201-8233', N'Raphael Young', N'2223 Vulputate, Av.', N'84048', N'Limelette')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16821111-5244', N'Echo Benjamin', N'P.O. Box 743, 8940 Gravida Rd.', N'L9P 2N6', N'Evansville')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16830925-0978', N'Maxwell Mullen', N'3484 Auctor St.', N'90-774', N'Fratta Todina')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16840108-5645', N'Camilla Barron', N'633-500 Nisi St.', N'280445', N'Piana degli Albanesi')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16840214-2536', N'Hiroko Holt', N'468-985 Viverra. Avenue', N'1704', N'Strasbourg')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16840420-0324', N'Nehru Johns', N'9049 Donec Ave', N'30096', N'Vanier')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16840509-9881', N'Carly House', N'P.O. Box 448, 4179 Quam Rd.', N'17296', N'Castiglione di Garfagnana')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16850603-1601', N'Harrison Estes', N'Ap #332-1643 Vitae Ave', N'4823', N'Empoli')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16860214-8853', N'Aspen Conner', N'Ap #487-2761 Et, St.', N'O5 1OB', N'Medemblik')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16870107-3176', N'Rudyard Colon', N'467-5057 Ut Road', N'77249', N'Driffield')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16870327-5787', N'Claire Mccarthy', N'124-5036 Phasellus Avenue', N'1083', N'Serik')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16870713-5094', N'Renee Case', N'Ap #907-714 Sed St.', N'02740', N'Schönebeck')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16881130-6557', N'Wayne Gentry', N'P.O. Box 981, 8833 Feugiat Street', N'50900', N'Lakeland County')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16890227-3831', N'Austin Bolton', N'Ap #516-4387 Fringilla Road', N'69-840', N'Morrinsville')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16900127-5230', N'Juliet Boone', N'P.O. Box 351, 6012 Lorem, Ave', N'5185', N'Covington')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16900414-0902', N'Ignacia Whitehead', N'Ap #552-8539 Eget Street', N'4829 JF', N'Lincoln')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16900426-7648', N'Meghan Parrish', N'196-6568 Velit Road', N'68114', N'Juazeiro do Norte')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16900808-4783', N'Steel Mercer', N'P.O. Box 323, 6207 Ante. St.', N'85-816', N'Vietri di Potenza')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16901211-0525', N'Chava Hudson', N'893-8813 Vitae, St.', N'40305', N'Mataró')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16910211-8735', N'Elaine Bruce', N'938-9174 Nulla St.', N'36605', N'Monticelli d''Ongina')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16910527-2323', N'Jayme Huffman', N'Ap #967-1660 Scelerisque St.', N'294055', N'Ingooigem')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16930310-2207', N'Oren Mcbride', N'P.O. Box 516, 3957 Tristique Rd.', N'677578', N'Campofelice di Fitalia')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16940417-5268', N'Beatrice Buckley', N'Ap #912-8033 At Av.', N'9651 IQ', N'Calle Larga')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16941104-9092', N'Rooney Melendez', N'P.O. Box 910, 1292 Nulla St.', N'681907', N'Saint-Remy')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16950124-9693', N'Sean Stewart', N'P.O. Box 241, 9924 Ornare, Road', N'E8B 0Z1', N'Austin')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16950512-2664', N'Danielle Cervantes', N'619-3169 Ultricies Rd.', N'70190-743', N'Fort St. John')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16950615-9541', N'Laith Summers', N'Ap #563-8670 Dapibus Rd.', N'3721', N'Ponoka')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16950703-6649', N'Zelda Stewart', N'Ap #720-2148 Cras Rd.', N'61619', N'Croydon')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16950718-9315', N'Tanya Guzman', N'1184 In St.', N'433199', N'Subiaco')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16960913-5166', N'Renee Kemp', N'Ap #915-7003 Nunc St.', N'J2V 6KW', N'Philadelphia')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16971201-6329', N'Tanya Morgan', N'P.O. Box 104, 8484 Eu, St.', N'37031', N'Ludwigshafen')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16980225-7619', N'Zeus Short', N'416 Ullamcorper St.', N'310061', N'Verzegnis')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16980527-4694', N'Sage Welch', N'9243 Enim, Ave', N'7486', N'Provost')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16981207-2057', N'Brenna Matthews', N'P.O. Box 902, 8605 Varius Road', N'5850', N'North Saanich')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16990518-9206', N'Justin Booker', N'1447 Phasellus Ave', N'R9N 7H2', N'Ellesmere Port')
INSERT [dbo].[Customer] ([ssn], [name], [street], [zip], [city]) VALUES (N'16990915-2390', N'Clare Rush', N'5234 Suspendisse Ave', N'74596-094', N'Galvarino')
GO
INSERT [dbo].[Product] ([productName], [price]) VALUES ( N'TV', CAST(4999.000 AS Decimal(18, 3)))
INSERT [dbo].[Product] ([productName], [price]) VALUES ( N'Computer', CAST(8999.000 AS Decimal(18, 3)))
INSERT [dbo].[Product] ([productName], [price]) VALUES ( N'Headphones', CAST(1999.000 AS Decimal(18, 3)))
INSERT [dbo].[Product] ([productName], [price]) VALUES ( N'Speaker', CAST(899.000 AS Decimal(18, 3)))
INSERT [dbo].[Product] ([productName], [price]) VALUES ( N'Powerbank', CAST(199.000 AS Decimal(18, 3)))
INSERT [dbo].[Product] ([productName], [price]) VALUES ( N'Monitor', CAST(2999.000 AS Decimal(18, 3)))
INSERT [dbo].[Product] ([productName], [price]) VALUES ( N'Keyboard', CAST(899.000 AS Decimal(18, 3)))
INSERT [dbo].[Product] ([productName], [price]) VALUES ( N'Computer mouse', CAST(299.000 AS Decimal(18, 3)))
INSERT [dbo].[Product] ([productName], [price]) VALUES ( N'Laptop', CAST(9999.000 AS Decimal(18, 3)))
INSERT [dbo].[Product] ([productName], [price]) VALUES ( N'Tablet', CAST(4999.000 AS Decimal(18, 3)))
ALTER TABLE [dbo].[Orderr]  WITH CHECK ADD  CONSTRAINT [FK_CustomerSSN] FOREIGN KEY([customerSSN])
REFERENCES [dbo].[Customer] ([ssn])
GO
ALTER TABLE [dbo].[Orderr] CHECK CONSTRAINT [FK_CustomerSSN]
GO
USE [master]
GO
ALTER DATABASE [ElasticFantastic] SET  READ_WRITE 
GO
