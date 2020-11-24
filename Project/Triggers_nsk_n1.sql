
drop trigger if exists new_record_apartments;

delimiter //

CREATE trigger new_record_apartments after INSERT on apartments
for each ROW 
BEGIN 
	INSERT INTO logs (table_name, table_id, title) VALUES
	('apartments', new.id, new.title);    
END// COMMENT = 'Триггер фиксации в журнал записей новой вставки в таблицу apartments'

delimiter ;

INSERT INTO apartments (title, district_id, microdistrict_id, is_suburb, realty_id, type_id, price,
is_new, constr_year, quarter_of_delivery, material_id, hometype_id, area, liv_area, kich_area, is_balcon, 
layout_id, bathroom_unit_id, type_apartment_id, flr, last_floor, owner_id, name, phone, email,
 street_id, house, description) VALUES
 ('продам 2-к, Гоголя, 205/2', 1, 7, 0, 1, 3, 8950000, 1, 2020, 4, 4, 8, 44, 29, 6, 1, 1, 3, 7, 4,
 5, 13, 'Ольга Николаевна', 79138932184, '1@12.ru', 1, '64', 'Квартира на удобном четвертом этаже. Продается в 
связи с переездом. Сделан ремонт в сан узле. Дом расположен во дворах.Комнаты изолированные, на две 
стороны. Состояние хорошее');



drop trigger if exists delete_record_apartments;

delimiter //

CREATE trigger delete_record_apartments after DELETE FROM novosibirsk_n1.apartments
for each ROW 
BEGIN 
    DELETE FROM logs WHERE id=old.id;
END// 
-- COMMENT = 'Триггер фиксации в журнал записей удаления из таблицы apartments'

delimiter ;


DELETE FROM novosibirsk_n1.apartments WHERE price=8950000;



drop trigger if exists record_apartments_is_new;

delimiter //

CREATE trigger record_apartments_is_new after INSERT on apartments
for each ROW 
BEGIN
	IF new.constr_year >= 2020 THEN
    UPDATE apartments
    SET new.is_new = 1;
  END IF;   
END// 
-- COMMENT = 'Триггер фиксации в apartments_is_new значение раное 1, если эта квартира в новостройке'

delimiter ;

INSERT INTO apartments (title, district_id, microdistrict_id, is_suburb, realty_id, type_id, price,
is_new, constr_year, quarter_of_delivery, material_id, hometype_id, area, liv_area, kich_area, is_balcon, 
layout_id, bathroom_unit_id, type_apartment_id, flr, last_floor, owner_id, name, phone, email,
 street_id, house, description) VALUES
 ('продам 2-к, Гоголя, 205/2', 1, 7, 0, 1, 3, 8950000, 1, 2020, 4, 4, 8, 44, 29, 6, 1, 1, 3, 7, 5,
 5, 13, 'Ольга Николаевна', 79138932184, '1@12.ru', 1, '64', 'Квартира на удобном четвертом этаже. Продается в 
связи с переездом. Сделан ремонт в сан узле. Дом расположен во дворах.Комнаты изолированные, на две 
стороны. Состояние хорошее');
