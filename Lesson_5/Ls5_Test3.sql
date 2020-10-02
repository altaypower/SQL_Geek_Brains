-- В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются   запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако нулевые запасы должны выводиться в конце, после всех 

CREATE DATABASE IF NOT EXISTS shop
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_bin;
;

USE shop;

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

insert into storehouses_products (id, storehouse_id, product_id, value) values (1, 1, 1, 68);
insert into storehouses_products (id, storehouse_id, product_id, value) values (2, 2, 2, 43);
insert into storehouses_products (id, storehouse_id, product_id, value) values (3, 3, 3, 87);
insert into storehouses_products (id, storehouse_id, product_id, value) values (4, 4, 4, 36);
insert into storehouses_products (id, storehouse_id, product_id, value) values (5, 5, 5, 53);
insert into storehouses_products (id, storehouse_id, product_id, value) values (6, 6, 6, 38);
insert into storehouses_products (id, storehouse_id, product_id, value) values (7, 7, 7, 0);
insert into storehouses_products (id, storehouse_id, product_id, value) values (8, 8, 8, 8);
insert into storehouses_products (id, storehouse_id, product_id, value) values (9, 9, 9, 94);
insert into storehouses_products (id, storehouse_id, product_id, value) values (10, 10, 10, 37);
insert into storehouses_products (id, storehouse_id, product_id, value) values (11, 11, 11, 19);
insert into storehouses_products (id, storehouse_id, product_id, value) values (12, 12, 12, 98);
insert into storehouses_products (id, storehouse_id, product_id, value) values (13, 13, 13, 65);
insert into storehouses_products (id, storehouse_id, product_id, value) values (14, 14, 14, 74);
insert into storehouses_products (id, storehouse_id, product_id, value) values (15, 15, 15, 16);
insert into storehouses_products (id, storehouse_id, product_id, value) values (16, 16, 16, 60);
insert into storehouses_products (id, storehouse_id, product_id, value) values (17, 17, 17, 12);
insert into storehouses_products (id, storehouse_id, product_id, value) values (18, 18, 18, 23);
insert into storehouses_products (id, storehouse_id, product_id, value) values (19, 19, 19, 87);
insert into storehouses_products (id, storehouse_id, product_id, value) values (20, 20, 20, 0);
insert into storehouses_products (id, storehouse_id, product_id, value) values (21, 21, 21, 98);
insert into storehouses_products (id, storehouse_id, product_id, value) values (22, 22, 22, 1);
insert into storehouses_products (id, storehouse_id, product_id, value) values (23, 23, 23, 20);
insert into storehouses_products (id, storehouse_id, product_id, value) values (24, 24, 24, 4);
insert into storehouses_products (id, storehouse_id, product_id, value) values (25, 25, 25, 7);
insert into storehouses_products (id, storehouse_id, product_id, value) values (26, 26, 26, 83);
insert into storehouses_products (id, storehouse_id, product_id, value) values (27, 27, 27, 91);
insert into storehouses_products (id, storehouse_id, product_id, value) values (28, 28, 28, 56);
insert into storehouses_products (id, storehouse_id, product_id, value) values (29, 29, 29, 67);
insert into storehouses_products (id, storehouse_id, product_id, value) values (30, 30, 30, 46);
insert into storehouses_products (id, storehouse_id, product_id, value) values (31, 31, 31, 79);
insert into storehouses_products (id, storehouse_id, product_id, value) values (32, 32, 32, 50);
insert into storehouses_products (id, storehouse_id, product_id, value) values (33, 33, 33, 62);
insert into storehouses_products (id, storehouse_id, product_id, value) values (34, 34, 34, 0);
insert into storehouses_products (id, storehouse_id, product_id, value) values (35, 35, 35, 50);
insert into storehouses_products (id, storehouse_id, product_id, value) values (36, 36, 36, 66);
insert into storehouses_products (id, storehouse_id, product_id, value) values (37, 37, 37, 3);
insert into storehouses_products (id, storehouse_id, product_id, value) values (38, 38, 38, 9);
insert into storehouses_products (id, storehouse_id, product_id, value) values (39, 39, 39, 72);
insert into storehouses_products (id, storehouse_id, product_id, value) values (40, 40, 40, 17);
insert into storehouses_products (id, storehouse_id, product_id, value) values (41, 41, 41, 79);
insert into storehouses_products (id, storehouse_id, product_id, value) values (42, 42, 42, 32);
insert into storehouses_products (id, storehouse_id, product_id, value) values (43, 43, 43, 22);
insert into storehouses_products (id, storehouse_id, product_id, value) values (44, 44, 44, 69);
insert into storehouses_products (id, storehouse_id, product_id, value) values (45, 45, 45, 13);
insert into storehouses_products (id, storehouse_id, product_id, value) values (46, 46, 46, 29);
insert into storehouses_products (id, storehouse_id, product_id, value) values (47, 47, 47, 18);
insert into storehouses_products (id, storehouse_id, product_id, value) values (48, 48, 48, 92);
insert into storehouses_products (id, storehouse_id, product_id, value) values (49, 49, 49, 96);
insert into storehouses_products (id, storehouse_id, product_id, value) values (50, 50, 50, 18);

(SELECT id, storehouse_id, product_id, value, created_at, updated_at
FROM storehouses_products WHERE value <> 0 ORDER BY value)
UNION ALL
(SELECT id, storehouse_id, product_id, value, created_at, updated_at
FROM storehouses_products WHERE value = 0);


