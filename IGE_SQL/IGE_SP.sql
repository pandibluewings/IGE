USE [indgarmentsexpo];
GO

IF OBJECT_ID('[dbo].[usp_BusinessTypeSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_BusinessTypeSelect] 
END 
GO
CREATE PROC [dbo].[usp_BusinessTypeSelect] 
    @bt_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [bt_id], [bt_name], [bt_cdate], [bt_mdate], [bt_cid], [bt_mid] 
	FROM   [dbo].[BusinessType] 
	WHERE  ([bt_id] = @bt_id OR @bt_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_BusinessTypeInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_BusinessTypeInsert] 
END 
GO
CREATE PROC [dbo].[usp_BusinessTypeInsert] 
    @bt_name nvarchar(100),
    @bt_cdate datetime = NULL,
    @bt_mdate datetime = NULL,
    @bt_cid bigint = NULL,
    @bt_mid bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[BusinessType] ([bt_name], [bt_cdate], [bt_mdate], [bt_cid], [bt_mid])
	SELECT @bt_name, @bt_cdate, @bt_mdate, @bt_cid, @bt_mid
	
	-- Begin Return Select <- do not remove
	SELECT [bt_id], [bt_name], [bt_cdate], [bt_mdate], [bt_cid], [bt_mid]
	FROM   [dbo].[BusinessType]
	WHERE  [bt_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_BusinessTypeUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_BusinessTypeUpdate] 
END 
GO
CREATE PROC [dbo].[usp_BusinessTypeUpdate] 
    @bt_id bigint,
    @bt_name nvarchar(100),
    @bt_cdate datetime = NULL,
    @bt_mdate datetime = NULL,
    @bt_cid bigint = NULL,
    @bt_mid bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[BusinessType]
	SET    [bt_name] = @bt_name, [bt_cdate] = @bt_cdate, [bt_mdate] = @bt_mdate, [bt_cid] = @bt_cid, [bt_mid] = @bt_mid
	WHERE  [bt_id] = @bt_id
	
	-- Begin Return Select <- do not remove
	SELECT [bt_id], [bt_name], [bt_cdate], [bt_mdate], [bt_cid], [bt_mid]
	FROM   [dbo].[BusinessType]
	WHERE  [bt_id] = @bt_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_BusinessTypeDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_BusinessTypeDelete] 
END 
GO
CREATE PROC [dbo].[usp_BusinessTypeDelete] 
    @bt_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[BusinessType]
	WHERE  [bt_id] = @bt_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_CitySelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CitySelect] 
END 
GO
CREATE PROC [dbo].[usp_CitySelect] 
    @city_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [city_id], [city_name], [con_id], [sta_id] 
	FROM   [dbo].[City] 
	WHERE  ([city_id] = @city_id OR @city_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_CityInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CityInsert] 
END 
GO
CREATE PROC [dbo].[usp_CityInsert] 
    @city_name nvarchar(100),
    @con_id bigint = NULL,
    @sta_id bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[City] ([city_name], [con_id], [sta_id])
	SELECT @city_name, @con_id, @sta_id
	
	-- Begin Return Select <- do not remove
	SELECT [city_id], [city_name], [con_id], [sta_id]
	FROM   [dbo].[City]
	WHERE  [city_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_CityUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CityUpdate] 
END 
GO
CREATE PROC [dbo].[usp_CityUpdate] 
    @city_id bigint,
    @city_name nvarchar(100),
    @con_id bigint = NULL,
    @sta_id bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[City]
	SET    [city_name] = @city_name, [con_id] = @con_id, [sta_id] = @sta_id
	WHERE  [city_id] = @city_id
	
	-- Begin Return Select <- do not remove
	SELECT [city_id], [city_name], [con_id], [sta_id]
	FROM   [dbo].[City]
	WHERE  [city_id] = @city_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_CityDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CityDelete] 
END 
GO
CREATE PROC [dbo].[usp_CityDelete] 
    @city_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[City]
	WHERE  [city_id] = @city_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_CompanySelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CompanySelect] 
