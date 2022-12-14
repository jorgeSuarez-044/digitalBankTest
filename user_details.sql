USE [master]
GO
/****** Object:  Database [user_details]    Script Date: 01-aug-22 6:57:25 AM ******/
CREATE DATABASE [user_details]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'user_details', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\user_details.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'user_details_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\user_details_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [user_details] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [user_details].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [user_details] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [user_details] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [user_details] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [user_details] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [user_details] SET ARITHABORT OFF 
GO
ALTER DATABASE [user_details] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [user_details] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [user_details] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [user_details] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [user_details] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [user_details] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [user_details] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [user_details] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [user_details] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [user_details] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [user_details] SET  DISABLE_BROKER 
GO
ALTER DATABASE [user_details] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [user_details] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [user_details] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [user_details] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [user_details] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [user_details] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [user_details] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [user_details] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [user_details] SET  MULTI_USER 
GO
ALTER DATABASE [user_details] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [user_details] SET DB_CHAINING OFF 
GO
ALTER DATABASE [user_details] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [user_details] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [user_details]
GO
/****** Object:  StoredProcedure [dbo].[CrudOperations]    Script Date: 01-May-16 12:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CrudOperations]
@user_id int = 0,
@name varchar(100)=null,
@fechasActual varchar(30)=null,
@sex varchar(1)=null,
@status varchar(50)
AS
BEGIN
SET NOCOUNT ON;
--- Insert New Records
IF @status='INSERT'
BEGIN
INSERT INTO users(name,date,sex) VALUES(@name,@date,@sex)
END
--- Select Records in Table
IF @status='SELECT'
BEGIN
SELECT user_id,name,date,sex FROM users
END
--- Update Records in Table
IF @status='UPDATE'
BEGIN
UPDATE users SET name=@name,date=@date,sex=@sex WHERE user_id=@user_id
END
--- Delete Records from Table
IF @status='DELETE'
BEGIN
DELETE FROM users where user_id=@user_id
END
SET NOCOUNT OFF
END
GO
/****** Object:  Table [dbo].[users]    Script Date: 01-aug-22 6:57:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NOT NULL,
	[fechasActual] [varchar](max) NOT NULL,
	[sex] [varchar](max) NOT NULL,
 CONSTRAINT [PK_users_1] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [user_details] SET  READ_WRITE 
GO
