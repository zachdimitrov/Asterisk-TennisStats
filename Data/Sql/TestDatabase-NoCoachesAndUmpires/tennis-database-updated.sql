USE [master]
GO
/****** Object:  Database [TennisStats]    Script Date: 06-Jun-17 2:35:20 AM ******/
CREATE DATABASE [TennisStats]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TennisStats', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TennisStats.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TennisStats_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TennisStats_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TennisStats] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TennisStats].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TennisStats] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TennisStats] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TennisStats] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TennisStats] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TennisStats] SET ARITHABORT OFF 
GO
ALTER DATABASE [TennisStats] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TennisStats] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TennisStats] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TennisStats] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TennisStats] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TennisStats] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TennisStats] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TennisStats] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TennisStats] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TennisStats] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TennisStats] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TennisStats] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TennisStats] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TennisStats] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TennisStats] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TennisStats] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TennisStats] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TennisStats] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TennisStats] SET  MULTI_USER 
GO
ALTER DATABASE [TennisStats] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TennisStats] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TennisStats] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TennisStats] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TennisStats] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TennisStats', N'ON'
GO
USE [TennisStats]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 06-Jun-17 2:35:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NULL,
	[TournamentId] [int] NULL,
	[CountryId] [int] NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 06-Jun-17 2:35:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Matches]    Script Date: 06-Jun-17 2:35:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matches](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WinnerId] [int] NOT NULL,
	[LoserId] [int] NOT NULL,
	[Result] [nvarchar](40) NULL,
	[TournamentId] [int] NULL,
	[DatePlayed] [smalldatetime] NULL,
	[RoundId] [int] NULL,
 CONSTRAINT [PK_Matches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Players]    Script Date: 06-Jun-17 2:35:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](40) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Height] [numeric](3, 0) NULL,
	[Weight] [numeric](3, 0) NULL,
	[BirthDate] [smalldatetime] NULL,
	[CityId] [int] NULL,
	[Ranking] [int] NOT NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PointDistributions]    Script Date: 06-Jun-17 2:35:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointDistributions](
	[RoundId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Points] [int] NULL,
 CONSTRAINT [PK_PointDistributionKeys] PRIMARY KEY CLUSTERED 
(
	[RoundId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rounds]    Script Date: 06-Jun-17 2:35:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rounds](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NULL,
 CONSTRAINT [PK_Rounds] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Surfaces]    Script Date: 06-Jun-17 2:35:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surfaces](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](40) NOT NULL,
	[Speed] [nvarchar](40) NULL,
 CONSTRAINT [PK_Surfaces] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TournamentCategories]    Script Date: 06-Jun-17 2:35:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](40) NOT NULL,
	[PlayersNumber] [int] NULL,
 CONSTRAINT [PK_Series] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tournaments]    Script Date: 06-Jun-17 2:35:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournaments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[StartDate] [smalldatetime] NOT NULL,
	[EndDate] [smalldatetime] NOT NULL,
	[SurfaceId] [int] NOT NULL,
	[PrizeMoney] [money] NOT NULL,
	[CityId] [int] NOT NULL,
 CONSTRAINT [PK_Tournaments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Players] FOREIGN KEY([LoserId])
REFERENCES [dbo].[Players] ([Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Players]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Players1] FOREIGN KEY([WinnerId])
REFERENCES [dbo].[Players] ([Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Players1]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Rounds] FOREIGN KEY([RoundId])
REFERENCES [dbo].[Rounds] ([Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Rounds]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Tournaments] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournaments] ([Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Tournaments]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Cities]
GO
ALTER TABLE [dbo].[PointDistributions]  WITH CHECK ADD  CONSTRAINT [FK_PointDistributionKeys_Rounds] FOREIGN KEY([RoundId])
REFERENCES [dbo].[Rounds] ([Id])
GO
ALTER TABLE [dbo].[PointDistributions] CHECK CONSTRAINT [FK_PointDistributionKeys_Rounds]
GO
ALTER TABLE [dbo].[PointDistributions]  WITH CHECK ADD  CONSTRAINT [FK_PointDistributionKeys_TournamentCategories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[TournamentCategories] ([Id])
GO
ALTER TABLE [dbo].[PointDistributions] CHECK CONSTRAINT [FK_PointDistributionKeys_TournamentCategories]
GO
ALTER TABLE [dbo].[Tournaments]  WITH CHECK ADD  CONSTRAINT [FK_Tournaments_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Tournaments] CHECK CONSTRAINT [FK_Tournaments_Cities]
GO
ALTER TABLE [dbo].[Tournaments]  WITH CHECK ADD  CONSTRAINT [FK_Tournaments_Surfaces] FOREIGN KEY([SurfaceId])
REFERENCES [dbo].[Surfaces] ([Id])
GO
ALTER TABLE [dbo].[Tournaments] CHECK CONSTRAINT [FK_Tournaments_Surfaces]
GO
ALTER TABLE [dbo].[Tournaments]  WITH CHECK ADD  CONSTRAINT [FK_Tournaments_TournamentCategories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[TournamentCategories] ([Id])
GO
ALTER TABLE [dbo].[Tournaments] CHECK CONSTRAINT [FK_Tournaments_TournamentCategories]
GO
USE [master]
GO
ALTER DATABASE [TennisStats] SET  READ_WRITE 
GO