END 
GO
CREATE PROC [dbo].[usp_CompanySelect] 
    @com_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [com_id], [com_name], [com_invoicename], [com_address1], [com_address2], [com_address3], [com_district], [city_id], [sta_id], [con_id], [com_pincode], [com_mobileno], [com_website], [com_phone], [com_email], [com_tin], [com_cst], [com_cstdate], [com_panno], [com_servicetaxno], [com_isdefault], [com_logo] 
	FROM   [dbo].[Company] 
	WHERE  ([com_id] = @com_id OR @com_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_CompanyInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CompanyInsert] 
END 
GO
CREATE PROC [dbo].[usp_CompanyInsert] 
    @com_name nvarchar(100),
    @com_invoicename nvarchar(100),
    @com_address1 nvarchar(250),
    @com_address2 nvarchar(250),
    @com_address3 nvarchar(250),
    @com_district nvarchar(100),
    @city_id bigint = NULL,
    @sta_id bigint = NULL,
    @con_id bigint = NULL,
    @com_pincode nvarchar(50),
    @com_mobileno nvarchar(50),
    @com_website nvarchar(100),
    @com_phone nvarchar(50),
    @com_email nvarchar(50),
    @com_tin nvarchar(50),
    @com_cst nvarchar(50),
    @com_cstdate date,
    @com_panno nvarchar(50),
    @com_servicetaxno nvarchar(50),
    @com_isdefault bit,
    @com_logo nvarchar(500)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Company] ([com_name], [com_invoicename], [com_address1], [com_address2], [com_address3], [com_district], [city_id], [sta_id], [con_id], [com_pincode], [com_mobileno], [com_website], [com_phone], [com_email], [com_tin], [com_cst], [com_cstdate], [com_panno], [com_servicetaxno], [com_isdefault], [com_logo])
	SELECT @com_name, @com_invoicename, @com_address1, @com_address2, @com_address3, @com_district, @city_id, @sta_id, @con_id, @com_pincode, @com_mobileno, @com_website, @com_phone, @com_email, @com_tin, @com_cst, @com_cstdate, @com_panno, @com_servicetaxno, @com_isdefault, @com_logo
	
	-- Begin Return Select <- do not remove
	SELECT [com_id], [com_name], [com_invoicename], [com_address1], [com_address2], [com_address3], [com_district], [city_id], [sta_id], [con_id], [com_pincode], [com_mobileno], [com_website], [com_phone], [com_email], [com_tin], [com_cst], [com_cstdate], [com_panno], [com_servicetaxno], [com_isdefault], [com_logo]
	FROM   [dbo].[Company]
	WHERE  [com_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_CompanyUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CompanyUpdate] 
END 
GO
CREATE PROC [dbo].[usp_CompanyUpdate] 
    @com_id bigint,
    @com_name nvarchar(100),
    @com_invoicename nvarchar(100),
    @com_address1 nvarchar(250),
    @com_address2 nvarchar(250),
    @com_address3 nvarchar(250),
    @com_district nvarchar(100),
    @city_id bigint = NULL,
    @sta_id bigint = NULL,
    @con_id bigint = NULL,
    @com_pincode nvarchar(50),
    @com_mobileno nvarchar(50),
    @com_website nvarchar(100),
    @com_phone nvarchar(50),
    @com_email nvarchar(50),
    @com_tin nvarchar(50),
    @com_cst nvarchar(50),
    @com_cstdate date,
    @com_panno nvarchar(50),
    @com_servicetaxno nvarchar(50),
    @com_isdefault bit,
    @com_logo nvarchar(500)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Company]
	SET    [com_name] = @com_name, [com_invoicename] = @com_invoicename, [com_address1] = @com_address1, [com_address2] = @com_address2, [com_address3] = @com_address3, [com_district] = @com_district, [city_id] = @city_id, [sta_id] = @sta_id, [con_id] = @con_id, [com_pincode] = @com_pincode, [com_mobileno] = @com_mobileno, [com_website] = @com_website, [com_phone] = @com_phone, [com_email] = @com_email, [com_tin] = @com_tin, [com_cst] = @com_cst, [com_cstdate] = @com_cstdate, [com_panno] = @com_panno, [com_servicetaxno] = @com_servicetaxno, [com_isdefault] = @com_isdefault, [com_logo] = @com_logo
	WHERE  [com_id] = @com_id
	
	-- Begin Return Select <- do not remove
	SELECT [com_id], [com_name], [com_invoicename], [com_address1], [com_address2], [com_address3], [com_district], [city_id], [sta_id], [con_id], [com_pincode], [com_mobileno], [com_website], [com_phone], [com_email], [com_tin], [com_cst], [com_cstdate], [com_panno], [com_servicetaxno], [com_isdefault], [com_logo]
	FROM   [dbo].[Company]
	WHERE  [com_id] = @com_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_CompanyDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CompanyDelete] 
