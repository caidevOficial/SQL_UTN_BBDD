## DROP INDEX statement overview

The ***DROP INDEX*** statement removes one or more indexes from the current database. Here is the syntax of the ***DROP INDEX*** statement:

```sql
DROP INDEX [IF EXISTS] index_name
ON table_name;
```

In this syntax:

First, specify the name of the index that you want to remove after the ***DROP INDEX*** clause.
Second, specify the name of the table to which the index belongs.
Removing a nonexisting index will result in an error. However, you can use the ***IF EXISTS*** option to conditionally drop the index and avoid the error.

Note that the ***IF EXISTS*** option has been available since SQL Server 2016 (13.x).

The ***DROP INDEX*** statement does not remove indexes created by ***PRIMARY KEY*** or ***UNIQUE*** constraints. To drop indexes associated with these constraints, you use the 
***ALTER TABLE DROP CONSTRAINT*** statement.

To remove multiple indexes from one or more tables at the same time, you specify a comma-separated list of index names with the corresponding table names after the DROP INDEX clause as shown in the following query:

```sql
DROP INDEX [IF EXISTS] 
    index_name1 ON table_name1,
    index_name2 ON table_name2,
    ...;
```

* A - Using SQL Server ***DROP INDEX*** to remove one index example
This statement uses the ***DROP INDEX*** statement to remove the ix_cust_email index from the sales.customers table:

```sql
DROP INDEX IF EXISTS ix_cust_email
ON sales.customers;
```
If you check the indexes of the sales.customers table, you will see that the ix_cust_email index was deleted.

* B - Using SQL Server ***DROP INDEX*** to remove multiple indexes example
The following example uses the ***DROP INDEX*** statement to remove the ix_cust_city, ix_cust_fullname indexes from the sales.customers table:

```sql
DROP INDEX 
    ix_cust_city ON sales.customers,
    ix_cust_fullname ON sales.customers;
```