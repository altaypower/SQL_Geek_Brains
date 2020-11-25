
-- Пусть имеется таблица с календарным полем created_at. В ней размещены разряженые календарные з
-- аписи за август 2018 года '2018-08-01', '2016-08-04', '2018-08-16' и 2018-08-17. Составьте 
-- запрос, который выводит полный список дат за август, выставляя в соседнем поле значение 1, 
-- если дата присутствует в исходном таблице и 0, если она отсутствует.

DROP TABLE IF EXISTS logs;

CREATE TABLE `logs` (
  `id` SERIAL PRIMARY KEY,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `num` int (5) DEFAULT NULL COMMENT 'Содержимое поля name'
);

INSERT into logs (created_at, num) VALUES
('2018-08-01', 1),
('2016-08-04', 2),
('2018-08-16', 3),
('2018-08-17', 4);

DROP TABLE IF EXISTS days;


CREATE TABLE days (
day int);

INSERT into days VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12), (13), (14), (15),
(16), (17), (18), (19), (20), (21), (22), (23), (24), (25), (26), (27), (28), (29), (30);

SELECT DATE( DATE('2018-08-31') - INTERVAL days.day DAY) as day FROM  days ORDER BY day;

SELECT 
   DATE( DATE('2018-08-31') - INTERVAL days.day DAY) as day,
   NOT ISNULL(logs.num) as lgs
   FROM  days
left join logs
on DATE( DATE('2018-08-31') - INTERVAL days.day DAY) = logs.created_at;



