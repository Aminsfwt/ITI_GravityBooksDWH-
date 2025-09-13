
-- Load Data into SubDimAuthor;

select	
	author_id,
	author_name		
from author;

----------------------------------------------------------------------------

-- Create Dimension SubDimAuthor into DWH

CREATE TABLE SubDimAuthor(
		Author_Key		INT PRIMARY KEY NOT NULL IDENTITY(1,1),
		author_BK	    INT,
		AuthorName      nvarchar(400)
		
		,source_system_code TINYINT NOT NULL
)
