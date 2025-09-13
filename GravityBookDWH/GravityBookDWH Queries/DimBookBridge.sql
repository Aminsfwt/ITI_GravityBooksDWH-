
-- Create Dimension Book_Bridge into DWH

CREATE TABLE Book_Bridge(
		boo_bridge_SK int identity(1,1) not null,
		book_BK int,
		author_BK int
)