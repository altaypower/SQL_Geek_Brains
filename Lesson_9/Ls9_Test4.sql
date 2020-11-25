-- Пусть имеется любая таблица с календарным полем created_at. 
-- Создайте запрос, который удаляет устаревшие записи из таблицы, оставляя только 5 самых свежих записей.


DROP TABLE IF EXISTS test4;
CREATE TABLE `test4` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
);


INSERT INTO test4 (created_at) VALUES
('2020-10-08 19:40:16.00'), 
('2020-01-08 19:40:16.00'), 
('2020-10-01 19:40:16.00'),
('2019-10-08 19:40:16.00'), 
('2018-01-08 19:40:16.00'), 
('2017-10-01 19:40:16.00');

SELECT *from test4 order by created_at desc LIMIT 5;