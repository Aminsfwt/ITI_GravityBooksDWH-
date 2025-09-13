
-- Create Dimension Customer into DWH

CREATE TABLE DimStatus(
	status_SK int IDENTITY(1,1) NOT NULL,
	StatusID_BK int NULL,
	StatusValue varchar(20) NULL,

	sorce_system_code tinyint NULL,
	start_date datetime NULL,
	end_date  datetime NULL,
	is_current tinyint NULL
)