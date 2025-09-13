-- drop table DimBook;

-- select * from DimBook;

select  
	bok.book_id, 
	bok.title,
	pub.publisher_id,
	pub.publisher_name,
	blang.language_id,
	blang.language_code,
	blang.language_name,

	bok.num_pages,
	bok.isbn13, 	 
	bok.publication_date
	

from book bok  join book_language blang ON bok.language_id = blang.language_id
			   join publisher pub on bok.publisher_id = pub.publisher_id;


CREATE TABLE DimBook(
			book_Key	  INT PRIMARY KEY NOT NULL IDENTITY(1,1),
			book_BK		  INT, 
			Title		  VARCHAR(400),
			PublisherId   INT,
			PublisherName VARCHAR(400),
			LanguageId    INT,
			LanguageCode  VARCHAR(8),
			LanguageName  VARCHAR(50),
			NumPages	  INT, 
			Isbn13		  VARCHAR(13), 
			PublicationDate	DATETIME

			,source_system_code TINYINT NOT NULL
			,start_date    DATETIME
			,end_date    DATETIME
			,is_current TINYINT NOT NULL
)