END 
GO
CREATE PROC [dbo].[usp_CompanyDelete] 
    @com_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Company]
	WHERE  [com_id] = @com_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_CountrySelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CountrySelect] 
END 
GO
CREATE PROC [dbo].[usp_CountrySelect] 
    @con_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [con_id], [con_name] 
	FROM   [dbo].[Country] 
	WHERE  ([con_id] = @con_id OR @con_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_CountryInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CountryInsert] 
END 
GO
CREATE PROC [dbo].[usp_CountryInsert] 
    @con_name nvarchar(100)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Country] ([con_name])
	SELECT @con_name
	
	-- Begin Return Select <- do not remove
	SELECT [con_id], [con_name]
	FROM   [dbo].[Country]
	WHERE  [con_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_CountryUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CountryUpdate] 
END 
GO
CREATE PROC [dbo].[usp_CountryUpdate] 
    @con_id bigint,
    @con_name nvarchar(100)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Country]
	SET    [con_name] = @con_name
	WHERE  [con_id] = @con_id
	
	-- Begin Return Select <- do not remove
	SELECT [con_id], [con_name]
	FROM   [dbo].[Country]
	WHERE  [con_id] = @con_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_CountryDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_CountryDelete] 
END 
GO
CREATE PROC [dbo].[usp_CountryDelete] 
    @con_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Country]
	WHERE  [con_id] = @con_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_farmSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_farmSelect] 
END 
GO
CREATE PROC [dbo].[usp_farmSelect] 
    @farm_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [farm_id], [module_id], [farm_name], [farm_add], [farm_edit], [farm_delete], [farm_view], [farm_print] 
	FROM   [dbo].[farm] 
	WHERE  ([farm_id] = @farm_id OR @farm_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_farmInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_farmInsert] 
END 
GO
CREATE PROC [dbo].[usp_farmInsert] 
    @farm_id bigint,
    @module_id bigint = NULL,
    @farm_name nvarchar(50) = NULL,
    @farm_add char(1) = NULL,
    @farm_edit char(1) = NULL,
    @farm_delete char(1) = NULL,
    @farm_view char(1) = NULL,
    @farm_print char(1) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[farm] ([farm_id], [module_id], [farm_name], [farm_add], [farm_edit], [farm_delete], [farm_view], [farm_print])
	SELECT @farm_id, @module_id, @farm_name, @farm_add, @farm_edit, @farm_delete, @farm_view, @farm_print
	
	-- Begin Return Select <- do not remove
	SELECT [farm_id], [module_id], [farm_name], [farm_add], [farm_edit], [farm_delete], [farm_view], [farm_print]
	FROM   [dbo].[farm]
	WHERE  [farm_id] = @farm_id
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_farmUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_farmUpdate] 
END 
GO
CREATE PROC [dbo].[usp_farmUpdate] 
    @farm_id bigint,
    @module_id bigint = NULL,
    @farm_name nvarchar(50) = NULL,
    @farm_add char(1) = NULL,
    @farm_edit char(1) = NULL,
    @farm_delete char(1) = NULL,
    @farm_view char(1) = NULL,
    @farm_print char(1) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[farm]
	SET    [farm_id] = @farm_id, [module_id] = @module_id, [farm_name] = @farm_name, [farm_add] = @farm_add, [farm_edit] = @farm_edit, [farm_delete] = @farm_delete, [farm_view] = @farm_view, [farm_print] = @farm_print
	WHERE  [farm_id] = @farm_id
	
	-- Begin Return Select <- do not remove
	SELECT [farm_id], [module_id], [farm_name], [farm_add], [farm_edit], [farm_delete], [farm_view], [farm_print]
	FROM   [dbo].[farm]
	WHERE  [farm_id] = @farm_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_farmDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_farmDelete] 
