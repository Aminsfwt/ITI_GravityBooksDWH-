# GravityBook Data Warehouse ETL Project

### Project Overview:
Welcome to the Gravity Books Sales ETL and Data Warehouse Project documentation. This initiative aims to transform the existing Gravity Books Sales database into a robust data warehouse, enabling advanced analytics and reporting capabilities. The project involves the use of Extract, Transform, Load (ETL) processes to migrate and transform data, and the implementation of SQL Server Integrated Services (SSIS) to extract data from OLTP Database, transform and load into OLAP galaxy-schema Data warehouse.

Below are the descriptions for each dimension and fact table, including all columns.

---
## Source Database Overview:
Database Information:
Database Type:
  - Relational Database (Microsoft SQL Server). 
  Technology Stack:

  - Microsoft SQL Server (2019)
    SQL Server Management Studio (SSMS) for database management.

## Data Structure:
#### Tables and Entities: 
- data base [HERE](https://github.com/Aminsfwt/ITI_GravityBooksDWH-/tree/main/GravityBookDWH/GravityBookDB)
- Entity Relationship Diagram ![ERD](https://github.com/Aminsfwt/ITI_GravityBooksDWH-/blob/main/GravityBookDWH/Project%20Output/db_erd.png)  

  ## 1- author Table:
    Purpose: Stores information about book authors.
    
    Fields:
    
    author_id: Unique identifier for the author.
    author_name: Name of the author.
    Constraints:
    Primary Key: author_id
    
  ## 2- publisher Table:  
    Purpose: Stores information about book publishers.
    
    Fields:
    publisher_id: Unique identifier for the publisher.
    publisher_name: Name of the publisher.
    Constraints:
    Primary Key: publisher_id
    
  ## 3- book_language Table:

    Purpose: Stores information about book languages.
    
    Fields:
    language_id: Unique identifier for the language.
    language_code: Code representing the language.
    language_name: Name of the language.
    Constraints:
    Primary Key: language_id
    
  ## 4- book Table:

    Purpose: Stores information about books.
    
    Fields:
    book_id: Unique identifier for the book.
    title: Title of the book.
    isbn13: ISBN-13 code of the book.
    language_id: Foreign key referencing book_language table.
    num_pages: Number of pages in the book.
    publication_date: Date when the book was published.
    publisher_id: Foreign key referencing publisher table.
    Constraints:
    Primary Key: book_id
    Foreign Keys: language_id, publisher_id

  ## 5- book_author Table:

Purpose: Represents the many-to-many relationship between books and authors.

    Fields:
    book_id: Foreign key referencing book table.
    author_id: Foreign key referencing author table.
    Constraints:
    Primary Key: Composite key (book_id, author_id)
    Foreign Keys: book_id, author_id

#### Primary Entities and Relationships:
The data structure in the gravity_books database comprises key tables, each representing a specific entity such as authors, publishers, book languages, books, and their relationships.

#### Author-Book Relationship:

The book_author table establishes a many-to-many relationship between books and authors.
Book-Publisher Relationship:

The book table includes a foreign key (publisher_id) referencing the publisher table, establishing a relationship between books and publishers.    

## Data Extraction Methods:
#### Extraction Tools:
SQL Server Integration Services (SSIS) for data extraction.

- Data Modeling ![modeling](https://github.com/Aminsfwt/ITI_GravityBooksDWH-/blob/main/GravityBookDWH/Project%20Output/GravietyBookDWH%20Modeling.png)

## Dimensions SSIS Packages:

### 1. DimBook
- **book_Key**: Surrogate key for the book.
- **book_BK**: Business key for the book.
- **Title**: Book title.
- **PublisherId**: Publisher's ID.
- **PublisherName**: Publisher's name.
- **LanguageId**: Language ID.
- **LanguageCode**: Language code.
- **LanguageName**: Language name.
- **NumPages**: Number of pages.
- **Isbn13**: ISBN-13 code.
- **PublicationDate**: Publication date.
- **source_system_code**: Source system identifier.
- **start_date**: Row start date (SCD2).
- **end_date**: Row end date (SCD2).
- **is_current**: Current row flag (SCD2).

  ![SSIS](https://github.com/Aminsfwt/ITI_GravityBooksDWH-/blob/main/GravityBookDWH/Project%20Output/DimBook.PNG?raw=true)

### 2. DimAuthor
- **Author_Key**: Surrogate key for the author.
- **author_BK**: Business key for the author.
- **AuthorName**: Author's name.
- **source_system_code**: Source system identifier.
- **is_current**: Current row flag (SCD2).

  ![SSIS](https://github.com/Aminsfwt/ITI_GravityBooksDWH-/blob/main/GravityBookDWH/Project%20Output/DimAuthor.PNG?raw=true)



### 3. DimBookAuthor (SubDimBookAuthor)
- **bookAuthor_Key**: Surrogate key for the book-author relationship.
- **BookId**: Book business key.
- **author_BK**: Author business key.
- **source_system_code**: Source system identifier.
  
![SSIS](https://github.com/Aminsfwt/ITI_GravityBooksDWH-/blob/main/GravityBookDWH/Project%20Output/DimBookAuthor.PNG?raw=true)

### 4. DimCustomer
- **Customer_Key**: Surrogate key for the customer.
- **Customer_BK**: Business key for the customer.
- **F_NAME**: First name.
- **L_NAME**: Last name.
- **Email**: Email address.
- **st_num**: Street number.
- **st_nam**: Street name.
- **city_nam**: City name.
- **country**: Country name.
- **stat**: Address status.
- **source_system_code**: Source system identifier.
- **start_date**: Row start date (SCD2).
- **end_date**: Row end date (SCD2).
- **is_current**: Current row flag (SCD2).

![SSIS](https://github.com/Aminsfwt/ITI_GravityBooksDWH-/blob/main/GravityBookDWH/Project%20Output/DimCustomer.PNG?raw=true)



### 5. DimShippingMethod
- **ShipMethod_SK**: Surrogate key for the shipping method.
- **method_BK**: Business key for the shipping method.
- **MethodName**: Shipping method name.
- **source_system_code**: Source system identifier.
- **start_date**: Row start date (SCD2).
- **end_date**: Row end date (SCD2).
- **is_current**: Current row flag (SCD2).

  ![SSIS](https://github.com/Aminsfwt/ITI_GravityBooksDWH-/blob/main/GravityBookDWH/Project%20Output/DimShipping%20Method.PNG?raw=true)

### 6. DimStatus
- **status_SK**: Surrogate key for the status.
- **StatusID_BK**: Business key for the status.
- **StatusValue**: Status description.
- **sorce_system_code**: Source system identifier.
- **start_date**: Row start date (SCD2).
- **end_date**: Row end date (SCD2).
- **is_current**: Current row flag (SCD2).

  ![SSIS](https://github.com/Aminsfwt/ITI_GravityBooksDWH-/blob/main/GravityBookDWH/Project%20Output/DimStatus.PNG?raw=true)

### 7. DimBridge (Book_Bridge)
- **boo_bridge_SK**: Surrogate key for the bridge table.
- **book_BK**: Book business key.
- **author_BK**: Author business key.

  ![SSIS](https://github.com/Aminsfwt/ITI_GravityBooksDWH-/blob/main/GravityBookDWH/Project%20Output/DimBookBridge.PNG?raw=true)

---

## Fact Tables

### 1. FactBookPrice
- **book_key**: Foreign key to DimBook.
- **customer_key**: Foreign key to DimCustomer.
- **cust_order_SK**: Foreign key to DimCustOrder.
- **price**: Book price.
- **order_date**: Date of order.
- **source_system_code**: Source system identifier.

  ![SSIS](https://github.com/Aminsfwt/ITI_GravityBooksDWH-/blob/main/GravityBookDWH/Project%20Output/FactBookPrice.PNG?raw=true)

### 2. FactTimeLine
- **order_id**: Order business key.
- **received**: Date order was received.
- **PendingDelivery**: Date order was pending delivery.
- **DeliveryInProgress**: Date delivery started.
- **delivered**: Date order was delivered.
- **cancelled**: Date order was cancelled.
- **returned**: Date order was returned.
- **customer_id**: Customer business key.
- **method_id**: Shipping method business key.
- **cost**: Shipping cost.
- **status_id**: Status business key.

  ![SSIS](https://github.com/Aminsfwt/ITI_GravityBooksDWH-/blob/main/GravityBookDWH/Project%20Output/FactTimeLine.PNG?raw=true)

---
![Alt text](https://github.com/Aminsfwt/ITI_GravityBooksDWH-/blob/main/GravietyBookDWH%20Modeling.png?raw=true)


#### Data Lineage
 - By supporting Excel for data mapping, the Gravity Books data warehouse promotes transparency, collaboration, and efficiency in managing the mapping process.[excel](https://github.com/Aminsfwt/ITI_GravityBooksDWH-/blob/main/GravityBookDWH/Graviety%20Books%20DWH.xlsx)

   
   ![lineage](https://github.com/Aminsfwt/ITI_GravityBooksDWH-/blob/main/GravityBookDWH/Project%20Output/fact_orders_lineage.png)

## Notes

- All dimension tables use SCD2 (Slowly Changing Dimension Type 2) columns: `start_date`, `end_date`, and `is_current`.
- The bridge and sub-dimension tables support many-to-many relationships (e.g., books and authors).
- The ETL packages use OLEDB connections to source and destination databases.

---

## Usage

- Each SSIS package (.dtsx) loads and transforms data for its respective table.
- For details on package logic, refer to the individual .dtsx files.

---

## License

This project is provided under the MIT License.
