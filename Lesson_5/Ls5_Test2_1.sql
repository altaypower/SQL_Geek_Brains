-- Подсчитайте средний возраст пользователей в таблице users.

CREATE DATABASE IF NOT EXISTS shop
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_bin;
;

USE shop;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(50),
  updated_at VARCHAR(50)
) COMMENT = 'Покупатели';

INSERT INTO shop.users (name, birthday_at, created_at, updated_at) VALUES
  ('Gennady', '1990-10-05', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Nata', '1984-11-12', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Alexandr', '1985-05-20', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Serj', '1988-02-14', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Ivan', '1998-01-12', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Mary', '1992-08-29', '20.10.2017 8:10', '20.10.2017 8:10');
 
 
 SELECT AVG(2020 - SUBSTRING(birthday_at, 1, 4)) as age FROM users;