END 
GO
CREATE PROC [dbo].[usp_farmDelete] 
    @farm_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[farm]
	WHERE  [farm_id] = @farm_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_MemberSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_MemberSelect] 
END 
GO
CREATE PROC [dbo].[usp_MemberSelect] 
    @mem_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [mem_id], [mt_id], [bt_id], [mem_name], [mem_companyname], [mem_owner], [mem_address1], [mem_address2], [mem_offaddress1], [mem_offaddress2], [city_id], [sta_id], [con_id], [mem_pincode], [mem_mobile], [mem_phone], [mem_offphone], [mem_email], [mem_webbsite], [mem_gstno], [mem_panno], [mem_logo], [mem_cdate], [mem_mdate], [mem_cid], [mem_mid] 
	FROM   [dbo].[Member] 
	WHERE  ([mem_id] = @mem_id OR @mem_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_MemberInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_MemberInsert] 
END 
GO
CREATE PROC [dbo].[usp_MemberInsert] 
    @mt_id bigint = NULL,
    @bt_id bigint = NULL,
    @mem_name nvarchar(100),
    @mem_companyname nvarchar(100),
    @mem_owner nvarchar(100),
    @mem_address1 nvarchar(250),
    @mem_address2 nvarchar(250),
    @mem_offaddress1 nvarchar(250),
    @mem_offaddress2 nvarchar(250),
    @city_id bigint = NULL,
    @sta_id bigint = NULL,
    @con_id bigint = NULL,
    @mem_pincode varchar(50),
    @mem_mobile varchar(50),
    @mem_phone varchar(50),
    @mem_offphone varchar(50),
    @mem_email nvarchar(100),
    @mem_webbsite nvarchar(100),
    @mem_gstno nvarchar(100),
    @mem_panno nvarchar(100),
    @mem_logo nvarchar(500) = NULL,
    @mem_cdate datetime = NULL,
    @mem_mdate datetime = NULL,
    @mem_cid bigint = NULL,
    @mem_mid bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[Member] ([mt_id], [bt_id], [mem_name], [mem_companyname], [mem_owner], [mem_address1], [mem_address2], [mem_offaddress1], [mem_offaddress2], [city_id], [sta_id], [con_id], [mem_pincode], [mem_mobile], [mem_phone], [mem_offphone], [mem_email], [mem_webbsite], [mem_gstno], [mem_panno], [mem_logo], [mem_cdate], [mem_mdate], [mem_cid], [mem_mid])
	SELECT @mt_id, @bt_id, @mem_name, @mem_companyname, @mem_owner, @mem_address1, @mem_address2, @mem_offaddress1, @mem_offaddress2, @city_id, @sta_id, @con_id, @mem_pincode, @mem_mobile, @mem_phone, @mem_offphone, @mem_email, @mem_webbsite, @mem_gstno, @mem_panno, @mem_logo, @mem_cdate, @mem_mdate, @mem_cid, @mem_mid
	
	-- Begin Return Select <- do not remove
	SELECT [mem_id], [mt_id], [bt_id], [mem_name], [mem_companyname], [mem_owner], [mem_address1], [mem_address2], [mem_offaddress1], [mem_offaddress2], [city_id], [sta_id], [con_id], [mem_pincode], [mem_mobile], [mem_phone], [mem_offphone], [mem_email], [mem_webbsite], [mem_gstno], [mem_panno], [mem_logo], [mem_cdate], [mem_mdate], [mem_cid], [mem_mid]
	FROM   [dbo].[Member]
	WHERE  [mem_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_MemberUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_MemberUpdate] 
