-- Выведите список товаров products и разделов catalogs, который соответствует товару.

SELECT  p.id, p.name, c.name FROM  products as p join catalogs as c WHERE  p.catalog_id = c.id;