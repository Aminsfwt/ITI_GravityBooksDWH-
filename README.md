# GravityBookDWH ETL Project

This project contains SSIS packages for loading and transforming data into a star-schema data warehouse for a book sales and library system. Below are the descriptions for each dimension and fact table, including all columns.

---

## Dimensions

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
