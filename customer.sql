USE [Customer]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11.05.2018 16:09:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerId] [int] IDENTITY(1,1) NOT NULL,
	[flightId] [int] NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 11.05.2018 16:09:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[flightId] [int] IDENTITY(1,1) NOT NULL,
	[airlineCompany] [nvarchar](50) NULL,
	[origin] [nvarchar](50) NULL,
	[destination] [nvarchar](50) NULL,
	[date] [nvarchar](50) NULL,
 CONSTRAINT [PK_Flight] PRIMARY KEY CLUSTERED 
(
	[flightId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Flight_FlightID] FOREIGN KEY([flightId])
REFERENCES [dbo].[Flight] ([flightId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Flight_FlightID]
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerInfoByID]    Script Date: 11.05.2018 16:09:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomerInfoByID] 
	-- Add the parameters for the stored procedure here
	@customerId int
AS
BEGIN
	select * from customer c inner join flight f on
	 c.flightId=f.flightId
	where c.customerId=@customerId
END
GO
