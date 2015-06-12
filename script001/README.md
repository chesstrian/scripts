Script 001
==========

This script written in PHP, takes a csv file and returns a sql file for MySQL.

CSV Example:

```csv
"field1","field2"
"row 11","row 12"
"row 21","row 22"
```

```sh
php main.php file.csv table file.sql
```
**Output:** _On file.sql_

```sql
-- Run queries to insert.
INSERT INTO table (`field1`,`field2`) VALUES ('row 11','row 12');
INSERT INTO table (`field1`,`field2`) VALUES ('row 21','row 22');
```
