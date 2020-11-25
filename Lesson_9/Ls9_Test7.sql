
-- Напишите хранимую функцию для вычисления произвольного числа Фибоначчи. Числами Фибоначчи
-- называется последовательность в которой число равно сумме двух предыдущих чисел. Вызов функции
-- FIBONACCI(10) должен возвращать число 55.



DROP FUNCTION fibonacci;

DELIMITER //

CREATE FUNCTION fibonacci(num int)
RETURNS int DETERMINISTIC 
    BEGIN 
	    DECLARE sq DOUBLE;
	    SET sq = SQRT(5);
	    RETURN (POW((1 + sq) / 2.0, num) + POW((1 - sq) / 2.0, num)) / sq;
    END//

DELIMITER ;

SELECT  fibonacci(10);
