-- Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. 
-- Выведите список рейсов flights с русскими названиями городов.

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  frm VARCHAR(255),
  tu VARCHAR(255)
) COMMENT = 'Рейсы';

INSERT INTO flights (frm, tu) VALUES
('moskow', 'omsk'),
('novgorog', 'kazan'),
('irkutsk', 'moskow'),
('omsk', 'irkutsk'),
('moskow', 'kazan');

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
label VARCHAR(255),
name VARCHAR(255)
) COMMENT = 'Перевод';

INSERT INTO cities VALUES
('moskow', 'Москва'),
('irkutsk', 'Иркутск'),
('novgorog', 'Новгород'),
('kazan', 'Казань'),
('omsk', 'Омск');


select departure.id, departure.name, arrival.name from
(select f.id, c.name from flights as f join cities as c on f.frm = c.label) as departure
join
(select f.id, c.name from flights as f join cities as c on f.tu = c.label) as arrival
on departure.id = arrival.id order by departure.id;

