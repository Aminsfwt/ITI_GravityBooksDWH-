-- DROP TABLE FactBookPrice;

-- Create GravityBookDWH

CREATE DATABASE GravityBookDWH;

-- load the date from gravity_book DB into the fact table FactBook  
SELECT  
	d.DateSK,
	ord.order_id,
	ord.order_date,
	ship.method_id,
	bk.book_id,
	cust.customer_id,

	line.price,
	ship.cost

FROM cust_order ord
	 LEFT JOIN order_line line ON ord.order_id = LINE.order_id
	 LEFT JOIN shipping_method ship ON ord.shipping_method_id = ship.method_id 
	 LEFT JOIN book bk ON line.book_id = bk.book_id
	 LEFT JOIN customer cust ON ord.customer_id = cust.customer_id;

-----------------------------------------------------------------------------------------

-- CREATE THE FACT TABLE FactBookPrice

CREATE TABLE FactBookPrice (
		FactBook_SK      INT PRIMARY KEY NOT NULL IDENTITY(1,1),
		Order_BK		 INT,
		OrderDate		 datetime NOT NULL,

		Date_SK		     INT,
		customer_SK		 INT NOT NULL,
		book_SK		     INT NOT NULL,
		ShipMethod_SK    INT NOT NULL,

		FactPrice        DECIMAL(5, 2),
		FactShipCost     DECIMAL(6, 2),

		Created_at       DATETIME

)
		
	


