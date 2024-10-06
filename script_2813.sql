USE [master]
GO
/****** Object:  Database [FRONT_MIRROR]    Script Date: 9/28/2022 6:31:30 PM ******/
CREATE DATABASE [FRONT_MIRROR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FRONT', FILENAME = N'F:\Microsoft SQL Server\MSSQL14.ECT_FRONT_MIRROR\MSSQL\DATA\FRONT_MIRROR.mdf' , SIZE = 38919168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1048576KB ), 
 FILEGROUP [FRONT_DATA] 
( NAME = N'FRONT_DATA', FILENAME = N'F:\Microsoft SQL Server\MSSQL14.ECT_FRONT_MIRROR\MSSQL\DATA\FRONT_MIRROR_DATA.ndf' , SIZE = 60669952KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1048576KB ), 
 FILEGROUP [FRONT_INDEX] 
( NAME = N'FRONT_INDEX', FILENAME = N'F:\Microsoft SQL Server\MSSQL14.ECT_FRONT_MIRROR\MSSQL\DATA\FRONT_MIRROR_INDEX.ndf' , SIZE = 36048896KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1048576KB ), 
 FILEGROUP [FRONT_TEMP_DATA] 
( NAME = N'FRONT_TEMP_DATA', FILENAME = N'F:\Microsoft SQL Server\MSSQL14.ECT_FRONT_MIRROR\MSSQL\DATA\FRONT_MIRROR_TEMP_DATA.ndf' , SIZE = 200704KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1048576KB ), 
 FILEGROUP [FRONT_TEMP_INDEX] 
( NAME = N'FRONT_TEMP_INDEX', FILENAME = N'F:\Microsoft SQL Server\MSSQL14.ECT_FRONT_MIRROR\MSSQL\DATA\FRONT_MIRROR_TEMP_INDEX.ndf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1048576KB )
 LOG ON 
( NAME = N'FRONT_log', FILENAME = N'H:\Microsoft SQL Server\MSSQL14.ECT_FRONT_MIRROR\MSSQL\TLOG\FRONT_MIRROR_log.ldf' , SIZE = 35561352KB , MAXSIZE = 2048GB , FILEGROWTH = 1048576KB )
GO
ALTER DATABASE [FRONT_MIRROR] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FRONT_MIRROR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FRONT_MIRROR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET ARITHABORT OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FRONT_MIRROR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FRONT_MIRROR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FRONT_MIRROR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FRONT_MIRROR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FRONT_MIRROR] SET  MULTI_USER 
GO
ALTER DATABASE [FRONT_MIRROR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FRONT_MIRROR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FRONT_MIRROR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FRONT_MIRROR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FRONT_MIRROR] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FRONT_MIRROR', N'ON'
GO
ALTER DATABASE [FRONT_MIRROR] SET QUERY_STORE = OFF
GO
USE [FRONT_MIRROR]
GO
/****** Object:  User [FR\TP5192]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE USER [FR\TP5192] FOR LOGIN [FR\TP5192] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [FR\AFB482]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE USER [FR\AFB482] FOR LOGIN [FR\AFB482] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [FR\_APP_DATACACHE_WEB]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE USER [FR\_APP_DATACACHE_WEB] FOR LOGIN [FR\_APP_DATACACHE_WEB] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [FR\TP5192]
GO
ALTER ROLE [db_datareader] ADD MEMBER [FR\AFB482]
GO
/****** Object:  Schema [RAP]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE SCHEMA [RAP]
GO
/****** Object:  Schema [TEST]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE SCHEMA [TEST]
GO
/****** Object:  UserDefinedTableType [dbo].[CodeReferenceDataType]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE TYPE [dbo].[CodeReferenceDataType] AS TABLE(
	[CodeRef] [varchar](20) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[CodeRef] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[ParamListTable]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE TYPE [dbo].[ParamListTable] AS TABLE(
	[Data] [varchar](256) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[ParamListTableCodeDomaine]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE TYPE [dbo].[ParamListTableCodeDomaine] AS TABLE(
	[Data] [varchar](20) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[Data] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[ParamListTableCodeTypeContrat]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE TYPE [dbo].[ParamListTableCodeTypeContrat] AS TABLE(
	[Data] [varchar](20) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[Data] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[ParamListTableDomaine]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE TYPE [dbo].[ParamListTableDomaine] AS TABLE(
	[Data] [nvarchar](100) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[Data] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[ParamListTablePK]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE TYPE [dbo].[ParamListTablePK] AS TABLE(
	[Data] [varchar](256) NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[Data] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  UserDefinedTableType [dbo].[SplitCodeInseeTableType]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE TYPE [dbo].[SplitCodeInseeTableType] AS TABLE(
	[splitdata] [varchar](6) NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[SplitCodeRefTableType]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE TYPE [dbo].[SplitCodeRefTableType] AS TABLE(
	[splitdata] [varchar](20) NULL
)
GO
/****** Object:  UserDefinedFunction [dbo].[fnSplitString]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnSplitString] 
( 
    @string NVARCHAR(MAX), 
    @delimiter CHAR(1) 
) 
RETURNS @output TABLE(splitdata NVARCHAR(MAX) 
) 
BEGIN 
    DECLARE @start INT, @end INT 
    SELECT @start = 1, @end = CHARINDEX(@delimiter, @string) 
    WHILE @start < LEN(@string) + 1 BEGIN 
        IF @end = 0  
            SET @end = LEN(@string) + 1
       
        INSERT INTO @output (splitdata)  
        VALUES(SUBSTRING(@string, @start, @end - @start)) 
        SET @start = @end + 1 
        SET @end = CHARINDEX(@delimiter, @string, @start)
        
    END 
    RETURN 
END
GO
/****** Object:  UserDefinedFunction [dbo].[function_Split_String]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[function_Split_String]
(
    @string VARCHAR(MAX),
    @delimiter CHAR(1)
)
RETURNS @output TABLE(
    data VARCHAR(256)
)
BEGIN

    DECLARE @start INT, @end INT
    SELECT @start = 1, @end = CHARINDEX(@delimiter, @string)

    WHILE @start < LEN(@string) + 1 BEGIN
        IF @end = 0 
            SET @end = LEN(@string) + 1

        INSERT INTO @output (data) 
        VALUES(SUBSTRING(@string, @start, @end - @start))
        SET @start = @end + 1
        SET @end = CHARINDEX(@delimiter, @string, @start)
    END

    RETURN

END
GO
/****** Object:  UserDefinedFunction [dbo].[ReturnIdentifiantFromReference]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ReturnIdentifiantFromReference] (@reference varchar(12))
    RETURNS int
AS
BEGIN
  DECLARE @total int

  -- Référence client odyssée => 98
  SET @reference = '98' + @reference;

  SET @total =  SUBSTRING(@reference, 1, 1) * 2;
  SET @total += SUBSTRING(@reference, 2, 1) * 3;
  SET @total += SUBSTRING(@reference, 3, 1) * 5;
  SET @total += SUBSTRING(@reference, 4, 1) * 7;
  SET @total += SUBSTRING(@reference, 5, 1) * 11;
  SET @total += SUBSTRING(@reference, 6, 1) * 13;
  SET @total += SUBSTRING(@reference, 7, 1) * 17;
  SET @total += SUBSTRING(@reference, 8, 1) * 19;
  SET @total += SUBSTRING(@reference, 9, 1) * 23;
  SET @total += SUBSTRING(@reference, 10, 1) * 29;
  SET @total += SUBSTRING(@reference, 11, 1) * 31;
  SET @total += SUBSTRING(@reference, 12, 1) * 37;

  RETURN LEFT(@total,1) + RIGHT(@total * 7777,3);

END
GO
/****** Object:  Table [RAP].[RAP_TER_POR]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RAP].[RAP_TER_POR](
	[NB_SEQ] [numeric](10, 0) NOT NULL,
	[ID_TER] [numeric](12, 0) NOT NULL,
	[CD_RELATION] [varchar](2) NULL,
	[CD_INSEE] [varchar](5) NULL,
	[LB_COM] [varchar](32) NULL,
	[CD_VOIE] [int] NULL,
	[LB_VOIE] [varchar](38) NULL,
	[NB_NUM_DEB] [smallint] NULL,
	[NB_NUM_FIN] [smallint] NULL,
	[BO_PAIR] [varchar](1) NULL,
	[BO_IMPAIR] [varchar](1) NULL,
	[CD_POSTAL] [varchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [RAP].[RAP_TER_REF]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RAP].[RAP_TER_REF](
	[ID_TER] [numeric](12, 0) NOT NULL,
	[ID_TYPE_TER] [smallint] NULL,
	[BO_ACTIF] [varchar](1) NULL,
	[LB_DESCR] [varchar](255) NULL,
	[ID_CREE_PAR] [varchar](50) NULL,
	[DT_CREATION] [datetime2](7) NULL,
	[CD_LANGUE] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_TerritoireSansCodeHexavia]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   FUNCTION [dbo].[fn_TerritoireSansCodeHexavia] (
   @p_cd_insee			AS  NVARCHAR(20) ,@p_cd_voie AS  NVARCHAR(20)  ,@p_NumeroRue	    AS  INT  = null 
)

RETURNS TABLE
AS RETURN  
  select * ,ISNULL (@p_NumeroRue,1) c from  (
				SELECT DISTINCT 'CMN COMP' SOURCE,
										   a.id_type_ter,
										   b.id_ter idBanco,
										   b.nb_seq,
										   b.CD_RELATION,
										   b.CD_INSEE CodeInsee ,
										   b.CD_VOIE,
						   				   IIF(B.CD_VOIE IS NULL ,NULL,ISNULL (B.NB_NUM_DEB,  0 )) NB_NUM_DEB,
										   IIF(B.CD_VOIE IS NULL ,NULL,ISNULL (B.NB_NUM_FIN,9999)) NB_NUM_FIN,
										   b.BO_PAIR,
										   b.BO_IMPAIR ,BO_ACTIF,
										   b.LB_VOIE
				FROM rap.rap_ter_ref a,
					 rap.rap_ter_por b
				WHERE 1=1 -- ON UTILISE LE PARAMÈTRE SUR LES TERRITOIRES INACTIFS UNIQUEMENT
				  AND cd_voie IS NULL AND cd_relation = 'IN' AND b.cd_insee = @p_cd_insee AND id_type_ter = 2 AND B.ID_TER = a.id_ter
				  AND (    (@p_cd_voie IS NOT NULL AND NOT EXISTS(SELECT 1 FROM rap.rap_ter_por w  WHERE cd_relation = 'EX' AND cd_voie = @p_cd_voie AND w.cd_insee = b.cd_insee  AND w.id_ter= b.id_ter ))
						OR (@p_cd_voie IS NULL     AND NOT EXISTS(SELECT 1   FROM rap.rap_ter_por w   WHERE  cd_relation = 'EX'  AND REPLACE(lb_voie, ' ', '') NOT  LIKE 'RUETRAVAUXPB%' AND w.cd_insee = b.cd_insee AND w.id_ter= b.id_ter))
						)
 
				UNION -- ON RÉCUPÉRE TOUTES LES PORTIONS EN IN OU EN EX AVEC LE MÊRME CODE VOIE

			
			   SELECT DISTINCT 'CMN PAR' SOURCE,
										  a.id_type_ter,
										  b.id_ter,
										  b.nb_seq,
										  b.CD_RELATION,
										  b.CD_INSEE,
										  b.CD_VOIE,
						  				  IIF(B.CD_VOIE IS NULL ,NULL,ISNULL (B.NB_NUM_DEB,  0 )) NB_NUM_DEB,
										  IIF(B.CD_VOIE IS NULL ,NULL,ISNULL (B.NB_NUM_FIN,9999)) NB_NUM_FIN,
										  b.BO_PAIR,
										  b.BO_IMPAIR,BO_ACTIF,b.LB_VOIE
				FROM rap.rap_ter_ref a,
					 rap.rap_ter_por b
				WHERE 1=1
				  AND cd_voie = @p_cd_voie AND b.cd_insee = @p_cd_insee  AND NOT (cd_relation = 'EX'   AND REPLACE(lb_voie, ' ', '') LIKE 'RUETRAVAUXPB%') AND id_type_ter = 2 AND B.ID_TER = a.id_ter
				)  AS c  
			
			
			WHERE 1 = 1 AND  (
			    (@p_NumeroRue IS null AND cd_relation = 'IN' AND cd_voie IS null ) 
			OR	(@p_NumeroRue IS  NULL AND CD_RELATION = 'IN'  AND cd_voie IS NOT NULL AND  ISNULL (@p_NumeroRue,1) IS NOT  NULL  AND  ISNULL (@p_NumeroRue,1) BETWEEN  nb_num_deb AND  nb_num_fin  AND  ( IIF (ISNULL (@p_NumeroRue,1) %2 = 0 ,'O','N') = BO_PAIR  OR  IIF (ISNULL (@p_NumeroRue,1) %2 = 1 ,'O','N') = BO_IMPAIR ) AND (nb_num_deb = 0 OR nb_num_deb = 1) AND nb_num_deb = 9999)  
			OR  (@p_NumeroRue IS  NULL AND cd_relation = 'IN' AND cd_voie IS NOT NULL AND ( (NB_NUM_DEB = 0  OR NB_NUM_DEB = 1)  AND NB_NUM_FIN = 9999 )) 
			OR  (@p_NumeroRue IS  NULL AND cd_relation = 'EX' AND cd_voie IS NOT NULL AND (NB_NUM_DEB NOT BETWEEN  0 AND 1 OR   NB_NUM_FIN != 9999  ) ) 
			OR 	(@p_NumeroRue IS NOT  NULL AND CD_RELATION = 'IN' AND cd_voie IS NOT NULL AND  @p_NumeroRue BETWEEN  nb_num_deb AND  nb_num_fin AND ( IIF (@p_NumeroRue %2 = 0 ,'O','N') = BO_PAIR  OR  IIF (@p_NumeroRue %2 = 1 ,'O','N') = BO_IMPAIR )  )  
			OR 	(@p_NumeroRue IS NOT  NULL AND CD_RELATION = 'EX'  AND cd_voie IS NOT NULL AND  @p_NumeroRue BETWEEN  0 AND  nb_num_deb AND  ( IIF (@p_NumeroRue %2 = 0 ,'O','N') = BO_PAIR  OR  IIF (@p_NumeroRue %2 = 1 ,'O','N') = BO_IMPAIR ) AND (NB_NUM_DEB NOT BETWEEN  0 AND 1 OR   NB_NUM_FIN != 9999  ) )  
	        OR 	(@p_NumeroRue IS NOT  NULL AND cd_voie IS  NULL)

				)


GO
/****** Object:  UserDefinedFunction [dbo].[fn_TerritoireSansCodeHexavia_V02]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_TerritoireSansCodeHexavia_V02]
(
	@p_cd_insee AS NVARCHAR(20)
  , @p_cd_voie AS NVARCHAR(20)
  , @p_NumeroRue AS INT = NULL
  , @p_TypeTerritoire AS NVARCHAR(50) = NULL
)
RETURNS TABLE
AS
RETURN SELECT c.SOURCE
			, c.ID_TYPE_TER
			, c.idBanco
			, c.NB_SEQ
			, c.CD_RELATION
			, c.CodeInsee
			, c.CD_VOIE
			, c.NB_NUM_DEB
			, c.NB_NUM_FIN
			, c.BO_PAIR
			, c.BO_IMPAIR
			, c.BO_ACTIF
			, c.LB_VOIE
			, ISNULL(@p_NumeroRue, 1) c
	   FROM
		   (   
				-- PARAMETRAGE A LA COMMUNE
				SELECT DISTINCT
					  'CMN COMP' SOURCE
					, a.ID_TYPE_TER
					, b.ID_TER idBanco
					, b.NB_SEQ
					, b.CD_RELATION
					, b.CD_INSEE CodeInsee
					, b.CD_VOIE
					, IIF(b.CD_VOIE IS NULL, NULL, ISNULL(b.NB_NUM_DEB, 0)) NB_NUM_DEB
					, IIF(b.CD_VOIE IS NULL, NULL, ISNULL(b.NB_NUM_FIN, 9999)) NB_NUM_FIN
					, b.BO_PAIR
					, b.BO_IMPAIR
					, a.BO_ACTIF
					, b.LB_VOIE
			   FROM RAP.RAP_TER_REF a
				   INNER JOIN RAP.RAP_TER_POR b ON b.ID_TER = a.ID_TER
			   WHERE 1 = 1 -- ON UTILISE LE PARAMÈTRE SUR LES TERRITOIRES INACTIFS UNIQUEMENT
					 AND b.CD_VOIE IS NULL
					 AND b.CD_RELATION = 'IN'
					 AND b.CD_INSEE = @p_cd_insee
					 AND EXISTS ( SELECT 1 FROM dbo.function_Split_String(@p_TypeTerritoire, ',') WHERE [data] = a.ID_TYPE_TER)
					 AND
						 (	 
							(	 
								@p_cd_voie IS NOT NULL
								AND NOT EXISTS
							   (   SELECT 1
								   FROM RAP.RAP_TER_POR w
								   WHERE w.CD_RELATION = 'EX'
										 AND w.CD_VOIE = @p_cd_voie
										 AND w.CD_INSEE = b.CD_INSEE
										 AND w.ID_TER = b.ID_TER)
							 )
							 OR
							 (	 @p_cd_voie IS NULL
								 AND NOT EXISTS
								(   SELECT 1
									FROM RAP.RAP_TER_POR w
									WHERE w.CD_RELATION = 'EX'
											AND REPLACE(w.LB_VOIE, ' ', '') NOT LIKE 'RUETRAVAUXPB%'
											AND w.CD_INSEE = b.CD_INSEE
											AND w.ID_TER = b.ID_TER)
							 )
						)

			   UNION 

			   -- ON RÉCUPÉRE TOUTES LES PORTIONS EN IN OU EN EX AVEC LE MÊME CODE VOIE
			   SELECT DISTINCT
					  'CMN PAR' SOURCE
					, a.ID_TYPE_TER
					, b.ID_TER
					, b.NB_SEQ
					, b.CD_RELATION
					, b.CD_INSEE
					, b.CD_VOIE
					, IIF(b.CD_VOIE IS NULL, NULL, ISNULL(b.NB_NUM_DEB, 0)) NB_NUM_DEB
					, IIF(b.CD_VOIE IS NULL, NULL, ISNULL(b.NB_NUM_FIN, 9999)) NB_NUM_FIN
					, b.BO_PAIR
					, b.BO_IMPAIR
					, a.BO_ACTIF
					, b.LB_VOIE
			   FROM RAP.RAP_TER_REF a
				  INNER JOIN RAP.RAP_TER_POR b ON b.ID_TER = a.ID_TER
			   WHERE 1 = 1
					 AND b.CD_VOIE = @p_cd_voie
					 AND b.CD_INSEE = @p_cd_insee
					 AND NOT (	 b.CD_RELATION = 'EX'
								 AND REPLACE(b.LB_VOIE, ' ', '') LIKE 'RUETRAVAUXPB%')
					 AND EXISTS ( SELECT 1 FROM dbo.function_Split_String(@p_TypeTerritoire, ',') WHERE [data] = a.ID_TYPE_TER )
	   ) AS c
	   WHERE 1 = 1
			 AND
				 (	 
					-- Mapping à la commune pour appel sans rue
					(	 
						@p_NumeroRue IS NULL
						AND CD_RELATION = 'IN'
						AND CD_VOIE IS NULL
					)

					-- Mapping à la commune pour appel avec rue
					OR
					(	 
						@p_NumeroRue IS NOT NULL
						AND CD_VOIE IS NULL
					)

					-- Mapping des rues IN avec numéros
					OR
					(	 
						@p_NumeroRue IS NULL
						AND CD_RELATION = 'IN'
						AND CD_VOIE IS NOT NULL
						AND
						(	 
							NB_NUM_DEB = 0
							OR NB_NUM_DEB = 1
						)
						AND NB_NUM_FIN = 9999
					)

					-- Mapping des rues EX pas totalement exclues 
					OR
					(	 
						@p_NumeroRue IS NULL
						AND CD_RELATION = 'EX'
						AND CD_VOIE IS NOT NULL
						AND
						(	 
							NB_NUM_DEB NOT BETWEEN 0 AND 1
							OR NB_NUM_FIN <> 9999
						)
					)

					-- Mapping des rues IN en fonction du numéro
					OR
					(	 
						@p_NumeroRue IS NOT NULL
						AND CD_RELATION = 'IN'
						AND CD_VOIE IS NOT NULL
						AND @p_NumeroRue BETWEEN NB_NUM_DEB AND NB_NUM_FIN
						AND
						(
							IIF(@p_NumeroRue % 2 = 0, 'O', 'N') = BO_PAIR
							OR IIF(@p_NumeroRue % 2 = 1, 'O', 'N') = BO_IMPAIR
						)
					)

					-- Mapping des rues EX en fonction du numéro
					OR
					(	 
						@p_NumeroRue IS NOT NULL
						AND CD_RELATION = 'EX'
						AND CD_VOIE IS NOT NULL
						AND 
						(
							@p_NumeroRue BETWEEN 0 AND NB_NUM_DEB
							OR @p_NumeroRue BETWEEN NB_NUM_FIN AND 9999
						)
						AND
						(
							IIF(@p_NumeroRue % 2 = 0, 'O', 'N') = BO_PAIR
							OR IIF(@p_NumeroRue % 2 = 1, 'O', 'N') = BO_IMPAIR
						)
						AND
						(	 
							NB_NUM_DEB NOT BETWEEN 0 AND 1
							OR NB_NUM_FIN <> 9999
						)
					)
				);


				
GO
/****** Object:  Table [dbo].[Acteur]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acteur](
	[IdActeur] [varchar](10) NOT NULL,
	[CodeOrigine] [varchar](10) NULL,
	[CodeSysteme] [varchar](10) NULL,
	[TypeActeur] [varchar](16) NULL,
	[CodeRef] [varchar](10) NULL,
	[Identite] [varchar](201) NULL,
	[CodeInsee] [varchar](6) NULL,
	[TelDomicile] [varchar](30) NULL,
	[TelPortable] [varchar](30) NULL,
	[TelBureau] [varchar](30) NULL,
	[Email] [varchar](254) NULL,
	[CanalContact] [varchar](50) NULL,
	[AdresseFacture1] [varchar](254) NULL,
	[AdresseFacture2] [varchar](254) NULL,
	[AdresseFacture3] [varchar](254) NULL,
	[CpFacture] [varchar](12) NULL,
	[VilleFacture] [varchar](90) NULL,
	[IdSite] [varchar](10) NULL,
	[AdresseSite1] [varchar](254) NULL,
	[AdresseSite2] [varchar](254) NULL,
	[AdresseSite3] [varchar](254) NULL,
	[CpSite] [varchar](12) NULL,
	[VilleSite] [varchar](90) NULL,
	[Siret] [varchar](50) NULL,
	[CodeApe] [varchar](50) NULL,
	[ContratBanco] [varchar](50) NULL,
	[CodeCreation] [varchar](50) NULL,
	[CreateDate] [datetime2](7) NULL,
	[CodeModif] [varchar](30) NULL,
	[UpdateDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Acteur] PRIMARY KEY CLUSTERED 
(
	[IdActeur] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [FRONT_INDEX]
) ON [FRONT_INDEX]
GO
/****** Object:  Table [dbo].[BLACKLIST]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BLACKLIST](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CODE_REF] [nvarchar](20) NULL,
	[CD_CREATION] [nvarchar](30) NULL,
	[DT_CREATION] [datetime2](7) NULL,
	[CD_MODIF] [nvarchar](30) NULL,
	[DT_MODIF] [datetime2](7) NULL
) ON [FRONT_DATA]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Sucesseur] [varchar](20) NULL,
	[Identite] [varchar](201) NULL,
	[CodeInsee] [varchar](6) NULL,
	[TelDomicile] [varchar](30) NULL,
	[TelPortable] [varchar](30) NULL,
	[TelBureau] [varchar](30) NULL,
	[Email] [varchar](254) NULL,
	[CanalContact] [varchar](32) NULL,
	[AdresseFacture1] [varchar](254) NULL,
	[AdresseFacture2] [varchar](254) NULL,
	[AdresseFacture3] [varchar](254) NULL,
	[AdresseFacture4] [varchar](254) NULL,
	[CpFacture] [varchar](10) NULL,
	[VilleFacture] [varchar](90) NULL,
	[ModePaiement] [varchar](20) NULL,
	[MtDerniereFacture] [numeric](15, 2) NULL,
	[MtSolde] [numeric](15, 2) NULL,
	[DateSolde] [datetime2](7) NULL,
	[CodeSituation] [varchar](1) NULL,
	[ContratCarte] [varchar](4) NULL,
	[TypeClient] [varchar](10) NULL,
	[Siret] [varchar](14) NULL,
	[CodeApe] [varchar](5) NULL,
	[NomRib] [varchar](254) NULL,
	[Etablissement] [varchar](5) NULL,
	[Guichet] [varchar](5) NULL,
	[Compte] [varchar](11) NULL,
	[CleRib] [varchar](3) NULL,
	[ContratBanco] [varchar](32) NULL,
	[CodeSysteme] [varchar](10) NULL,
	[CodeRef] [varchar](20) NOT NULL,
	[CodeOrigine] [varchar](10) NULL,
	[CodeCreation] [varchar](50) NULL,
	[CodeModif] [varchar](30) NULL,
	[HashDiff] [nchar](128) NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[DateEFacture] [date] NULL,
	[CodeClasseClient] [varchar](8) NULL,
	[LibelleClasseClient] [varchar](60) NULL,
	[ClientGrandCompte] [smallint] NULL,
	[ClientChorus] [smallint] NULL,
	[ClientAbonnementDate] [date] NULL,
	[Rum] [varchar](50) NULL,
	[CiviliteActeurPrincipal] [varchar](16) NULL,
	[AdresseSite1] [varchar](254) NULL,
	[AdresseSite2] [varchar](254) NULL,
	[AdresseSite3] [varchar](254) NULL,
	[AdresseSite4] [varchar](254) NULL,
	[CpSite] [varchar](10) NULL,
	[VilleSite] [varchar](90) NULL,
	[DestinataireFacture] [varchar](150) NULL,
	[DateModePaiement] [datetime2](7) NULL,
	[Iban] [varchar](50) NULL,
	[IdActeur] [varchar](10) NULL,
	[codeEnvoiFacture] [varchar](16) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[CodeRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [FRONT_INDEX]
) ON [FRONT_INDEX]
GO
/****** Object:  Table [dbo].[ClientDate]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientDate](
	[Id_Client] [varchar](10) NOT NULL,
	[SpId] [varchar](10) NOT NULL,
	[DateDebut] [date] NULL,
	[DateFin] [date] NULL,
 CONSTRAINT [PK_ClientDate] PRIMARY KEY CLUSTERED 
(
	[Id_Client] ASC,
	[SpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [FRONT_INDEX]
) ON [FRONT_INDEX]
GO
/****** Object:  Table [dbo].[Compteur]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compteur](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CompteurId] [varchar](10) NULL,
	[CodeEquipement] [varchar](2) NULL,
	[AdresseId] [varchar](12) NULL,
	[AdresseDesserte1] [varchar](255) NULL,
	[AdresseDesserte2] [varchar](255) NULL,
	[AdresseDesserte3] [varchar](255) NULL,
	[CpDesserte] [varchar](5) NULL,
	[Ville] [varchar](90) NULL,
	[NumeroBranchement] [varchar](14) NULL,
	[Rang] [varchar](30) NULL,
	[Matricule] [varchar](16) NULL,
	[PeriodeReleve] [bit] NULL,
	[CodeSysteme] [varchar](10) NULL,
	[CodeRef] [varchar](20) NULL,
	[CodeOrigine] [varchar](10) NULL,
	[CodeCreation] [varchar](50) NULL,
	[CodeModif] [varchar](30) NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[CompteurDivisionnaire] [varchar](1) NULL,
	[ModeReleve] [varchar](1) NULL,
	[CompteurGeneral] [varchar](1) NULL,
	[TypeRaccordement] [varchar](16) NULL,
	[Usage] [varchar](16) NULL,
	[Fluide] [varchar](16) NULL,
	[EtatSource] [varchar](10) NULL,
	[EtatPDS] [varchar](20) NULL,
	[DiametreFacturation] [varchar](3) NULL,
	[TypeProprietaire] [varchar](16) NULL,
	[AnneeFabrication] [varchar](16) NULL,
	[CauseFermeture] [varchar](4) NULL,
	[LibelleEmplacement] [varchar](60) NULL,
	[CodeEmplacement] [varchar](4) NULL,
	[DateMiseEnService] [date] NULL,
	[DateDepose] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consommation]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consommation](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CompteurId] [varchar](10) NULL,
	[Index] [int] NULL,
	[QualiteIndex] [varchar](3) NULL,
	[DateIndex] [date] NULL,
	[AncienIndex] [int] NULL,
	[CodeSysteme] [varchar](10) NULL,
	[CodeRef] [varchar](20) NULL,
	[CodeOrigine] [varchar](10) NULL,
	[CodeCreation] [varchar](50) NULL,
	[CodeModif] [varchar](30) NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[BsegID] [varchar](12) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTRAT]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTRAT](
	[IdBanco_Contrat] [varchar](10) NULL,
	[IdBanco_ContratInitial] [varchar](10) NULL,
	[IdSigile_Contrat] [varchar](10) NULL,
	[NumeroAvenant] [int] NULL,
	[Nom] [nvarchar](80) NULL,
	[Libelle_Contrat] [nvarchar](80) NULL,
	[Code_TypeContrat] [varchar](20) NULL,
	[Libelle_TypeContrat] [nvarchar](100) NULL,
	[LibelleCourt_TypeContrat] [nvarchar](100) NULL,
	[Code_DomaineContrat] [varchar](20) NULL,
	[Libelle_DomaineContrat] [nvarchar](100) NULL,
	[Code_EtatContrat] [varchar](20) NULL,
	[Libelle_EtatContrat] [nvarchar](100) NULL,
	[Code_StatutContrat] [varchar](20) NULL,
	[Libelle_StatutContrat] [nvarchar](100) NULL,
	[Code_NatureContrat] [varchar](20) NULL,
	[Libelle_NatureContrat] [nvarchar](100) NULL,
	[DateSignatureCollectivite] [date] NULL,
	[Code_PointBalance] [varchar](5) NULL,
	[Code_TypeAbonnementContrat] [varchar](20) NULL,
	[Libelle_TypeAbonnementContrat] [nvarchar](100) NULL,
	[Code_TypeClientContrat] [varchar](20) NULL,
	[Libelle_TypeClientContrat] [nvarchar](100) NULL,
	[Code_FinContratAction] [varchar](20) NULL,
	[Libelle_FinContratAction] [nvarchar](100) NULL,
	[Code_FinContratSuiteADonner] [varchar](20) NULL,
	[Libelle_FinContratSuiteADonner] [nvarchar](100) NULL,
	[Code_ElementOrgaSEFAgence] [varchar](20) NULL,
	[Libelle_ElementOrgaSEFAgence] [nvarchar](100) NULL,
	[Code_ElementOrgaSEFRegion] [varchar](20) NULL,
	[Libelle_ElementOrgaSEFRegion] [nvarchar](100) NULL,
	[Code_CentreRegional] [varchar](4) NULL,
	[Libelle_CentreRegional] [nvarchar](50) NULL,
	[Code_Delegation] [varchar](10) NULL,
	[Libelle_Delegation] [nvarchar](50) NULL,
	[NomContractant] [nvarchar](80) NULL,
	[Code_NatureContractant] [varchar](3) NULL,
	[Libelle_NatureContractant] [nvarchar](20) NULL,
	[Code_TypeContractant] [varchar](10) NULL,
	[Libelle_TypeContractant] [nvarchar](80) NULL,
	[IdInsee_SIRENContractant] [varchar](9) NULL,
	[CodeInsee_CommuneContractant] [varchar](6) NULL,
	[PopulationContractant] [int] NULL,
	[NomSignataire] [nvarchar](50) NULL,
	[DateDebut] [date] NULL,
	[DateFin] [date] NULL,
	[DateEcheance] [date] NULL,
	[CAAnnuelMoyen] [numeric](15, 2) NULL,
	[NomResponsableExecutionContrat] [nvarchar](100) NULL,
	[PrenomResponsableExecutionContrat] [nvarchar](100) NULL,
	[Date_Insert] [datetime2](7) NULL,
	[Date_Update] [datetime2](7) NULL,
	[ID_AGENCE] [int] NULL
) ON [FRONT_DATA]
GO
/****** Object:  Table [dbo].[CorrespondanceInsee]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CorrespondanceInsee](
	[Insee1] [varchar](5) NOT NULL,
	[insee2] [varchar](5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Echeance]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Echeance](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Montant] [numeric](15, 2) NULL,
	[CodeSysteme] [varchar](10) NULL,
	[CodeRef] [varchar](20) NOT NULL,
	[CodeOrigine] [varchar](10) NULL,
	[CodeCreation] [varchar](50) NULL,
	[CodeModif] [varchar](30) NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL
) ON [FRONT_DATA]
GO
/****** Object:  Table [dbo].[Eligibilite]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eligibilite](
	[Id_Per] [varchar](10) NULL,
	[Id_Client] [varchar](10) NULL,
	[Id_Pds] [varchar](16) NULL,
	[FAC_ATT] [int] NULL,
	[RJTTITDCD] [int] NULL,
	[RDR] [int] NULL,
	[DEG] [int] NULL,
	[FAC] [int] NULL,
	[AT] [int] NULL,
	[DEP] [int] NULL,
	[Eligible] [int] NULL,
	[InsertDate] [datetime] NULL
) ON [FRONT_DATA]
GO
/****** Object:  Table [dbo].[Eligibilite_AcctNbSite]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eligibilite_AcctNbSite](
	[Id_Client] [varchar](10) NULL,
	[NbSite] [int] NULL,
	[InsertDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Eligibilite_Arrivee]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Eligibilite_Arrivee](
	[codeReference] [varchar](10) NOT NULL,
	[spId] [varchar](10) NOT NULL,
	[dateDepart] [date] NULL,
	[cptId] [varchar](10) NULL,
	[siteId] [varchar](10) NULL,
	[flagCptDepose] [bit] NULL,
	[flagCptFlottant] [bit] NULL,
	[flagCptMultiPds] [bit] NULL,
	[flagCptPdsSuppr] [bit] NULL,
	[flagCptUnique] [bit] NULL,
	[adresseSite1] [varchar](254) NULL,
	[adresseSite2] [varchar](254) NULL,
	[adresseSite3] [varchar](254) NULL,
	[cpSite] [varchar](12) NULL,
	[villeSite] [varchar](90) NULL,
	[codeInsee] [varchar](6) NULL,
	[codeBanco] [varchar](50) NULL,
	[nombreCompteur] [int] NULL,
	[nombreCompteurTr] [int] NULL,
	[nombreCompteurRr] [int] NULL,
	[nombreCompteurSe] [int] NULL,
	[nombreCompteurGen] [int] NULL,
	[nbSite] [int] NULL,
	[idSite] [varchar](10) NULL,
	[idHexavia] [varchar](254) NULL,
	[adresseDesserte1] [varchar](254) NULL,
	[adresseDesserte2] [varchar](254) NULL,
	[adresseDesserte3] [varchar](254) NULL,
	[cpDesserte] [varchar](10) NULL,
	[villeDesserte] [varchar](90) NULL,
	[codeEquipement] [varchar](2) NULL,
	[numeroBadgeCompteur] [varchar](30) NULL,
	[matricule] [varchar](16) NULL,
	[indiceTeleRel] [bit] NULL,
	[cptGeneral] [bit] NULL,
	[InsertDate] [datetime2](7) NULL
) ON [FRONT_DATA]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Eligibilite_Arrivee_codeRef]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE CLUSTERED INDEX [IX_Eligibilite_Arrivee_codeRef] ON [dbo].[Eligibilite_Arrivee]
(
	[codeReference] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [FRONT_DATA]
GO
/****** Object:  Table [dbo].[Facture]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facture](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FactureId] [varchar](12) NULL,
	[Date] [date] NULL,
	[Montant] [numeric](15, 2) NULL,
	[Image] [varchar](255) NULL,
	[CodeSysteme] [varchar](10) NULL,
	[CodeRef] [varchar](20) NULL,
	[CodeOrigine] [varchar](10) NULL,
	[CodeCreation] [varchar](50) NULL,
	[CodeModif] [varchar](30) NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL,
	[DateEffectivePrelevement] [date] NULL,
	[FondSolidariteLogement] [varchar](1) NULL,
	[DateLimitePaiement] [date] NULL,
	[SoldeFacture] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactureConsommee]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactureConsommee](
	[Id_Facture] [varchar](12) NOT NULL,
	[Id_Client] [varchar](10) NOT NULL,
	[Id_Document] [varchar](30) NULL,
	[Id_Pds] [varchar](10) NOT NULL,
	[Conso] [numeric](15, 6) NULL,
	[AncienIndex] [numeric](15, 6) NULL,
	[DateAncienIndex] [datetime2](7) NULL,
	[NouvelIndex] [numeric](15, 6) NULL,
	[DateNouvelIndex] [datetime2](7) NULL,
	[TypeFacture] [varchar](5) NOT NULL,
	[DateUpsert] [datetime2](7) NULL
) ON [FRONT_DATA]
GO
/****** Object:  Table [dbo].[FactureConsommeeCreance]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactureConsommeeCreance](
	[Id_Facture] [varchar](12) NOT NULL,
	[Date] [date] NULL,
	[MontantHTVA] [numeric](15, 2) NULL,
	[MontantTVA] [numeric](15, 2) NULL,
	[MontantTTC] [numeric](15, 2) NULL,
	[MontantDetHTVA] [numeric](15, 2) NULL,
	[MontantDetTTC] [numeric](15, 2) NULL,
	[MontantDecFac] [numeric](15, 2) NULL,
	[DateUpsert] [datetime2](7) NULL
) ON [FRONT_DATA]
GO
/****** Object:  Table [dbo].[Operation]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operation](
	[Id] [varchar](12) NOT NULL,
	[TypeOperation] [varchar](30) NOT NULL,
	[Date] [date] NULL,
	[DateLimitePaiement] [date] NULL,
	[Credit] [numeric](15, 2) NULL,
	[Debit] [numeric](15, 2) NULL,
	[CodeSysteme] [varchar](10) NULL,
	[CodeRef] [varchar](20) NULL,
	[CodeOrigine] [varchar](10) NULL,
	[CodeCreation] [varchar](50) NULL,
	[CodeModif] [varchar](30) NULL,
	[CreateDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL
) ON [FRONT_DATA]
GO
/****** Object:  Table [dbo].[PrioriteContrat]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrioriteContrat](
	[CodeBanco] [nvarchar](10) NOT NULL,
	[Priorite] [int] NULL,
	[InsertDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [RAP].[CONTRAT]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RAP].[CONTRAT](
	[Id] [int] NOT NULL,
	[IdBanco] [varchar](10) NULL,
	[NumeroBanco] [varchar](10) NULL,
	[CodeDomaine] [varchar](20) NULL,
	[Domaine] [nvarchar](100) NULL,
	[CodeTypeBanco] [varchar](20) NULL,
	[TypeBanco] [nvarchar](100) NULL,
	[Priorite] [int] NULL,
	[IdCompte] [varchar](100) NULL,
	[NbClients] [int] NULL,
	[CodeInsee] [varchar](5) NULL,
	[CodeHexaviaAdresse] [varchar](8) NULL,
	[NumeroRue] [int] NULL,
	[IdPds] [varchar](15) NULL,
	[IdSite] [varchar](15) NULL,
	[Flag_EnregistrementActif] [bit] NULL,
	[Date_Insert] [datetime] NULL,
	[Date_Update] [datetime] NULL,
	[DateDebut] [date] NULL,
	[DateFin] [date] NULL,
	[EdcEnCours] [int] NULL,
 CONSTRAINT [PK_CONTRAT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [RAP].[GetContratParAdresseLog]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RAP].[GetContratParAdresseLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CodeInsee] [varchar](5) NULL,
	[CodeHexaviaAdresse] [varchar](50) NULL,
	[NumeroRue] [varchar](50) NULL,
	[CodeDomaine] [varchar](255) NULL,
	[Domaine] [varchar](255) NULL,
	[CodeTypeContrat] [varchar](255) NULL,
	[Prioritaire] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [RAP].[IdBanco_Adresse]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RAP].[IdBanco_Adresse](
	[IdBanco] [numeric](12, 0) NOT NULL,
	[CodeVoie] [int] NULL,
	[CodeInsee] [varchar](5) NULL,
	[DebutNumeroRue] [smallint] NULL,
	[FinNumeroRue] [smallint] NULL,
	[Session] [int] NULL
) ON [FRONT_DATA]
GO
/****** Object:  Table [RAP].[INCLUSION]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RAP].[INCLUSION](
	[ID] [int] NOT NULL,
	[ID_TYPE_TER] [smallint] NULL,
	[ID_TER] [numeric](12, 0) NOT NULL,
	[CD_INSEE] [varchar](5) NULL,
	[CD_INSEE_ISNULL] [varchar](5) NULL,
	[InsertDate] [datetime2](7) NULL,
	[UpdateDate] [datetime2](7) NULL
) ON [FRONT_DATA]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_RAP_INCLUSION]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE CLUSTERED INDEX [IDX_RAP_INCLUSION] ON [RAP].[INCLUSION]
(
	[ID_TER] ASC,
	[CD_INSEE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FRONT_DATA]
GO
/****** Object:  Table [RAP].[TerritoireAdresse]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RAP].[TerritoireAdresse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeTerritoire] [smallint] NULL,
	[IdBanco] [numeric](12, 0) NOT NULL,
	[Sequence] [numeric](10, 0) NOT NULL,
	[Relation] [varchar](2) NULL,
	[CodeInsee] [varchar](5) NULL,
	[CodeVoie] [int] NULL,
	[DebutNumeroRue] [smallint] NULL,
	[FinNumeroRue] [smallint] NULL,
	[Pair] [varchar](1) NULL,
	[Impair] [varchar](1) NULL,
	[Date_Insert] [datetime] NULL,
	[Date_Update] [datetime] NULL
) ON [FRONT_DATA]
GO
/****** Object:  Table [RAP].[TerritoireCommune]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [RAP].[TerritoireCommune](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeTerritoire] [smallint] NULL,
	[IdBanco] [numeric](12, 0) NULL,
	[Sequence] [numeric](10, 0) NOT NULL,
	[Relation] [varchar](2) NULL,
	[CodeInsee] [varchar](5) NULL,
	[Date_Insert] [datetime] NULL,
	[Date_Update] [datetime] NULL
) ON [FRONT_DATA]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Blacklist]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Blacklist] ON [dbo].[BLACKLIST]
(
	[CODE_REF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [FRONT_INDEX]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_CodeInsee_CodeSituation]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_CodeInsee_CodeSituation] ON [dbo].[Client]
(
	[CodeInsee] ASC,
	[CodeSituation] ASC
)
INCLUDE([Identite],[ModePaiement],[TypeClient],[CodeSysteme]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [FRONT_INDEX]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Cpt_CodeRef]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Cpt_CodeRef] ON [dbo].[Compteur]
(
	[CodeRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [FRONT_INDEX]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Consommation]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Consommation] ON [dbo].[Consommation]
(
	[CodeRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Consommation_CodeRefDate]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Consommation_CodeRefDate] ON [dbo].[Consommation]
(
	[CodeRef] ASC,
	[DateIndex] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [FRONT_INDEX]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Contrat_Libelle]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Contrat_Libelle] ON [dbo].[CONTRAT]
(
	[Libelle_DomaineContrat] ASC
)
INCLUDE([IdBanco_ContratInitial]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FRONT_DATA]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_NC_EchCodeRef]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_NC_EchCodeRef] ON [dbo].[Echeance]
(
	[CodeRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [FRONT_INDEX]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Eligibilite_IdClient]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Eligibilite_IdClient] ON [dbo].[Eligibilite]
(
	[Id_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [FRONT_INDEX]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Eligibilite_AcctNbSite_IdClient]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Eligibilite_AcctNbSite_IdClient] ON [dbo].[Eligibilite_AcctNbSite]
(
	[Id_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [FRONT_INDEX]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_NC_Eligibilite_Arrivee_MatriculeCpt]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_NC_Eligibilite_Arrivee_MatriculeCpt] ON [dbo].[Eligibilite_Arrivee]
(
	[matricule] ASC,
	[cptId] ASC,
	[codeReference] ASC,
	[spId] ASC,
	[dateDepart] ASC,
	[siteId] ASC,
	[adresseSite1] ASC,
	[adresseSite2] ASC,
	[adresseSite3] ASC,
	[cpSite] ASC,
	[villeSite] ASC,
	[codeInsee] ASC,
	[codeBanco] ASC,
	[nombreCompteur] ASC,
	[nombreCompteurTr] ASC,
	[nombreCompteurRr] ASC,
	[nombreCompteurSe] ASC,
	[nombreCompteurGen] ASC,
	[nbSite] ASC,
	[idSite] ASC,
	[idHexavia] ASC,
	[adresseDesserte1] ASC,
	[adresseDesserte2] ASC,
	[adresseDesserte3] ASC,
	[cpDesserte] ASC,
	[villeDesserte] ASC,
	[codeEquipement] ASC,
	[numeroBadgeCompteur] ASC,
	[indiceTeleRel] ASC,
	[cptGeneral] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FRONT_INDEX]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Facture_CodeRef]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Facture_CodeRef] ON [dbo].[Facture]
(
	[CodeRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [FRONT_INDEX]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FactureConsommee_Client]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FactureConsommee_Client] ON [dbo].[FactureConsommee]
(
	[Id_Client] ASC
)
INCLUDE([AncienIndex],[Conso],[DateAncienIndex],[DateNouvelIndex],[DateUpsert],[Id_Document],[NouvelIndex]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FRONT_DATA]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_NC_FactureConsommee_IdClient]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_NC_FactureConsommee_IdClient] ON [dbo].[FactureConsommee]
(
	[Id_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [FRONT_INDEX]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_FactureConsommee_Creance]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_FactureConsommee_Creance] ON [dbo].[FactureConsommeeCreance]
(
	[Id_Facture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [FRONT_INDEX]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_NC_Operation]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_NC_Operation] ON [dbo].[Operation]
(
	[CodeRef] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [FRONT_INDEX]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_contrat-par-compteur_IdCompte]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_contrat-par-compteur_IdCompte] ON [RAP].[CONTRAT]
(
	[IdCompte] ASC,
	[Flag_EnregistrementActif] ASC,
	[Domaine] ASC,
	[DateFin] ASC,
	[EdcEnCours] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FRONT_DATA]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_contrat-par-compteur_IdPds]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_contrat-par-compteur_IdPds] ON [RAP].[CONTRAT]
(
	[IdPds] ASC,
	[Flag_EnregistrementActif] ASC,
	[Domaine] ASC,
	[DateFin] ASC,
	[EdcEnCours] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FRONT_DATA]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_contrat-par-compteur_IdSite]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_contrat-par-compteur_IdSite] ON [RAP].[CONTRAT]
(
	[IdSite] ASC,
	[Flag_EnregistrementActif] ASC,
	[Domaine] ASC,
	[DateFin] ASC,
	[EdcEnCours] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FRONT_DATA]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_CONTRATPARADRESSE]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_CONTRATPARADRESSE] ON [RAP].[RAP_TER_POR]
(
	[ID_TER] ASC,
	[CD_RELATION] ASC,
	[CD_INSEE] ASC
)
INCLUDE([LB_VOIE]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_CONTRATPARADRESSE_CodeInseeCodeVoie]    Script Date: 9/28/2022 6:31:31 PM ******/
CREATE NONCLUSTERED INDEX [IDX_CONTRATPARADRESSE_CodeInseeCodeVoie] ON [RAP].[RAP_TER_POR]
(
	[CD_VOIE] ASC,
	[CD_INSEE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Acteur] ADD  CONSTRAINT [DF_Acteur_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Acteur] ADD  CONSTRAINT [DF_Acteur_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[BLACKLIST] ADD  CONSTRAINT [DF__BLACKLIST__DT_CR__14270015]  DEFAULT (getdate()) FOR [DT_CREATION]
GO
ALTER TABLE [dbo].[BLACKLIST] ADD  CONSTRAINT [DF__BLACKLIST__DT_MO__151B244E]  DEFAULT (getdate()) FOR [DT_MODIF]
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Client] ADD  CONSTRAINT [DF_Client_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Compteur] ADD  CONSTRAINT [DF_Compteur_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Compteur] ADD  CONSTRAINT [DF_Compteur_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Consommation] ADD  CONSTRAINT [DF_Consommation_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Consommation] ADD  CONSTRAINT [DF_Consommation_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Echeance] ADD  CONSTRAINT [DF_Echeance_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Echeance] ADD  CONSTRAINT [DF_Echeance_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Eligibilite] ADD  CONSTRAINT [DF_Eligibilite_InsertDate]  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[Eligibilite_AcctNbSite] ADD  CONSTRAINT [DF_Eligibilite_AcctNbSite_InsertDate]  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[Eligibilite_Arrivee] ADD  CONSTRAINT [DF_EligibiliteArrivee_InsertDate]  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [dbo].[Facture] ADD  CONSTRAINT [DF_Facture_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Facture] ADD  CONSTRAINT [DF_Facture_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[FactureConsommee] ADD  CONSTRAINT [DF_Facture_Consommee_DateUpsert]  DEFAULT (getdate()) FOR [DateUpsert]
GO
ALTER TABLE [dbo].[FactureConsommeeCreance] ADD  CONSTRAINT [DF_Facture_Consommee_Creance_DateUpsert]  DEFAULT (getdate()) FOR [DateUpsert]
GO
ALTER TABLE [dbo].[Operation] ADD  CONSTRAINT [DF_Operation_CreateDate_]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Operation] ADD  CONSTRAINT [DF_Operation_UpdateDate_]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [RAP].[CONTRAT] ADD  CONSTRAINT [DF_RAP_Contrat_Date_Insert]  DEFAULT (getdate()) FOR [Date_Insert]
GO
ALTER TABLE [RAP].[CONTRAT] ADD  CONSTRAINT [DF_RAP_Contrat_Date_Update]  DEFAULT (getdate()) FOR [Date_Update]
GO
ALTER TABLE [RAP].[INCLUSION] ADD  CONSTRAINT [DF__INCLUSION__Inser__2B0A656D]  DEFAULT (getdate()) FOR [InsertDate]
GO
ALTER TABLE [RAP].[INCLUSION] ADD  CONSTRAINT [DF__INCLUSION__Updat__2BFE89A6]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [RAP].[TerritoireAdresse] ADD  CONSTRAINT [DF_RAP_TERRITOIRE_ADRESSE_Date_Insert]  DEFAULT (getdate()) FOR [Date_Insert]
GO
ALTER TABLE [RAP].[TerritoireAdresse] ADD  CONSTRAINT [DF_RAP_TERRITOIRE_ADRESSE_Date_Update]  DEFAULT (getdate()) FOR [Date_Update]
GO
ALTER TABLE [RAP].[TerritoireCommune] ADD  CONSTRAINT [DF_RAP_TERRITOIRE_COMMUNE_Date_Insert]  DEFAULT (getdate()) FOR [Date_Insert]
GO
ALTER TABLE [RAP].[TerritoireCommune] ADD  CONSTRAINT [DF_RAP_TERRITOIRE_COMMUNE_Date_Update]  DEFAULT (getdate()) FOR [Date_Update]
GO
/****** Object:  StoredProcedure [dbo].[GetActeur]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- [GetActeur] '0000003605'

CREATE PROCEDURE [dbo].[GetActeur]
	@IdActeur varchar(10)
AS
BEGIN

	DECLARE @IdActeurInterne varchar(10);
	SET @IdActeurInterne = @IdActeur;

	SELECT
		A.[IdActeur]
	,	ISNULL(A.[CodeOrigine],'Y') AS [CodeOrigine]
	,	ISNULL(A.[CodeSysteme],'98') AS [CodeSysteme]
	,	A.[TypeActeur]
	,	A.[CodeRef]
	,	A.[Identite]
	,	A.[CodeInsee]
	,	A.[TelDomicile]
	,	A.[TelPortable]
	,	A.[TelBureau]
	,	A.[Email]
	,	A.[CanalContact]
	,	A.[AdresseFacture1]
	,	A.[AdresseFacture2]
	,	A.[AdresseFacture3]
	,	A.[CpFacture]
	,	A.[VilleFacture]
	,	A.[IdSite]
	,	A.[AdresseSite1]
	,	A.[AdresseSite2]
	,	A.[AdresseSite3]
	,	A.[CpSite]
	,	A.[VilleSite]
	,	A.[Siret]
	,	A.[CodeApe]
	,	A.[ContratBanco]
	,	A.[CodeCreation]
	,	A.[CreateDate]
	,	A.[CodeModif]
	,	A.[UpdateDate]
	
	FROM [dbo].[Acteur] A
	WHERE A.[IdActeur] = @IdActeurInterne

END
GO
/****** Object:  StoredProcedure [dbo].[GetCompteurs]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- EXEC GetCompteurs '9870005173'
-- 

CREATE PROCEDURE [dbo].[GetCompteurs]
	@CodeRef nvarchar(20)
AS
BEGIN

	DECLARE @CodeRefInterne varchar(10);
	SET @CodeRefInterne = @CodeRef;
	
	SELECT
		Cpt.ID
	,	Cpt.CompteurId
	,	Cpt.CodeEquipement
	,	Cpt.AdresseId
	,	Cpt.AdresseDesserte1
	,	Cpt.AdresseDesserte2
	,	Cpt.AdresseDesserte3
	,	Cpt.CpDesserte
	,	Cpt.Ville
	,	REPLACE(RTRIM(LTRIM(Cpt.[AdresseDesserte1])) + ' ' + RTRIM(LTRIM(Cpt.[AdresseDesserte2])) + ' ' + RTRIM(LTRIM(Cpt.[AdresseDesserte3])) + ' ' + RTRIM(LTRIM(Cpt.CpDesserte)) + ' ' + Cpt.Ville, '  ', ' ') AS 'AdresseDesservie'
	,	Cpt.NumeroBranchement
	,	Cpt.Rang
	,	Cpt.Matricule
	,	Cpt.PeriodeReleve
	,	C.CodeSysteme
	,	C.CodeRef
	,	C.CodeOrigine
	,	Cpt.CodeModif
	,	CONVERT(bit,CASE WHEN Cpt.CompteurGeneral = 'O' THEN 1 ELSE 0 END) as CptGeneral
	,	ISNULL(N.NbSite,0) as NbSite

	FROM Client C
	LEFT OUTER JOIN FRONT_MIRROR.dbo.Compteur Cpt ON Cpt.CodeRef = C.CodeRef
	LEFT OUTER JOIN FRONT_MIRROR.dbo.Eligibilite_AcctNbSite N ON N.Id_Client = C.CodeRef

	WHERE C.CodeRef = @CodeRefInterne
END
GO
/****** Object:  StoredProcedure [dbo].[GetConsommations]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetConsommations]
@CodeRef NVARCHAR (20), @NumeroCompteur NVARCHAR (20)=NULL
AS
BEGIN
    SET DATEFORMAT dmy;
    DECLARE @CodeRefInterne AS VARCHAR (10);
    SET @CodeRefInterne = @CodeRef;
    DECLARE @NbConso AS INT = NULL;
    SELECT @NbConso = (SELECT COUNT(1)
                       FROM   Consommation AS CC
                       WHERE  CC.CodeRef = @CodeRefInterne);
    IF (@NbConso > 1)
        BEGIN
            SELECT   *
            FROM     (SELECT CC.ID,
                             CompteurId,
                             [Index],
                             QualiteIndex,
                             DateIndex,
                             AncienIndex,
                             C.CodeSysteme,
                             C.CodeRef,
                             C.CodeOrigine,
                             C.CodeModif,
                             CONVERT (DATE, CD.DateDebut, 103) AS DatePremiereConsommationFacturee,
                             ROW_NUMBER() OVER (PARTITION BY C.CodeRef, DateIndex, AncienIndex, [Index], QualiteIndex ORDER BY CC.ID DESC) AS RowNumber
                      FROM   Client AS C
                             INNER JOIN
                             Consommation AS CC
                             ON C.CodeRef = CC.CodeRef OUTER APPLY (SELECT   TOP (1) DateDebut,
                                                                                     DateFin
                                                                    FROM     ClientDate AS CD
                                                                    WHERE    CD.Id_Client = C.CodeRef
                                                                             AND ISNULL(CC.CompteurId, 0) = ISNULL(CD.SpId, 0)
                                                                    ORDER BY DateDebut DESC) AS CD
                      WHERE  C.CodeRef = @CodeRefInterne
                             AND CC.DateIndex >= CD.DateDebut
                             AND CC.DateIndex <= CD.DateFin
                             AND CASE WHEN @NumeroCompteur IS NULL THEN '1' ELSE Cc.CompteurId END = CASE WHEN @NumeroCompteur IS NULL THEN '1' ELSE @NumeroCompteur END) AS V
            WHERE    V.RowNumber = 1
                     AND V.AncienIndex != -1
            ORDER BY v.CompteurId, v.DateIndex DESC;
        END
    ELSE
        IF @NbConso = 1
            BEGIN
                SELECT   *
                FROM     (SELECT CC.ID,
                                 CompteurId,
                                 [Index],
                                 QualiteIndex,
                                 DateIndex,
                                 [Index] AS 'AncienIndex',
                                 C.CodeSysteme,
                                 C.CodeRef,
                                 C.CodeOrigine,
                                 C.CodeModif,
                                 CONVERT (DATE, CD.DateDebut, 103) AS DatePremiereConsommationFacturee,
                                 ROW_NUMBER() OVER (PARTITION BY C.CodeRef, DateIndex, AncienIndex, [Index], QualiteIndex ORDER BY CC.ID DESC) AS RowNumber
                          FROM   Client AS C
                                 INNER JOIN
                                 Consommation AS CC
                                 ON C.CodeRef = CC.CodeRef OUTER APPLY (SELECT   TOP (1) DateDebut,
                                                                                         DateFin
                                                                        FROM     ClientDate AS CD
                                                                        WHERE    CD.Id_Client = C.CodeRef
                                                                                 AND ISNULL(CC.CompteurId, 0) = ISNULL(CD.SpId, 0)
                                                                        ORDER BY DateDebut DESC) AS CD
                          WHERE  C.CodeRef = @CodeRefInterne
                                 AND CC.DateIndex >= CD.DateDebut
                                 AND CC.DateIndex <= CD.DateFin
                                 AND CASE WHEN @NumeroCompteur IS NULL THEN '1' ELSE Cc.CompteurId END = CASE WHEN @NumeroCompteur IS NULL THEN '1' ELSE @NumeroCompteur END) AS V
                WHERE    V.RowNumber = 1
                ORDER BY v.CompteurId, v.DateIndex DESC;
            END
        ELSE
            BEGIN
                SELECT   C.ID AS ID,
                         NULL AS CompteurId,
                         NULL AS [Index],
                         NULL AS QualiteIndex,
                         NULL AS DateIndex,
                         NULL AS AncienIndex,
                         C.CodeSysteme,
                         C.CodeRef,
                         C.CodeOrigine,
                         C.CodeModif,
                         CONVERT (DATE, CD.DateDebut, 103) AS DatePremiereConsommationFacturee
                FROM     Client AS C OUTER APPLY (SELECT   TOP (1) DateDebut,
                                                                   DateFin
                                                  FROM     ClientDate AS CD
                                                  WHERE    CD.Id_Client = C.CodeRef
                                                  ORDER BY DateDebut DESC) AS CD
                WHERE    C.CodeRef = @CodeRefInterne
                ORDER BY CompteurId, DateIndex DESC;
            END
END


GO
/****** Object:  StoredProcedure [dbo].[GetContratPDS]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetContratPDS]	  
	 @ListeCodeRef AS NVARCHAR(MAX) = NULL
	,@ListeCodeInsee AS NVARCHAR(MAX) = NULL
	,@CodeSituation AS VARCHAR(1) =  NULL
	,@Mono as BIT = NULL
	,@CodeEquipement AS VARCHAR(2) = NULL 
AS BEGIN 

if not exists (select * from sys.types where name = 'SplitCodeRefTableType')
	create type SplitCodeRefTableType as table (splitdata VARCHAR(20))

if not exists (select * from sys.types where name = 'SplitCodeInseeTableType')
	create type SplitCodeInseeTableType as table (splitdata VARCHAR(6))

DECLARE @SplitCodeRef SplitCodeRefTableType
DECLARE @SplitCodeInsee SplitCodeInseeTableType

INSERT INTO @SplitCodeRef SELECT RIGHT(splitdata,LEN(splitdata)-2) FROM dbo.fnSplitString( @ListeCodeRef  ,',')
INSERT INTO @SplitCodeInsee SELECT splitdata FROM dbo.fnSplitString( @ListeCodeInsee  ,',')

DECLARE @SqlQuery NVARCHAR(4000)
DECLARE @ParamDefinition AS NVARCHAR(2000) 

SET @SqlQuery = ''

SET @SqlQuery += ' SELECT * FROM '
SET @SqlQuery += ' ( '
SET @SqlQuery += ' SELECT Client.*, '
SET @SqlQuery += ' CPT.adresseid AS ID_ADRESSE, '
SET @SqlQuery += ' CPT.AdresseDesserte1 AS ADRESSE_DESSERTE_1, '
SET @SqlQuery += ' CPT.AdresseDesserte2 AS ADRESSE_DESSERTE_2, '
SET @SqlQuery += ' CPT.AdresseDesserte3 AS ADRESSE_DESSERTE_3, '
SET @SqlQuery += ' CPT.Ville AS VILLE_DESSERTE, '
SET @SqlQuery += ' CPT.CpDesserte AS CP_DESSERTE, '
SET @SqlQuery += ' CPT.CodeEquipement AS CODE_EQUIPEMENT, '
SET @SqlQuery += ' CPT.CompteurId AS NUMERO_COMPTEUR, '
SET @SqlQuery += ' COUNT (*) OVER (PARTITION BY Client.CodeRef) AS NOMBRE_COMPTEURS, '
SET @SqlQuery += ' D.DateDebut AS DATE_ARRIVEE '
SET @SqlQuery += ' FROM ( '
SET @SqlQuery += ' SELECT C.CodeRef AS CodeRef, '
SET @SqlQuery += '        C.CodeSysteme + C.CodeRef AS CODE_REF, '
SET @SqlQuery += '        C.Identite AS IDENTITE, '
SET @SqlQuery += '        C.CodeSituation AS CODE_SITUATION, '
SET @SqlQuery += '        C.ModePaiement AS MODE_PAIE, '
SET @SqlQuery += '        C.CodeInsee AS CODE_INSEE, '
SET @SqlQuery += '        C.ContratBanco AS CODE_BANCO, '
SET @SqlQuery += '        C.UpdateDate AS DT_MODIF '
SET @SqlQuery += ' FROM Client C '
SET @SqlQuery += ' '
SET @SqlQuery += ' WHERE 1=1 '

IF ((SELECT COUNT(*) FROM @SplitCodeRef) > 0)
SET @SqlQuery += ' AND C.CodeRef IN (SELECT splitdata FROM @SplitCodeRef) '

IF (SELECT COUNT(*) FROM @SplitCodeInsee) > 0
SET @SqlQuery += ' AND C.CodeInsee IN (SELECT splitdata FROM @SplitCodeInsee) '

--IF (ISNULL(@ListeCodeRef,'') != '')
--SET @SqlQuery += ' AND C.CodeRef IN (SELECT RIGHT(splitdata,LEN(splitdata)-2) FROM dbo.fnSplitString( @ListeCodeRef  ,'','')) '

--IF (ISNULL(@ListeCodeInsee,'') != '')
--SET @SqlQuery += ' AND C.CodeInsee IN (SELECT splitdata FROM dbo.fnSplitString( @ListeCodeInsee  ,'','')) '

IF ISNULL(@CodeSituation,'') != ''
SET @SqlQuery += ' AND C.CodeSituation = @CodeSituation '

SET @SqlQuery += ' '
SET @SqlQuery += ' ) AS Client '
SET @SqlQuery += ' LEFT OUTER JOIN Compteur CPT ON Client.CodeRef = CPT.CodeRef '
SET @SqlQuery += ' LEFT OUTER JOIN ClientDate D ON D.Id_Client = Client.CodeRef AND D.SpId = CPT.CompteurId '
SET @SqlQuery += ' WHERE 1 = 1 '

IF ISNULL(@CodeEquipement,'') != ''
SET @SqlQuery += ' AND CPT.CodeEquipement = @CodeEquipement '

SET @SqlQuery += ' ) AS P '

IF ISNULL(@Mono,0) = 1
SET @SqlQuery += ' WHERE NOMBRE_COMPTEURS = 1 '
ELSE IF ISNULL(@Mono,1) = 0
SET @SqlQuery += ' WHERE NOMBRE_COMPTEURS > 1 '

SET @ParamDefinition =  '@SplitCodeRef SplitCodeRefTableType READONLY,
				@SplitCodeInsee SplitCodeInseeTableType READONLY,
				@CodeSituation VARCHAR(1),					
				@CodeEquipement VARCHAR(2)';


--SET @ParamDefinition =  '@ListeCodeRef NVARCHAR(MAX),
--				@ListeCodeInsee NVARCHAR(MAX),
--				@CodeSituation VARCHAR(1),					
--				@CodeEquipement NVARCHAR(5)';

PRINT @SqlQuery

EXECUTE sp_Executesql     @SQLQuery,
	@ParamDefinition,
	@SplitCodeRef,
	@SplitCodeInsee,
	@CodeSituation,
	@CodeEquipement

--EXECUTE sp_Executesql     @SQLQuery,
--	@ParamDefinition,
--	@ListeCodeRef,
--	@ListeCodeInsee,
--	@CodeSituation,
--	@CodeEquipement

--SELECT * FROM
--(
--SELECT Client.*,
--CPT.adresseid AS ID_ADRESSE, 
--CPT.AdresseDesserte1 AS ADRESSE_DESSERTE_1, 
--CPT.AdresseDesserte2 AS ADRESSE_DESSERTE_2, 
--CPT.AdresseDesserte3 AS ADRESSE_DESSERTE_3, 
--CPT.Ville AS VILLE_DESSERTE, 
--CPT.CpDesserte AS CP_DESSERTE,
--CPT.CodeEquipement AS CODE_EQUIPEMENT, 
--CPT.CompteurId AS NUMERO_COMPTEUR, 
--COUNT (*) OVER (PARTITION BY Client.CodeRef) AS NOMBRE_COMPTEURS,
--D.DateDebut AS DATE_ARRIVEE
--FROM (
--SELECT C.CodeRef AS CodeRef,
--       C.CodeSysteme + C.CodeRef AS CODE_REF, 
--       C.Identite AS IDENTITE, 
--       C.CodeSituation AS CODE_SITUATION, 
--       C.ModePaiement AS MODE_PAIE, 
--       C.CodeInsee AS CODE_INSEE, 
--       C.ContratBanco AS CODE_BANCO, 
--       C.UpdateDate AS DT_MODIF
--FROM Client C 

--WHERE 1=1 AND (ISNULL(@ListeCodeRef,'') = '' OR C.CodeRef IN (SELECT splitdata FROM @SplitCodeRef))
--AND (ISNULL(@ListeCodeInsee,'') = '' OR C.CodeInsee IN (SELECT splitdata FROM @SplitCodeInsee)) -- (SELECT splitdata  FROM dbo.fnSplitString( @ListeCodeInsee  ,',') ) )
--AND (ISNULL(@CodeSituation,'') = '' OR C.CodeSituation = @CodeSituation  ) 

--) AS Client
--LEFT OUTER JOIN compteur CPT ON Client.CodeRef = CPT.CodeRef
--LEFT OUTER JOIN ClientDate D ON D.Id_Client = Client.CodeRef AND D.SpId = CPT.CompteurId
--WHERE (ISNULL(@CodeEquipement,'') = '' OR CPT.CodeEquipement = @CodeEquipement )
--) AS P
--WHERE CASE WHEN (ISNULL(@Mono,'') = '' OR @Mono = 0) THEN 1 ELSE NOMBRE_COMPTEURS END = 1 
--AND CASE WHEN (ISNULL(@Mono, '') = '' OR @Mono = 1) THEN 2 ELSE NOMBRE_COMPTEURS END > 1

END 
	

GO
/****** Object:  StoredProcedure [dbo].[GetContratPro]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetContratPro]
	@ListeCodeRef CodeReferenceDataType READONLY
,	@Debut int = 0
,	@Max int = 100
,	@AdresseSite varchar(100)
AS
BEGIN

SET NOCOUNT ON;

	SELECT * FROM (
	SELECT
		C.ID
	,	C.Sucesseur
	,	C.Identite
	,	C.CodeInsee
	,	C.TelDomicile
	,	C.TelPortable
	,	C.TelBureau
	,	C.EMail
	,	C.CanalContact
	,	C.DestinataireFacture
	,	CASE WHEN ISNULL(C.AdresseFacture1,'') = '' THEN C.AdresseSite1 ELSE C.AdresseFacture1 END as 'AdresseFacture1'
	,	CASE WHEN ISNULL(C.AdresseFacture2,'') = '' THEN C.AdresseSite2 ELSE C.AdresseFacture2 END as 'AdresseFacture2'
	,	CASE WHEN ISNULL(C.AdresseFacture3,'') = '' THEN C.AdresseSite3 ELSE C.AdresseFacture3 END as 'AdresseFacture3'
	,	CASE WHEN ISNULL(C.CpFacture,'') = '' THEN C.CpSite ELSE C.CpFacture END as 'CpFacture'
	,	CASE WHEN ISNULL(C.VilleFacture,'') = '' THEN C.VilleSite ELSE C.VilleFacture END as 'VilleFacture'
	,	C.AdresseSite1
	,	C.AdresseSite2
	,	C.AdresseSite3
	,	C.CpSite
	,	C.VilleSite
	,   C.ClientAbonnementDate as 'AbonnementEfacture'
	,   C.DateEfacture
	,   C.ModePaiement
	,   convert (varchar(10),C.DateModePaiement,103) as 'DateModePaiement'
	,   C.MtDerniereFacture
	,   C.MtSolde
	,   C.CodeSituation
	,   C.ContratCarte
	,   C.TypeClient
	,   C.CodeClasseClient
	,   C.LibelleClasseClient
	,   C.ClientGrandCompte as 'GrandCompte'
	,   C.ClientChorus as 'Chorus'
	,   C.Siret
	,   C.CodeApe
	,   C.DateSolde
	,   C.NomRib
	,   C.Etablissement
	,   C.Guichet
	,   C.Compte
	,   C.CleRib
	,	C.Iban as 'Iban'
	,   C.ContratBanco
	--,   C.DateProchaineFacture
	,	NULL as DateProchaineFacture
	--,   C.DateProchainReleve
	,	NULL as DateProchainReleve
	,   C.ClientAbonnementDate as 'DateDemandeAbonnement'
	,   DateArrivee = convert (varchar(10),ClientDate.DateDebut,103)
	,   CASE WHEN (C.CiviliteActeurPrincipal IS NOT NULL) THEN 1 ELSE 0 END AS 'ActeurPrincipal'
	,   C.CiviliteActeurPrincipal
	,   C.Rum
	--,   C.Marque
	,	NULL as 'Marque'
	,   C.CodeCreation
	,   C.CreateDate
	,   C.UpdateDate 
	,	'98' as 'CodeSysteme'
	,	CC.CodeRef as 'Reference'
	,	'Y' as CodeOrigine
	,	C.CodeModif
	,	dbo.ReturnIdentifiantFromReference(C.CodeRef) AS Identifiant
	,	DENSE_RANK() OVER(ORDER BY CC.CodeRef ASC) AS RowNumber

	FROM (	SELECT LCR.CodeRef FROM @ListeCodeRef LCR
			LEFT JOIN Client C ON LCR.CodeRef = C.CodeRef
			LEFT JOIN BLACKLIST B ON B.CODE_REF = C.CodeRef
			WHERE ((REPLACE(RTRIM(LTRIM(C.AdresseSite1)) + ' ' + RTRIM(LTRIM(C.AdresseSite2)) + ' ' + RTRIM(LTRIM(C.AdresseSite3)) + ' ' + RTRIM(LTRIM(C.CpSite)) + ' ' + RTRIM(LTRIM(C.VilleSite)), '  ', ' ') LIKE '%'+@AdresseSite+'%') OR (@AdresseSite IS NULL OR @AdresseSite = ''))
			AND B.ID IS NULL
	) CC
	
	INNER JOIN Client C ON CC.CodeRef = C.CodeRef
	OUTER APPLY (SELECT TOP(1) CD.DateDebut FROM ClientDate CD WHERE CD.Id_Client = C.CodeRef and ISNULL(CD.DateFin, '9999-12-30') > GETDATE()) ClientDate

	WHERE ((REPLACE(RTRIM(LTRIM(C.AdresseSite1)) + ' ' + RTRIM(LTRIM(C.AdresseSite2)) + ' ' + RTRIM(LTRIM(C.AdresseSite3)) + ' ' + RTRIM(LTRIM(C.CpSite)) + ' ' + RTRIM(LTRIM(C.VilleSite)), '  ', ' ') LIKE '%'+@AdresseSite+'%') OR (@AdresseSite IS NULL OR @AdresseSite = ''))
	) v
	
	WHERE v.RowNumber > @Debut and v.RowNumber <= @Debut + @Max
END
GO
/****** Object:  StoredProcedure [dbo].[GetDashBoardCel]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author		: Mancier Jonathan
-- Create date	: 22/11/2018
-- Description	: API - GetDashBoardCel
-- EXEC GetDashboardCel '9870005173'
-- =============================================
CREATE PROCEDURE [dbo].[GetDashBoardCel]
	--@CdOrigine NVARCHAR(5), @CodeSysteme nvarchar(20),
	@CodeRef nvarchar(20)
AS
BEGIN
	SET DATEFORMAT dmy;

	DECLARE @CodeRefInterne varchar(10);
	SET @CodeRefInterne = @CodeRef;

	SELECT
		DISTINCT(C.[CodeRef]) as 'reference'
	,	'Y' as 'CdOrigine'
	,	'98' as 'CodeSysteme'
	--,	C.[CodeRef] as 'reference'
	,	C.[Identite] as 'identite'
	,	C.ContratBanco as 'ContratBanco'
	,	C.[MtSolde]
	,	C.[ModePaiement] AS 'modePaiement'
	,	LTRIM(RTRIM(ISNULL(C.[AdresseFacture1],'')))
		 + CASE WHEN ISNULL(C.[AdresseFacture2],'') != '' THEN ' '+LTRIM(RTRIM(C.[AdresseFacture2])) ELSE '' END
		 + CASE WHEN ISNULL(C.[AdresseFacture3],'') != '' THEN ' '+LTRIM(RTRIM(C.[AdresseFacture3])) ELSE '' END
		 + CASE WHEN ISNULL(C.[AdresseFacture4],'') != '' THEN ' '+LTRIM(RTRIM(C.[AdresseFacture4])) ELSE '' END
		 + CASE WHEN ISNULL(C.[CpFacture],'') != '' THEN ' '+LTRIM(RTRIM(C.[CpFacture])) ELSE '' END
		 + CASE WHEN ISNULL(C.[VilleFacture],'') != '' THEN ' '+LTRIM(RTRIM(C.[VilleFacture])) ELSE '' END
		 AS 'adresseFacturation'
	,	LTRIM(RTRIM(ISNULL(CompteurDesserte.[AdresseDesserte1],'')))
		 + CASE WHEN ISNULL(CompteurDesserte.[AdresseDesserte2],'') != '' THEN ' '+LTRIM(RTRIM(CompteurDesserte.[AdresseDesserte2])) ELSE '' END
		 + CASE WHEN ISNULL(CompteurDesserte.[AdresseDesserte3],'') != '' THEN ' '+LTRIM(RTRIM(CompteurDesserte.[AdresseDesserte3])) ELSE '' END
		 + CASE WHEN ISNULL(CompteurDesserte.[CpDesserte],'') != '' THEN ' '+LTRIM(RTRIM(CompteurDesserte.[CpDesserte])) ELSE '' END
		 + CASE WHEN ISNULL(CompteurDesserte.[Ville],'') != '' THEN ' '+LTRIM(RTRIM(CompteurDesserte.[Ville])) ELSE '' END
		 AS 'adresseDesserte'
	,	NextEcheance.[Date] AS 'dateProchaineEcheance'
	,	NextEcheance.[Montant] AS 'mtProchaineEcheance'
	,	Facture.[Date] AS 'dateDerniereFacture'
	,	Facture.[Montant] AS 'mtDerniereFacture'
	,	Facture.[FactureId] AS 'numeroDerniereFacture'
	,	Facture.[Image] AS 'imageDerniereFacture'
	,	Consommation.[DateIndex] AS 'dateDernierIndex'
	,	Consommation.[Index] AS 'valeurDernierIndex'
	--,	CompteurTR.[CompteurId] as 'numeroCompteurTR'
	,	ListCptTR.CompteurId as 'numeroCompteurTR'
	,	[nombreCompteurTr] = (SELECT COUNT(DISTINCT(CompteurId)) FROM [dbo].[Compteur] CptTR WHERE CptTR.CodeRef = C.CodeRef AND CptTR.CodeEquipement = 'TR' GROUP BY CptTR.CodeRef)
	,	[nombreCompteurRr] = (SELECT COUNT(DISTINCT(CompteurId)) FROM [dbo].[Compteur] CptRR WHERE CptRR.CodeRef = C.CodeRef AND CptRR.CodeEquipement = 'RR' GROUP BY CptRR.CodeRef)
	,	[nombreCompteurSe] = (SELECT COUNT(DISTINCT(CompteurId)) FROM [dbo].[Compteur] CptSE WHERE CptSE.CodeRef = C.CodeRef AND CptSE.CodeEquipement = 'SE' GROUP BY CptSE.CodeRef)
	,	C.[CodeCreation]
	,	C.[CreateDate]
	,	C.[CodeModif]
	,	C.[UpdateDate]
	,	ISNULL(N.NbSite,0) as NbSite
	,	[nombreCompteurGen] = ISNULL((SELECT COUNT(DISTINCT(CompteurId)) FROM [dbo].[Compteur] CptGen WHERE CptGen.CodeRef = C.CodeRef AND CompteurGeneral = 'O' GROUP BY CptGen.CodeRef),0)

	FROM [dbo].[Client] C

	--INNER JOIN [dbo].[Compteur] Cpt ON Cpt.[CodeRef] = C.[CodeRef]

	OUTER APPLY (	SELECT TOP(1) EC.[Date], EC.[Montant]
					FROM [dbo].[Echeance] EC
					WHERE EC.[CodeRef] = @CodeRefInterne
					ORDER BY EC.[Date] ASC
				)	
				AS NextEcheance

	OUTER APPLY (	SELECT TOP(1) F.[Date], F.[Montant], F.[FactureId], F.[Image]
					FROM [dbo].[Facture] F
					WHERE F.[CodeRef] = @CodeRefInterne
					ORDER BY F.[Date] DESC
				)
				AS Facture

	OUTER APPLY (
	SELECT TOP(1) CS.[DateIndex], CS.[Index]
					FROM [dbo].[Consommation] CS
					INNER JOIN ClientDate CD ON CD.SpId = CS.CompteurId
					WHERE CS.[CodeRef] = C.CodeRef and CS.DateIndex >= CD.DateDebut and CS.DateIndex <= CD.DateFin  AND CS.CodeRef = CD.Id_Client
					ORDER BY CS.[DateIndex] DESC
				)
				AS Consommation
	
	LEFT JOIN [dbo].[Compteur] ListCptTR ON ListCptTR.CodeRef = @CodeRefInterne AND ListCptTR.CodeEquipement = 'TR'
	LEFT OUTER JOIN FRONT_MIRROR.dbo.Eligibilite_AcctNbSite N ON N.Id_Client = C.CodeRef

	OUTER APPLY (	SELECT TOP 1 CT.AdresseDesserte1, CT.AdresseDesserte2, CT.AdresseDesserte3, CT.CpDesserte, CT.Ville
					FROM [dbo].[Compteur] CT
					INNER JOIN ClientDate CD ON CT.CodeRef = CD.Id_Client and CD.DateFin = '9999-12-31' and CT.CompteurID = CD.SpId
					WHERE CT.[CodeRef] = @CodeRefInterne
				) AS CompteurDesserte

	WHERE C.CodeRef = @CodeRefInterne
	--WHERE C.[CodeRef] IN (SELECT splitdata FROM [dbo].[fnSplitString] (@CodeRef, ','))

END
GO
/****** Object:  StoredProcedure [dbo].[GetEcheances]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEcheances]
--@CdOrigine nvarchar(5), @CodeSysteme nvarchar(20), 
	@CodeRef nvarchar(20)
AS
BEGIN
	DECLARE @CodeRefInterne varchar(10);
	SET @CodeRefInterne = @CodeRef;

	SELECT

		E.ID
	,	E.[Date]
	,	E.Montant
	,	E.CodeSysteme
	,	C.CodeRef
	,	C.CodeOrigine
	,	E.CodeModif

	FROM Client C
	LEFT OUTER JOIN [dbo].[Echeance] E ON C.CodeRef = E.CodeRef

	WHERE C.CodeRef = @CodeRefInterne
		--AND CodeOrigine = @CdOrigine AND CodeSysteme = @CodeSysteme
	ORDER BY E.[Date] ASC

END
GO
/****** Object:  StoredProcedure [dbo].[GetEligibilite]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- [GetEligibilite] '3613421111','','', NULL

-- 0244835220 => Départ sans facture
-- 3613421111


CREATE   PROCEDURE [dbo].[GetEligibilite]
	@CodeRef varchar(10) = NULL
,	@IdActeur varchar(10) = NULL
,	@IdPds varchar(10) = NULL
,	@Parcours varchar(10) = 'DEPART'
AS
BEGIN

	DECLARE @IdActeurInterne varchar(10);
	SET @IdActeurInterne = @IdActeur;

	DECLARE @CodeRefInterne varchar(10);
	SET @CodeRefInterne = @CodeRef;
	
	DECLARE @IdPdsInterne varchar(10);
	SET @IdPdsInterne = @IdPds;

	SELECT
		v.CodeOrigine
	,	v.CodeSysteme
	,	v.idActeur
	,	v.CodeRef
	,	v.IdPds
	,	v.eligible
	,	v.causeNonEligibilite
	,	'DEPART' as parcours

	FROM
	(
		SELECT
			'Y' AS [CodeOrigine]
		,	'98' AS [CodeSysteme]
		,	[Id_Per] as idActeur
		,	[Id_Client] as CodeRef
		,	IdPds.IdPds
		,	CASE WHEN [FAC_ATT] > 0 OR [RJTTITDCD] = 1 OR [RDR] = 1 OR [DEG] = 1 OR [FAC] = 1 OR [AT] = 1 OR [DEP] = 1 OR [FAC] = 1 THEN 0 ELSE 1 END as eligible
		,	CASE WHEN [FAC_ATT] > 0 THEN 'FAC en attente' ELSE
				CASE WHEN [AT] = 1 THEN 'INTER en cours' ELSE
					CASE WHEN [DEP] = 1 THEN 'DEP en cours' ELSE
					CASE WHEN [RDR] = 1 OR [DEG] = 1 OR [DEG] = 1 OR [FAC] = 1 OR [RJTTITDCD] = 1 THEN 'DOSSIER en cours' ELSE '' END
					END
				END
			END
			AS causeNonEligibilite

		,	ROW_NUMBER() OVER(Partition by [Id_Client] ORDER BY [Id_Client]) AS RN

		FROM [FRONT_MIRROR].[dbo].[Client] C 
		LEFT JOIN [FRONT_MIRROR].[dbo].[Eligibilite] E ON E.Id_Client = C.CodeRef

		OUTER APPLY (SELECT STRING_AGG([Id_Pds],';') AS IdPds FROM [FRONT_MIRROR].[dbo].[Eligibilite] WHERE Id_Client = @CodeRefInterne) IdPds
		WHERE C.CodeRef = @CodeRefInterne
	) v
	WHERE v.RN = 1
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetFactures]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetFactures]
	--@CdOrigine nvarchar(5), @CodeSysteme nvarchar(20),
	@CodeRef nvarchar(20)
AS
BEGIN
	DECLARE @CodeRefInterne varchar(10);
	SET @CodeRefInterne = @CodeRef;

	SELECT
		F.ID
	,	F.[Date]
	,	F.Montant
	,	F.[Image]
	,	C.CodeSysteme
	,	F.FactureId AS CodeRef
	,	C.CodeOrigine
	,	F.CodeModif	

	FROM Client C
	LEFT OUTER JOIN[dbo].[Facture] F ON F.CodeRef = C.CodeRef

	WHERE C.CodeRef = @CodeRefInterne
	--AND CodeOrigine = @CdOrigine AND CodeSysteme = @CodeSysteme 
	ORDER BY [Date] DESC

END
GO
/****** Object:  StoredProcedure [dbo].[GetFicheClient]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetFicheClient]
	@CodeRef nvarchar(20)
AS
BEGIN

	DECLARE @CodeRefInterne varchar(10);
	SET @CodeRefInterne = @CodeRef;

	SELECT
		C.ID
	,	C.Sucesseur
	,	C.Identite
	,	C.CodeInsee
	,	C.TelDomicile
	,	C.TelPortable
	,	C.TelBureau
	,	C.Email
	,	C.CanalContact
	,	CASE WHEN ISNULL(C.AdresseFacture1,'') = '' THEN C.AdresseSite1 ELSE C.AdresseFacture1 END as 'AdresseFacture1'
	,	CASE WHEN ISNULL(C.AdresseFacture2,'') = '' THEN C.AdresseSite2 ELSE C.AdresseFacture2 END as 'AdresseFacture2'
	,	CASE WHEN ISNULL(C.AdresseFacture3,'') = '' THEN C.AdresseSite3 ELSE C.AdresseFacture3 END as 'AdresseFacture3'
	,	CASE WHEN ISNULL(C.CpFacture,'') = '' THEN C.CpSite ELSE C.CpFacture END as 'CpFacture'
	,	CASE WHEN ISNULL(C.VilleFacture,'') = '' THEN C.VilleSite ELSE C.VilleFacture END as 'VilleFacture'
	,	C.AdresseSite1
	,	C.AdresseSite2
	,	C.AdresseSite3
	,	C.CpSite
	,	C.VilleSite
	,	C.ModePaiement
	,	C.MtDerniereFacture
	,	C.MtSolde
	,	C.CodeSituation
	,	C.ContratCarte
	,	C.TypeClient
	,	C.Siret
	,	C.CodeApe
	,	C.DateSolde
	,	C.NomRib
	,	C.Etablissement
	,	C.Guichet
	,	C.Compte
	,	C.CleRib
	,	C.ContratBanco
	,	C.CodeCreation
	,	C.CreateDate
	,	C.UpdateDate
	--,	CodeSysteme
	,	'98' as 'CodeSysteme'
	,	C.CodeRef
	,	'Y' as CodeOrigine
	,	C.CodeModif
	,	dbo.ReturnIdentifiantFromReference(@CodeRefInterne) AS Identifiant
	,	CONVERT(varchar(10),CD.DateDebut) as 'DateDebutService'
	,	Iban
	,	IdActeur
	,	codeEnvoiFacture

	FROM Client C

	LEFT JOIN ClientDate CD ON CD.Id_Client = @CodeRefInterne
	WHERE CodeRef = @CodeRefInterne

	OPTION (FAST 1)

END
GO
/****** Object:  StoredProcedure [dbo].[GetFicheClientPro]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetFicheClientPro] @ListeCodeRef CodeReferenceDataType READONLY, @Debut int = 0, @Max int = 100
AS
BEGIN

	SELECT
		C.ID
	,	C.Sucesseur
	,	C.Identite
	,	C.CodeInsee
	,	C.TelDomicile
	,	C.TelPortable
	,	C.TelBureau
	,	C.Email
	,	C.CanalContact
	,	C.AdresseFacture1
	,	C.AdresseFacture2
	,	C.AdresseFacture3
	,	C.CpFacture
	,	C.VilleFacture
	,	C.ModePaiement
	,	C.MtDerniereFacture
	,	C.MtSolde
	,	C.CodeSituation
	,	C.ContratCarte
	,	C.TypeClient
	,	C.Siret
	,	C.CodeApe
	,	C.DateSolde
	,	C.NomRib
	,	C.Etablissement
	,	C.Guichet
	,	C.Compte
	,	C.CleRib
	,	C.ContratBanco
	,	C.CodeCreation
	,	C.CreateDate
	,	C.UpdateDate
	--,	C.CodeSysteme
	,	'98' as 'CodeSysteme'
	,	C.CodeRef
	,	'Y' as CodeOrigine
	,	C.CodeModif
	,	dbo.ReturnIdentifiantFromReference(C.CodeRef) AS Identifiant

	FROM Client C 
	INNER JOIN @ListeCodeRef CC ON CC.CodeRef = C.CodeRef

END
GO
/****** Object:  StoredProcedure [dbo].[GetListeClientSite]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetListeClientSite] @ListeCodeRef CodeReferenceDataType READONLY, @Debut int = 0, @Max int = 100, @AdresseSite varchar(100)
AS
BEGIN

	SELECT
		CC.CodeRef
	,	ISNULL(C.CodeOrigine,'Y') as 'CodeOrigine'
	,	ISNULL(C.CodeSysteme,'98') as 'CodeSysteme'
	,	Cpt.AdresseId as 'IdSite'
	,	C.Identite
	,	C.CodeInsee
	,	C.CodeSituation
	,	C.TypeClient
	,	C.ContratBanco
	,	Cpt.AdresseId as 'IdAdresse'
	,	C.AdresseSite1 as 'AdresseDesserte1'
	,	C.AdresseSite2 as 'AdresseDesserte2'
	,	C.AdresseSite3 as 'AdresseDesserte3'
	,	C.CpSite as 'CpDesserte'
	,	C.VilleSite as 'VilleDesserte'
	,	REPLACE(RTRIM(LTRIM(C.AdresseSite1)) + ' ' + RTRIM(LTRIM(C.AdresseSite2)) + ' ' + RTRIM(LTRIM(C.AdresseSite3)) + ' ' + RTRIM(LTRIM(C.CpSite)) + ' ' + RTRIM(LTRIM(C.VilleSite)) + ' ', '  ', ' ') AS 'AdresseDesserte'
	,	Cpt.CompteurId as 'IdPds' 

	FROM (
	SELECT CodeRef
	FROM @ListeCodeRef T
	) CC
	INNER JOIN Client C ON CC.CodeRef = C.CodeRef
	INNER JOIN Compteur Cpt ON CPT.CodeRef = C.CodeRef
	LEFT JOIN BLACKLIST B ON B.CODE_REF = C.CodeRef
	WHERE B.ID IS NULL
	AND ((REPLACE(RTRIM(LTRIM(C.AdresseSite1)) + ' ' + RTRIM(LTRIM(C.AdresseSite2)) + ' ' + RTRIM(LTRIM(C.AdresseSite3)) + ' ' + RTRIM(LTRIM(C.CpSite)) + ' ' + RTRIM(LTRIM(C.VilleSite)), '  ', ' ') LIKE '%'+@AdresseSite+'%') OR (@AdresseSite IS NULL OR @AdresseSite = ''))

	ORDER BY CC.CodeRef, Cpt.AdresseId

END
GO
/****** Object:  StoredProcedure [dbo].[GetListeCompteurPro]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetListeCompteurPro]
	@ListeCodeRef CodeReferenceDataType READONLY
,	@Debut int = 0
,	@Max int = 100
,	@IdPds varchar(10)
,	@Matricule varchar(50)
,	@AdresseSite varchar(100)
,	@Usage varchar(20)
AS
BEGIN

	SELECT * FROM
	(

	SELECT
		CC.CodeRef as 'Reference'
	,	ISNULL(C.CodeOrigine,'Y') as 'CodeOrigine'
	,	ISNULL(C.CodeSysteme,'98') as 'CodeSysteme'
	,	Cpt.ID
	,	Cpt.CompteurId
	,	Cpt.AdresseId as 'IdSite'
	,	Cpt.Rang as 'NumeroBadge'
	,	Cpt.Matricule as 'MatriculeCompteur'
	,	Cpt.PeriodeReleve
	,	Cpt.CodeEquipement
	,	Cpt.AdresseId as 'IdAdresse'
	,	Cpt.AdresseDesserte1
	,	Cpt.AdresseDesserte2
	,	Cpt.AdresseDesserte3
	,	Cpt.CpDesserte
	,	Cpt.Ville
	,	REPLACE(RTRIM(LTRIM(Cpt.[AdresseDesserte1])) + ' ' + RTRIM(LTRIM(Cpt.[AdresseDesserte2])) + ' ' + RTRIM(LTRIM(Cpt.[AdresseDesserte3])) + ' ' + RTRIM(LTRIM(Cpt.CpDesserte)) + ' ' + Cpt.Ville, '  ', ' ') AS 'AdresseDesserte'
	,	Cpt.Usage
	,	Cpt.DiametreFacturation as 'Calibre'
	,	CASE WHEN Cpt.CompteurGeneral = 'O' THEN 1 ELSE 0 END AS CompteurGeneral
	,	Cpt.CompteurDivisionnaire
	,	Cpt.CodeEmplacement
	,	Cpt.LibelleEmplacement
	,	Cpt.CauseFermeture
	,	Cpt.TypeRaccordement
	,	Cpt.Fluide
	,	Cpt.EtatSource as 'EtatCompteur'
	,	Cpt.EtatPDS
	,	Cpt.AnneeFabrication
	,	Cpt.TypeProprietaire
	,	CONVERT(varchar(10),Cpt.DateMiseEnService,103) as 'DateMiseEnService'
	,	NULL as 'IndexPose'
	,	CONVERT(varchar(10),Cpt.DateDepose,103) as 'DateDepose'
	,	NULL as 'IndexDepose'
	,	Cpt.CodeEquipement as 'TypeReleve'
	,	NULL as 'CodeRemarqueDepose'
	--,	Cpt.CodeModif
	,	Cpt.UpdateDate as 'DateModif'
	,	Cpt.CreateDate as 'DateCreation'
	,	DENSE_RANK() OVER(ORDER BY CC.CodeRef ASC) AS RowNumber
	,	NbCompteurFull = sum(1) over()
	,	NbCodeRefFull

	FROM (

		SELECT v.CodeRef, sum(1) OVER() AS NbCodeRefFull

		FROM
		(
		SELECT DISTINCT(CC.CodeRef)
		FROM @ListeCodeRef CC
		
		INNER JOIN Client C ON CC.CodeRef = C.CodeRef
		INNER JOIN Compteur Cpt ON Cpt.CodeRef = C.CodeRef
		LEFT JOIN BLACKLIST B ON B.CODE_REF = CC.CodeRef
		
		WHERE B.ID IS NULL
		AND (ISNULL(@IdPds,'') = '' OR Cpt.CompteurId = @IdPds)
		AND (ISNULL(@Matricule,'') = '' OR Cpt.Matricule = @Matricule)
		AND (ISNULL(@AdresseSite,'') = '' OR REPLACE(RTRIM(LTRIM(Cpt.[AdresseDesserte1])) + ' ' + RTRIM(LTRIM(Cpt.[AdresseDesserte2])) + ' ' + RTRIM(LTRIM(Cpt.[AdresseDesserte3])) + ' ' + RTRIM(LTRIM(Cpt.CpDesserte)) + ' ' + Cpt.Ville, '  ', ' ') LIKE '%'+@AdresseSite+'%')
		AND (ISNULL(@Usage,'') = '' OR Cpt.Usage = @Usage)
		) v
	) CC

	INNER JOIN Client C ON CC.CodeRef = C.CodeRef
	INNER JOIN Compteur Cpt ON Cpt.CodeRef = C.CodeRef
	
	WHERE 1 = 1
	AND (ISNULL(@IdPds,'') = '' OR Cpt.CompteurId = @IdPds)
	AND (ISNULL(@Matricule,'') = '' OR Cpt.Matricule = @Matricule)
	AND (ISNULL(@AdresseSite,'') = '' OR REPLACE(RTRIM(LTRIM(Cpt.[AdresseDesserte1])) + ' ' + RTRIM(LTRIM(Cpt.[AdresseDesserte2])) + ' ' + RTRIM(LTRIM(Cpt.[AdresseDesserte3])) + ' ' + RTRIM(LTRIM(Cpt.CpDesserte)) + ' ' + Cpt.Ville, '  ', ' ') LIKE '%'+@AdresseSite+'%')
	AND (ISNULL(@Usage,'') = '' OR Cpt.Usage = @Usage)
	) v
	
	WHERE v.RowNumber > @Debut and v.RowNumber <= @Debut + @Max
	ORDER BY v.RowNumber ASC
END
GO
/****** Object:  StoredProcedure [dbo].[GetListeConsommationPro]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetListeConsommationPro]
@ListeCodeRef CodeReferenceDataType READONLY, @Debut INT=0, @Max INT=100, @IdPds VARCHAR (10), @DateIndexMin VARCHAR (10), @DateIndexMax VARCHAR (10)
AS
BEGIN
    SET DATEFORMAT dmy;
    SELECT   *
    FROM     (SELECT count(*) OVER () AS 'NbTotalRows',
                     *
              FROM   (SELECT LC.CodeRef,
                             CC.ID,
                             ISNULL(C.CodeOrigine, 'Y') AS 'CodeOrigine',
                             ISNULL(C.CodeSysteme, '98') AS 'CodeSysteme',
                             CONVERT (VARCHAR (10), CD.DateDebut, 103) AS DateArrivee,
                             Cpt.CompteurId AS 'IdPDS',
                             Cpt.Rang AS 'NumeroBadge',
                             Cpt.Matricule AS 'Matricule',
                             [Index] AS 'IndexCompteur',
                             QualiteIndex,
                             CONVERT (VARCHAR (10), DateIndex, 23) AS 'DateIndex',
                             CASE WHEN AncienIndex = -1 THEN [Index] ELSE AncienIndex END AS 'AncienIndex',
                             CASE WHEN AncienIndex = -1 THEN 0 ELSE ([Index] - [AncienIndex]) END AS 'Consommation',
                             ROW_NUMBER() OVER (PARTITION BY C.CodeRef, DateIndex, AncienIndex, [Index], QualiteIndex ORDER BY CC.ID DESC) AS RowNumber,
                             DENSE_RANK() OVER (ORDER BY C.CodeRef ASC) AS RowNumberPaging
                      FROM   (SELECT DISTINCT (LCR.CodeRef) AS 'CodeRef'
                              FROM   @ListeCodeRef AS LCR
                                     INNER JOIN
                                     (SELECT CodeRef
                                      FROM   Client) AS C
                                     ON LCR.CodeRef = C.CodeRef
                                     INNER JOIN
                                     (SELECT CodeRef,
                                             CompteurId
                                      FROM   Compteur) AS Cpt
                                     ON Cpt.CodeRef = C.CodeRef
                                     INNER JOIN
                                     (SELECT CodeRef,
                                             CompteurId,
                                             DateIndex
                                      FROM   Consommation) AS CC
                                     ON C.CodeRef = CC.CodeRef
                                        AND CC.CompteurId = Cpt.CompteurId
                                     INNER JOIN
                                     (SELECT Id_Client,
                                             SpId,
                                             DateDebut,
                                             DateFin
                                      FROM   ClientDate) AS CD
                                     ON CD.Id_Client = LCR.CodeRef
                                     LEFT OUTER JOIN BLACKLIST AS B
                                     ON B.CODE_REF = CC.CodeRef
                              WHERE  B.ID IS NULL
                                     AND CC.DateIndex >= CD.DateDebut
                                     AND CC.DateIndex <= CD.DateFin
                                     AND ISNULL(CC.DateIndex, '') >= ISNULL(CD.DateDebut, '')
                                     AND ISNULL(CC.DateIndex, '') <= ISNULL(CD.DateFin, '')
                                     AND CD.SpId = CC.CompteurId
                                     AND CD.Id_Client = LCR.CodeRef
                                     AND (ISNULL(@IdPds, '') = ''
                                          OR Cpt.CompteurId = @IdPds)
                                     AND (ISNULL(@DateIndexMin, '') = ''
                                          OR CC.DateIndex >= @DateIndexMin)
                                     AND (ISNULL(@DateIndexMax, '') = ''
                                          OR CC.DateIndex <= @DateIndexMax)) AS LC
                             INNER JOIN
                             (SELECT CodeRef,
                                     CodeOrigine,
                                     CodeSysteme
                              FROM   Client) AS C
                             ON LC.CodeRef = C.CodeRef
                             INNER JOIN
                             Compteur AS Cpt
                             ON Cpt.CodeRef = C.CodeRef
                             INNER JOIN
                             Consommation AS CC
                             ON C.CodeRef = CC.CodeRef
                                AND CC.CompteurId = Cpt.CompteurId
                             INNER JOIN
                             ClientDate AS CD
                             ON CD.Id_Client = LC.CodeRef
                      WHERE  CC.DateIndex >= CD.DateDebut
                             AND CC.DateIndex <= CD.DateFin
                             AND ISNULL(CC.DateIndex, '') >= ISNULL(CD.DateDebut, '')
                             AND ISNULL(CC.DateIndex, '') <= ISNULL(CD.DateFin, '')
                             AND CD.SpId = CC.CompteurId
                             AND CD.Id_Client = LC.CodeRef
                             AND (ISNULL(@IdPds, '') = ''
                                  OR Cpt.CompteurId = @IdPds)
                             AND (ISNULL(@DateIndexMin, '') = ''
                                  OR CC.DateIndex >= @DateIndexMin)
                             AND (ISNULL(@DateIndexMax, '') = ''
                                  OR CC.DateIndex <= @DateIndexMax)) AS v
              WHERE  v.RowNumber = 1
                     AND v.RowNumberPaging > @Debut
                     AND v.RowNumberPaging <= @Debut + @Max) AS v2
    WHERE    v2.AncienIndex != (CASE WHEN NbTotalRows > 1 THEN -1 ELSE -2 END)
    ORDER BY v2.CodeRef, v2.IdPDS, v2.DateIndex DESC;
END

GO
/****** Object:  StoredProcedure [dbo].[GetListeFacturePro]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetListeFacturePro]
	@ListeCodeRef CodeReferenceDataType READONLY
,	@Debut int = 0
,   @Max int = 100
,	@NumeroFacture varchar(12)
,	@AdresseSite varchar(100)
,	@Montant varchar(100)
,	@DateFactureMin varchar(20)
,	@DateFactureMax varchar(20)

AS
BEGIN
	SET NOCOUNT ON;
	SET DATEFORMAT dmy;
	
	SELECT * FROM
	(
		SELECT
			CC.CodeRef
		,	C.CodeOrigine
		,	C.CodeSysteme
		,	F.ID
		,	convert(varchar(10),F.[Date],23) as 'DateFacture'
		,	F.FactureId as 'NumeroFacture'
		,	F.Montant as 'MontantFacture'
		,	F.[Image]
		--,	NULL as 'DateEcheance'
		,	CASE WHEN F.SoldeFacture = 'Soldée' THEN 'S' ELSE 'A' END as 'Statut'
		,	NULL as 'Consommation'
		,	NULL as 'Motif'
		,	F.FondSolidariteLogement as 'Fsl'
		,	CONVERT(varchar(10),F.DateEffectivePrelevement,103) as 'DatePrelevement'
		,	CONVERT(varchar(10),F.DateLimitePaiement,103) as 'DateEcheance'
		,	DENSE_RANK() OVER(ORDER BY CC.CodeRef ASC) AS RowNumber
		,	NbCodeRefFull
		,	NbFactureFull = sum(1) over()

		FROM 
		(
			SELECT v.CodeRef, sum(1) OVER() AS NbCodeRefFull
			FROM
			(
				SELECT DISTINCT(CC.CodeRef)
				FROM @ListeCodeRef CC
				LEFT JOIN BLACKLIST B ON B.CODE_REF = CodeRef
			
			INNER JOIN (SELECT CodeRef FROM Client) C ON CC.CodeRef = C.CodeRef
			INNER JOIN (SELECT CodeRef, FactureId, Montant, [Date] FROM Facture) F ON F.CodeRef = C.CodeRef

			WHERE B.ID IS NULL
			AND (ISNULL(@NumeroFacture,'') = '' OR F.FactureId = @NumeroFacture)
			--AND (ISNULL(@AdresseSite,'') = '' OR REPLACE(RTRIM(LTRIM(C.AdresseFacture1)) + ' ' + RTRIM(LTRIM(C.AdresseFacture2)) + ' ' + RTRIM(LTRIM(C.AdresseFacture3)) + '' + RTRIM(LTRIM(C.CpFacture)) + ' ' + RTRIM(LTRIM(C.VilleFacture)), '  ', ' ') LIKE '%'+@AdresseSite+'%')
			AND (ISNULL(@Montant,'') = '' OR F.Montant = TRY_CONVERT(numeric(15,2), @Montant))
			AND (ISNULL(@DateFactureMin,'') = '' OR F.[Date] >= @DateFactureMin)
			AND (ISNULL(@DateFactureMax,'') = '' OR F.[Date] <= @DateFactureMax)
		) v
		) CC
	
		INNER JOIN (SELECT CodeRef, CodeOrigine, CodeSysteme FROM Client) C ON CC.CodeRef = C.CodeRef
		INNER JOIN Facture F ON F.CodeRef = C.CodeRef

		WHERE (ISNULL(@NumeroFacture,'') = '' OR F.FactureId = @NumeroFacture)
		--AND (ISNULL(@AdresseSite,'') = '' OR REPLACE(RTRIM(LTRIM(C.AdresseFacture1)) + ' ' + RTRIM(LTRIM(C.AdresseFacture2)) + ' ' + RTRIM(LTRIM(C.AdresseFacture3)) + '' + RTRIM(LTRIM(C.CpFacture)) + ' ' + RTRIM(LTRIM(C.VilleFacture)), '  ', ' ') LIKE '%'+@AdresseSite+'%')
		AND (ISNULL(@Montant,'') = '' OR F.Montant = TRY_CONVERT(numeric(15,2), @Montant))
		AND (ISNULL(@DateFactureMin,'') = '' OR F.[Date] >= @DateFactureMin)
		AND (ISNULL(@DateFactureMax,'') = '' OR F.[Date] <= @DateFactureMax)

	) v
	
	WHERE v.RowNumber > @Debut and v.RowNumber <= @Debut + @Max
	ORDER BY v.RowNumber ASC
	

END
GO
/****** Object:  StoredProcedure [dbo].[GetListeFichesClientPro]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[GetListeFichesClientPro] @ListeCodeRef CodeReferenceDataType READONLY, @Debut int = 0, @Max int = 100
AS
BEGIN

	SELECT
		C.ID
	,	C.Sucesseur
	,	C.Identite
	,	C.CodeInsee
	,	C.TelDomicile
	,	C.TelPortable
	,	C.TelBureau
	,	C.Email
	,	C.CanalContact
	,	C.AdresseFacture1
	,	C.AdresseFacture2
	,	C.AdresseFacture3
	,	C.CpFacture
	,	C.VilleFacture
	,	C.ModePaiement
	,	C.MtDerniereFacture
	,	C.MtSolde
	,	C.CodeSituation
	,	C.ContratCarte
	,	C.TypeClient
	,	C.Siret
	,	C.CodeApe
	,	C.DateSolde
	,	C.NomRib
	,	C.Etablissement
	,	C.Guichet
	,	C.Compte
	,	C.CleRib
	,	C.Iban
	,	C.ContratBanco
	,	C.CodeCreation
	,	C.CreateDate
	,	C.UpdateDate
	--,	C.CodeSysteme
	,	'98' as 'CodeSysteme'
	,	CC.CodeRef
	,	'Y' as CodeOrigine
	,	C.CodeModif
	,	dbo.ReturnIdentifiantFromReference(C.CodeRef) AS Identifiant

	FROM (SELECT DISTINCT CodeRef FROM @ListeCodeRef) CC 
	LEFT OUTER JOIN Client C ON CC.CodeRef = C.CodeRef

END
GO
/****** Object:  StoredProcedure [dbo].[GetMensualite]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMensualite]
	--@CdOrigine NVARCHAR(5), @CodeSysteme nvarchar(20), 
	@CodeRef nvarchar(20), @Histo AS NVARCHAR(10), @Montant120 AS NVARCHAR(15)  
AS
BEGIN

	DECLARE @CodeRefInterne varchar(10);
	SET @CodeRefInterne = @CodeRef;

	DECLARE @X							AS INT		= 375
	DECLARE @Fourchette1Min				AS INT		= 335
	DECLARE @Fourchette1Max				AS INT		= 395
	DECLARE @FourchetteMediane			AS INT		= 150
	DECLARE @PeriodeCouverte			AS INT
	DECLARE @NbFactures					AS INT
	DECLARE @DateDebutPeriodeCouverte	AS DATETIME
	DECLARE @DateDerniereFacture		AS DATETIME
	DECLARE @DatePremiereFacture		AS DATETIME
	DECLARE @Budget						AS MONEY
	DECLARE @MontantPremiereFacture		AS MONEY
	DECLARE @Cas						AS NVARCHAR(15)
	DECLARE @LB_MODE_RETOUR				AS NVARCHAR(250)
	DECLARE @SoldeCompteClient			AS MONEY
	DECLARE @Echeance					AS MONEY
	DECLARE @MontantFacture				AS MONEY

	SET @x	= @Histo
	SET @MontantFacture  = CAST(@Montant120 AS MONEY);

	-- Date dernière facture
	SELECT	@DateDerniereFacture = MAX([DATE])
	FROM	dbo.Facture
	WHERE	CodeRef = @CodeRefInterne
	--WHERE	CodeOrigine = @CdOrigine AND CodeSysteme = @CodeSysteme AND CodeRef = @CodeRefInterne

	-- Date début période couverte
	SET @DateDebutPeriodeCouverte = DATEADD(DAY, @X * -1, @DateDerniereFacture)

	-- Date première facture
	SELECT	@DatePremiereFacture = MIN([DATE])
	FROM	dbo.Facture 
	WHERE	[Date] BETWEEN @DateDebutPeriodeCouverte AND @DateDerniereFacture
	AND		CodeRef = @CodeRefInterne
	--AND		CodeOrigine = @CdOrigine AND CodeSysteme = @CodeSysteme AND CodeRef = @CodeRefInterne

	-- Nombre de factures entre la première et dernière facture
	SELECT	@NbFactures = COUNT(*)
	FROM	dbo.Facture
	WHERE	[Date] BETWEEN @DatePremiereFacture AND @DateDerniereFacture
	AND		CodeRef = @CodeRefInterne
	--AND		CodeOrigine = @CdOrigine AND CodeSysteme = @CodeSysteme AND CodeRef = @CodeRefInterne

	-- Periode Couverte
	SELECT @PeriodeCouverte = DATEDIFF(DAY, @DatePremiereFacture, @DateDerniereFacture)

	-- Montant première facture
	SELECT	@MontantPremiereFacture = CAST(Montant AS MONEY) 
	FROM	dbo.Facture
	WHERE	[Date] = @DatePremiereFacture
	AND		CodeRef = @CodeRefInterne
	--AND		CodeOrigine = @CdOrigine AND CodeSysteme = @CodeSysteme AND CodeRef = @CodeRefInterne

	--Calcul du budget
	SELECT	@Budget = SUM(CAST(Montant AS MONEY)) - @MontantPremiereFacture
	FROM	dbo.Facture
	WHERE	[Date] BETWEEN @DatePremiereFacture AND @DateDerniereFacture
	AND		CodeRef = @CodeRefInterne
	--AND		CodeOrigine = @CdOrigine AND CodeSysteme = @CodeSysteme AND CodeRef = @CodeRefInterne

	IF (@NbFactures >= 2 AND @PeriodeCouverte BETWEEN @Fourchette1Min AND @Fourchette1Max) 
	BEGIN
		SELECT @Cas = 'CALC_365J'
	END 
	ELSE 
	BEGIN
		IF (@NbFactures >= 2 AND @PeriodeCouverte > @FourchetteMediane)
		BEGIN
			SELECT @Budget	= @Budget * 365 / @PeriodeCouverte
			SELECT @Cas		= 'CALC_150J'	 
		END 
		ELSE 
		BEGIN
			SELECT @Budget	= @MontantFacture
			SELECT @Cas		= 'CALC_120'
		END
	END 
		SELECT	@SoldeCompteClient = CAST(MtSolde AS MONEY) 
		FROM	dbo.Client
		WHERE	CodeRef = @CodeRefInterne 
		--WHERE CodeOrigine = @CdOrigine AND CodeSysteme = @CodeSysteme AND CodeRef = @CodeRefInterne

		SELECT @Echeance = (@Budget + @SoldeCompteClient) / 10
		SELECT
			CAST(ROUND(@Echeance, 0) AS INT)	AS MontantMensualite
		,	@Cas								AS CodeModeCalcul
		--,	@CodeSysteme						AS CodeSysteme
		,	'CacheClient' AS CodeSysteme
		,	@CodeRefInterne						AS CodeReference
		,	@Echeance							AS Echeance
		,	@PeriodeCouverte					AS PeriodeCouverte
		,	@DatePremiereFacture				AS DatePremiereFacture
		,	@DateDerniereFacture				AS DateDerniereFacture
		,	@SoldeCompteClient					AS SoldeCompteClient

END
GO
/****** Object:  StoredProcedure [dbo].[GetOperations]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOperations]
	--@CdOrigine nvarchar(5), @CodeSysteme nvarchar(20),
	@CodeRef nvarchar(20)
AS
BEGIN
	DECLARE @CodeRefInterne varchar(10);
	SET @CodeRefInterne = @CodeRef

	--SELECT

	--	O.ID
	--,	O.TypeOperation
	--,	O.[Date]
	--,	O.DateLimitePaiement
	--,	O.[Credit]
	--,	O.Debit
	--,	C.CodeSysteme
	--,	C.CodeRef
	--,	C.CodeOrigine
	--,	O.CodeModif

	--FROM Client C
	--LEFT OUTER JOIN Operation O ON O.CodeRef = C.CodeRef

	--WHERE  C.CodeRef = @CodeRefInterne
	---- AND O.CodeOrigine = @CdOrigine AND O.CodeSysteme = @CodeSysteme
	--ORDER BY O.Date DESC



	SELECT

		O.ID
	,	O.TypeOperation
	,	O.[Date]
	,	O.DateLimitePaiement
	,	O.[Credit]
	,	O.Debit
	,	C.CodeSysteme
	,	C.CodeRef
	,	C.CodeOrigine
	,	O.CodeModif

	FROM (SELECT C.CodeSysteme, C.CodeRef, C.CodeOrigine FROM Client C WHERE C.CodeRef = @CodeRefInterne) C
	LEFT OUTER JOIN (SELECT O.ID, O.TypeOperation, O.[Date], O.DateLimitePaiement, O.[Credit], O.Debit, O.CodeRef, O.CodeModif FROM Operation O ) O ON O.CodeRef = C.CodeRef

	-- AND O.CodeOrigine = @CdOrigine AND O.CodeSysteme = @CodeSysteme
	ORDER BY O.Date DESC

END
GO
/****** Object:  StoredProcedure [dbo].[spCheckFrontStatus]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- EXEC [spCheckFrontStatus]
-- =============================================
CREATE PROCEDURE [dbo].[spCheckFrontStatus]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	 SELECT 1 AS GetDataFromMirror

END
GO
/****** Object:  StoredProcedure [dbo].[spCheckFrontStatusInvoiceDetail]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCheckFrontStatusInvoiceDetail] @GetFromMirror bit OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 1 AS GetDataFromMirror

END
GO
/****** Object:  StoredProcedure [dbo].[spCheckFrontStatusNotre]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spCheckFrontStatusNotre]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT 1 AS GetDataFromMirror 
END
GO
/****** Object:  StoredProcedure [dbo].[spCheckLastDateCache]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- EXEC [spCheckLastDateCache]
-- =============================================

CREATE PROCEDURE [dbo].[spCheckLastDateCache]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT CONVERT(datetime2,MAX(DateProcess)) as 'LastProcessDate' FROM TabMonitoring WHERE ProcessStatut = 'OK' and NomTable IN ('Operation','Client','Echeancier','Compteur','Consommation','Facture')

END
GO
/****** Object:  StoredProcedure [dbo].[spGetEligibiliteArrivee]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- [spGetEligibiliteArrivee] '576313','','',''
-- [spGetEligibiliteArrivee_TEST] '','0002123794','',''
-- [spGetEligibiliteArrivee] '','','5463013238',''
-- [spGetEligibiliteArrivee] '','','','34300|641239|3'

CREATE       PROCEDURE [dbo].[spGetEligibiliteArrivee]
	@matriculeCompteur varchar(16)
,	@idSite varchar(10)
,	@idPds varchar(10)
,	@adresse varchar(269)
AS
BEGIN

SET NOCOUNT ON;

DECLARE @numero varchar(10) = '';
DECLARE @codeInsee varchar(5) = '';
DECLARE @idHexavia varchar(254) = '';

IF LEN(@adresse) > 0
BEGIN
	DECLARE @table table (id int identity(1,1), valeur varchar(255));

	INSERT INTO @table
	SELECT *
	FROM dbo.fnSplitString(@adresse,'|');

	--SELECT * FROM @table

	SET @codeInsee = (SELECT UPPER(valeur) FROM @table where id = 1);
	SET @idHexavia = (SELECT UPPER(valeur) FROM @table where id = 2);
	SET @numero = (SELECT UPPER(valeur) FROM @table where id = 3);

END

IF ISNULL(@matriculeCompteur,'') != ''
BEGIN

	;WITH CTE AS (
		SELECT
			'Y' as codeOrigine
		,	'98' as codeSysteme
		,	[codeReference]
		,	[spId]
		,	CONVERT(varchar,[dateDepart],103) as [dateDepart]
		,	[cptId]
		,	[siteId]
		,	[adresseSite1]
		,	[adresseSite2]
		,	[adresseSite3]
		,	[cpSite]
		,	[villeSite]
		,	CONVERT(varchar(5),LEFT([codeInsee],5)) as codeInsee
		,	[codeBanco]
		,	ISNULL([nombreCompteur],0) as [nombreCompteur]
		,	ISNULL([nombreCompteurTr],0) as [nombreCompteurTr]
		,	ISNULL([nombreCompteurRr],0) as [nombreCompteurRr]
		,	ISNULL([nombreCompteurSe],0) as [nombreCompteurSe]
		,	ISNULL([nombreCompteurGen],0) as [nombreCompteurGen]
		,	ISNULL([nbSite],0) as [nbSite]
		,	[idSite]
		,	[idHexavia]
		,	[adresseDesserte1]
		,	[adresseDesserte2]
		,	[adresseDesserte3]
		,	[cpDesserte]
		,	[villeDesserte]
		,	[codeEquipement]
		,	[numeroBadgeCompteur]
		,	[matricule]
		,	CONVERT(int,[indiceTeleRel]) as [indiceTeleRel]
		,	[cptGeneral]
		FROM Eligibilite_Arrivee
		WHERE matricule = @matriculeCompteur
		)
	SELECT
			codeOrigine
		,	codeSysteme
		,	[codeReference]
		,	[spId]
		,	CONVERT(varchar,[dateDepart],103) as [dateDepart]
		,	[cptId]
		,	[siteId]
		,	[adresseSite1]
		,	[adresseSite2]
		,	[adresseSite3]
		,	[cpSite]
		,	[villeSite]
		,	CONVERT(varchar(5),LEFT([codeInsee],5)) as codeInsee
		,	[codeBanco]
		--,	[nbSite]
		,	[idSite]
		,	[idHexavia]
		,	[adresseDesserte1]
		,	[adresseDesserte2]
		,	[adresseDesserte3]
		,	[cpDesserte]
		,	[villeDesserte]
		,	[codeEquipement]
		,	[numeroBadgeCompteur]
		,	[matricule]
		,	[indiceTeleRel]
		,	[cptGeneral]
		,	SUM(nombreCompteur) OVER (PARTITION BY [codeReference]) as nombreCompteur
		,	SUM(nombreCompteurTr) OVER (PARTITION BY [codeReference]) as nombreCompteurTr
		,	SUM(nombreCompteurRr) OVER (PARTITION BY [codeReference]) as nombreCompteurRr
		,	SUM(nombreCompteurSe) OVER (PARTITION BY [codeReference]) as nombreCompteurSe
		,	SUM(nombreCompteurGen) OVER (PARTITION BY [codeReference]) as nombreCompteurGen
		,   nbSite.cnt as nbSite -- Correction nb site faux

		FROM CTE
		OUTER APPLY (SELECT COUNT (DISTINCT [idSite]) AS cnt FROM CTE) AS nbSite -- Correction nb site faux
END
ELSE IF ISNULL(@idSite,'') != ''
BEGIN

	;WITH CTE AS (
		SELECT
			'Y' as codeOrigine
		,	'98' as codeSysteme
		,	[codeReference]
		,	[spId]
		,	CONVERT(varchar,[dateDepart],103) as [dateDepart]
		,	[cptId]
		,	[siteId]
		,	[adresseSite1]
		,	[adresseSite2]
		,	[adresseSite3]
		,	[cpSite]
		,	[villeSite]
		,	CONVERT(varchar(5),LEFT([codeInsee],5)) as codeInsee
		,	[codeBanco]
		,	ISNULL([nombreCompteur],0) as [nombreCompteur]
		,	ISNULL([nombreCompteurTr],0) as [nombreCompteurTr]
		,	ISNULL([nombreCompteurRr],0) as [nombreCompteurRr]
		,	ISNULL([nombreCompteurSe],0) as [nombreCompteurSe]
		,	ISNULL([nombreCompteurGen],0) as [nombreCompteurGen]
		,	ISNULL([nbSite],0) as [nbSite]
		,	[idSite]
		,	[idHexavia]
		,	[adresseDesserte1]
		,	[adresseDesserte2]
		,	[adresseDesserte3]
		,	[cpDesserte]
		,	[villeDesserte]
		,	[codeEquipement]
		,	[numeroBadgeCompteur]
		,	[matricule]
		,	CONVERT(int,[indiceTeleRel]) as [indiceTeleRel]
		,	[cptGeneral]
		FROM Eligibilite_Arrivee
		WHERE idSite = @idSite
		
	)
	SELECT
			codeOrigine
		,	codeSysteme
		,	[codeReference]
		,	[spId]
		,	CONVERT(varchar,[dateDepart],103) as [dateDepart]
		,	[cptId]
		,	[siteId]
		,	[adresseSite1]
		,	[adresseSite2]
		,	[adresseSite3]
		,	[cpSite]
		,	[villeSite]
		,	CONVERT(varchar(5),LEFT([codeInsee],5)) as codeInsee
		,	[codeBanco]
		--,	[nbSite]
		,	[idSite]
		,	[idHexavia]
		,	[adresseDesserte1]
		,	[adresseDesserte2]
		,	[adresseDesserte3]
		,	[cpDesserte]
		,	[villeDesserte]
		,	[codeEquipement]
		,	[numeroBadgeCompteur]
		,	[matricule]
		,	[indiceTeleRel]
		,	[cptGeneral]
		,	SUM(nombreCompteur) OVER (PARTITION BY [codeReference]) as nombreCompteur
		,	SUM(nombreCompteurTr) OVER (PARTITION BY [codeReference]) as nombreCompteurTr
		,	SUM(nombreCompteurRr) OVER (PARTITION BY [codeReference]) as nombreCompteurRr
		,	SUM(nombreCompteurSe) OVER (PARTITION BY [codeReference]) as nombreCompteurSe
		,	SUM(nombreCompteurGen) OVER (PARTITION BY [codeReference]) as nombreCompteurGen
		,   nbSite.cnt as nbSite -- Correction nb site faux

		FROM CTE
		OUTER APPLY (SELECT COUNT (DISTINCT [idSite]) AS cnt FROM CTE) AS nbSite -- Correction nb site faux
END
ELSE IF ISNULL(@idPds,'') != ''
BEGIN

	;WITH CTE AS (
		SELECT
			'Y' as codeOrigine
		,	'98' as codeSysteme
		,	[codeReference]
		,	[spId]
		,	CONVERT(varchar,[dateDepart],103) as [dateDepart]
		,	[cptId]
		,	[siteId]
		,	[adresseSite1]
		,	[adresseSite2]
		,	[adresseSite3]
		,	[cpSite]
		,	[villeSite]
		,	CONVERT(varchar(5),LEFT([codeInsee],5)) as codeInsee
		,	[codeBanco]
		,	ISNULL([nombreCompteur],0) as [nombreCompteur]
		,	ISNULL([nombreCompteurTr],0) as [nombreCompteurTr]
		,	ISNULL([nombreCompteurRr],0) as [nombreCompteurRr]
		,	ISNULL([nombreCompteurSe],0) as [nombreCompteurSe]
		,	ISNULL([nombreCompteurGen],0) as [nombreCompteurGen]
		,	ISNULL([nbSite],0) as [nbSite]
		,	[idSite]
		,	[idHexavia]
		,	[adresseDesserte1]
		,	[adresseDesserte2]
		,	[adresseDesserte3]
		,	[cpDesserte]
		,	[villeDesserte]
		,	[codeEquipement]
		,	[numeroBadgeCompteur]
		,	[matricule]
		,	CONVERT(int,[indiceTeleRel]) as [indiceTeleRel]
		,	[cptGeneral]
		FROM Eligibilite_Arrivee
		WHERE spId = @idPds
	)
	SELECT
			codeOrigine
		,	codeSysteme
		,	[codeReference]
		,	[spId]
		,	CONVERT(varchar,[dateDepart],103) as [dateDepart]
		,	[cptId]
		,	[siteId]
		,	[adresseSite1]
		,	[adresseSite2]
		,	[adresseSite3]
		,	[cpSite]
		,	[villeSite]
		,	CONVERT(varchar(5),LEFT([codeInsee],5)) as codeInsee
		,	[codeBanco]
		--,	[nbSite]
		,	[idSite]
		,	[idHexavia]
		,	[adresseDesserte1]
		,	[adresseDesserte2]
		,	[adresseDesserte3]
		,	[cpDesserte]
		,	[villeDesserte]
		,	[codeEquipement]
		,	[numeroBadgeCompteur]
		,	[matricule]
		,	[indiceTeleRel]
		,	[cptGeneral]
		,	SUM(nombreCompteur) OVER (PARTITION BY [codeReference]) as nombreCompteur
		,	SUM(nombreCompteurTr) OVER (PARTITION BY [codeReference]) as nombreCompteurTr
		,	SUM(nombreCompteurRr) OVER (PARTITION BY [codeReference]) as nombreCompteurRr
		,	SUM(nombreCompteurSe) OVER (PARTITION BY [codeReference]) as nombreCompteurSe
		,	SUM(nombreCompteurGen) OVER (PARTITION BY [codeReference]) as nombreCompteurGen
		,   nbSite.cnt as nbSite -- Correction nb site faux

		FROM CTE
		OUTER APPLY (SELECT COUNT (DISTINCT [idSite]) AS cnt FROM CTE) AS nbSite -- Correction nb site faux
END
ELSE IF ISNULL(@adresse,'') != ''
BEGIN

	;WITH CTE AS (
		SELECT
			'Y' as codeOrigine
		,	'98' as codeSysteme
		,	[codeReference]
		,	[spId]
		,	CONVERT(varchar,[dateDepart],103) as [dateDepart]
		,	[cptId]
		,	[siteId]
		,	[adresseSite1]
		,	[adresseSite2]
		,	[adresseSite3]
		,	[cpSite]
		,	[villeSite]
		,	CONVERT(varchar(5),LEFT([codeInsee],5)) as codeInsee
		,	[codeBanco]
		,	ISNULL([nombreCompteur],0) as [nombreCompteur]
		,	ISNULL([nombreCompteurTr],0) as [nombreCompteurTr]
		,	ISNULL([nombreCompteurRr],0) as [nombreCompteurRr]
		,	ISNULL([nombreCompteurSe],0) as [nombreCompteurSe]
		,	ISNULL([nombreCompteurGen],0) as [nombreCompteurGen]
		,	ISNULL([nbSite],0) as [nbSite]
		,	[idSite]
		,	[idHexavia]
		,	[adresseDesserte1]
		,	[adresseDesserte2]
		,	[adresseDesserte3]
		,	[cpDesserte]
		,	[villeDesserte]
		,	[codeEquipement]
		,	[numeroBadgeCompteur]
		,	[matricule]
		,	CONVERT(int,[indiceTeleRel]) as [indiceTeleRel]
		,	[cptGeneral]
		FROM Eligibilite_Arrivee
		WHERE (
					
						UPPER(LEFT(adresseDesserte1, CASE WHEN CHARINDEX(' ',adresseDesserte1) > 1 THEN CHARINDEX(' ',adresseDesserte1)-1 
						ELSE CHARINDEX(' ',adresseDesserte1)
						END )) = @numero
					
					AND
					UPPER(codeInsee) = @codeInsee
					AND
					UPPER(idHexavia) = @idHexavia
				)
		
	)
	SELECT
			codeOrigine
		,	codeSysteme
		,	[codeReference]
		,	[spId]
		,	CONVERT(varchar,[dateDepart],103) as [dateDepart]
		,	[cptId]
		,	[siteId]
		,	[adresseSite1]
		,	[adresseSite2]
		,	[adresseSite3]
		,	[cpSite]
		,	[villeSite]
		,	CONVERT(varchar(5),LEFT([codeInsee],5)) as codeInsee
		,	[codeBanco]
		--,	[nbSite]
		,	[idSite]
		,	[idHexavia]
		,	[adresseDesserte1]
		,	[adresseDesserte2]
		,	[adresseDesserte3]
		,	[cpDesserte]
		,	[villeDesserte]
		,	[codeEquipement]
		,	[numeroBadgeCompteur]
		,	[matricule]
		,	[indiceTeleRel]
		,	[cptGeneral]
		,	SUM(nombreCompteur) OVER (PARTITION BY [codeReference]) as nombreCompteur
		,	SUM(nombreCompteurTr) OVER (PARTITION BY [codeReference]) as nombreCompteurTr
		,	SUM(nombreCompteurRr) OVER (PARTITION BY [codeReference]) as nombreCompteurRr
		,	SUM(nombreCompteurSe) OVER (PARTITION BY [codeReference]) as nombreCompteurSe
		,	SUM(nombreCompteurGen) OVER (PARTITION BY [codeReference]) as nombreCompteurGen
		,   nbSite.cnt as nbSite -- Correction nb site faux

		FROM CTE
		OUTER APPLY (SELECT COUNT (DISTINCT [idSite]) AS cnt FROM CTE) AS nbSite -- Correction nb site faux
END

END
GO
/****** Object:  StoredProcedure [dbo].[spMirrorClearContrat]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spMirrorClearContrat]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	TRUNCATE TABLE dbo.Contrat 
	DROP INDEX IF EXISTS [IDX_Contrat_Libelle] ON [dbo].[CONTRAT]
END
GO
/****** Object:  StoredProcedure [dbo].[spMirrorClearPrioriteContrat]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spMirrorClearPrioriteContrat]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	TRUNCATE TABLE dbo.PrioriteContrat 
END
GO
/****** Object:  StoredProcedure [dbo].[spMirrorClearRapContrat]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMirrorClearRapContrat]
AS
BEGIN
	SET NOCOUNT ON;

	TRUNCATE TABLE rap.CONTRAT 

	DROP INDEX IF EXISTS [IDX_contrat-par-compteur_IdPds] ON [rap].[CONTRAT]
	DROP INDEX IF EXISTS [IDX_contrat-par-compteur_IdCompte] ON [rap].[CONTRAT]
	DROP INDEX IF EXISTS [IDX_contrat-par-compteur_IdSite] ON [rap].[CONTRAT]
END
GO
/****** Object:  StoredProcedure [dbo].[spMirrorClearRapInclusion]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMirrorClearRapInclusion]
AS
BEGIN 
	TRUNCATE TABLE [rap].[Inclusion]
	DROP INDEX  IF EXISTS  [IDX_RAP_INCLUSION] ON [rap].[Inclusion] WITH ( ONLINE = OFF )
END
GO
/****** Object:  StoredProcedure [dbo].[spMirrorClearRapTerPor]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMirrorClearRapTerPor]
AS
BEGIN
	SET NOCOUNT ON;

	TRUNCATE TABLE RAP.[RAP_TER_POR] 

	DROP INDEX IF EXISTS [IDX_CONTRATPARADRESSE] ON [rap].[RAP_TER_POR]
	DROP INDEX IF EXISTS [IDX_CONTRATPARADRESSE_CodeInseeCodeVoie] ON [rap].[RAP_TER_POR]

END
GO
/****** Object:  StoredProcedure [dbo].[spMirrorClearRapTerRef]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMirrorClearRapTerRef]
AS
BEGIN
	SET NOCOUNT ON;
	TRUNCATE TABLE rap.[RAP_TER_ref] 
END
GO
/****** Object:  StoredProcedure [dbo].[spMirrorRebuildContrat]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[spMirrorRebuildContrat]
AS
BEGIN

		CREATE NONCLUSTERED INDEX [IDX_Contrat_Libelle] ON [dbo].[CONTRAT]
(
	[Libelle_DomaineContrat] ASC
)
INCLUDE([IdBanco_ContratInitial]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FRONT_DATA]
END
GO
/****** Object:  StoredProcedure [dbo].[spMirrorRebuildPrioriteContrat]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMirrorRebuildPrioriteContrat]
AS BEGIN 
SELECT  0
END
GO
/****** Object:  StoredProcedure [dbo].[spMirrorRebuildRapContrat]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMirrorRebuildRapContrat]
AS
BEGIN

		CREATE NONCLUSTERED INDEX [IDX_contrat-par-compteur_IdCompte] ON [rap].[Contrat]
		(
			[IdCompte] ASC,
			[Flag_EnregistrementActif] ASC,
			[Domaine] ASC,
			[DateFin] ASC,
			[EdcEnCours] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FRONT_DATA]

		CREATE NONCLUSTERED INDEX [IDX_contrat-par-compteur_IdPds] ON [rap].[Contrat]
		(
			[IdPds] ASC,
			[Flag_EnregistrementActif] ASC,
			[Domaine] ASC,
			[DateFin] ASC,
			[EdcEnCours] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FRONT_DATA]

		CREATE NONCLUSTERED INDEX [IDX_contrat-par-compteur_IdSite] ON [rap].[Contrat]
		(
			[IdSite] ASC,
			[Flag_EnregistrementActif] ASC,
			[Domaine] ASC,
			[DateFin] ASC,
			[EdcEnCours] ASC
		)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FRONT_DATA]
END
GO
/****** Object:  StoredProcedure [dbo].[spMirrorRebuildRapInclusion]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMirrorRebuildRapInclusion]
AS BEGIN 
CREATE CLUSTERED INDEX [IDX_RAP_INCLUSION] ON [rap].[Inclusion]
(
	[ID_TER] ASC,
	[CD_INSEE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [FRONT_DATA]
END
GO
/****** Object:  StoredProcedure [dbo].[spMirrorRebuildRapTerPor]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMirrorRebuildRapTerPor]
AS BEGIN 
CREATE NONCLUSTERED INDEX [IDX_CONTRATPARADRESSE_CodeInseeCodeVoie] ON [rap].[RAP_TER_POR]
(
	[CD_VOIE] ASC,
	[CD_INSEE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]



CREATE NONCLUSTERED INDEX [IDX_CONTRATPARADRESSE] ON [rap].[RAP_TER_POR]
(
	[ID_TER] ASC,
	[CD_RELATION] ASC,
	[CD_INSEE] ASC
)
INCLUDE([LB_VOIE]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

END
GO
/****** Object:  StoredProcedure [dbo].[spMirrorRebuildRapTerRef]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMirrorRebuildRapTerRef]
AS BEGIN 
SELECT 0
END








GO
/****** Object:  StoredProcedure [dbo].[zzGetCompteursPro]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[zzGetCompteursPro]
	@CodeRef nvarchar(20)
AS
BEGIN

	DECLARE @CodeRefInterne varchar(10);
	SET @CodeRefInterne = @CodeRef;
	
	SELECT
		Cpt.ID
	,	Cpt.CompteurId
	,	Cpt.CodeEquipement
	,	Cpt.AdresseId
	,	Cpt.AdresseDesserte1
	,	Cpt.AdresseDesserte2
	,	Cpt.AdresseDesserte3
	,	Cpt.CpDesserte
	,	Cpt.Ville
	,	REPLACE(RTRIM(LTRIM(Cpt.[AdresseDesserte1])) + ' ' + RTRIM(LTRIM(Cpt.[AdresseDesserte2])) + ' ' + RTRIM(LTRIM(Cpt.[AdresseDesserte3])) + ' ' + RTRIM(LTRIM(Cpt.CpDesserte)) + ' ' + Cpt.Ville, '  ', ' ') AS 'AdresseDesservie'
	,	Cpt.NumeroBranchement
	,	Cpt.Rang
	,	Cpt.Matricule
	,	Cpt.PeriodeReleve
	,	Cpt.DiametreFacturation as 'Calibre'
	,	C.CodeSysteme
	,	C.CodeRef
	,	C.CodeOrigine
	,	Cpt.CodeModif

	FROM Client C
	LEFT OUTER JOIN Compteur Cpt ON Cpt.CodeRef = C.CodeRef
	WHERE C.CodeRef = @CodeRefInterne

END
GO
/****** Object:  StoredProcedure [RAP].[GetContratParAdresse]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [RAP].[GetContratParAdresse] 
 @CodeInsee VARCHAR(20) = NULL
 ,@CodeHexaviaAdresse VARCHAR(50) = NULL 
 ,@NumeroRue VARCHAR(50) = NULL 
 ,@CodeDomaine VARCHAR(50) = NULL 
 ,@Domaine VARCHAR(50) = NULL
 ,@CodeTypeContrat VARCHAR(10) = NULL
 ,@Prioritaire INT = NULL 
AS 
BEGIN 

	DECLARE @CodeDomaineTable PARAMLISTTABLE , @CodeTypeContratTable PARAMLISTTABLE , @DomaineTable PARAMLISTTABLE 

	IF ISNULL (@CodeDomaine ,'') != ''   INSERT INTO @CodeDomaineTable (data) SELECT splitdata FROM dbo.Fnsplitstring(@CodeDomaine, ','); 
	IF ISNULL (@CodeTypeContrat ,'') != '' INSERT INTO @CodeTypeContratTable (data) SELECT splitdata FROM dbo.Fnsplitstring(@CodeTypeContrat	, ','); 
	IF ISNULL (@Domaine ,'') != '' INSERT INTO @DomaineTable (data) SELECT splitdata FROM dbo.Fnsplitstring(@Domaine, ','); 

	DECLARE @SQL NVARCHAR(MAX)

	SET @SQL = 'SELECT * FROM '
	SET @SQL += '( ' -- Contrats
	SET @SQL += '	SELECT * '
	SET @SQL += '	,RANK() OVER (PARTITION BY Domaine ORDER BY RangGeneral ASC) AS RangParDomaine '
	SET @SQL += '	FROM ' 
	SET @SQL += '	( ' -- TriParDomaine
	SET @SQL += '		SELECT * FROM '
	SET @SQL += '		( ' -- ContratEnCoursEtEchu
				-- UNION
	SET @SQL += '			SELECT * '
	SET @SQL += '			FROM '
	SET @SQL += '			( ' -- ContratEnCoursParPriorite
	SET @SQL += '				SELECT	* '
	SET @SQL += '				,RANK() OVER (PARTITION BY ContratEnCours.Domaine ORDER BY ContratEnCours.Priorite DESC, ContratEnCours.NbClients DESC, ContratEnCours.DateFin DESC, CAST(ContratEnCours.Idbanco AS INT) DESC, ContratEnCours.NumeroBanco DESC) AS RangStatutDomaine '
	SET @SQL += '				,ROW_NUMBER() OVER (ORDER BY ContratEnCours.Priorite DESC, ContratEnCours.NbClients DESC, ContratEnCours.DateFin DESC, CAST(ContratEnCours.IdBanco AS INT) DESC) AS RangGeneral '
	SET @SQL += '				FROM '
	SET @SQL += '				( ' -- ContratEnCours
	SET @SQL += '					SELECT DISTINCT '
	SET @SQL += '					C.IdBanco '
	SET @SQL += '					,C.CodeInsee '
	SET @SQL += '					,C.NumeroBanco '
	SET @SQL += '					,C.Domaine '
	SET @SQL += '					,C.CodeTypeBanco '
	SET @SQL += '					,C.TypeBanco '
	SET @SQL += '					,C.Priorite '
	SET @SQL += '					,C.NbClients '
	SET @SQL += '					,C.CodeDomaine '
	SET @SQL += '					,C.DateDebut '
	SET @SQL += '					,C.DateFin '
	SET @SQL += '					FROM RAP.CONTRAT C '
	SET @SQL += '					INNER JOIN [RAP].[INCLUSION] I ON C.CodeInsee = I.CD_INSEE AND C.IdBanco = I.ID_TER '
	SET @SQL += '					WHERE 1 = 1 '
	SET @SQL += '					AND C.Flag_EnregistrementActif = 1 '
	IF (ISNULL(@CodeInsee,'') != '')
	SET @SQL += '					AND	(C.CodeInsee = @CodeInsee) '
	IF (ISNULL(@CodeHexaviaAdresse,'') != '')
	SET @SQL += '					AND (RIGHT(''000000000'' + c.CodeHexaviaAdresse,8)	 = @CodeHexaviaAdresse) '
	IF (ISNULL(@NumeroRue,'') != '')
	SET @SQL += '					AND (C.NumeroRue = @NumeroRue) '
	IF (ISNULL(@CodeDomaine,'') != '')
	SET @SQL += '					AND (C.CodeDomaine IN (SELECT DATA from @CodeDomaineTable)) '
	IF (ISNULL(@Domaine,'') != '')
	SET @SQL += '					AND (C.Domaine IN (SELECT DATA from @DomaineTable)) '
	IF (ISNULL(@CodeTypeContrat,'') != '')
	SET @SQL += '					AND (C.CodeTypeBanco IN (SELECT DATA from @CodeTypeContratTable)) '
	SET @SQL += '					AND DateFin > = GETDATE() '
	SET @SQL += '				) ' 
	SET @SQL += '				AS ContratEnCours  '
	SET @SQL += '			) ' 
	SET @SQL += '			AS ContratEnCoursParPriorite '
	SET @SQL += '			WHERE 1 = 1 '
	IF (ISNULL(@Prioritaire, 0) != 0)
	SET @SQL += '			AND ContratEnCoursParPriorite.RangStatutDomaine = 1 '-- Seulement le contrat prioritaire ? 

	SET @SQL += '			UNION '

	SET @SQL += '			SELECT * '
	SET @SQL += '			FROM '
	SET @SQL += '			( ' -- ContratEchuParPriorite
	SET @SQL += '				SELECT	* '
	SET @SQL += '				,RANK() OVER (PARTITION BY ContratEchu.Domaine ORDER BY ContratEchu.Priorite DESC, ContratEchu.NbCLients DESC, CAST(ContratEchu.IdBanco AS INT) DESC, ContratEchu.NumeroBanco DESC) AS RangStatutDomaine '
	SET @SQL += '				,1000 + ROW_NUMBER() OVER (ORDER BY DateFin DESC, priorite DESC, NbClients DESC, CAST(IdBanco AS INT) DESC) AS RangGeneral '
	SET @SQL += '				FROM '
	SET @SQL += '				( ' -- ContratEchu
	SET @SQL += '					SELECT DISTINCT '
	SET @SQL += '					C.IdBanco ,C.CodeInsee '
	SET @SQL += '					,C.NumeroBanco '
	SET @SQL += '					,C.Domaine '
	SET @SQL += '					,C.CodeTypeBanco '
	SET @SQL += '					,C.TypeBanco '
	SET @SQL += '					,C.Priorite '
	SET @SQL += '					,C.NbClients '
	SET @SQL += '					,C.CodeDomaine '
	SET @SQL += '					,C.[DateDebut] '
	SET @SQL += '					,C.[DateFin] '
	SET @SQL += '					FROM RAP.CONTRAT C '
	SET @SQL += '					INNER JOIN [RAP].[INCLUSION] I ON C.CodeInsee = I.CD_INSEE AND C.IdBanco = I.ID_TER '
	SET @SQL += '					WHERE 1 = 1 AND Flag_EnregistrementActif = 1 '
	--SET @SQL += '				AND (ISNULL(@CodeInsee,'') = '' OR C.codeInsee = @CodeInsee)
	--SET @SQL += '				AND (ISNULL(@CodeHexaviaAdresse,'') = '' OR RIGHT('000000000' + C.CodeHexaviaAdresse,8)	 = @CodeHexaviaAdresse)
	--SET @SQL += '				AND (ISNULL(@NumeroRue,'') = '' OR c.NumeroRue = @NumeroRue)
	--SET @SQL += '				AND (ISNULL(@CodeDomaine,'') = '' OR c.CodeDomaine IN (Select DATA from @CodeDomaineTable))
	--SET @SQL += '				AND (ISNULL(@Domaine,'') = '' OR c.Domaine IN (Select DATA from @DomaineTable))
	--SET @SQL += '				AND (ISNULL(@CodeTypeContrat,'') = '' OR c.CodeTypeBanco IN (Select DATA from @CodeTypeContratTable))
	--SET @SQL += '				AND DateFin < GETDATE()
	IF (ISNULL(@CodeInsee,'') != '')
	SET @SQL += '					AND	(C.CodeInsee = @CodeInsee) '
	IF (ISNULL(@CodeHexaviaAdresse,'') != '')
	SET @SQL += '					AND (RIGHT(''000000000'' + c.CodeHexaviaAdresse,8)	 = @CodeHexaviaAdresse) '
	IF (ISNULL(@NumeroRue,'') != '')
	SET @SQL += '					AND (C.NumeroRue = @NumeroRue) '
	IF (ISNULL(@CodeDomaine,'') != '')
	SET @SQL += '					AND (C.CodeDomaine IN (SELECT DATA from @CodeDomaineTable)) '
	IF (ISNULL(@Domaine,'') != '')
	SET @SQL += '					AND (C.Domaine IN (SELECT DATA from @DomaineTable)) '
	IF (ISNULL(@CodeTypeContrat,'') != '')
	SET @SQL += '					AND (C.CodeTypeBanco IN (SELECT DATA from @CodeTypeContratTable)) '
	SET @SQL += '						AND DateFin < GETDATE() '																								-- fni 20200611 CHANGE FROM 	AND DateFin > = GETDATE()  TO AND DateFin < GETDATE() 
	SET @SQL += '				) '
	SET @SQL += '				AS ContratEchu '
	SET @SQL += '			) '
	SET @SQL += '			AS ContratEchuParPriorite '
	SET @SQL += '			WHERE 1 = 1 '
	IF (ISNULL(@Prioritaire, 0) != 0)
	SET @SQL += '			AND ContratEchuParPriorite.RangStatutDomaine = 1 '-- Seulement le contrat prioritaire ? 
	SET @SQL += '		) AS ContratEnCoursEtEchu '
	SET @SQL += '	) AS TriParDomaine	'
	SET @SQL +=') AS Contrats '
	IF (ISNULL(@Prioritaire, 0) != 0)
	SET @SQL +=' WHERE Contrats.RangParDomaine = 1 ' -- Seulement le contrat prioritaire ? 
	SET @SQL +=' ORDER BY Contrats.RangGeneral ASC '

	DECLARE @Parameters NVARCHAR(500)

    SET @Parameters =  '@CodeInsee varchar(max),
						@CodeHexaviaAdresse varchar(max),
						@NumeroRue varchar(max),
						@CodeDomaineTable ParamListTable READONLY,
						@DomaineTable ParamListTable READONLY,
						@CodeTypeContratTable ParamListTable READONLY';

	PRINT(@SQL);

	EXECUTE sp_Executesql   @SQL,
							@Parameters,
							@CodeInsee,
							@CodeHexaviaAdresse,
							@NumeroRue,
							@CodeDomaineTable,
							@DomaineTable,
							@CodeTypeContratTable	

	--EX : ----RAP.[GetContratParAdresse] 78672
	--	RAP.[GetContratParAdresse] 78672,1524777 ,'253',1001
	----GO
	----RAP.[GetContratParAdresse] 78672,1524777 
	----GO 
	-- RAP.[GetContratParAdresse] 78672,1524777 ,'253',1001
	-- [RAP].[GetContratParAdresse] @CodeInsee			 = '91573'
	--	,@CodeHexaviaAdresse = NULL 
	-- ,@NumeroRue			 = NULL 
	-- ,@CodeDomaine		 = NULL 
	-- ,@Domaine			 = 'Eau,Assainissement'
	-- ,@CodeTypeContrat	 = 'DSP,PPP,CP,MT'
	-- ,@Prioritaire		 = 1 

END 
GO
/****** Object:  StoredProcedure [RAP].[GetContratParAdresse_Rap]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      PROCEDURE [RAP].[GetContratParAdresse_Rap]  
  @CodeInsee			VARCHAR(20) = NULL
 ,@CodeHexaviaAdresse	VARCHAR(50) = NULL 
 ,@NumeroRue			VARCHAR(50) = NULL 
 ,@CodeDomaine			VARCHAR(255) = NULL 
 ,@Domaine				VARCHAR(255) = NULL
 ,@CodeTypeContrat		VARCHAR(255) = NULL
-- ,@TypeTerritoire VARCHAR(255) = NULL
 ,@Prioritaire			INT = NULL

 AS BEGIN 
    DECLARE @SQL NVARCHAR(MAX);
	DECLARE @CodeDomaineTable PARAMLISTTABLE , @CodeTypeContratTable PARAMLISTTABLE , @DomaineTable PARAMLISTTABLE




	IF ISNULL (@CodeDomaine ,'') != ''		INSERT INTO @CodeDomaineTable		(data) SELECT splitdata FROM dbo.Fnsplitstring(@CodeDomaine, ','); 
	IF ISNULL (@CodeTypeContrat ,'') != ''	INSERT INTO @CodeTypeContratTable	(data) SELECT splitdata FROM dbo.Fnsplitstring(@CodeTypeContrat	, ','); 
	IF ISNULL (@Domaine ,'') != ''			INSERT INTO @DomaineTable			(data) SELECT splitdata FROM dbo.Fnsplitstring(@Domaine, ','); 
	--SEUL LE CODEINSEE EST RENSEIGNE 
	IF @CodeHexaviaAdresse = 0   set @CodeHexaviaAdresse = null
	--IF (ISNULL(@Prioritaire, 0) != 0)
	--	SET @SQL = 'SELECT TOP 2  IdBanco,NumeroBanco,CodeInsee,CodeDomaine,Domaine,LibelleCourt_TypeContrat AS  CodeTypeBanco,TypeBanco,Priorite,DateDebut,DateFin,MAX(QualitePrioEauAvantMAX) OVER (PARTITION BY (SELECT null)  ) QualitePrioEau ,MAX(QualitePrioASsainissementAvantMAX) OVER (PARTITION BY (SELECT null) ) QualitePrioASsainissement ,nbClients,RangStatutDomaine,RangGeneral'
 --   ELSE 

	SET @SQL = ' WITH RequeteFinale AS  ('
	SET @SQL += '			SELECT * FROM ('
	SET @SQL += '							SELECT IdBanco,NumeroBanco,CodeInsee, CodeDomaine,Domaine,LibelleCourt_TypeContrat AS  CodeTypeBanco,TypeBanco,Priorite,DateDebut,DateFin,MAX(QualitePrioEauAvantMAX) OVER (PARTITION BY (SELECT null)  ) QualitePrioEau ,MAX(QualitePrioASsainissementAvantMAX) OVER (PARTITION BY (SELECT null) ) QualitePrioASsainissement ,nbClients ,RangStatutDomaine,RangGeneral '
	SET @SQL +='							FROM '
	SET @SQL +='								('
	SET @SQL +='								SELECT *  , CASE WHEN Domaine = ''EAU'' THEN QualitePrio END AS QualitePrioEauAvantMAX , CASE WHEN domaine = ''ASSAINISSEMENT''  THEN QualitePrio END AS QualitePrioASsainissementAvantMAX'
	SET @SQL +='								FROM '
	SET @SQL +='									( '--Priorite Eau ASsainissement
	SET @SQL +='										SELECT   *,COUNT(*) OVER (PARTITION BY Domaine,Priorite) AS QualitePrio FROM '
	           --Contrats
	SET @SQL +='										('
	SET @SQL +='											SELECT  *  ,RANK() OVER (PARTITION BY Domaine ORDER BY RangGeneral ASC) AS RangParDomaine '
	SET @SQL +='											FROM  '
	SET @SQL +='											(           '               -- Tri Par Domaine
	SET @SQL +='												SELECT  * FROM  '
	SET @SQL +='															(					'									--CONTRAT EN COURS PAR PRIORITE  
	SET @SQL +='															SELECT *'
	SET @SQL +='																,RANK() OVER (PARTITION BY ContratEnCours.Domaine ORDER BY ContratEnCours.Priorite DESC,  ContratEnCours.DateFin DESC, CAST(ContratEnCours.Idbanco AS INT) DESC, ContratEnCours.NumeroBanco DESC) AS RangStatutDomaine '
	SET @SQL +='																,ROW_NUMBER() OVER (ORDER BY ContratEnCours.Priorite DESC, ContratEnCours.DateFin DESC, CAST(ContratEnCours.IdBanco AS INT) DESC) AS RangGeneral '
	SET @SQL +='															FROM'
	SET @SQL +='																(SELECT DISTINCT TC.IdBanco, '   --CONTRAT EN COURS 
	SET @SQL +='																	   TC.CodeInsee ,'
	SET @SQL +='																	   C.IdBanco_Contrat NumeroBanco,'
	SET @SQL +='														               C.Libelle_DomaineContrat Domaine,'
	SET @SQL +='																	   C.LibelleCourt_TypeContrat,'
	SET @SQL +='																	   C.Libelle_TypeContrat TypeBanco,'
	SET @SQL +='											                           PC.Priorite,'
	SET @SQL +='											                           C.Code_DomaineContrat AS CodeDomaine,'
	SET @SQL +='											                           C.DateDebut,'
	SET @SQL +='											                           C.DateEcheance AS DateFin,'
	SET @SQL +='										                               NULL AS NbClients'
	SET @SQL +='																 FROM [dbo].[fn_TerritoireSansCodeHexavia]	(@CodeInsee,@CodeHexaviaAdresse,@NumeroRue) TC'
	SET @SQL +='																	INNER JOIN dbo.PrioriteContrat PC ON TC.IdBanco = PC.CodeBanco'
	SET @SQL +='																	LEFT OUTER JOIN (SELECT *, ROW_NUMBER() OVER(PARTITION BY IdBanco_Contratinitial ORDER BY NumeroAvenant DESC) AS RowNum FROM dbo.Contrat) C ON RowNum = 1 AND CAST (TC.IdBanco AS VARCHAR (10)) = C.IdBanco_Contratinitial'
	SET @SQL +='																 WHERE 1=1  AND C.dateEcheance > = GETDATE() '
	SET @SQL +='																   AND CodeInsee = @codeInsee '
	IF (ISNULL(@CodeDomaine,'') != '')
	SET @SQL += '							                                       AND (C.Code_DomaineContrat IN (SELECT DATA FROM @CodeDomaineTable)) '
	IF (ISNULL(@Domaine,'') != '')
	SET @SQL += '																   AND (C.Libelle_DomaineContrat IN (SELECT DATA FROM @DomaineTable)) '
	IF (ISNULL(@CodeTypeContrat,'') != '')
	SET @SQL += '																   AND (C.LibelleCourt_TypeContrat IN (SELECT DATA FROM @CodeTypeContratTable)) '
	SET @SQL +='																) AS ContratEnCours       '  --CONTRAT EN COURS 
	SET @SQL +='						                                  ) AS ContratEnCoursParPriorite		'					--CONTRAT EN COURS PAR PRIORITE  
	SET @SQL += '												WHERE 1 = 1 '
	IF (ISNULL(@Prioritaire, 0) != 0)
	SET @SQL += '													AND ContratEnCoursParPriorite.RangStatutDomaine = 1 '-- Seulement le contrat prioritaire ? 
	SET @SQL +='												UNION  '
	SET @SQL +='												SELECT  * FROM '
	SET @SQL +='															(							'						--CONTRAT ECHU PAR PRIORITE  
	SET @SQL +='															SELECT *'
	SET @SQL +='																,RANK() OVER (PARTITION BY ContratEchu.Domaine ORDER BY ContratEchu.Priorite DESC,  ContratEchu.DateFin DESC, CAST(ContratEchu.Idbanco AS INT) DESC, ContratEchu.NumeroBanco DESC) AS RangStatutDomaine '
	SET @SQL +='																,1000 + ROW_NUMBER() OVER (ORDER BY DateFin DESC, priorite DESC, CAST(IdBanco AS INT) DESC) AS RangGeneral'
	SET @SQL +='															FROM'
	SET @SQL +='																(SELECT DISTINCT TC.IdBanco,  '  --CONTRAT ECHU
	SET @SQL +='																	TC.CodeInsee ,'
	SET @SQL +='																	C.IdBanco_Contrat NumeroBanco,'
	SET @SQL +='																	C.Libelle_DomaineContrat Domaine,'
	SET @SQL +='																	C.LibelleCourt_TypeContrat,'
	SET @SQL +='																	C.Libelle_TypeContrat TypeBanco,'
	SET @SQL +='																	PC.Priorite,'
	SET @SQL +='																	C.Code_DomaineContrat AS CodeDomaine,'
	SET @SQL +='																	C.dateDebut,'
	SET @SQL +='																	C.dateEcheance AS DateFin'
	SET @SQL +='																	,NULL AS NbClients'
	SET @SQL +='																FROM [dbo].[fn_TerritoireSansCodeHexavia]	(@CodeInsee,@CodeHexaviaAdresse,@NumeroRue) TC'
	SET @SQL +='																	INNER JOIN dbo.PrioriteContrat PC ON TC.IdBanco = PC.CodeBanco'
	SET @SQL +='																	INNER JOIN (SELECT *, ROW_NUMBER() OVER(PARTITION BY IdBanco_Contratinitial ORDER BY NumeroAvenant DESC) AS RowNum FROM dbo.Contrat) C ON RowNum = 1 AND CAST (TC.IdBanco AS VARCHAR (10)) = C.IdBanco_Contratinitial'
	SET @SQL +='																WHERE 1=1  AND C.dateEcheance < GETDATE() '
	SET @SQL +='																	AND CodeInsee = @codeInsee '
	IF (ISNULL(@CodeDomaine,'') != '')
	SET @SQL += '																	AND (C.Code_DomaineContrat IN (SELECT DATA FROM @CodeDomaineTable)) '
	IF (ISNULL(@Domaine,'') != '')
	SET @SQL += '																	AND (C.Libelle_DomaineContrat IN (SELECT DATA FROM @DomaineTable)) '
	IF (ISNULL(@CodeTypeContrat,'') != '')
	SET @SQL += '																	AND (C.LibelleCourt_TypeContrat IN (SELECT DATA FROM @CodeTypeContratTable)) '
	SET @SQL +='															) AS ContratEchu          '   --CONTRAT ECHU 
	SET @SQL +='														) AS ContratEchuParPriorite	'					--CONTRAT ECHU  PAR PRIORITE 
	SET @SQL += '												WHERE 1 = 1 '
	IF (ISNULL(@Prioritaire, 0) != 0)
	SET @SQL += '													AND ContratEchuParPriorite.RangStatutDomaine = 1 '-- Seulement le contrat prioritaire ? 

	SET @SQL += '											UNION 	'
	SET @SQL +='											SELECT  * FROM '
	SET @SQL +='														(	'
	SET @SQL  += '														SELECT * '
	SET @SQL  +='															,RANK() OVER (PARTITION BY ContratHorsOdyssee.Domaine ORDER BY  ContratHorsOdyssee.DateFin DESC, CAST(ContratHorsOdyssee.Idbanco AS INT) DESC, ContratHorsOdyssee.NumeroBanco DESC) AS RangStatutDomaine '
	SET @SQL  +='															,10000 + ROW_NUMBER() OVER (ORDER BY ContratHorsOdyssee.Priorite DESC, ContratHorsOdyssee.DateFin DESC, CAST(ContratHorsOdyssee.IdBanco AS INT) DESC) AS RangGeneral '
	SET @SQL  +='														FROM('
	SET @SQL  +='															SELECT DISTINCT TC.idBanco,'
	SET @SQL  +='																TC.CodeInsee,'
	SET @SQL  +='																C.IdBanco_Contrat AS NumeroBanco, '
	SET @SQL  +='																C.Libelle_DomaineContrat AS Domaine,'
	SET @SQL  +='																C.libelleCourt_TypeContrat ,'
	SET @SQL  +='																C.libelle_TypeContrat AS TypeBanco, '
	SET @SQL  +='																NULL AS Priorite , '
	SET @SQL  +='																C.Code_DomaineContrat AS CodeDomaine,'
	SET @SQL  +='																C.DateDebut ,'
	SET @SQL  +='																C.DateEcheance AS DateFin, ' 
	SET @SQL  +='																NULL AS NbClients '
	SET @SQL  +='															FROM [dbo].[fn_TerritoireSansCodeHexavia](@CodeInsee,@CodeHexaviaAdresse,@NumeroRue) TC 	'
	SET @SQL +='																	LEFT OUTER JOIN dbo.PrioriteContrat PC ON TC.IdBanco = PC.CodeBanco '
	SET @SQL  +='																INNER JOIN (SELECT *, ROW_NUMBER() OVER(PARTITION BY IdBanco_Contratinitial ORDER BY NumeroAvenant DESC) AS RowNum FROM dbo.Contrat) C ON RowNum = 1 AND CAST (TC.IdBanco AS VARCHAR (10)) = C.IdBanco_Contratinitial '

	SET @SQL +='														WHERE 1=1  '
	SET @SQL +='															AND PC.CodeBanco IS NULL ' -- Contrat Hors Odyssee
	SET @SQL +='															AND CodeInsee = @codeInsee '
	IF (ISNULL(@CodeDomaine,'') != '')
	SET @SQL += '															AND (C.Code_DomaineContrat IN (SELECT DATA FROM @CodeDomaineTable)) '
	IF (ISNULL(@Domaine,'') != '')
	SET @SQL += '															AND (C.Libelle_DomaineContrat IN (SELECT DATA FROM @DomaineTable)) '
	IF (ISNULL(@CodeTypeContrat,'') != '')
	SET @SQL += '															AND (C.LibelleCourt_TypeContrat IN (SELECT DATA FROM @CodeTypeContratTable)) '
	SET @SQL += '														) ContratHorsOdyssee '
	SET @SQL +='													) AS ContratHorsOdysseeParPriorite	'					--Contrat HorsOdyssee  PAR PRIORITE 
	SET @SQL += '										WHERE 1 = 1 '
	IF (ISNULL(@Prioritaire, 0) != 0)
	SET @SQL += '											AND ContratHorsOdysseeParPriorite.RangStatutDomaine = 1 '-- Seulement le contrat prioritaire ? 
	
	SET @SQL +='								) TriParDomaine    '   -- Tri Par Domaine 
	SET @SQL +='						) AS  Contrats' -- Contrats
	SET @SQL +='				)   AS PrioriteEauAssainissement'  --Priorite Eau ASsainissement 
    SET @SQL +='		) AS Priorite '
	SET @SQL +='	) QualitePriorite '
	SET @SQL +=')  ' --RequeteFinale
	IF (ISNULL(@Prioritaire, 0) != 0)
	SET @SQL += '	SELECT * FROM (SELECT * ,RANK() OVER (PARTITION BY domaine ORDER BY RangGeneral)RangFinal FROM RequeteFinale    ) AS RequeteFinalePrioritaire   WHERE RangFinal = 1 ORDER BY Domaine DESC'-- Seulement le contrat prioritaire ? 
	else 
	SET @SQL += '	SELECT * FROM RequeteFinale  ORDER BY rangGeneral '
	


	DECLARE @Parameters NVARCHAR(500)
    SET @Parameters =  '@CodeInsee VARCHAR(max),
						@CodeHexaviaAdresse VARCHAR(max),
						@NumeroRue VARCHAR(max),
						@CodeDomaineTable ParamListTable READONLY,
						@DomaineTable ParamListTable READONLY,
						@CodeTypeContratTable ParamListTable READONLY ' ;


	PRINT(@SQL);
 PRINT(len(@SQL));
	EXECUTE sp_Executesql   @SQL,
							@Parameters,
							@CodeInsee,
							@CodeHexaviaAdresse,
							@NumeroRue,
							@CodeDomaineTable,
							@DomaineTable,
							@CodeTypeContratTable  
END

GO
/****** Object:  StoredProcedure [RAP].[GetContratParAdresse_Rap_V2]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE    PROCEDURE [RAP].[GetContratParAdresse_Rap_V2]  
  @CodeInsee			VARCHAR(20) = NULL
 ,@CodeHexaviaAdresse	VARCHAR(50) = NULL 
 ,@NumeroRue			VARCHAR(50) = NULL 
 ,@CodeDomaine			VARCHAR(255) = NULL 
 ,@Domaine				VARCHAR(255) = NULL
 ,@CodeTypeContrat		VARCHAR(255) = NULL
 ,@TypeTerritoire VARCHAR(255) = NULL
 ,@Prioritaire			INT = NULL

 AS BEGIN 
    DECLARE @SQL NVARCHAR(MAX);
	DECLARE @CodeDomaineTable PARAMLISTTABLE , @CodeTypeContratTable PARAMLISTTABLE , @DomaineTable PARAMLISTTABLE , @ListeTypeTerritoire PARAMLISTTABLE 
	DECLARE  @TypeTerritoire2 VARCHAR(100)='10'
	DECLARE  @ListeTypeTerritoireAutre VARCHAR(100)='10'

IF @TypeTerritoire IS NOT NULL INSERT INTO @ListeTypeTerritoire(data)SELECT splitdata FROM dbo.Fnsplitstring(@TypeTerritoire, ','); 
	
IF EXISTS(SELECT * FROM @ListeTypeTerritoire WHERE data=2)set @TypeTerritoire2='2'
IF exists(SELECT * FROM @ListeTypeTerritoire WHERE data=1)set @ListeTypeTerritoireAutre+=',1'
IF exists(SELECT * FROM @ListeTypeTerritoire WHERE data=3)set @ListeTypeTerritoireAutre+=',3'
IF exists(SELECT * FROM @ListeTypeTerritoire WHERE data=4)set @ListeTypeTerritoireAutre+=',4'
IF exists(SELECT * FROM @ListeTypeTerritoire WHERE data=5)set @ListeTypeTerritoireAutre+=',5'
IF exists(SELECT * FROM @ListeTypeTerritoire WHERE data=6)set @ListeTypeTerritoireAutre+=',6'
IF exists(SELECT * FROM @ListeTypeTerritoire WHERE data=7)set @ListeTypeTerritoireAutre+=',7'



	IF ISNULL (@CodeDomaine ,'') != ''		INSERT INTO @CodeDomaineTable		(data) SELECT splitdata FROM dbo.Fnsplitstring(@CodeDomaine, ','); 
	IF ISNULL (@CodeTypeContrat ,'') != ''	INSERT INTO @CodeTypeContratTable	(data) SELECT splitdata FROM dbo.Fnsplitstring(@CodeTypeContrat	, ','); 
	IF ISNULL (@Domaine ,'') != ''			INSERT INTO @DomaineTable			(data) SELECT splitdata FROM dbo.Fnsplitstring(@Domaine, ','); 
	--SEUL LE CODEINSEE EST RENSEIGNE 
	IF @CodeHexaviaAdresse = 0   set @CodeHexaviaAdresse = null
	--IF (ISNULL(@Prioritaire, 0) != 0)
	--	SET @SQL = 'SELECT TOP 2  IdBanco,NumeroBanco,CodeInsee,CodeDomaine,Domaine,LibelleCourt_TypeContrat AS  CodeTypeBanco,TypeBanco,Priorite,DateDebut,DateFin,MAX(QualitePrioEauAvantMAX) OVER (PARTITION BY (SELECT null)  ) QualitePrioEau ,MAX(QualitePrioASsainissementAvantMAX) OVER (PARTITION BY (SELECT null) ) QualitePrioASsainissement ,nbClients,RangStatutDomaine,RangGeneral'
 --   ELSE 

	SET @SQL = ' WITH RequeteFinale AS  ('
	SET @SQL += '			SELECT * FROM ('
	SET @SQL += '							SELECT IdBanco,NumeroBanco,CodeInsee,id_type_ter As TypeTerritoire, CodeDomaine,Domaine,LibelleCourt_TypeContrat AS  CodeTypeBanco,TypeBanco,Priorite,DateDebut,DateFin,MAX(QualitePrioEauAvantMAX) OVER (PARTITION BY (SELECT null)  ) QualitePrioEau ,MAX(QualitePrioASsainissementAvantMAX) OVER (PARTITION BY (SELECT null) ) QualitePrioASsainissement ,nbClients ,RangStatutDomaine,RangGeneral '
	SET @SQL +='							FROM '
	SET @SQL +='								('
	SET @SQL +='								SELECT *  , CASE WHEN Domaine = ''EAU'' THEN QualitePrio END AS QualitePrioEauAvantMAX , CASE WHEN domaine = ''ASSAINISSEMENT''  THEN QualitePrio END AS QualitePrioASsainissementAvantMAX'
	SET @SQL +='								FROM '
	SET @SQL +='									( '--Priorite Eau ASsainissement
	SET @SQL +='										SELECT   *,COUNT(*) OVER (PARTITION BY Domaine,Priorite) AS QualitePrio FROM '
	           --Contrats
	SET @SQL +='										('
	SET @SQL +='											SELECT  *  ,RANK() OVER (PARTITION BY Domaine ORDER BY RangGeneral ASC) AS RangParDomaine '
	SET @SQL +='											FROM  '
	SET @SQL +='											(           '               -- Tri Par Domaine
	SET @SQL +='												SELECT  * FROM  '
	SET @SQL +='															(					'									--CONTRAT EN COURS PAR PRIORITE  
	SET @SQL +='															SELECT *'
	SET @SQL +='																,RANK() OVER (PARTITION BY ContratEnCours.Domaine ORDER BY ContratEnCours.Priorite DESC,  ContratEnCours.DateFin DESC, CAST(ContratEnCours.Idbanco AS INT) DESC, ContratEnCours.NumeroBanco DESC) AS RangStatutDomaine '
	SET @SQL +='																,ROW_NUMBER() OVER (ORDER BY ContratEnCours.Priorite DESC, ContratEnCours.DateFin DESC, CAST(ContratEnCours.IdBanco AS INT) DESC) AS RangGeneral '
	SET @SQL +='															FROM'
	SET @SQL +='																(SELECT DISTINCT TC.IdBanco, '   --CONTRAT EN COURS 
	SET @SQL +='																	   TC.CodeInsee ,'
	SET @SQL +='																	   TC.id_type_ter ,'
	SET @SQL +='																	   C.IdBanco_Contrat NumeroBanco,'
	SET @SQL +='														               C.Libelle_DomaineContrat Domaine,'
	SET @SQL +='																	   C.LibelleCourt_TypeContrat,'
	SET @SQL +='																	   C.Libelle_TypeContrat TypeBanco,'
	SET @SQL +='											                           PC.Priorite,'
	SET @SQL +='											                           C.Code_DomaineContrat AS CodeDomaine,'
	SET @SQL +='											                           C.DateDebut,'
	SET @SQL +='											                           C.DateEcheance AS DateFin,'
	SET @SQL +='										                               NULL AS NbClients'
	SET @SQL +='																 FROM [dbo].[fn_TerritoireSansCodeHexavia_V02]	(@CodeInsee,@CodeHexaviaAdresse,@NumeroRue,@TypeTerritoire2) TC'
	SET @SQL +='																	INNER JOIN dbo.PrioriteContrat PC ON TC.IdBanco = PC.CodeBanco'
	SET @SQL +='																	LEFT OUTER JOIN (SELECT *, ROW_NUMBER() OVER(PARTITION BY IdBanco_Contratinitial ORDER BY NumeroAvenant DESC) AS RowNum FROM dbo.Contrat) C ON RowNum = 1 AND CAST (TC.IdBanco AS VARCHAR (10)) = C.IdBanco_Contratinitial'
	SET @SQL +='																 WHERE 1=1  AND C.dateEcheance > = GETDATE() '
	SET @SQL +='																   AND CodeInsee = @codeInsee '
	IF (ISNULL(@CodeDomaine,'') != '')
	SET @SQL += '							                                       AND (C.Code_DomaineContrat IN (SELECT DATA FROM @CodeDomaineTable)) '
	IF (ISNULL(@Domaine,'') != '')
	SET @SQL += '																   AND (C.Libelle_DomaineContrat IN (SELECT DATA FROM @DomaineTable)) '
	IF (ISNULL(@CodeTypeContrat,'') != '')
	SET @SQL += '																   AND (C.LibelleCourt_TypeContrat IN (SELECT DATA FROM @CodeTypeContratTable)) '
	SET @SQL +='																) AS ContratEnCours       '  --CONTRAT EN COURS 
	SET @SQL +='						                                  ) AS ContratEnCoursParPriorite		'					--CONTRAT EN COURS PAR PRIORITE  
	SET @SQL += '												WHERE 1 = 1 '
	IF (ISNULL(@Prioritaire, 0) != 0)
	SET @SQL += '													AND ContratEnCoursParPriorite.RangStatutDomaine = 1 '-- Seulement le contrat prioritaire ? 
	SET @SQL +='												UNION  '
	SET @SQL +='												SELECT  * FROM '
	SET @SQL +='															(							'						--CONTRAT ECHU PAR PRIORITE  
	SET @SQL +='															SELECT *'
	SET @SQL +='																,RANK() OVER (PARTITION BY ContratEchu.Domaine ORDER BY ContratEchu.Priorite DESC,  ContratEchu.DateFin DESC, CAST(ContratEchu.Idbanco AS INT) DESC, ContratEchu.NumeroBanco DESC) AS RangStatutDomaine '
	SET @SQL +='																,1000 + ROW_NUMBER() OVER (ORDER BY DateFin DESC, priorite DESC, CAST(IdBanco AS INT) DESC) AS RangGeneral'
	SET @SQL +='															FROM'
	SET @SQL +='																(SELECT DISTINCT TC.IdBanco,  '  --CONTRAT ECHU
	SET @SQL +='																	TC.CodeInsee ,'
	SET @SQL +='																	TC.id_type_ter ,'
	SET @SQL +='																	C.IdBanco_Contrat NumeroBanco,'
	SET @SQL +='																	C.Libelle_DomaineContrat Domaine,'
	SET @SQL +='																	C.LibelleCourt_TypeContrat,'
	SET @SQL +='																	C.Libelle_TypeContrat TypeBanco,'
	SET @SQL +='																	PC.Priorite,'
	SET @SQL +='																	C.Code_DomaineContrat AS CodeDomaine,'
	SET @SQL +='																	C.dateDebut,'
	SET @SQL +='																	C.dateEcheance AS DateFin'
	SET @SQL +='																	,NULL AS NbClients'
	SET @SQL +='																FROM [dbo].[fn_TerritoireSansCodeHexavia_V02]	(@CodeInsee,@CodeHexaviaAdresse,@NumeroRue,@TypeTerritoire2) TC'
	SET @SQL +='																	INNER JOIN dbo.PrioriteContrat PC ON TC.IdBanco = PC.CodeBanco'
	SET @SQL +='																	LEFT OUTER JOIN (SELECT *, ROW_NUMBER() OVER(PARTITION BY IdBanco_Contratinitial ORDER BY NumeroAvenant DESC) AS RowNum FROM dbo.Contrat) C ON RowNum = 1 AND CAST (TC.IdBanco AS VARCHAR (10)) = C.IdBanco_Contratinitial'
	SET @SQL +='																WHERE 1=1  AND C.dateEcheance < GETDATE() '
	SET @SQL +='																	AND CodeInsee = @codeInsee '
	IF (ISNULL(@CodeDomaine,'') != '')
	SET @SQL += '																	AND (C.Code_DomaineContrat IN (SELECT DATA FROM @CodeDomaineTable)) '
	IF (ISNULL(@Domaine,'') != '')
	SET @SQL += '																	AND (C.Libelle_DomaineContrat IN (SELECT DATA FROM @DomaineTable)) '
	IF (ISNULL(@CodeTypeContrat,'') != '')
	SET @SQL += '																	AND (C.LibelleCourt_TypeContrat IN (SELECT DATA FROM @CodeTypeContratTable)) '
	SET @SQL +='															) AS ContratEchu          '   --CONTRAT ECHU 
	SET @SQL +='														) AS ContratEchuParPriorite	'					--CONTRAT ECHU  PAR PRIORITE 
	SET @SQL += '												WHERE 1 = 1 '
	IF (ISNULL(@Prioritaire, 0) != 0)
	SET @SQL += '													AND ContratEchuParPriorite.RangStatutDomaine = 1 '-- Seulement le contrat prioritaire ? 

	SET @SQL += '											UNION 	'
	SET @SQL +='											SELECT  * FROM '
	SET @SQL +='														(	'
	SET @SQL  += '														SELECT * '
	SET @SQL  +='															,RANK() OVER (PARTITION BY ContratHorsOdyssee.Domaine ORDER BY  ContratHorsOdyssee.DateFin DESC, CAST(ContratHorsOdyssee.Idbanco AS INT) DESC, ContratHorsOdyssee.NumeroBanco DESC) AS RangStatutDomaine '
	SET @SQL  +='															,10000 + ROW_NUMBER() OVER (ORDER BY ContratHorsOdyssee.Priorite DESC, ContratHorsOdyssee.DateFin DESC, CAST(ContratHorsOdyssee.IdBanco AS INT) DESC) AS RangGeneral '
	SET @SQL  +='														FROM('
	SET @SQL  +='															SELECT DISTINCT TC.idBanco,'
	SET @SQL  +='																TC.CodeInsee,'
	SET @SQL +='														        TC.id_type_ter ,'
	SET @SQL  +='																C.IdBanco_Contrat AS NumeroBanco, '
	SET @SQL  +='																C.Libelle_DomaineContrat AS Domaine,'
	SET @SQL  +='																C.libelleCourt_TypeContrat ,'
	SET @SQL  +='																C.libelle_TypeContrat AS TypeBanco, '
	SET @SQL  +='																NULL AS Priorite , '
	SET @SQL  +='																C.Code_DomaineContrat AS CodeDomaine,'
	SET @SQL  +='																C.DateDebut ,'
	SET @SQL  +='																C.DateEcheance AS DateFin, ' 
	SET @SQL  +='																NULL AS NbClients '
	SET @SQL  +='															FROM [dbo].[fn_TerritoireSansCodeHexavia_V02](@CodeInsee,@CodeHexaviaAdresse,@NumeroRue,@ListeTypeTerritoireAutre) TC 	'
	SET @SQL  +='																LEFT OUTER JOIN (SELECT *, ROW_NUMBER() OVER(PARTITION BY IdBanco_Contratinitial ORDER BY NumeroAvenant DESC) AS RowNum FROM dbo.Contrat) C ON RowNum = 1 AND CAST (TC.IdBanco AS VARCHAR (10)) = C.IdBanco_Contratinitial '

	SET @SQL +='														WHERE 1=1  '
	SET @SQL +='															AND CodeInsee = @codeInsee '
	IF (ISNULL(@CodeDomaine,'') != '')
	SET @SQL += '															AND (C.Code_DomaineContrat IN (SELECT DATA FROM @CodeDomaineTable)) '
	IF (ISNULL(@Domaine,'') != '')
	SET @SQL += '															AND (C.Libelle_DomaineContrat IN (SELECT DATA FROM @DomaineTable)) '
	IF (ISNULL(@CodeTypeContrat,'') != '')
	SET @SQL += '															AND (C.LibelleCourt_TypeContrat IN (SELECT DATA FROM @CodeTypeContratTable)) '
	SET @SQL += '														) ContratHorsOdyssee '
	SET @SQL +='													) AS ContratHorsOdysseeParPriorite	'					--Contrat HorsOdyssee  PAR PRIORITE 
	SET @SQL += '										WHERE 1 = 1 '
	IF (ISNULL(@Prioritaire, 0) != 0)
	SET @SQL += '											AND ContratHorsOdysseeParPriorite.RangStatutDomaine = 1 '-- Seulement le contrat prioritaire ? 
	
	SET @SQL +='								) TriParDomaine    '   -- Tri Par Domaine 
	SET @SQL +='						) AS  Contrats' -- Contrats
	SET @SQL +='				)   AS PrioriteEauAssainissement'  --Priorite Eau ASsainissement 
    SET @SQL +='		) AS Priorite '
	SET @SQL +='	) QualitePriorite '
	SET @SQL +=')  ' --RequeteFinale
	IF (ISNULL(@Prioritaire, 0) != 0)
	SET @SQL += '	SELECT * FROM (SELECT * ,RANK() OVER (PARTITION BY domaine ORDER BY RangGeneral)RangFinal FROM RequeteFinale    ) AS RequeteFinalePrioritaire   WHERE RangFinal = 1 ORDER BY Domaine DESC'-- Seulement le contrat prioritaire ? 
	else 
	SET @SQL += '	SELECT * FROM RequeteFinale  ORDER BY rangGeneral '
	


	DECLARE @Parameters NVARCHAR(500)
    SET @Parameters =  '@CodeInsee VARCHAR(max),
						@CodeHexaviaAdresse VARCHAR(max),
						@NumeroRue VARCHAR(max),
						@TypeTerritoire2 VARCHAR(max),
						@ListeTypeTerritoireAutre VARCHAR(max),
						@CodeDomaineTable ParamListTable READONLY,
						@DomaineTable ParamListTable READONLY,
						@CodeTypeContratTable ParamListTable READONLY ' ;


	PRINT(@SQL);
 PRINT(len(@SQL));
	EXECUTE sp_Executesql   @SQL,
							@Parameters,
							@CodeInsee,
							@CodeHexaviaAdresse,
							@NumeroRue,
							@TypeTerritoire2,
						    @ListeTypeTerritoireAutre,
							@CodeDomaineTable,
							@DomaineTable,
							@CodeTypeContratTable  
END

GO
/****** Object:  StoredProcedure [RAP].[GetContratParCompteur]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [RAP].[GetContratParCompteur]
@Idsite VARCHAR(20) = NULL
,@IdPds VARCHAR(50) = NULL 
,@IdCompte VARCHAR(50) = NULL 
,@CodeDomaine VARCHAR(50) = NULL 
,@Domaine VARCHAR(50) = NULL
,@CodeTypeContrat VARCHAR(10) = NULL
,@Prioritaire INT = NULL 
AS 
BEGIN 
--[RAP].[GetContratParCompteur]
--@Idsite  = NULL
--,@IdPds = NULL 
--,@IdCompte  = 3831913908  
--,@CodeDomaine  = NULL 
--,@Domaine  = NULL
--,@CodeTypeContrat  = NULL
--,@Prioritaire  = 1 

	-- EdcEnCours = 1 : Il existe un STATUS_FLG = 10, 20 ou 50 dans les SA_ID du PDS
	-- EdcEnCours = 2 : Il n'existe que des STATUS_FLG = 70 dans les SA_ID du PDS (saisie erronée dans CCNB)
	-- EdcEnCours = 3 : Autres

	DECLARE @CodeDomaineTable PARAMLISTTABLE, @CodeTypeContratTable PARAMLISTTABLE, @DomaineTable PARAMLISTTABLE ;

IF NULL IS NOT NULL INSERT INTO @CodeDomaineTable (data) SELECT splitdata FROM dbo.Fnsplitstring(NULL, ','); 
IF @CodeTypeContrat IS NOT NULL INSERT INTO @CodeTypeContratTable (data) SELECT splitdata FROM dbo.Fnsplitstring(@CodeTypeContrat, ','); 
IF @Domaine IS NOT NULL INSERT INTO @DomaineTable (data) SELECT splitdata FROM dbo.Fnsplitstring(@Domaine, ',');


DECLARE @Sql NVARCHAR(4000)

SET @Sql = 'SELECT
	 TOP (CASE WHEN @Prioritaire = 1 THEN 2 ELSE 1000000 END ) -- Ajout  probleme QualitéprioAssanissment 20200416 Fara Niang
				* ,MAX(QualitePrioEauAvantMAx) OVER (PARTITION BY (SELECT null)  ) QualitePrioEau
			  ,MAX(QualitePrioAssainissementAvantMAX) OVER (PARTITION BY (SELECT null) ) QualitePrioAssainissement'

--SET @Sql+= '
--	SELECT '
	 --TOP (CASE WHEN 1 = 1 THEN 2 ELSE 1000000 END ) -- Ajout  probleme QualitéprioAssanissment 20200416 Fara Niang

	-- IF (ISNULL(@Prioritaire,0) = 1) SET @Sql+= ' TOP 2 '

SET @Sql+= '		
	FROM ( --PrioriteEauAssainissement

				SELECT *	, CASE WHEN domaine = ''EAU''				THEN QualitePrio END AS QualitePrioEauAvantMAX
							, CASE WHEN domaine = ''ASsainissement''  THEN QualitePrio END AS QualitePrioAssainissementAvantMAX  
				FROM 

					( --Priorite

						SELECT *,COUNT(*) OVER (PARTITION BY Domaine,Priorite) AS QualitePrio FROM 
						(-- Contrat
					
								SELECT * 
								FROM 

								(-- ContratActifNonEchuParPriorite
									SELECT RANK() OVER (PARTITION BY Domaine ORDER BY Priorite DESC,NbClients DESC, CAST(IdBanco as INT) DESC ,NumeroBanco DESC) AS RangStatutDomaine
										  ,ROW_NUMBER() OVER (ORDER BY priorite DESC, NbClients DESC, DateFin DESC, CAST(IdBanco AS INT) DESC)                   AS RangGeneral 
										  ,ContratActifNonEchu.* 
									FROM 
									
									(-- ContratActifNonEchu
											SELECT DISTINCT IdBanco, NumeroBanco, Domaine, CodeTypeBanco, TypeBanco, Priorite, NbClients, CodeDomaine, DateDebut, DateFin, Flag_EnregistrementActif ,EdcEnCours 
											FROM RAP.CONTRAT
											WHERE 1= 1 AND Flag_EnregistrementActif = 1 '
											
											IF ISNULL(@Idsite,'') != ''
											SET @Sql += ' AND Idsite = '''+@Idsite+''' '
											IF ISNULL(@IdPds,'') != ''
											SET @Sql += ' AND IdPds = '''+@IdPds+''' '
											IF ISNULL(@IdCompte,'') != ''
											SET @Sql += ' AND IdCompte = '''+@IdCompte+''' '
											IF ISNULL(@Domaine,'') != ''
											SET @Sql += ' AND Domaine IN (SELECT DATA FROM @DomaineTable) '
											IF ISNULL(@CodeTypeContrat,'') != ''
											SET @Sql += ' AND CodeTypeBanco IN (SELECT DATA FROM @CodeTypeContratTable) '

											SET @Sql += ' AND DateFin >= getdate() AND EdcEnCours = 1 -- 10,20,50
									) AS ContratActifNonEchu
									 
								) AS ContratActifNonEchuParPriorite	
								
								WHERE 1 = 1
							--	AND CASE WHEN ISNULL(@Prioritaire, 0) = 0 THEN 1 ELSE RangStatutDomaine END = 1 -- Seulement le contrat prioritaire ?  -- Mise en commentaire probleme prio 20200416 Fara Niang
			
							UNION 

								SELECT * 
								FROM 

								(-- ContratInactifEchuParPriorite
										SELECT RANK() OVER (PARTITION BY domaine ORDER BY Priorite DESC, NbClients DESC, CAST(IdBanco AS INT) DESC, NumeroBanco DESC) AS RangStatutDomaine
										,1000 + ROW_NUMBER() OVER (ORDER BY DateFin DESC, Priorite DESC, NbClients DESC, CAST(IdBanco AS INT) DESC) RangGeneral 
										,ContratInactifEchu.* 
										FROM 

										(-- ContratInactifEchu
											SELECT DISTINCT IdBanco, NumeroBanco, Domaine, CodeTypeBanco, TypeBanco, Priorite, NbClients, CodeDomaine, DateDebut, DateFin, Flag_EnregistrementActif ,EdcEnCours 
											FROM RAP.CONTRAT
											WHERE 1= 1 AND Flag_EnregistrementActif = 1  '

											IF ISNULL(@Idsite,'') != ''
											SET @Sql += ' AND Idsite = '''+@Idsite+''' '
											IF ISNULL(@IdPds,'') != ''
											SET @Sql += ' AND IdPds = '''+@IdPds+''' '
											IF ISNULL(@IdCompte,'') != ''
											SET @Sql += ' AND IdCompte = '''+@IdCompte+''' '
											IF ISNULL(@Domaine,'') != ''
											SET @Sql += ' AND Domaine IN (SELECT DATA FROM @DomaineTable) '
											IF ISNULL(@CodeTypeContrat,'') != ''
											SET @Sql += ' AND CodeTypeBanco IN (SELECT DATA FROM @CodeTypeContratTable) '

											SET @Sql += ' AND DateFin < GETDATE() AND EdcEnCours != 2 --  70 uniquement
										) AS ContratInactifEchu 
								
								) AS ContratInactifEchuParPriorite	
								
								WHERE 1 = 1
								-- AND CASE WHEN ISNULL(@Prioritaire, 0) = 0 THEN 1 ELSE RangStatutDomaine END = 1  -- Mise en commentaire probleme prio 20200416 Fara Niang 
			
						) Contrat 

				) Priorite 

		) PrioriteEauAssainissement 
		WHERE 1=1  		AND CASE WHEN ISNULL(@prioritaire, 0) = 0 THEN 1 ELSE RangStatutDomaine END = 1  -- Ajout Ligne  probleme prio 20200416 Fara Niang
	ORDER BY PrioriteEAUAssainissement.RangGeneral '    

	--		-- AND CASE WHEN ISNULL(1, 0) = 0 THEN 1 ELSE RangStatutDomaine END = 1  -- Ajout Ligne  probleme prio 20200416 Fara Niang
	-- IF (ISNULL(@Prioritaire,0) = 0) SET @Sql+= ' AND RangStatutDomaine = 1 '

	--SET @Sql += ' ORDER BY PrioriteEAUAssainissement.RangGeneral'


	PRINT @Sql

	DECLARE @Param NVARCHAR(4000) 

	SET @Param = ' @DomaineTable PARAMLISTTABLE READONLY, @CodeTypeContratTable PARAMLISTTABLE READONLY,@prioritaire int '

	EXEC sys.sp_executesql @Sql, @Param, @DomaineTable, @CodeTypeContratTable ,@prioritaire

		--RAP.GetContratParCompteur
		-- @Idsite			= '6449355159'
		--,@IdPds			= NULL
		--,@IdCompte		= NULL 
		--,@Domaine			= 'Assainissement,Eau'
		--,@CodeTypeContrat	= 'MP,DSP,CP,MT,PPP'
		--,@Prioritaire		= 1
END
GO
/****** Object:  StoredProcedure [RAP].[GetContratParCompteur_cp]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [RAP].[GetContratParCompteur_cp]
@Idsite VARCHAR(20) = NULL
,@IdPds VARCHAR(50) = NULL 
,@IdCompte VARCHAR(50) = NULL 
,@CodeDomaine VARCHAR(50) = NULL 
,@Domaine VARCHAR(50) = NULL
,@CodeTypeContrat VARCHAR(10) = NULL
,@Prioritaire INT = NULL 
AS 
BEGIN 

	-- EdcEnCours = 1 : Il existe un STATUS_FLG = 10, 20 ou 50 dans les SA_ID du PDS
	-- EdcEnCours = 2 : Il n'existe que des STATUS_FLG = 70 dans les SA_ID du PDS (saisie erronée dans CCNB)
	-- EdcEnCours = 3 : Autres

	DECLARE @CodeDomaineTable PARAMLISTTABLE, @CodeTypeContratTable PARAMLISTTABLE, @DomaineTable PARAMLISTTABLE ;

IF NULL IS NOT NULL INSERT INTO @CodeDomaineTable (data) SELECT splitdata FROM dbo.Fnsplitstring(NULL, ','); 
IF @CodeTypeContrat IS NOT NULL INSERT INTO @CodeTypeContratTable (data) SELECT splitdata FROM dbo.Fnsplitstring(@CodeTypeContrat, ','); 
IF @Domaine IS NOT NULL INSERT INTO @DomaineTable (data) SELECT splitdata FROM dbo.Fnsplitstring(@Domaine, ',');


DECLARE @Sql NVARCHAR(4000)

SET @Sql = ''

SET @Sql+= '
	SELECT '
	 --TOP (CASE WHEN 1 = 1 THEN 2 ELSE 1000000 END ) -- Ajout  probleme QualitéprioAssanissment 20200416 Fara Niang

	 IF (ISNULL(@Prioritaire,0) = 1) SET @Sql+= ' TOP 2 '

SET @Sql+= '				* ,MAX(QualitePrioEauAvantMAx) OVER (PARTITION BY (SELECT null)  ) QualitePrioEau
			  ,MAX(QualitePrioAssainissementAvantMAX) OVER (PARTITION BY (SELECT null) ) QualitePrioAssainissement
	FROM ( --PrioriteEauAssainissement

				SELECT *	, CASE WHEN domaine = ''EAU''				THEN QualitePrio END AS QualitePrioEauAvantMAX
							, CASE WHEN domaine = ''ASsainissement''  THEN QualitePrio END AS QualitePrioAssainissementAvantMAX  
				FROM 

					( --Priorite

						SELECT *,COUNT(*) OVER (PARTITION BY Domaine,Priorite) AS QualitePrio FROM 
						(-- Contrat
					
								SELECT * 
								FROM 

								(-- ContratActifNonEchuParPriorite
									SELECT RANK() OVER (PARTITION BY Domaine ORDER BY Priorite DESC,NbClients DESC, CAST(IdBanco as INT) DESC ,NumeroBanco DESC) AS RangStatutDomaine
										  ,ROW_NUMBER() OVER (ORDER BY priorite DESC, NbClients DESC, DateFin DESC, CAST(IdBanco AS INT) DESC)                   AS RangGeneral 
										  ,ContratActifNonEchu.* 
									FROM 
									
									(-- ContratActifNonEchu
											SELECT DISTINCT IdBanco, NumeroBanco, Domaine, CodeTypeBanco, TypeBanco, Priorite, NbClients, CodeDomaine, DateDebut, DateFin, Flag_EnregistrementActif ,EdcEnCours 
											FROM RAP.CONTRAT
											WHERE 1= 1 AND Flag_EnregistrementActif = 1 '
											
											IF ISNULL(@Idsite,'') != ''
											SET @Sql += ' AND Idsite = '''+@Idsite+''' '
											IF ISNULL(@IdPds,'') != ''
											SET @Sql += ' AND IdPds = '''+@IdPds+''' '
											IF ISNULL(@IdCompte,'') != ''
											SET @Sql += ' AND IdCompte = '''+@IdCompte+''' '
											IF ISNULL(@Domaine,'') != ''
											SET @Sql += ' AND Domaine IN (SELECT DATA FROM @DomaineTable) '
											IF ISNULL(@CodeTypeContrat,'') != ''
											SET @Sql += ' AND CodeTypeBanco IN (SELECT DATA FROM @CodeTypeContratTable) '

											SET @Sql += ' AND DateFin >= getdate() AND EdcEnCours = 1 -- 10,20,50
									) AS ContratActifNonEchu
									 
								) AS ContratActifNonEchuParPriorite	
								
								WHERE 1 = 1
							--	AND CASE WHEN ISNULL(@Prioritaire, 0) = 0 THEN 1 ELSE RangStatutDomaine END = 1 -- Seulement le contrat prioritaire ?  -- Mise en commentaire probleme prio 20200416 Fara Niang
			
							UNION 

								SELECT * 
								FROM 

								(-- ContratInactifEchuParPriorite
										SELECT RANK() OVER (PARTITION BY domaine ORDER BY Priorite DESC, NbClients DESC, CAST(IdBanco AS INT) DESC, NumeroBanco DESC) AS RangStatutDomaine
										,1000 + ROW_NUMBER() OVER (ORDER BY DateFin DESC, Priorite DESC, NbClients DESC, CAST(IdBanco AS INT) DESC) RangGeneral 
										,ContratInactifEchu.* 
										FROM 

										(-- ContratInactifEchu
											SELECT DISTINCT IdBanco, NumeroBanco, Domaine, CodeTypeBanco, TypeBanco, Priorite, NbClients, CodeDomaine, DateDebut, DateFin, Flag_EnregistrementActif ,EdcEnCours 
											FROM RAP.CONTRAT
											WHERE 1= 1 AND Flag_EnregistrementActif = 1  '

											IF ISNULL(@Idsite,'') != ''
											SET @Sql += ' AND Idsite = '''+@Idsite+''' '
											IF ISNULL(@IdPds,'') != ''
											SET @Sql += ' AND IdPds = '''+@IdPds+''' '
											IF ISNULL(@IdCompte,'') != ''
											SET @Sql += ' AND IdCompte = '''+@IdCompte+''' '
											IF ISNULL(@Domaine,'') != ''
											SET @Sql += ' AND Domaine IN (SELECT DATA FROM @DomaineTable) '
											IF ISNULL(@CodeTypeContrat,'') != ''
											SET @Sql += ' AND CodeTypeBanco IN (SELECT DATA FROM @CodeTypeContratTable) '

											SET @Sql += ' AND DateFin < GETDATE() AND EdcEnCours != 2 --  70 uniquement
										) AS ContratInactifEchu 
								
								) AS ContratInactifEchuParPriorite	
								
								WHERE 1 = 1
								-- AND CASE WHEN ISNULL(@Prioritaire, 0) = 0 THEN 1 ELSE RangStatutDomaine END = 1  -- Mise en commentaire probleme prio 20200416 Fara Niang 
			
						) Contrat 

				) Priorite 

		) PrioriteEauAssainissement 
		WHERE 1=1 '

			-- AND CASE WHEN ISNULL(1, 0) = 0 THEN 1 ELSE RangStatutDomaine END = 1  -- Ajout Ligne  probleme prio 20200416 Fara Niang
	 IF (ISNULL(@Prioritaire,0) = 0) SET @Sql+= ' AND RangStatutDomaine = 1 '

	SET @Sql += ' ORDER BY PrioriteEAUAssainissement.RangGeneral'


	PRINT @Sql

	DECLARE @Param NVARCHAR(4000) 

	SET @Param = ' @DomaineTable PARAMLISTTABLE READONLY, @CodeTypeContratTable PARAMLISTTABLE READONLY'

	EXEC sys.sp_executesql @Sql, @Param, @DomaineTable, @CodeTypeContratTable

		--RAP.GetContratParCompteur
		-- @Idsite			= '6449355159'
		--,@IdPds			= NULL
		--,@IdCompte		= NULL 
		--,@Domaine			= 'Assainissement,Eau'
		--,@CodeTypeContrat	= 'MP,DSP,CP,MT,PPP'
		--,@Prioritaire		= 1
END
GO
/****** Object:  StoredProcedure [RAP].[GetContratParCompteur_EDC_ARRETES]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [RAP].[GetContratParCompteur_EDC_ARRETES]
@Idsite VARCHAR(20) = NULL
,@IdPds VARCHAR(50) = NULL 
,@IdCompte VARCHAR(50) = NULL 
,@CodeDomaine VARCHAR(50) = NULL 
,@Domaine VARCHAR(50) = NULL
,@CodeTypeContrat VARCHAR(10) = NULL
,@Prioritaire INT = NULL 
AS 
BEGIN 
--[RAP].[GetContratParCompteur]
--@Idsite  = NULL
--,@IdPds = NULL 
--,@IdCompte  = 3831913908  
--,@CodeDomaine  = NULL 
--,@Domaine  = NULL
--,@CodeTypeContrat  = NULL
--,@Prioritaire  = 1 

	-- EdcEnCours = 1 : Il existe un STATUS_FLG = 10, 20 ou 50 dans les SA_ID du PDS
	-- EdcEnCours = 2 : Il n'existe que des STATUS_FLG = 70 dans les SA_ID du PDS (saisie erronée dans CCNB)
	-- EdcEnCours = 3 : Autres

	DECLARE @CodeDomaineTable PARAMLISTTABLE, @CodeTypeContratTable PARAMLISTTABLE, @DomaineTable PARAMLISTTABLE ;

IF NULL IS NOT NULL INSERT INTO @CodeDomaineTable (data) SELECT splitdata FROM dbo.Fnsplitstring(NULL, ','); 
IF @CodeTypeContrat IS NOT NULL INSERT INTO @CodeTypeContratTable (data) SELECT splitdata FROM dbo.Fnsplitstring(@CodeTypeContrat, ','); 
IF @Domaine IS NOT NULL INSERT INTO @DomaineTable (data) SELECT splitdata FROM dbo.Fnsplitstring(@Domaine, ',');


DECLARE @Sql NVARCHAR(4000)

SET @Sql = 'SELECT
	 TOP (CASE WHEN @Prioritaire = 1 THEN 2 ELSE 1000000 END ) -- Ajout  probleme QualitéprioAssanissment 20200416 Fara Niang
				* ,MAX(QualitePrioEauAvantMAx) OVER (PARTITION BY (SELECT null)  ) QualitePrioEau
			  ,MAX(QualitePrioAssainissementAvantMAX) OVER (PARTITION BY (SELECT null) ) QualitePrioAssainissement'

--SET @Sql+= '
--	SELECT '
	 --TOP (CASE WHEN 1 = 1 THEN 2 ELSE 1000000 END ) -- Ajout  probleme QualitéprioAssanissment 20200416 Fara Niang

	-- IF (ISNULL(@Prioritaire,0) = 1) SET @Sql+= ' TOP 2 '

SET @Sql+= '		
	FROM ( --PrioriteEauAssainissement 
	SELECT *,CASE WHEN domaine=''EAU'' THEN QualitePrio END AS QualitePrioEauAvantMAX, CASE WHEN domaine = ''ASsainissement''  THEN QualitePrio END AS QualitePrioAssainissementAvantMAX  
				FROM 
					( --Priorite
						SELECT *,COUNT(*) OVER (PARTITION BY Domaine,Priorite) AS QualitePrio FROM 
						(-- Contrat					
								SELECT * 
								FROM
								(-- ContratActifNonEchuParPriorite
									SELECT RANK() OVER (PARTITION BY Domaine ORDER BY Priorite DESC,NbClients DESC, CAST(IdBanco as INT) DESC ,NumeroBanco DESC) AS RangStatutDomaine
										  ,ROW_NUMBER() OVER (ORDER BY priorite DESC, NbClients DESC, DateFin DESC, CAST(IdBanco AS INT) DESC)   AS RangGeneral 
										  ,ContratActifNonEchu.* FROM 
									(-- ContratActifNonEchu
											SELECT DISTINCT IdBanco,NumeroBanco,Domaine,CodeTypeBanco,TypeBanco,Priorite,NbClients,CodeDomaine,DateDebut,DateFin, Flag_EnregistrementActif ,EdcEnCours 
											FROM RAP.CONTRAT
											WHERE 1= 1 AND Flag_EnregistrementActif=1 '
											
											IF ISNULL(@Idsite,'') != ''
											SET @Sql += ' AND Idsite = '''+@Idsite+''' '
											IF ISNULL(@IdPds,'') != ''
											SET @Sql += ' AND IdPds = '''+@IdPds+''' '
											IF ISNULL(@IdCompte,'') != ''
											SET @Sql += ' AND IdCompte = '''+@IdCompte+''' '
											IF ISNULL(@Domaine,'') != ''
											SET @Sql += ' AND Domaine IN (SELECT DATA FROM @DomaineTable) '
											IF ISNULL(@CodeTypeContrat,'') != ''
											SET @Sql += ' AND CodeTypeBanco IN (SELECT DATA FROM @CodeTypeContratTable) '

											SET @Sql += ' AND DateFin >= getdate() AND EdcEnCours = 1 -- 10,20,50
									) AS ContratActifNonEchu
									 
								) AS ContratActifNonEchuParPriorite	
								
								WHERE 1 = 1
							--	AND CASE WHEN ISNULL(@Prioritaire, 0) = 0 THEN 1 ELSE RangStatutDomaine END = 1 -- Seulement le contrat prioritaire ?  -- Mise en commentaire probleme prio 20200416 Fara Niang
			
							UNION 
							SELECT * 
								FROM 

								(-- ContratActifNonEchuParPriorite
									SELECT RANK() OVER (PARTITION BY Domaine ORDER BY Priorite DESC,NbClients DESC, CAST(IdBanco as INT) DESC ,NumeroBanco DESC) AS RangStatutDomaine
										  ,100 + ROW_NUMBER() OVER (ORDER BY priorite DESC, NbClients DESC, DateFin DESC, CAST(IdBanco AS INT) DESC)                   AS RangGeneral 
										  ,ContratActifNonEchu.* 
									FROM 
									
									(-- ContratActifNonEchu
											SELECT DISTINCT IdBanco, NumeroBanco, Domaine, CodeTypeBanco, TypeBanco, Priorite, NbClients, CodeDomaine, DateDebut, DateFin, Flag_EnregistrementActif ,EdcEnCours 
											FROM RAP.CONTRAT
											WHERE 1= 1 AND Flag_EnregistrementActif = 1 '
											
											IF ISNULL(@Idsite,'') != ''
											SET @Sql += ' AND Idsite = '''+@Idsite+''' '
											IF ISNULL(@IdPds,'') != ''
											SET @Sql += ' AND IdPds = '''+@IdPds+''' '
											IF ISNULL(@IdCompte,'') != ''
											SET @Sql += ' AND IdCompte = '''+@IdCompte+''' '
											IF ISNULL(@Domaine,'') != ''
											SET @Sql += ' AND Domaine IN (SELECT DATA FROM @DomaineTable) '
											IF ISNULL(@CodeTypeContrat,'') != ''
											SET @Sql += ' AND CodeTypeBanco IN (SELECT DATA FROM @CodeTypeContratTable) '

											SET @Sql += ' AND DateFin >= getdate() AND EdcEnCours = 3 -- 10,20,50
									) AS ContratActifNonEchu
									 
								) AS ContratActifNonEchuParPriorite	
								
								WHERE 1 = 1
			
							UNION 
								SELECT * 
								FROM 

								(-- ContratInactifEchuParPriorite
										SELECT RANK() OVER (PARTITION BY domaine ORDER BY Priorite DESC, NbClients DESC, CAST(IdBanco AS INT) DESC, NumeroBanco DESC) AS RangStatutDomaine
										,1000 + ROW_NUMBER() OVER (ORDER BY Priorite DESC, NbClients DESC, DateFin DESC, CAST(IdBanco AS INT) DESC) RangGeneral 
										,ContratInactifEchu.* 
										FROM 

										(-- ContratInactifEchu
											SELECT DISTINCT IdBanco, NumeroBanco, Domaine, CodeTypeBanco, TypeBanco, Priorite, NbClients, CodeDomaine, DateDebut, DateFin, Flag_EnregistrementActif ,EdcEnCours 
											FROM RAP.CONTRAT
											WHERE 1= 1 AND Flag_EnregistrementActif = 1  '

											IF ISNULL(@Idsite,'') != ''
											SET @Sql += ' AND Idsite = '''+@Idsite+''' '
											IF ISNULL(@IdPds,'') != ''
											SET @Sql += ' AND IdPds = '''+@IdPds+''' '
											IF ISNULL(@IdCompte,'') != ''
											SET @Sql += ' AND IdCompte = '''+@IdCompte+''' '
											IF ISNULL(@Domaine,'') != ''
											SET @Sql += ' AND Domaine IN (SELECT DATA FROM @DomaineTable) '
											IF ISNULL(@CodeTypeContrat,'') != ''
											SET @Sql += ' AND CodeTypeBanco IN (SELECT DATA FROM @CodeTypeContratTable) '

											SET @Sql += ' AND DateFin < GETDATE() AND EdcEnCours != 2 --  70 uniquement
										) AS ContratInactifEchu 
								
								) AS ContratInactifEchuParPriorite	
								WHERE 1 = 1
										
						) Contrat 

				) Priorxite 

		) PrioriteEauAssainissement 
		WHERE 1=1  		AND CASE WHEN ISNULL(@prioritaire,0) =0 THEN 1 ELSE RangStatutDomaine END = 1  -- Ajout Ligne  probleme prio 20200416 Fara Niang
	ORDER BY PrioriteEAUAssainissement.RangGeneral '    

	--		-- AND CASE WHEN ISNULL(1, 0) = 0 THEN 1 ELSE RangStatutDomaine END = 1  -- Ajout Ligne  probleme prio 20200416 Fara Niang
	-- IF (ISNULL(@Prioritaire,0) = 0) SET @Sql+= ' AND RangStatutDomaine = 1 '

	--SET @Sql += ' ORDER BY PrioriteEAUAssainissement.RangGeneral'


	PRINT @Sql

	DECLARE @Param NVARCHAR(4000) 

	SET @Param = ' @DomaineTable PARAMLISTTABLE READONLY, @CodeTypeContratTable PARAMLISTTABLE READONLY,@prioritaire int '

	EXEC sys.sp_executesql @Sql, @Param, @DomaineTable, @CodeTypeContratTable ,@prioritaire

		--RAP.GetContratParCompteur
		-- @Idsite			= '6449355159'
		--,@IdPds			= NULL
		--,@IdCompte		= NULL 
		--,@Domaine			= 'Assainissement,Eau'
		--,@CodeTypeContrat	= 'MP,DSP,CP,MT,PPP'
		--,@Prioritaire		= 1
END
GO
/****** Object:  StoredProcedure [RAP].[GetControleInclusion]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [RAP].[GetControleInclusion]   
	  @CodeInsee NVARCHAR(50) 
	 ,@TypeTerritoire NVARCHAR(50)
AS 
-- ex : [RAP].[ControleInclusion]   30004,1
SELECT TOP (1)
	 ID_TYPE_TER	
	,ID_TER
	,CD_INSEE
	,CD_INSEE_ISNULL 
	,IIF ( CD_INSEE_ISNULL IS NULL, 'TERR_COMMUNE'			,'TERR_RUE'			) AS CodeResultat 
	,IIF ( CD_INSEE_ISNULL IS NULL, 'Territoire commune'	,'Territoire rue'	) AS LibelleResultat
FROM 
	RAP.INCLUSION
WHERE		
		ID_TYPE_TER =  @TypeTerritoire  
	AND CD_INSEE    =  @CodeInsee
ORDER BY 
	IIF ( CD_INSEE_ISNULL IS NULL, 'TERR_COMMUNE'			,'TERR_RUE' ) DESC 
GO
/****** Object:  StoredProcedure [RAP].[GetControleInclusion_V02]    Script Date: 9/28/2022 6:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [RAP].[GetControleInclusion_V02] 
	  @CodeInsee NVARCHAR(50) 
	 ,@TypeTerritoire NVARCHAR(max)
AS 
-- ex : [RAP].[ControleInclusion]   30004,1

SELECT 
	 ID_TYPE_TER 	
	,MAX(ID_TER ) ID_TER
	,CD_INSEE  
	,CD_INSEE_ISNULL 
	,IIF ( CD_INSEE_ISNULL IS NULL, 'TERR_COMMUNE'			,'TERR_RUE'			)  AS CodeResultat 
	,IIF ( CD_INSEE_ISNULL IS NULL, 'Territoire commune'	,'Territoire rue'	)  AS LibelleResultat
    ,CASE WHEN EXISTS (SELECT * FROM RAP.INCLUSION 
						WHERE ID_TYPE_TER in  ( SELECT * FROM [dbo].fnSplitString(@TypeTerritoire , ',')) 
						  AND CD_INSEE    =  @CodeInsee AND CD_INSEE_ISNULL IS NOT NULL
                        ) 
	  THEN 'TERR_RUE'  ELSE 'TERR_COMMUNE' END										AS CodeResultatGeneral

	      ,CASE WHEN EXISTS (SELECT * FROM RAP.INCLUSION 
						WHERE ID_TYPE_TER in  ( SELECT * FROM [dbo].fnSplitString(@TypeTerritoire , ',')) 
						  AND CD_INSEE    =  @CodeInsee AND CD_INSEE_ISNULL IS NOT NULL
                        ) 
	  THEN 'Territoire rue'  ELSE 'Territoire commune' END										AS LibelleResultatGeneral
FROM 
	RAP.INCLUSION
WHERE ID_TYPE_TER IN  ( SELECT * FROM [dbo].fnSplitString(@TypeTerritoire , ','))
	AND CD_INSEE    =  @CodeInsee
GROUP BY ID_TYPE_TER ,CD_INSEE,CD_INSEE_ISNULL
ORDER BY IIF ( CD_INSEE_ISNULL IS NULL, 'TERR_COMMUNE','TERR_RUE' ) DESC 
GO
USE [master]
GO
ALTER DATABASE [FRONT_MIRROR] SET  READ_WRITE 
GO
