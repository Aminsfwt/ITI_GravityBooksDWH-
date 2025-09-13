
-- Load Data into Dimension DIM_shipping_method

select 
	method_id,
	method_name
from shipping_method;

----------------------------------------------------------------------------

-- Create Dimension Book into DWH

CREATE TABLE DimShippingMethod(
			ShipMethod_SK INT PRIMARY KEY NOT NULL IDENTITY(1,1),
			method_BK	  INT,
			MethodName	  VARCHAR(100)

			,source_system_code TINYINT NOT NULL
			,start_date    DATETIME
			,end_date    DATETIME
			,is_current TINYINT NOT NULL

)