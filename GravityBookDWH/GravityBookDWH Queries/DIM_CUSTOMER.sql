-- DROP TABLE DimCustomer;

-- Load Data into Customer Dimension

select 
	cust.customer_id, 
	cust.first_name, 
	cust.last_name, 
	cust.email,
	adrs.street_number, 
	adrs.street_name, 
	adrs.city, 
	cont.country_name, 
	stat.address_status
from customer cust left join customer_address custadd on cust.customer_id = custadd.customer_id
				   left join address adrs on custadd.address_id = adrs.address_id
				   left join country cont on adrs.country_id = cont.country_id
				   left join address_status stat on custadd.status_id = stat.status_id;

----------------------------------------------------------------------------

-- Create Dimension Customer into DWH

CREATE TABLE DimCustomer(
		customer_Key  INT PRIMARY KEY NOT NULL IDENTITY(1,1),
		customer_BK  INT, 
		FirstName	 NVARCHAR(200), 
		LastName	 NVARCHAR(200), 
		Mail		 NVARCHAR(350),
		StreetNum	 NVARCHAR(10), 
		StreetName	 NVARCHAR(200), 
		City		 NVARCHAR(100), 
		CountryName	 NVARCHAR(200),
		AddressStatus NVARCHAR(30)

		,source_system_code TINYINT NOT NULL
		,start_date    DATETIME
		,end_date      DATETIME
		,is_current    TINYINT NOT NULL
)

