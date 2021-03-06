USE [master]
GO
/****** Object:  Database [TennisStatsClean]    Script Date: 2017-06-05 6:46:54 PM ******/
CREATE DATABASE [TennisStatsClean]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TennisStatsClean', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\TennisStatsClean.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TennisStatsClean_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\TennisStatsClean_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TennisStatsClean] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TennisStatsClean].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TennisStatsClean] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TennisStatsClean] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TennisStatsClean] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TennisStatsClean] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TennisStatsClean] SET ARITHABORT OFF 
GO
ALTER DATABASE [TennisStatsClean] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TennisStatsClean] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TennisStatsClean] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TennisStatsClean] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TennisStatsClean] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TennisStatsClean] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TennisStatsClean] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TennisStatsClean] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TennisStatsClean] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TennisStatsClean] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TennisStatsClean] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TennisStatsClean] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TennisStatsClean] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TennisStatsClean] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TennisStatsClean] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TennisStatsClean] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TennisStatsClean] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TennisStatsClean] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TennisStatsClean] SET  MULTI_USER 
GO
ALTER DATABASE [TennisStatsClean] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TennisStatsClean] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TennisStatsClean] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TennisStatsClean] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TennisStatsClean] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TennisStatsClean] SET QUERY_STORE = OFF
GO
USE [TennisStatsClean]
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
USE [TennisStatsClean]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 2017-06-05 6:46:54 PM ******/
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
/****** Object:  Table [dbo].[Coaches]    Script Date: 2017-06-05 6:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coaches](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](40) NOT NULL,
	[LastName] [nvarchar](40) NOT NULL,
	[BirthDate] [smalldatetime] NULL,
 CONSTRAINT [PK_Coaches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 2017-06-05 6:46:54 PM ******/
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
/****** Object:  Table [dbo].[Matches]    Script Date: 2017-06-05 6:46:54 PM ******/
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
	[UmpireId] [int] NULL,
	[RoundId] [int] NULL,
 CONSTRAINT [PK_Matches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 2017-06-05 6:46:54 PM ******/
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
	[CoachId] [int] NULL,
	[Ranking] [int] NOT NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointDistributionKeys]    Script Date: 2017-06-05 6:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointDistributionKeys](
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
/****** Object:  Table [dbo].[Rounds]    Script Date: 2017-06-05 6:46:54 PM ******/
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
/****** Object:  Table [dbo].[Surfaces]    Script Date: 2017-06-05 6:46:54 PM ******/
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
/****** Object:  Table [dbo].[TournamentCategories]    Script Date: 2017-06-05 6:46:54 PM ******/
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
/****** Object:  Table [dbo].[Tournaments]    Script Date: 2017-06-05 6:46:54 PM ******/
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
/****** Object:  Table [dbo].[Umpires]    Script Date: 2017-06-05 6:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Umpires](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](40) NOT NULL,
	[LastName] [nvarchar](40) NOT NULL,
	[YearActive] [smallint] NULL,
 CONSTRAINT [PK_Umpires] PRIMARY KEY CLUSTERED 
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
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Umpires] FOREIGN KEY([UmpireId])
REFERENCES [dbo].[Umpires] ([Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Umpires]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Cities]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Coaches1] FOREIGN KEY([CoachId])
REFERENCES [dbo].[Coaches] ([Id])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Coaches1]
GO
ALTER TABLE [dbo].[PointDistributionKeys]  WITH CHECK ADD  CONSTRAINT [FK_PointDistributionKeys_Rounds] FOREIGN KEY([RoundId])
REFERENCES [dbo].[Rounds] ([Id])
GO
ALTER TABLE [dbo].[PointDistributionKeys] CHECK CONSTRAINT [FK_PointDistributionKeys_Rounds]
GO
ALTER TABLE [dbo].[PointDistributionKeys]  WITH CHECK ADD  CONSTRAINT [FK_PointDistributionKeys_TournamentCategories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[TournamentCategories] ([Id])
GO
ALTER TABLE [dbo].[PointDistributionKeys] CHECK CONSTRAINT [FK_PointDistributionKeys_TournamentCategories]
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
ALTER DATABASE [TennisStatsClean] SET  READ_WRITE 
GO
