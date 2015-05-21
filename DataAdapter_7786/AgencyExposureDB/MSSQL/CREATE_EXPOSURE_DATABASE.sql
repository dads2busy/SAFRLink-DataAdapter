USE [master]
GO

/****** Object:  Database [VLDS_Lexicon] ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'Z_UR_Expose')
ALTER DATABASE [Z_UR_Expose] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'Z_UR_Expose')
DROP DATABASE [Z_UR_Expose]
GO

CREATE DATABASE [Z_UR_Expose] ON  PRIMARY 
( NAME = N'Z_UR_Expose', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Z_UR_Expose.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Z_UR_EXPOSE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Z_UR_Expose_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [Z_UR_Expose] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Z_UR_Expose].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Z_UR_Expose] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Z_UR_Expose] SET ANSI_NULLS OFF 
GO
