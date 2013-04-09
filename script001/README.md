Script 001
==========

This script written in PHP, takes a csv file and returns a sql file for MySQL.

CSV Example:
"field1","field2"
"row 11","row 12"
"row 21","row 22"

```sh
php main.php file.csv
```
**Output:**

```sql
-- Run queries to insert.
INSERT INTO osdial.osdial_list (`field1`,`field2`) VALUES ('row 11','row 12');
INSERT INTO osdial.osdial_list (`field1`,`field2`) VALUES ('row 21','row 22');
```