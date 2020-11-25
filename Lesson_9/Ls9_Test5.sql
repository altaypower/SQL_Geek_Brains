
-- Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от 
-- текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Good morning", 
-- с 12:00 до 18:00 функция должна возвращать фразу "Good day", с 18:00 до 00:00 — "Good evning",
--  с 00:00 до 6:00 — "Good night".

DROP FUNCTION IF EXISTS hello;


DELIMITER //

CREATE FUNCTION hello()
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
  CASE
  WHEN  HOUR(NOW()) BETWEEN 6 and 12 THEN RETURN "Good morning";
  WHEN HOUR(NOW()) BETWEEN 12 and 18 THEN RETURN "Good day";
  WHEN HOUR(NOW()) BETWEEN 18 and 00 THEN RETURN "Good evning";
  WHEN HOUR(NOW()) BETWEEN 00 and 6 THEN RETURN "Good night";
  END CASE;
END//

DELIMITER ;

SELECT hello ();

