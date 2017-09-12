USE [AA_IGE];
GO

IF OBJECT_ID(' [usp_BusinessTypeSelect]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_BusinessTypeSelect] 
END 
GO
CREATE PROC  [usp_BusinessTypeSelect] 
    @bt_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [bt_id], [bt_name], [bt_cdate], [bt_mdate], [bt_cid], [bt_mid] 
	FROM    [BusinessType] 
	WHERE  ([bt_id] = @bt_id OR @bt_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[usp_BusinessTypeInsert]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_BusinessTypeInsert] 
END 
GO
CREATE PROC  [usp_BusinessTypeInsert] 
    @bt_name nvarchar(100),
    @bt_cdate datetime = NULL,
    @bt_mdate datetime = NULL,
    @bt_cid bigint = NULL,
    @bt_mid bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO  [BusinessType] ([bt_name], [bt_cdate], [bt_mdate], [bt_cid], [bt_mid])
	SELECT @bt_name, @bt_cdate, @bt_mdate, @bt_cid, @bt_mid
	
	-- Begin Return Select <- do not remove
	SELECT [bt_id], [bt_name], [bt_cdate], [bt_mdate], [bt_cid], [bt_mid]
	FROM    [BusinessType]
	WHERE  [bt_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID(' [usp_BusinessTypeUpdate]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_BusinessTypeUpdate] 
END 
GO
CREATE PROC  [usp_BusinessTypeUpdate] 
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

	UPDATE  [BusinessType]
	SET    [bt_name] = @bt_name, [bt_cdate] = @bt_cdate, [bt_mdate] = @bt_mdate, [bt_cid] = @bt_cid, [bt_mid] = @bt_mid
	WHERE  [bt_id] = @bt_id
	
	-- Begin Return Select <- do not remove
	SELECT [bt_id], [bt_name], [bt_cdate], [bt_mdate], [bt_cid], [bt_mid]
	FROM    [BusinessType]
	WHERE  [bt_id] = @bt_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID(' [usp_BusinessTypeDelete]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_BusinessTypeDelete] 
END 
GO
CREATE PROC  [usp_BusinessTypeDelete] 
    @bt_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM    [BusinessType]
	WHERE  [bt_id] = @bt_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID(' [usp_CompanySelect]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_CompanySelect] 
END 
GO
CREATE PROC  [usp_CompanySelect] 
    @com_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [com_id], [com_name], [com_invoicename], [com_address1], [com_address2], [com_address3], [com_district], [city_id], [sta_id], [con_id], [com_pincode], [com_mobileno], [com_website], [com_phone], [com_email], [com_tin], [com_cst], [com_cstdate], [com_panno], [com_servicetaxno], [com_isdefault], [com_logo] 
	FROM    [Company] 
	WHERE  ([com_id] = @com_id OR @com_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID(' [usp_CompanyInsert]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_CompanyInsert] 
END 
GO
CREATE PROC  [usp_CompanyInsert] 
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
	
	INSERT INTO  [Company] ([com_name], [com_invoicename], [com_address1], [com_address2], [com_address3], [com_district], [city_id], [sta_id], [con_id], [com_pincode], [com_mobileno], [com_website], [com_phone], [com_email], [com_tin], [com_cst], [com_cstdate], [com_panno], [com_servicetaxno], [com_isdefault], [com_logo])
	SELECT @com_name, @com_invoicename, @com_address1, @com_address2, @com_address3, @com_district, @city_id, @sta_id, @con_id, @com_pincode, @com_mobileno, @com_website, @com_phone, @com_email, @com_tin, @com_cst, @com_cstdate, @com_panno, @com_servicetaxno, @com_isdefault, @com_logo
	
	-- Begin Return Select <- do not remove
	SELECT [com_id], [com_name], [com_invoicename], [com_address1], [com_address2], [com_address3], [com_district], [city_id], [sta_id], [con_id], [com_pincode], [com_mobileno], [com_website], [com_phone], [com_email], [com_tin], [com_cst], [com_cstdate], [com_panno], [com_servicetaxno], [com_isdefault], [com_logo]
	FROM    [Company]
	WHERE  [com_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID(' [usp_CompanyUpdate]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_CompanyUpdate] 
END 
GO
CREATE PROC  [usp_CompanyUpdate] 
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

	UPDATE  [Company]
	SET    [com_name] = @com_name, [com_invoicename] = @com_invoicename, [com_address1] = @com_address1, [com_address2] = @com_address2, [com_address3] = @com_address3, [com_district] = @com_district, [city_id] = @city_id, [sta_id] = @sta_id, [con_id] = @con_id, [com_pincode] = @com_pincode, [com_mobileno] = @com_mobileno, [com_website] = @com_website, [com_phone] = @com_phone, [com_email] = @com_email, [com_tin] = @com_tin, [com_cst] = @com_cst, [com_cstdate] = @com_cstdate, [com_panno] = @com_panno, [com_servicetaxno] = @com_servicetaxno, [com_isdefault] = @com_isdefault, [com_logo] = @com_logo
	WHERE  [com_id] = @com_id
	
	-- Begin Return Select <- do not remove
	SELECT [com_id], [com_name], [com_invoicename], [com_address1], [com_address2], [com_address3], [com_district], [city_id], [sta_id], [con_id], [com_pincode], [com_mobileno], [com_website], [com_phone], [com_email], [com_tin], [com_cst], [com_cstdate], [com_panno], [com_servicetaxno], [com_isdefault], [com_logo]
	FROM    [Company]
	WHERE  [com_id] = @com_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID(' [usp_CompanyDelete]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_CompanyDelete] 
END 
GO
CREATE PROC  [usp_CompanyDelete] 
    @com_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM    [Company]
	WHERE  [com_id] = @com_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID(' [usp_CountrySelect]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_CountrySelect] 
END 
GO
CREATE PROC  [usp_CountrySelect] 
    @con_id bigint=null
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [con_id], [con_name] 
	FROM    [Country] 
	WHERE  ([con_id] = @con_id OR @con_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID(' [usp_CountryInsert]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_CountryInsert] 
END 
GO
CREATE PROC  [usp_CountryInsert] 
    @con_name nvarchar(100)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO  [Country] ([con_name])
	SELECT @con_name
	
	-- Begin Return Select <- do not remove
	SELECT [con_id], [con_name]
	FROM    [Country]
	WHERE  [con_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID(' [usp_CountryUpdate]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_CountryUpdate] 
END 
GO
CREATE PROC  [usp_CountryUpdate] 
    @con_id bigint,
    @con_name nvarchar(100)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE  [Country]
	SET    [con_name] = @con_name
	WHERE  [con_id] = @con_id
	
	-- Begin Return Select <- do not remove
	SELECT [con_id], [con_name]
	FROM    [Country]
	WHERE  [con_id] = @con_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID(' [usp_CountryDelete]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_CountryDelete] 
END 
GO
CREATE PROC  [usp_CountryDelete] 
    @con_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM    [Country]
	WHERE  [con_id] = @con_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID(' [usp_StatesSelect]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_StatesSelect] 
END 
GO
CREATE PROC  [usp_StatesSelect] 
    @sta_id bigint=null,
    @con_id bigint=null
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [sta_id], [sta_name], [con_id] 
	FROM    [States] 
	WHERE  ([sta_id] = @sta_id OR @sta_id IS NULL) 
	AND  ([con_id]  = @con_id  OR @con_id  IS NULL) 
	COMMIT
GO
IF OBJECT_ID(' [usp_StatesInsert]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_StatesInsert] 
END 
GO
CREATE PROC  [usp_StatesInsert] 
    @sta_name nvarchar(100),
    @con_id bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO  [States] ([sta_name], [con_id])
	SELECT @sta_name, @con_id
	
	-- Begin Return Select <- do not remove
	SELECT [sta_id], [sta_name], [con_id]
	FROM    [States]
	WHERE  [sta_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID(' [usp_StatesUpdate]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_StatesUpdate] 
END 
GO
CREATE PROC  [usp_StatesUpdate] 
    @sta_id bigint,
    @sta_name nvarchar(100),
    @con_id bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE  [States]
	SET    [sta_name] = @sta_name, [con_id] = @con_id
	WHERE  [sta_id] = @sta_id
	
	-- Begin Return Select <- do not remove
	SELECT [sta_id], [sta_name], [con_id]
	FROM    [States]
	WHERE  [sta_id] = @sta_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID(' [usp_StatesDelete]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_StatesDelete] 
END 
GO
CREATE PROC  [usp_StatesDelete] 
    @sta_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM    [States]
	WHERE  [sta_id] = @sta_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID(' [usp_CitySelect]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_CitySelect] 
END 
GO
CREATE PROC  [usp_CitySelect] 
    @city_id bigint=null,
    @sta_id bigint=null,
    @con_id bigint=null
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [city_id], [city_name], [con_id], [sta_id] 
	FROM    [City] 
	WHERE  ([city_id] = @city_id OR @city_id IS NULL) 
	AND ([sta_id]  = @sta_id  OR @sta_id  IS NULL) 
	AND ([con_id]  = @con_id OR @con_id  IS NULL) 

	COMMIT
GO
IF OBJECT_ID(' [usp_CityInsert]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_CityInsert] 
END 
GO
CREATE PROC  [usp_CityInsert] 
    @city_name nvarchar(100),
    @con_id bigint = NULL,
    @sta_id bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO  [City] ([city_name], [con_id], [sta_id])
	SELECT @city_name, @con_id, @sta_id
	
	-- Begin Return Select <- do not remove
	SELECT [city_id], [city_name], [con_id], [sta_id]
	FROM    [City]
	WHERE  [city_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID(' [usp_CityUpdate]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_CityUpdate] 
END 
GO
CREATE PROC  [usp_CityUpdate] 
    @city_id bigint,
    @city_name nvarchar(100),
    @con_id bigint = NULL,
    @sta_id bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE  [City]
	SET    [city_name] = @city_name, [con_id] = @con_id, [sta_id] = @sta_id
	WHERE  [city_id] = @city_id
	
	-- Begin Return Select <- do not remove
	SELECT [city_id], [city_name], [con_id], [sta_id]
	FROM    [City]
	WHERE  [city_id] = @city_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID(' [usp_CityDelete]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_CityDelete] 
END 
GO
CREATE PROC  [usp_CityDelete] 
    @city_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM    [City]
	WHERE  [city_id] = @city_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID(' [usp_farmSelect]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_farmSelect] 
END 
GO
CREATE PROC  [usp_farmSelect] 
    @farm_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [farm_id], [module_id], [farm_name], [farm_add], [farm_edit], [farm_delete], [farm_view], [farm_print] 
	FROM    [farm] 
	WHERE  ([farm_id] = @farm_id OR @farm_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID(' [usp_farmInsert]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_farmInsert] 
END 
GO
CREATE PROC  [usp_farmInsert] 
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
	
	INSERT INTO  [farm] ([farm_id], [module_id], [farm_name], [farm_add], [farm_edit], [farm_delete], [farm_view], [farm_print])
	SELECT @farm_id, @module_id, @farm_name, @farm_add, @farm_edit, @farm_delete, @farm_view, @farm_print
	
	-- Begin Return Select <- do not remove
	SELECT [farm_id], [module_id], [farm_name], [farm_add], [farm_edit], [farm_delete], [farm_view], [farm_print]
	FROM    [farm]
	WHERE  [farm_id] = @farm_id
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID(' [usp_farmUpdate]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_farmUpdate] 
END 
GO
CREATE PROC  [usp_farmUpdate] 
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

	UPDATE  [farm]
	SET    [farm_id] = @farm_id, [module_id] = @module_id, [farm_name] = @farm_name, [farm_add] = @farm_add, [farm_edit] = @farm_edit, [farm_delete] = @farm_delete, [farm_view] = @farm_view, [farm_print] = @farm_print
	WHERE  [farm_id] = @farm_id
	
	-- Begin Return Select <- do not remove
	SELECT [farm_id], [module_id], [farm_name], [farm_add], [farm_edit], [farm_delete], [farm_view], [farm_print]
	FROM    [farm]
	WHERE  [farm_id] = @farm_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID(' [usp_farmDelete]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_farmDelete] 
END 
GO
CREATE PROC  [usp_farmDelete] 
    @farm_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM    [farm]
	WHERE  [farm_id] = @farm_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID(' [usp_MemberSelect]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_MemberSelect] 
END 
GO
CREATE PROC  [usp_MemberSelect] 
    @mem_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [mem_id], [mt_id], [bt_id], [mem_name], [mem_companyname], [mem_owner], [mem_address1], [mem_address2], [mem_offaddress1], [mem_offaddress2], [city_id], [sta_id], [con_id], [mem_pincode], [mem_mobile], [mem_phone], [mem_offphone], [mem_email], [mem_webbsite], [mem_gstno], [mem_panno], [mem_logo], [mem_cdate], [mem_mdate], [mem_cid], [mem_mid] 
	FROM    [Member] 
	WHERE  ([mem_id] = @mem_id OR @mem_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID(' [usp_MemberInsert]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_MemberInsert] 
END 
GO
CREATE PROC  [usp_MemberInsert] 
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
	
	INSERT INTO  [Member] ([mt_id], [bt_id], [mem_name], [mem_companyname], [mem_owner], [mem_address1], [mem_address2], [mem_offaddress1], [mem_offaddress2], [city_id], [sta_id], [con_id], [mem_pincode], [mem_mobile], [mem_phone], [mem_offphone], [mem_email], [mem_webbsite], [mem_gstno], [mem_panno], [mem_logo], [mem_cdate], [mem_mdate], [mem_cid], [mem_mid])
	SELECT @mt_id, @bt_id, @mem_name, @mem_companyname, @mem_owner, @mem_address1, @mem_address2, @mem_offaddress1, @mem_offaddress2, @city_id, @sta_id, @con_id, @mem_pincode, @mem_mobile, @mem_phone, @mem_offphone, @mem_email, @mem_webbsite, @mem_gstno, @mem_panno, @mem_logo, @mem_cdate, @mem_mdate, @mem_cid, @mem_mid
	
	-- Begin Return Select <- do not remove
	SELECT [mem_id], [mt_id], [bt_id], [mem_name], [mem_companyname], [mem_owner], [mem_address1], [mem_address2], [mem_offaddress1], [mem_offaddress2], [city_id], [sta_id], [con_id], [mem_pincode], [mem_mobile], [mem_phone], [mem_offphone], [mem_email], [mem_webbsite], [mem_gstno], [mem_panno], [mem_logo], [mem_cdate], [mem_mdate], [mem_cid], [mem_mid]
	FROM    [Member]
	WHERE  [mem_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID(' [usp_MemberUpdate]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_MemberUpdate] 
END 
GO
CREATE PROC  [usp_MemberUpdate] 
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

	UPDATE  [Member]
	SET    [mt_id] = @mt_id, [bt_id] = @bt_id, [mem_name] = @mem_name, [mem_companyname] = @mem_companyname, [mem_owner] = @mem_owner, [mem_address1] = @mem_address1, [mem_address2] = @mem_address2, [mem_offaddress1] = @mem_offaddress1, [mem_offaddress2] = @mem_offaddress2, [city_id] = @city_id, [sta_id] = @sta_id, [con_id] = @con_id, [mem_pincode] = @mem_pincode, [mem_mobile] = @mem_mobile, [mem_phone] = @mem_phone, [mem_offphone] = @mem_offphone, [mem_email] = @mem_email, [mem_webbsite] = @mem_webbsite, [mem_gstno] = @mem_gstno, [mem_panno] = @mem_panno, [mem_logo] = @mem_logo, [mem_cdate] = @mem_cdate, [mem_mdate] = @mem_mdate, [mem_cid] = @mem_cid, [mem_mid] = @mem_mid
	WHERE  [mem_id] = @mem_id
	
	-- Begin Return Select <- do not remove
	SELECT [mem_id], [mt_id], [bt_id], [mem_name], [mem_companyname], [mem_owner], [mem_address1], [mem_address2], [mem_offaddress1], [mem_offaddress2], [city_id], [sta_id], [con_id], [mem_pincode], [mem_mobile], [mem_phone], [mem_offphone], [mem_email], [mem_webbsite], [mem_gstno], [mem_panno], [mem_logo], [mem_cdate], [mem_mdate], [mem_cid], [mem_mid]
	FROM    [Member]
	WHERE  [mem_id] = @mem_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID(' [usp_MemberDelete]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_MemberDelete] 
END 
GO
CREATE PROC  [usp_MemberDelete] 
    @mem_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM    [Member]
	WHERE  [mem_id] = @mem_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID(' [usp_MemberTypeSelect]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_MemberTypeSelect] 
END 
GO
CREATE PROC  [usp_MemberTypeSelect] 
    @mt_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [mt_id], [mt_name], [mt_cdate], [mt_mdate], [mt_cid], [mt_mid] 
	FROM    [MemberType] 
	WHERE  ([mt_id] = @mt_id OR @mt_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID(' [usp_MemberTypeInsert]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_MemberTypeInsert] 
END 
GO
CREATE PROC  [usp_MemberTypeInsert] 
    @mt_name nvarchar(100),
    @mt_cdate datetime = NULL,
    @mt_mdate datetime = NULL,
    @mt_cid bigint = NULL,
    @mt_mid bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO  [MemberType] ([mt_name], [mt_cdate], [mt_mdate], [mt_cid], [mt_mid])
	SELECT @mt_name, @mt_cdate, @mt_mdate, @mt_cid, @mt_mid
	
	-- Begin Return Select <- do not remove
	SELECT [mt_id], [mt_name], [mt_cdate], [mt_mdate], [mt_cid], [mt_mid]
	FROM    [MemberType]
	WHERE  [mt_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID(' [usp_MemberTypeUpdate]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_MemberTypeUpdate] 
END 
GO
CREATE PROC  [usp_MemberTypeUpdate] 
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

	UPDATE  [MemberType]
	SET    [mt_name] = @mt_name, [mt_cdate] = @mt_cdate, [mt_mdate] = @mt_mdate, [mt_cid] = @mt_cid, [mt_mid] = @mt_mid
	WHERE  [mt_id] = @mt_id
	
	-- Begin Return Select <- do not remove
	SELECT [mt_id], [mt_name], [mt_cdate], [mt_mdate], [mt_cid], [mt_mid]
	FROM    [MemberType]
	WHERE  [mt_id] = @mt_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID(' [usp_MemberTypeDelete]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_MemberTypeDelete] 
END 
GO
CREATE PROC  [usp_MemberTypeDelete] 
    @mt_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM    [MemberType]
	WHERE  [mt_id] = @mt_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID(' [usp_moduleSelect]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_moduleSelect] 
END 
GO
CREATE PROC  [usp_moduleSelect] 
    @module_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [module_id], [module_name] 
	FROM    [module] 
	WHERE  ([module_id] = @module_id OR @module_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID(' [usp_moduleInsert]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_moduleInsert] 
END 
GO
CREATE PROC  [usp_moduleInsert] 
    @module_id bigint,
    @module_name nvarchar(50) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO  [module] ([module_id], [module_name])
	SELECT @module_id, @module_name
	
	-- Begin Return Select <- do not remove
	SELECT [module_id], [module_name]
	FROM    [module]
	WHERE  [module_id] = @module_id
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID(' [usp_moduleUpdate]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_moduleUpdate] 
END 
GO
CREATE PROC  [usp_moduleUpdate] 
    @module_id bigint,
    @module_name nvarchar(50) = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE  [module]
	SET    [module_id] = @module_id, [module_name] = @module_name
	WHERE  [module_id] = @module_id
	
	-- Begin Return Select <- do not remove
	SELECT [module_id], [module_name]
	FROM    [module]
	WHERE  [module_id] = @module_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID(' [usp_moduleDelete]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_moduleDelete] 
END 
GO
CREATE PROC  [usp_moduleDelete] 
    @module_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM    [module]
	WHERE  [module_id] = @module_id

	COMMIT
GO


----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID(' [usp_usersSelect]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_usersSelect] 
END 
GO
CREATE PROC  [usp_usersSelect] 
    @users_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [users_id], [users_name], [users_password], [users_question], [users_answer], [users_email], [users_phone], [ut_id], [com_id] 
	FROM    [users] 
	WHERE  ([users_id] = @users_id OR @users_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID(' [usp_usersInsert]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_usersInsert] 
END 
GO
CREATE PROC  [usp_usersInsert] 
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
	
	INSERT INTO  [users] ([users_name], [users_password], [users_question], [users_answer], [users_email], [users_phone], [ut_id], [com_id])
	SELECT @users_name, @users_password, @users_question, @users_answer, @users_email, @users_phone, @ut_id, @com_id
	
	-- Begin Return Select <- do not remove
	SELECT [users_id], [users_name], [users_password], [users_question], [users_answer], [users_email], [users_phone], [ut_id], [com_id]
	FROM    [users]
	WHERE  [users_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID(' [usp_usersUpdate]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_usersUpdate] 
END 
GO
CREATE PROC  [usp_usersUpdate] 
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

	UPDATE  [users]
	SET    [users_name] = @users_name, [users_password] = @users_password, [users_question] = @users_question, [users_answer] = @users_answer, [users_email] = @users_email, [users_phone] = @users_phone, [ut_id] = @ut_id, [com_id] = @com_id
	WHERE  [users_id] = @users_id
	
	-- Begin Return Select <- do not remove
	SELECT [users_id], [users_name], [users_password], [users_question], [users_answer], [users_email], [users_phone], [ut_id], [com_id]
	FROM    [users]
	WHERE  [users_id] = @users_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID(' [usp_usersDelete]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_usersDelete] 
END 
GO
CREATE PROC  [usp_usersDelete] 
    @users_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM    [users]
	WHERE  [users_id] = @users_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID(' [usp_UserTypeSelect]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_UserTypeSelect] 
END 
GO
CREATE PROC  [usp_UserTypeSelect] 
    @ut_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [ut_id], [ut_code], [ut_name], [com_id] 
	FROM    [UserType] 
	WHERE  ([ut_id] = @ut_id OR @ut_id IS NULL) 

	COMMIT
GO
IF OBJECT_ID(' [usp_UserTypeInsert]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_UserTypeInsert] 
END 
GO
CREATE PROC  [usp_UserTypeInsert] 
    @ut_code nvarchar(100),
    @ut_name nvarchar(100),
    @com_id bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO  [UserType] ([ut_code], [ut_name], [com_id])
	SELECT @ut_code, @ut_name, @com_id
	
	-- Begin Return Select <- do not remove
	SELECT [ut_id], [ut_code], [ut_name], [com_id]
	FROM    [UserType]
	WHERE  [ut_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID(' [usp_UserTypeUpdate]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_UserTypeUpdate] 
END 
GO
CREATE PROC  [usp_UserTypeUpdate] 
    @ut_id bigint,
    @ut_code nvarchar(100),
    @ut_name nvarchar(100),
    @com_id bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE  [UserType]
	SET    [ut_code] = @ut_code, [ut_name] = @ut_name, [com_id] = @com_id
	WHERE  [ut_id] = @ut_id
	
	-- Begin Return Select <- do not remove
	SELECT [ut_id], [ut_code], [ut_name], [com_id]
	FROM    [UserType]
	WHERE  [ut_id] = @ut_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID(' [usp_UserTypeDelete]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_UserTypeDelete] 
END 
GO
CREATE PROC  [usp_UserTypeDelete] 
    @ut_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM    [UserType]
	WHERE  [ut_id] = @ut_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------



IF OBJECT_ID(' [usp_CustomerSelect]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_CustomerSelect] 
END 
GO
CREATE PROC  [usp_CustomerSelect] 
    @cust_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [cust_id], [cust_code], [cust_type], [cust_name], [cust_brand], [cust_contactperson], [cust_address1], [cust_address2], [cust_address3], [cust_city], [cust_district], [cust_state], [cust_pincode], [cust_mobile], [cust_phone], [cust_mobile2], [cust_email], [cust_webbsite], [cust_gstno] 
	FROM    [Customer] 
	WHERE  ([cust_id] = @cust_id OR @cust_id IS NULL) 

	COMMIT
GO

IF OBJECT_ID(' [usp_CustomerInsert]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_CustomerInsert] 
END 
GO
CREATE PROC  [usp_CustomerInsert] 
    @cust_code bigint = NULL,
    @cust_type nvarchar(100),
    @cust_name nvarchar(100),
    @cust_brand nvarchar(100),
    @cust_contactperson nvarchar(100),
    @cust_address1 nvarchar(250),
    @cust_address2 nvarchar(250),
    @cust_address3 nvarchar(250),
    @cust_city nvarchar(100),
    @cust_district nvarchar(100),
    @cust_state nvarchar(100),
    @cust_pincode varchar(50),
    @cust_mobile varchar(50),
    @cust_phone varchar(50),
    @cust_mobile2 varchar(50),
    @cust_email nvarchar(100),
    @cust_webbsite nvarchar(100),
    @cust_gstno nvarchar(100)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO  [Customer] ([cust_code], [cust_type], [cust_name], [cust_brand], [cust_contactperson], [cust_address1], [cust_address2], [cust_address3], [cust_city], [cust_district], [cust_state], [cust_pincode], [cust_mobile], [cust_phone], [cust_mobile2], [cust_email], [cust_webbsite], [cust_gstno])
	SELECT @cust_code, @cust_type, @cust_name, @cust_brand, @cust_contactperson, @cust_address1, @cust_address2, @cust_address3, @cust_city, @cust_district, @cust_state, @cust_pincode, @cust_mobile, @cust_phone, @cust_mobile2, @cust_email, @cust_webbsite, @cust_gstno
	
	-- Begin Return Select <- do not remove
	SELECT [cust_id], [cust_code], [cust_type], [cust_name], [cust_brand], [cust_contactperson], [cust_address1], [cust_address2], [cust_address3], [cust_city], [cust_district], [cust_state], [cust_pincode], [cust_mobile], [cust_phone], [cust_mobile2], [cust_email], [cust_webbsite], [cust_gstno]
	FROM    [Customer]
	WHERE  [cust_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID(' [usp_CustomerUpdate]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_CustomerUpdate] 
END 
GO
CREATE PROC  [usp_CustomerUpdate] 
    @cust_id bigint,
    @cust_code bigint = NULL,
    @cust_type nvarchar(100),
    @cust_name nvarchar(100),
    @cust_brand nvarchar(100),
    @cust_contactperson nvarchar(100),
    @cust_address1 nvarchar(250),
    @cust_address2 nvarchar(250),
    @cust_address3 nvarchar(250),
    @cust_city nvarchar(100),
    @cust_district nvarchar(100),
    @cust_state nvarchar(100),
    @cust_pincode varchar(50),
    @cust_mobile varchar(50),
    @cust_phone varchar(50),
    @cust_mobile2 varchar(50),
    @cust_email nvarchar(100),
    @cust_webbsite nvarchar(100),
    @cust_gstno nvarchar(100)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE  [Customer]
	SET    [cust_code] = @cust_code, [cust_type] = @cust_type, [cust_name] = @cust_name, [cust_brand] = @cust_brand, [cust_contactperson] = @cust_contactperson, [cust_address1] = @cust_address1, [cust_address2] = @cust_address2, [cust_address3] = @cust_address3, [cust_city] = @cust_city, [cust_district] = @cust_district, [cust_state] = @cust_state, [cust_pincode] = @cust_pincode, [cust_mobile] = @cust_mobile, [cust_phone] = @cust_phone, [cust_mobile2] = @cust_mobile2, [cust_email] = @cust_email, [cust_webbsite] = @cust_webbsite, [cust_gstno] = @cust_gstno
	WHERE  [cust_id] = @cust_id
	
	-- Begin Return Select <- do not remove
	SELECT [cust_id], [cust_code], [cust_type], [cust_name], [cust_brand], [cust_contactperson], [cust_address1], [cust_address2], [cust_address3], [cust_city], [cust_district], [cust_state], [cust_pincode], [cust_mobile], [cust_phone], [cust_mobile2], [cust_email], [cust_webbsite], [cust_gstno]
	FROM    [Customer]
	WHERE  [cust_id] = @cust_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID(' [usp_CustomerDelete]') IS NOT NULL
BEGIN 
    DROP PROC  [usp_CustomerDelete] 
END 
GO
CREATE PROC  [usp_CustomerDelete] 
    @cust_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM    [Customer]
	WHERE  [cust_id] = @cust_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------


IF OBJECT_ID('[dbo].[usp_MemberGallerySelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_MemberGallerySelect] 
END 
GO
CREATE PROC [dbo].[usp_MemberGallerySelect] 
    @mem_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [mg_id], [mg_path], [mem_id] 
	FROM   [dbo].[MemberGallery] 
	WHERE  ([mem_id] = @mem_id  OR @mem_id  IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_MemberGalleryInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_MemberGalleryInsert] 
END 
GO
CREATE PROC [dbo].[usp_MemberGalleryInsert] 
    @mg_path nvarchar(500) = NULL,
    @mem_id bigint = NULL
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[MemberGallery] ([mg_path], [mem_id])
	SELECT @mg_path, @mem_id
	
	-- Begin Return Select <- do not remove
	SELECT [mg_id], [mg_path], [mem_id]
	FROM   [dbo].[MemberGallery]
	WHERE  [mg_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_MemberGalleryDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_MemberGalleryDelete] 
END 
GO
CREATE PROC [dbo].[usp_MemberGalleryDelete] 
    @mem_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[MemberGallery]
	WHERE  [mem_id] = @mem_id 

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

IF OBJECT_ID('[dbo].[usp_MemberReviewSelect]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_MemberReviewSelect] 
END 
GO
CREATE PROC [dbo].[usp_MemberReviewSelect] 
    @mr_reviewfor bigint=null
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [mr_id], [mr_reviewstar], [mr_reviewfor], [mr_reviewedby], [mr_title], [mr_comment], [mr_date] 
	FROM   [dbo].[MemberReview] 
	WHERE  (mr_reviewfor = @mr_reviewfor OR @mr_reviewfor IS NULL) 

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_MemberReviewInsert]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_MemberReviewInsert] 
END 
GO
CREATE PROC [dbo].[usp_MemberReviewInsert] 
    @mr_reviewstar int,
    @mr_reviewfor bigint = NULL,
    @mr_reviewedby bigint = NULL,
    @mr_title nvarchar(250) = NULL,
    @mr_comment nvarchar(MAX) = NULL,
    @mr_date datetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[MemberReview] ([mr_reviewstar], [mr_reviewfor], [mr_reviewedby], [mr_title], [mr_comment], [mr_date])
	SELECT @mr_reviewstar, @mr_reviewfor, @mr_reviewedby, @mr_title, @mr_comment, @mr_date
	
	-- Begin Return Select <- do not remove
	SELECT [mr_id], [mr_reviewstar], [mr_reviewfor], [mr_reviewedby], [mr_title], [mr_comment], [mr_date]
	FROM   [dbo].[MemberReview]
	WHERE  [mr_id] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_MemberReviewUpdate]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_MemberReviewUpdate] 
END 
GO
CREATE PROC [dbo].[usp_MemberReviewUpdate] 
    @mr_id bigint,
    @mr_reviewstar int,
    @mr_reviewfor bigint = NULL,
    @mr_reviewedby bigint = NULL,
    @mr_title nvarchar(250) = NULL,
    @mr_comment nvarchar(MAX) = NULL,
    @mr_date datetime
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[MemberReview]
	SET    [mr_reviewstar] = @mr_reviewstar, [mr_reviewfor] = @mr_reviewfor, [mr_reviewedby] = @mr_reviewedby, [mr_title] = @mr_title, [mr_comment] = @mr_comment, [mr_date] = @mr_date
	WHERE  [mr_id] = @mr_id
	
	-- Begin Return Select <- do not remove
	SELECT [mr_id], [mr_reviewstar], [mr_reviewfor], [mr_reviewedby], [mr_title], [mr_comment], [mr_date]
	FROM   [dbo].[MemberReview]
	WHERE  [mr_id] = @mr_id	
	-- End Return Select <- do not remove

	COMMIT
GO
IF OBJECT_ID('[dbo].[usp_MemberReviewDelete]') IS NOT NULL
BEGIN 
    DROP PROC [dbo].[usp_MemberReviewDelete] 
END 
GO
CREATE PROC [dbo].[usp_MemberReviewDelete] 
    @mr_id bigint
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[MemberReview]
	WHERE  [mr_id] = @mr_id

	COMMIT
GO

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