END 
GO
CREATE PROC [dbo].[usp_MemberUpdate] 
    @mem_id bigint,
    @mt_id bigint = NULL,
    @bt_id bigint = NULL,
    @mem_name nvarchar(100),
    @mem_companyname nvarchar(100),
    @mem_owner nvarchar(100),
    @mem_address1 nvarchar(250),
    @mem_address2 nvarchar(250),
    @mem_offaddress1 nvarchar(250),
    @mem_offaddress2 nvarchar(250),
    @city_id bigint = NULL,
    @sta_id bigint = NULL,
    @con_id bigint = NULL,
    @mem_pincode varchar(50),
    @mem_mobile varchar(50),
    @mem_phone varchar(50),
    @mem_offphone varchar(50),
    @mem_email nvarchar(100),
    @mem_webbsite nvarchar(100),
    @mem_gstno nvarchar(100),
    @mem_panno nvarchar(100),
    @mem_logo nvarchar(500) = NULL,
    @mem_cdate datetime = NULL,
    @mem_mdate datetime = NULL,
    @mem_cid bigint = NULL,
    @mem_mid bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[Member]
	SET    [mt_id] = @mt_id, [bt_id] = @bt_id, [mem_name] = @mem_name, [mem_companyname] = @mem_companyname, [mem_owner] = @mem_owner, [mem_address1] = @mem_address1, [mem_address2] = @mem_address2, [mem_offaddress1] = @mem_offaddress1, [mem_offaddress2] = @mem_offaddress2, [city_id] = @city_id, [sta_id] = @sta_id, [con_id] = @con_id, [mem_pincode] = @mem_pincode, [mem_mobile] = @mem_mobile, [mem_phone] = @mem_phone, [mem_offphone] = @mem_offphone, [mem_email] = @mem_email, [mem_webbsite] = @mem_webbsite, [mem_gstno] = @mem_gstno, [mem_panno] = @mem_panno, [mem_logo] = @mem_logo, [mem_cdate] = @mem_cdate, [mem_mdate] = @mem_mdate, [mem_cid] = @mem_cid, [mem_mid] = @mem_mid
	WHERE  [mem_id] = @mem_id
	
	-- Begin Return Select <- do not remove
	SELECT [mem_id], [mt_id], [bt_id], [mem_name], [mem_companyname], [mem_owner], [mem_address1], [mem_address2], [mem_offaddress1], [mem_offaddress2], [city_id], [sta_id], [con_id], [mem_pincode], [mem_mobile], [mem_phone], [mem_offphone], [mem_email], [mem_webbsite], [mem_gstno], [mem_panno], [mem_logo], [mem_cdate], [mem_mdate], [mem_cid], [mem_mid]
	FROM   [dbo].[Member]
	WHERE  [mem_id] = @mem_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_MemberDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_MemberDelete] 
END 
GO
CREATE PROC [dbo].[usp_MemberDelete] 
    @mem_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[Member]
	WHERE  [mem_id] = @mem_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_MemberTypeSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_MemberTypeSelect] 
END 
GO
CREATE PROC [dbo].[usp_MemberTypeSelect] 
    @mt_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [mt_id], [mt_name], [mt_cdate], [mt_mdate], [mt_cid], [mt_mid] 
	FROM   [dbo].[MemberType] 
	WHERE  ([mt_id] = @mt_id OR @mt_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_MemberTypeInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_MemberTypeInsert] 
END 
GO
CREATE PROC [dbo].[usp_MemberTypeInsert] 
    @mt_name nvarchar(100),
    @mt_cdate datetime = NULL,
    @mt_mdate datetime = NULL,
    @mt_cid bigint = NULL,
    @mt_mid bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[MemberType] ([mt_name], [mt_cdate], [mt_mdate], [mt_cid], [mt_mid])
	SELECT @mt_name, @mt_cdate, @mt_mdate, @mt_cid, @mt_mid
	
	-- Begin Return Select <- do not remove
	SELECT [mt_id], [mt_name], [mt_cdate], [mt_mdate], [mt_cid], [mt_mid]
	FROM   [dbo].[MemberType]
	WHERE  [mt_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_MemberTypeUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_MemberTypeUpdate] 
