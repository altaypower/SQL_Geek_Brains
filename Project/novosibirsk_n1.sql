-- база данных сайта новосибирской недвижимости
DROP DATABASE IF EXISTS novosibirsk_n1;
CREATE DATABASE IF NOT EXISTS novosibirsk_n1;

USE novosibirsk_n1;

DROP TABLE IF EXISTS realty;
CREATE TABLE realty (
  id int(2) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
) DEFAULT CHARSET=utf8mb4 COMMENT 'Тип недвижимости';


DROP TABLE IF EXISTS rooms;
CREATE TABLE rooms (
  id int(1) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
) DEFAULT CHARSET=utf8mb4 COMMENT = 'Количество комнат';

DROP TABLE IF EXISTS district;
CREATE TABLE district (
  id int(4) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
) DEFAULT CHARSET=utf8mb4 COMMENT = 'Район';

DROP TABLE IF EXISTS metro;
CREATE TABLE metro (
  id int(3) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
) DEFAULT CHARSET=utf8mb4 COMMENT = 'Ближайшая станция метро';

DROP TABLE IF EXISTS microdistrict;
CREATE TABLE microdistrict (
  id bigint(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
) DEFAULT CHARSET=utf8mb4 COMMENT = 'Микрорайон';


DROP TABLE IF EXISTS streets;
CREATE TABLE streets (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100)
) DEFAULT CHARSET=utf8mb4 COMMENT = 'Улицы';

DROP TABLE IF EXISTS bathroom_unit;
CREATE TABLE bathroom_unit (
  id int(2) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
) DEFAULT CHARSET=utf8mb4 COMMENT = 'Тип санузла';


DROP TABLE IF EXISTS material;
CREATE TABLE material (
  id int(2) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
) DEFAULT CHARSET=utf8mb4 COMMENT = 'Материал стен';


DROP TABLE IF EXISTS hometype;
CREATE TABLE hometype (
  id int(2) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
) DEFAULT CHARSET=utf8mb4 COMMENT = 'Тип дома';


DROP TABLE IF EXISTS layout;
CREATE TABLE layout (
  id int(2) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
) DEFAULT CHARSET=utf8mb4 COMMENT = 'Планировка';

DROP TABLE IF EXISTS type_apartment;
CREATE TABLE type_apartment (
  id int(2) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
) DEFAULT CHARSET=utf8mb4 COMMENT = 'Тип квартиры';


DROP TABLE IF EXISTS type_owner;
CREATE TABLE type_owner (
  id int(2) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
) DEFAULT CHARSET=utf8mb4 COMMENT = 'Тип пользователя сайта';


DROP TABLE IF EXISTS owner;
CREATE TABLE owner (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  adress VARCHAR(100) DEFAULT NULL,
  phone bigint(20) unsigned DEFAULT NULL,
  email varchar(120) DEFAULT NULL,
  site varchar(120) DEFAULT NULL,
  type_owner_id int(2) unsigned NOT NULL,
  `description` text,
  `pass` varchar(120) DEFAULT NULL,
  created_at DATE,
  FOREIGN KEY (type_owner_id) REFERENCES type_owner (id)
) DEFAULT CHARSET=utf8mb4 COMMENT = 'Пользователи сайта';


