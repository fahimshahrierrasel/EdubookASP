USE [master]
GO
/****** Object:  Database [Edubook]    Script Date: 09-Mar-18 11:38:13 PM ******/
CREATE DATABASE [Edubook]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Edubook', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Edubook.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Edubook_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Edubook_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Edubook] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Edubook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Edubook] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Edubook] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Edubook] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Edubook] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Edubook] SET ARITHABORT OFF 
GO
ALTER DATABASE [Edubook] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Edubook] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Edubook] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Edubook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Edubook] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Edubook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Edubook] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Edubook] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Edubook] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Edubook] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Edubook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Edubook] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Edubook] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Edubook] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [Edubook] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Edubook] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Edubook] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Edubook] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Edubook] SET  MULTI_USER 
GO
ALTER DATABASE [Edubook] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Edubook] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Edubook] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Edubook] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Edubook] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Edubook] SET QUERY_STORE = ON
GO
ALTER DATABASE [Edubook] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [Edubook]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
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
USE [Edubook]
GO
USE [Edubook]
GO
/****** Object:  Sequence [dbo].[UserIdSequence]    Script Date: 09-Mar-18 11:38:13 PM ******/
CREATE SEQUENCE [dbo].[UserIdSequence] 
 AS [bigint]
 START WITH 1
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 09-Mar-18 11:38:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CmtId] [int] IDENTITY(1,1) NOT NULL,
	[CmtText] [text] NOT NULL,
	[Profile_ProfileId] [int] NOT NULL,
	[Post_PostId] [int] NOT NULL,
 CONSTRAINT [Comment_pk] PRIMARY KEY CLUSTERED 