END 
GO
CREATE PROC [dbo].[usp_MemberTypeUpdate] 
    @mt_id bigint,
    @mt_name nvarchar(100),
    @mt_cdate datetime = NULL,
    @mt_mdate datetime = NULL,
    @mt_cid bigint = NULL,
    @mt_mid bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[MemberType]
	SET    [mt_name] = @mt_name, [mt_cdate] = @mt_cdate, [mt_mdate] = @mt_mdate, [mt_cid] = @mt_cid, [mt_mid] = @mt_mid
	WHERE  [mt_id] = @mt_id
	
	-- Begin Return Select <- do not remove
	SELECT [mt_id], [mt_name], [mt_cdate], [mt_mdate], [mt_cid], [mt_mid]
	FROM   [dbo].[MemberType]
	WHERE  [mt_id] = @mt_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_MemberTypeDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_MemberTypeDelete] 
END 
GO
CREATE PROC [dbo].[usp_MemberTypeDelete] 
    @mt_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[MemberType]
	WHERE  [mt_id] = @mt_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_moduleSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_moduleSelect] 
END 
GO
CREATE PROC [dbo].[usp_moduleSelect] 
    @module_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [module_id], [module_name] 
	FROM   [dbo].[module] 
	WHERE  ([module_id] = @module_id OR @module_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_moduleInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_moduleInsert] 
END 
GO
CREATE PROC [dbo].[usp_moduleInsert] 
    @module_id bigint,
    @module_name nvarchar(50) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[module] ([module_id], [module_name])
	SELECT @module_id, @module_name
	
	-- Begin Return Select <- do not remove
	SELECT [module_id], [module_name]
	FROM   [dbo].[module]
	WHERE  [module_id] = @module_id
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_moduleUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_moduleUpdate] 
END 
GO
CREATE PROC [dbo].[usp_moduleUpdate] 
    @module_id bigint,
    @module_name nvarchar(50) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[module]
	SET    [module_id] = @module_id, [module_name] = @module_name
	WHERE  [module_id] = @module_id
	
	-- Begin Return Select <- do not remove
	SELECT [module_id], [module_name]
	FROM   [dbo].[module]
	WHERE  [module_id] = @module_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_moduleDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_moduleDelete] 
END 
GO
CREATE PROC [dbo].[usp_moduleDelete] 
    @module_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[module]
	WHERE  [module_id] = @module_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_StatesSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_StatesSelect] 
END 
GO
CREATE PROC [dbo].[usp_StatesSelect] 
    @sta_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [sta_id], [sta_name], [con_id] 
	FROM   [dbo].[States] 
	WHERE  ([sta_id] = @sta_id OR @sta_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_StatesInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_StatesInsert] 
END 
GO
CREATE PROC [dbo].[usp_StatesInsert] 
    @sta_name nvarchar(100),
    @con_id bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[States] ([sta_name], [con_id])
	SELECT @sta_name, @con_id
	
	-- Begin Return Select <- do not remove
	SELECT [sta_id], [sta_name], [con_id]
	FROM   [dbo].[States]
	WHERE  [sta_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_StatesUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_StatesUpdate] 
END 
GO
CREATE PROC [dbo].[usp_StatesUpdate] 
    @sta_id bigint,
    @sta_name nvarchar(100),
    @con_id bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[States]
	SET    [sta_name] = @sta_name, [con_id] = @con_id
	WHERE  [sta_id] = @sta_id
	
	-- Begin Return Select <- do not remove
	SELECT [sta_id], [sta_name], [con_id]
	FROM   [dbo].[States]
	WHERE  [sta_id] = @sta_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_StatesDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_StatesDelete] 
END 
GO
CREATE PROC [dbo].[usp_StatesDelete] 
    @sta_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[States]
	WHERE  [sta_id] = @sta_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_usersSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_usersSelect] 
