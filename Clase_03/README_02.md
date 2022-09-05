## CREATE VIEW

To create a new view in SQL Server, you use the CREATE VIEW statement as shown below:

```sql
CREATE OR REPLACE VIEW `ejemplos`.`alumnos_vw` 
AS
    SELECT `ejemplos`.`alumnos_vw`.`legajo`
    WHERE `legajo` > 1500;
```

In this syntax:

First, specify the name of the view after the CREATE VIEW keywords. The schema_name is the name of the schema to which the view belongs.
Second, specify a SELECT statement (select_statement) that defines the view after the AS keyword. The SELECT statement can refer to one or more tables.
If you don’t explicitly specify a list of columns for the view, SQL Server will use the column list derived from the SELECT statement.

In case you want to redefine the view e.g., adding more columns to it or removing some columns from it, you can use the OR ALTER keywords after the CREATE VIEW keywords.

Example:
The following statement creates a view named daily_sales based on the orders, order_items, and products tables:
```sql
CREATE VIEW sales.daily_sales
AS
SELECT
    year(order_date) AS y,
    month(order_date) AS m,
    day(order_date) AS d,
    p.product_id,
    product_name,
    quantity * i.list_price AS sales
FROM
    sales.orders AS o
INNER JOIN sales.order_items AS i
    ON o.order_id = i.order_id
INNER JOIN production.products AS p
    ON p.product_id = i.product_id;
```