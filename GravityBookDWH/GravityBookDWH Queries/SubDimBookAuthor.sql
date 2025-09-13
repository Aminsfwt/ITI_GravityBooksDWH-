
-- Load Data into SubDimBookAuthor;

select
	book_id,	
	author_id		
from book_author;

----------------------------------------------------------------------------

-- Create Dimension Customer into DWH

CREATE TABLE SubDimBookAuthor(
		bookAuthor_Key		INT PRIMARY KEY NOT NULL IDENTITY(1,1),
		author_BK INT,
		BookId  INT
		
		,source_system_code TINYINT NOT NULL
)