END 
GO
CREATE PROC [dbo].[usp_usersSelect] 
    @users_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [users_id], [users_name], [users_password], [users_question], [users_answer], [users_email], [users_phone], [ut_id], [com_id] 
	FROM   [dbo].[users] 
	WHERE  ([users_id] = @users_id OR @users_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_usersInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_usersInsert] 
END 
GO
CREATE PROC [dbo].[usp_usersInsert] 
    @users_name nvarchar(100),
    @users_password nvarchar(100),
    @users_question nvarchar(250),
    @users_answer nvarchar(250),
    @users_email nvarchar(50),
    @users_phone nvarchar(50),
    @ut_id bigint = NULL,
    @com_id bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[users] ([users_name], [users_password], [users_question], [users_answer], [users_email], [users_phone], [ut_id], [com_id])
	SELECT @users_name, @users_password, @users_question, @users_answer, @users_email, @users_phone, @ut_id, @com_id
	
	-- Begin Return Select <- do not remove
	SELECT [users_id], [users_name], [users_password], [users_question], [users_answer], [users_email], [users_phone], [ut_id], [com_id]
	FROM   [dbo].[users]
	WHERE  [users_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_usersUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_usersUpdate] 
END 
GO
CREATE PROC [dbo].[usp_usersUpdate] 
    @users_id bigint,
    @users_name nvarchar(100),
    @users_password nvarchar(100),
    @users_question nvarchar(250),
    @users_answer nvarchar(250),
    @users_email nvarchar(50),
    @users_phone nvarchar(50),
    @ut_id bigint = NULL,
    @com_id bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[users]
	SET    [users_name] = @users_name, [users_password] = @users_password, [users_question] = @users_question, [users_answer] = @users_answer, [users_email] = @users_email, [users_phone] = @users_phone, [ut_id] = @ut_id, [com_id] = @com_id
	WHERE  [users_id] = @users_id
	
	-- Begin Return Select <- do not remove
	SELECT [users_id], [users_name], [users_password], [users_question], [users_answer], [users_email], [users_phone], [ut_id], [com_id]
	FROM   [dbo].[users]
	WHERE  [users_id] = @users_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_usersDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_usersDelete] 
END 
GO
CREATE PROC [dbo].[usp_usersDelete] 
    @users_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[users]
	WHERE  [users_id] = @users_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_UserTypeSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_UserTypeSelect] 
END 
GO
CREATE PROC [dbo].[usp_UserTypeSelect] 
    @ut_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ut_id], [ut_code], [ut_name], [com_id] 
	FROM   [dbo].[UserType] 
	WHERE  ([ut_id] = @ut_id OR @ut_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_UserTypeInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_UserTypeInsert] 
END 
GO
CREATE PROC [dbo].[usp_UserTypeInsert] 
    @ut_code nvarchar(100),
    @ut_name nvarchar(100),
    @com_id bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[UserType] ([ut_code], [ut_name], [com_id])
	SELECT @ut_code, @ut_name, @com_id
	
	-- Begin Return Select <- do not remove
	SELECT [ut_id], [ut_code], [ut_name], [com_id]
	FROM   [dbo].[UserType]
	WHERE  [ut_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_UserTypeUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_UserTypeUpdate] 
END 
GO
CREATE PROC [dbo].[usp_UserTypeUpdate] 
    @ut_id bigint,
    @ut_code nvarchar(100),
    @ut_name nvarchar(100),
    @com_id bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[UserType]
	SET    [ut_code] = @ut_code, [ut_name] = @ut_name, [com_id] = @com_id
	WHERE  [ut_id] = @ut_id
	
	-- Begin Return Select <- do not remove
	SELECT [ut_id], [ut_code], [ut_name], [com_id]
	FROM   [dbo].[UserType]
	WHERE  [ut_id] = @ut_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_UserTypeDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_UserTypeDelete] 
END 
GO
CREATE PROC [dbo].[usp_UserTypeDelete] 
    @ut_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[UserType]
	WHERE  [ut_id] = @ut_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