(
	[CmtId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 09-Mar-18 11:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ExamId] [int] IDENTITY(1,1) NOT NULL,
	[ExamDate] [date] NOT NULL,
	[ExamName] [varchar](300) NOT NULL,
	[Description] [text] NOT NULL,
	[Profile_ProfileId] [int] NOT NULL,
 CONSTRAINT [Exam_pk] PRIMARY KEY CLUSTERED 
(
	[ExamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExamScore]    Script Date: 09-Mar-18 11:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamScore](
	[ExamScoreId] [int] IDENTITY(1,1) NOT NULL,
	[Correct] [int] NOT NULL,
	[Wrong] [int] NOT NULL,
	[Profile_ProfileId] [int] NOT NULL,
	[Exam_ExamId] [int] NOT NULL,
 CONSTRAINT [ExamScore_pk] PRIMARY KEY CLUSTERED 
(
	[ExamScoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friend]    Script Date: 09-Mar-18 11:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friend](
	[Profile_FriendId] [int] NOT NULL,
	[User_UserId] [int] NOT NULL,
 CONSTRAINT [Friend_pk] PRIMARY KEY CLUSTERED 
(
	[Profile_FriendId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 09-Mar-18 11:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[PostText] [text] NOT NULL,
	[Likes] [int] NOT NULL,
	[Tags] [varchar](100) NOT NULL,
	[PostDateTime] [datetime] NOT NULL,
	[Profile_ProfileId] [int] NOT NULL,
 CONSTRAINT [Post_pk] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profile]    Script Date: 09-Mar-18 11:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profile](
	[ProfileId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Education] [varchar](100) NULL,
	[Institution] [varchar](200) NULL,
	[Rating] [int] NOT NULL,
	[FavTag] [varchar](100) NOT NULL,
	[About] [varchar](max) NULL,
	[PhotoUrl] [varchar](300) NULL,
	[User_UserId] [int] NOT NULL,
 CONSTRAINT [Profile_pk] PRIMARY KEY CLUSTERED 
(
	[ProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 09-Mar-18 11:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[QuesText] [text] NOT NULL,
	[Exam_ExamId] [int] NOT NULL,
 CONSTRAINT [Question_pk] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionOption]    Script Date: 09-Mar-18 11:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionOption](
	[OptionId] [int] IDENTITY(1,1) NOT NULL,
	[OptNo] [int] NOT NULL,
	[OptText] [varchar](300) NOT NULL,
	[Question_QuestionId] [int] NOT NULL,
 CONSTRAINT [QuestionOption_pk] PRIMARY KEY CLUSTERED 
(
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09-Mar-18 11:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] NOT NULL,
	[Username] [varchar](30) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[RegDate] [date] NOT NULL,
 CONSTRAINT [User_pk] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAnswers]    Script Date: 09-Mar-18 11:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAnswers](
	[UserAnswerNo] [int] IDENTITY(1,1) NOT NULL,
	[Exam_ExamId] [int] NOT NULL,
	[Question_QuestionId] [int] NOT NULL,
	[AnsOptNo] [int] NOT NULL,
	[Profile_ProfileId] [int] NOT NULL,
 CONSTRAINT [UserAnswers_pk] PRIMARY KEY CLUSTERED 
(
	[UserAnswerNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ValidAnswer]    Script Date: 09-Mar-18 11:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ValidAnswer](
	[ValidAnswerId] [int] IDENTITY(1,1) NOT NULL,
	[AnsOptNo] [int] NOT NULL,
	[AnswerText] [varchar](300) NULL,
	[Question_QuestionId] [int] NOT NULL,
 CONSTRAINT [ValidAnswer_pk] PRIMARY KEY CLUSTERED 
(
	[ValidAnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Profile] ADD  CONSTRAINT [DF__Profile__Rating__5DCAEF64]  DEFAULT ((0)) FOR [Rating]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [Comment_Post] FOREIGN KEY([Post_PostId])
REFERENCES [dbo].[Post] ([PostId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [Comment_Post]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [Comment_Profile] FOREIGN KEY([Profile_ProfileId])
REFERENCES [dbo].[Profile] ([ProfileId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [Comment_Profile]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [Exam_Profile] FOREIGN KEY([Profile_ProfileId])
REFERENCES [dbo].[Profile] ([ProfileId])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [Exam_Profile]
GO
ALTER TABLE [dbo].[ExamScore]  WITH CHECK ADD  CONSTRAINT [ExamScore_Exam] FOREIGN KEY([Exam_ExamId])
REFERENCES [dbo].[Exam] ([ExamId])
GO
ALTER TABLE [dbo].[ExamScore] CHECK CONSTRAINT [ExamScore_Exam]
GO
ALTER TABLE [dbo].[ExamScore]  WITH CHECK ADD  CONSTRAINT [ExamScore_Profile] FOREIGN KEY([Profile_ProfileId])
REFERENCES [dbo].[Profile] ([ProfileId])
GO
ALTER TABLE [dbo].[ExamScore] CHECK CONSTRAINT [ExamScore_Profile]
GO
ALTER TABLE [dbo].[Friend]  WITH CHECK ADD  CONSTRAINT [Friend_Profile] FOREIGN KEY([Profile_FriendId])
REFERENCES [dbo].[Profile] ([ProfileId])
GO
ALTER TABLE [dbo].[Friend] CHECK CONSTRAINT [Friend_Profile]
GO
ALTER TABLE [dbo].[Friend]  WITH CHECK ADD  CONSTRAINT [Friend_User] FOREIGN KEY([User_UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Friend] CHECK CONSTRAINT [Friend_User]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [Post_Profile] FOREIGN KEY([Profile_ProfileId])
REFERENCES [dbo].[Profile] ([ProfileId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [Post_Profile]
GO
ALTER TABLE [dbo].[Profile]  WITH CHECK ADD  CONSTRAINT [Profile_User] FOREIGN KEY([User_UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Profile] CHECK CONSTRAINT [Profile_User]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [Question_Exam] FOREIGN KEY([Exam_ExamId])
REFERENCES [dbo].[Exam] ([ExamId])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [Question_Exam]
GO
ALTER TABLE [dbo].[QuestionOption]  WITH CHECK ADD  CONSTRAINT [QuestionOption_Question] FOREIGN KEY([Question_QuestionId])
REFERENCES [dbo].[Question] ([QuestionId])
GO
ALTER TABLE [dbo].[QuestionOption] CHECK CONSTRAINT [QuestionOption_Question]
GO
ALTER TABLE [dbo].[UserAnswers]  WITH CHECK ADD  CONSTRAINT [UserAnswers_Exam] FOREIGN KEY([Exam_ExamId])
REFERENCES [dbo].[Exam] ([ExamId])
GO
ALTER TABLE [dbo].[UserAnswers] CHECK CONSTRAINT [UserAnswers_Exam]
GO
ALTER TABLE [dbo].[UserAnswers]  WITH CHECK ADD  CONSTRAINT [UserAnswers_Profile] FOREIGN KEY([Profile_ProfileId])
REFERENCES [dbo].[Profile] ([ProfileId])
GO
ALTER TABLE [dbo].[UserAnswers] CHECK CONSTRAINT [UserAnswers_Profile]
GO
ALTER TABLE [dbo].[UserAnswers]  WITH CHECK ADD  CONSTRAINT [UserAnswers_Question] FOREIGN KEY([Question_QuestionId])
REFERENCES [dbo].[Question] ([QuestionId])
GO
ALTER TABLE [dbo].[UserAnswers] CHECK CONSTRAINT [UserAnswers_Question]
GO
ALTER TABLE [dbo].[ValidAnswer]  WITH CHECK ADD  CONSTRAINT [ValidAnswer_Question] FOREIGN KEY([Question_QuestionId])
REFERENCES [dbo].[Question] ([QuestionId])
GO
ALTER TABLE [dbo].[ValidAnswer] CHECK CONSTRAINT [ValidAnswer_Question]
GO
/****** Object:  StoredProcedure [dbo].[InsertNewUser]    Script Date: 09-Mar-18 11:38:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertNewUser]
(
	@Username Varchar(30),
	@Email Varchar(100),
	@PassHash Varchar(200),
	@FirstName Varchar(50),
	@LastName Varchar(50),
	@BirthDate Date,
	@City Varchar(50)
)
AS
BEGIN
	DECLARE @UserId Int;
	SET @UserId = NEXT VALUE FOR UserIdSequence;

	INSERT INTO [User](UserId, Username, Email, Password, RegDate)
		Values (@UserId, @Username, @Email, @PassHash, GETDATE());

	INSERT INTO Profile(FirstName, LastName, BirthDate, City, Rating, FavTag, User_UserId)
		Values (@FirstName, @LastName, @BirthDate, @City, 5, 'All', @UserId); 

END
GO
USE [master]
GO
ALTER DATABASE [Edubook] SET  READ_WRITE 
GO
