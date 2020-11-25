
-- В таблице products есть два текстовых поля: name с названием товара и description с его описанием.
--  Допустимо присутствие обоих полей или одно из них. Ситуация, когда оба поля принимают 
-- неопределенное значение NULL неприемлема. Используя триггеры, добейтесь того, чтобы одно из этих
-- полей или оба поля были заполнены. При попытке присвоить полям NULL-значение необходимо отменить
-- операцию.

DROP TRIGGER IF EXISTS name_descript_notnull;


DELIMITER //

CREATE trigger name_descript_notnull before INSERT on products
    for EACH ROW BEGIN 
	    if new.name is null and new.description is null then 
	        SIGNAL SQLSTATE '45000' 
	        SET message_text = 'Name and description dont have insert NULL';
	    end if;
    END//
    
DELIMITER ;
    
    
INSERT  into products (name, description) values (NULL, NULL);


DROP TRIGGER IF EXISTS name_descript_notnull_update;

DELIMITER //

CREATE trigger name_descript_notnull_update before UPDATE on products
    for EACH ROW BEGIN 
	    if new.name is null and new.description is null then 
	        SIGNAL SQLSTATE '45000' 
	        SET message_text = 'Name and description dont have update NULL';
	    end if;
    END//
    
DELIMITER ;


UPDATE shop.products
SET name= NULL, description= NULL WHERE id=1;


