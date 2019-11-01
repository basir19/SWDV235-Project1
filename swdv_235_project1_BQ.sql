--create database
Create database bq_business;
GO

Use bq_business;
GO
--Create visitor table:
CREATE TABLE [dbo].[visitor](
[visitor_id] [int] IDENTITY(1,1) NOT NULL,
[visitor_fname] [nchar](50) NOT NULL,
[visitor_lname] [nchar](50) NOT NULL,
[visitor_country] [nchar](50) NOT NULL,
[visitor_msg] [nchar](200) NOT NULL
) ON [PRIMARY]

GO
--create procedure
drop procedure if exists InsertVisitor;
go
create procedure InsertVisitor
@visitor_fname nchar(50),
@visitor_lname nchar(50),
@visitor_country nchar(50),
@visitor_msg nchar(200)
as
INSERT INTO [bq_business].[dbo].[visitor]
           ([visitor_fname]
			,[visitor_lname]
           ,[visitor_country]
           ,[visitor_msg])
     VALUES
           (@visitor_fname
		   ,@visitor_lname
           ,@visitor_country
           ,@visitor_msg)
GO

execute InsertVisitor "Mickey1", "Mouse1", "USA1", "1 Insert using SP from SSMS";

select * from visitor;
--create login
CREATE LOGIN [BQApp] WITH PASSWORD='Pa$$w0rd', DEFAULT_DATABASE=[bq_business]
go
use bq_business
go
--create user
CREATE USER [BQApp] FOR LOGIN [BQApp] WITH DEFAULT_SCHEMA=[dbo]
GO
--grant execute permission to the user BQApp
grant execute on InsertVisitor to BQApp
go



