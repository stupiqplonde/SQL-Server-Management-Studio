DECLARE @DT datetime = GetDate()

DECLARE @D date = '2001-09-11'
DECLARE @T time = GetDate()
DECLARE @DT2 datetime2 = SysDateTime() 

DECLARE @DTO datetimeoffset = GetDate()

SELECT @DT