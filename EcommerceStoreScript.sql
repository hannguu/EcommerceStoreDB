USE [master]
GO
/****** Object:  Database [EcomerceStore]    Script Date: 1/30/2024 11:39:48 PM ******/
CREATE DATABASE [EcomerceStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EcomerceStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EcomerceStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EcomerceStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EcomerceStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EcomerceStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EcomerceStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EcomerceStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EcomerceStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EcomerceStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EcomerceStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EcomerceStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [EcomerceStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EcomerceStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EcomerceStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EcomerceStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EcomerceStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EcomerceStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EcomerceStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EcomerceStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EcomerceStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EcomerceStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EcomerceStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EcomerceStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EcomerceStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EcomerceStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EcomerceStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EcomerceStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EcomerceStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EcomerceStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EcomerceStore] SET  MULTI_USER 
GO
ALTER DATABASE [EcomerceStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EcomerceStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EcomerceStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EcomerceStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EcomerceStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EcomerceStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EcomerceStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [EcomerceStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EcomerceStore]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 1/30/2024 11:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[admin_id] [int] IDENTITY(1,1) NOT NULL,
	[admin_name] [nvarchar](max) NULL,
	[admin_birthday] [nchar](50) NULL,
	[admin_address] [nvarchar](max) NULL,
	[admin_phone] [nchar](12) NULL,
	[roles] [nchar](50) NULL,
	[admin_acc] [nvarchar](max) NULL,
	[admin_password] [nvarchar](max) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[admin_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 1/30/2024 11:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[cart_item_id] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 1/30/2024 11:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[cart_item_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[cart_id] [int] NULL,
 CONSTRAINT [PK_CartItem] PRIMARY KEY CLUSTERED 
(
	[cart_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 1/30/2024 11:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[order_detail_id] [int] NULL,
	[rating] [float] NULL,
	[feedback_content] [nvarchar](max) NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/30/2024 11:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[address_id] [int] NULL,
	[cost] [float] NULL,
	[status] [nvarchar](max) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 1/30/2024 11:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[product_name] [nvarchar](max) NULL,
	[image] [nchar](50) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/30/2024 11:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_quantity] [int] NULL,
	[product_name] [nvarchar](max) NULL,
	[product_image] [nchar](50) NULL,
	[rating] [float] NULL,
	[product_brand] [nvarchar](max) NULL,
	[product_price] [float] NULL,
	[product_type] [nchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 1/30/2024 11:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[product_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[information] [nvarchar](max) NULL,
	[feature] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProductDetail] PRIMARY KEY CLUSTERED 
(
	[product_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStaff]    Script Date: 1/30/2024 11:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStaff](
	[staff_id] [int] IDENTITY(1,1) NOT NULL,
	[staff_name] [nvarchar](max) NULL,
	[staff_phoneNumber] [nchar](12) NULL,
	[staff_address] [nvarchar](max) NULL,
	[staff_birthday] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductStaff] PRIMARY KEY CLUSTERED 
(
	[staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 1/30/2024 11:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[time] [timestamp] NULL,
	[status] [nvarchar](max) NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/30/2024 11:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](max) NULL,
	[user_email] [nvarchar](max) NULL,
	[roles] [nchar](50) NULL,
	[user_phone_number] [nchar](12) NULL,
	[birthday] [date] NULL,
	[password] [nvarchar](max) NULL,
	[is_active] [bit] NULL,
	[otp] [nvarchar](max) NULL,
	[otp_generated_time] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddress]    Script Date: 1/30/2024 11:39:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddress](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[district] [nvarchar](max) NULL,
	[commute] [nvarchar](max) NULL,
	[detail_address] [nvarchar](max) NULL,
	[city] [nvarchar](max) NULL,
	[receive_name] [nvarchar](max) NULL,
	[receive_phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserAddress] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_CartItem] FOREIGN KEY([cart_item_id])
REFERENCES [dbo].[CartItem] ([cart_item_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_CartItem]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_User]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FK_CartItem_Product]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_OrderDetail] FOREIGN KEY([order_detail_id])
REFERENCES [dbo].[OrderDetail] ([order_detail_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_OrderDetail]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_UserAddress] FOREIGN KEY([address_id])
REFERENCES [dbo].[UserAddress] ([address_id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_UserAddress]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_ProductDetail_Product]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_User]
GO
ALTER TABLE [dbo].[UserAddress]  WITH CHECK ADD  CONSTRAINT [FK_UserAddress_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[UserAddress] CHECK CONSTRAINT [FK_UserAddress_User]
GO
USE [master]
GO
ALTER DATABASE [EcomerceStore] SET  READ_WRITE 
GO
