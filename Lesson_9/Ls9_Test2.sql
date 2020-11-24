-- Создайте представление, которое выводит название name товарной позиции из таблицы products 
-- и соответствующее название каталога name из таблицы catalogs.



SELECT p.name, c.name FROM catalogs c join products p where c.id = p.catalog_id;

CREATE VIEW cat (p_name, c_name) AS SELECT p.name, c.name FROM catalogs c join products p 
where c.id = p.catalog_id;

SELECT * from cat;