DROP TABLE IF EXISTS apartments;
CREATE TABLE apartments (
  id bigint(20) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title varchar(200) DEFAULT NULL COMMENT 'Заголовок',
  district_id int(4) unsigned NOT NULL COMMENT 'Район',
  microdistrict_id bigint(10) unsigned NOT NULL COMMENT 'Микрорайон',
  is_suburb int(1) unsigned DEFAULT '0' COMMENT 'Пригород',
  realty_id int(2) unsigned NOT NULL COMMENT 'Тип недвижимости',
  type_id int(1) unsigned NOT NULL COMMENT 'Количество комнат',
  price bigint(20) COMMENT 'Цена',
  is_new INT(1) unsigned DEFAULT '0' COMMENT 'Новостройка',
  constr_year INT(4) unsigned DEFAULT NULL COMMENT 'Год постройки/сдачи',
  quarter_of_delivery INT(1) unsigned DEFAULT NULL COMMENT 'Квартал сдачи',
  material_id int(2) unsigned NOT NULL COMMENT 'Материал стен',
  hometype_id int(2) unsigned NOT NULL COMMENT 'Тип дома',
  area int(4) unsigned DEFAULT NULL COMMENT 'Площадь квартиры',
  liv_area int(4) unsigned DEFAULT NULL COMMENT 'Жилая площадь квартиры',
  kich_area int(4) unsigned DEFAULT NULL COMMENT 'Площадь кухни',
  is_balcon INT(1) unsigned DEFAULT '0' COMMENT 'Балкон или лоджия',
  layout_id int(2) unsigned NOT NULL COMMENT 'Планировка',
  bathroom_unit_id int(2) unsigned NOT NULL COMMENT 'Тип санузла',
  type_apartment_id int(2) unsigned NOT NULL COMMENT 'Тип квартиры',
  flr INT(2) unsigned DEFAULT NULL COMMENT 'Этаж',
  last_floor INT(2) unsigned DEFAULT NULL COMMENT 'Этажность',
  owner_id bigint(20) unsigned NOT NULL COMMENT 'Владелец объявления',
  name varchar(50) DEFAULT NULL COMMENT 'Контактное лицо владельца объявления',
  phone bigint(20) DEFAULT NULL,
  email varchar(120) DEFAULT NULL,
  street_id bigint(20) unsigned NOT NULL,
  house varchar(100) DEFAULT NULL COMMENT 'Номер дома',
  description TEXT COMMENT 'Описание',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (`realty_id`) REFERENCES `realty` (`id`),
  FOREIGN KEY (`district_id`) REFERENCES `district` (`id`),
  FOREIGN KEY (`microdistrict_id`) REFERENCES `microdistrict` (`id`),
  FOREIGN KEY (`type_id`) REFERENCES `rooms` (`id`),
  FOREIGN KEY (`material_id`) REFERENCES `material` (`id`),
  FOREIGN KEY (`hometype_id`) REFERENCES `hometype` (`id`),
  FOREIGN KEY (`layout_id`) REFERENCES `layout` (`id`),
  FOREIGN KEY (`type_apartment_id`) REFERENCES `type_apartment` (`id`),
  FOREIGN KEY (`owner_id`) REFERENCES `owner` (`id`),
  FOREIGN KEY (`street_id`) REFERENCES `streets` (`id`),
  FOREIGN KEY (`bathroom_unit_id`) REFERENCES `bathroom_unit` (`id`)
) DEFAULT CHARSET=utf8mb4 COMMENT 'Квартиры';


DROP TABLE IF EXISTS `apartments_metro`;
CREATE TABLE `apartments_metro` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `apartments_id` bigint(20) unsigned NOT NULL,
  `metro_id` int(2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`apartments_id`) REFERENCES `apartments` (`id`),
  FOREIGN KEY (`metro_id`) REFERENCES `metro` (`id`)
) DEFAULT CHARSET=utf8mb4 COMMENT 'Промежуточная таблица между квартирами и станциями метро';


DROP TABLE IF EXISTS apartments_maps;
CREATE TABLE apartments_maps (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `apartments_id` bigint(20) unsigned NOT NULL,
  `filename` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  FOREIGN KEY (`apartments_id`) REFERENCES `apartments` (`id`)
) DEFAULT CHARSET=utf8mb4 COMMENT = 'Схемы квартир';

DROP TABLE IF EXISTS apartments_photos;
CREATE TABLE `apartments_photos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `apartments_id` bigint(20) unsigned NOT NULL,
  `filename` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  FOREIGN KEY (`apartments_id`) REFERENCES `apartments` (`id`)
) DEFAULT CHARSET=utf8mb4 COMMENT = 'Фото квартир';



DROP TABLE IF EXISTS messages;
CREATE TABLE `messages` (
    `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
    `from_owner_id` bigint(20) unsigned NOT NULL,
    `to_owner_id` bigint(20) unsigned NOT NULL,
    `body` text COLLATE utf8_unicode_ci DEFAULT NULL,
    `is_read` tinyint(1) DEFAULT 0,
    `created_at` datetime DEFAULT current_timestamp(),
     PRIMARY KEY (`id`),
     FOREIGN KEY (`from_owner_id`) REFERENCES `owner` (`id`),
     FOREIGN KEY (`to_owner_id`) REFERENCES `owner` (`id`)
) DEFAULT CHARSET=utf8 COMMENT = 'Мессенджер';



DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  table_name VARCHAR(255) COMMENT 'Название таблицы',
  table_id int COMMENT 'Иентификатор первичного ключа',
  name VARCHAR(255) COMMENT 'Содержимое поля name') COMMENT = 'Журнал записей в таблице apartments
' ENGINE=Archive;


DROP TABLE IF EXISTS residential_complex;
CREATE TABLE residential_complex (
  id int(3) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description text COMMENT 'Описание'
) DEFAULT CHARSET=utf8mb4 COMMENT 'Жилые комплексы';


DROP TABLE IF EXISTS apartments_residential_complex;
CREATE TABLE `apartments_residential_complex` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `apartments_id` bigint(20) unsigned NOT NULL,
  `residential_complex_id` int(2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`apartments_id`) REFERENCES `apartments` (`id`),
  FOREIGN KEY (`residential_complex_id`) REFERENCES `residential_complex` (`id`)
) DEFAULT CHARSET=utf8mb4 COMMENT 'Промежуточная таблица между жилыми комплексами и квартирами';


