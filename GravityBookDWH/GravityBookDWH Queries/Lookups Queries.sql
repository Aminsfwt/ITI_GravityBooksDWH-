-- Fact Book Lookups

select customer_key, customer_bk from DimCustomer;

select book_key, book_bk from DimBook;

select ShipMethod_SK, method_bk from DimShippingMethod;

select cust_order_SK, OrderID from DimCustOrder;

select DateSK, Date from DimDate;

--------------------------------------------------------------------------
-- Fact TimeLine Lookups

select customer_key, customer_bk from DimCustomer;

select ShipMethod_SK, method_bk from DimShippingMethod;

select status_SK, StatusID_BK from DimStatus