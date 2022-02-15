use olist;
show tables;
+-----------------------------------------+
| Tables_in_olist                         |
+-----------------------------------------+
| olist_customers_dataset                 |
| olist_geolocation_dataset               |
| olist_order_items_dataset               |
| olist_order_payments_dataset            |
| olist_order_reviews_dataset             |
| olist_orders_dataset                    |
| olist_product_category_name_translation |
| olist_products_dataset                  |
| olist_sellers_dataset                   |
+-----------------------------------------+

select count(*) from olist_customers_dataset;
+----------+
| count(*) |
+----------+
|    10491 |
+----------+

select count(*) from olist_order_payments_dataset;
+----------+
| count(*) |
+----------+
|    99440 |
+----------+

select count(*) from olist_order_reviews_dataset;
+----------+
| count(*) |
+----------+
|    98024 |
+----------+

select count(*) from olist_orders_dataset;
+----------+
| count(*) |
+----------+
|    96461 |
+----------+

 select count(*) from olist_products_dataset;
+----------+
| count(*) |
+----------+
|    32857 |
+----------+

select count(*) from olist_sellers_dataset;
+----------+
| count(*) |
+----------+
|     2810 |
+----------+

select count(*) from olist_order_items_dataset;
+----------+
| count(*) |
+----------+
|   112655 |
+----------+

select count(*) from olist_geolocation_dataset;
+----------+
| count(*) |
+----------+
|   899006 |
+----------+

select count(*) from olist_product_category_name_translation;
+----------+
| count(*) |
+----------+
|       71 |
+----------+

#export sctructure only:
mysqldump -uroot -proot -h localhost --no-data  olist > olist_structure.sql

#export tables with data:
mysqldump -uroot -proot olist olist_sellers_dataset > olist_sellers_dataset.sql
mysqldump -uroot -proot olist olist_products_dataset > olist_products_dataset.sql
mysqldump -uroot -proot olist olist_order_payments_dataset > olist_order_payments_dataset.sql
mysqldump -uroot -proot olist olist_order_reviews_dataset > olist_order_reviews_dataset.sql
mysqldump -uroot -proot olist olist_orders_dataset > olist_orders_dataset.sql
mysqldump -uroot -proot olist olist_product_category_name_translation > olist_product_category_name_translation.sql
mysqldump -uroot -proot olist olist_customers_dataset > olist_customers_dataset.sql
mysqldump -uroot -proot olist olist_order_items_dataset > olist_order_items_dataset.sql
mysqldump -uroot -proot olist olist_geolocation_dataset > olist_geolocation_dataset.sql

#export table to CSV from mysql command line:
mysql -B -u root -p root olist -h localhost -e "SELECT * FROM olist_sellers_dataset;" \ | sed "s/\"/\"\"/g;s/'/\'/;s/\t/\",\"/g;s/^/\"/;s/$/\"/;s/\n//g" > olist_sellers_dataset.csv

#Import table from SQL file from mysql command line:
mysql -u root -p root -D olist < olist_sellers_dataset.sql
