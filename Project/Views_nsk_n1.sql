
-- Представление показывает основные характеристики 1-комнатных квартир в новостройах
CREATE OR REPLACE VIEW new_1_room AS SELECT id, title, price,constr_year, quarter_of_delivery, 
material_id, area, flr, last_floor, owner_id FROM  apartments
where type_id = 2 and is_new = 1;

SELECT * FROM new_1_room;


-- Представление, показывающее варианты квартир в ЖК "Венеция"
CREATE OR REPLACE VIEW rc_venecia AS SELECT id, title, price,constr_year, quarter_of_delivery, 
material_id, area, flr, last_floor, owner_id FROM  apartments
where id in (SELECT apartments_id FROM  apartments_residential_complex where residential_complex_id = 1) ORDER BY area;

SELECT * FROM rc_venecia;

-- То же самое через join
CREATE OR REPLACE VIEW rc_venecia2 AS SELECT apartments.id, title, price,constr_year, 
quarter_of_delivery, material_id, area, flr, last_floor, owner_id FROM  apartments 
join apartments_residential_complex on apartments.id = 
apartments_residential_complex.apartments_id and residential_complex_id = 1 ORDER BY area;

SELECT * FROM rc_venecia2;


-- Представление, показывающее варианты квартир в ЖК ""Расцветай" на Мaркса"
CREATE OR REPLACE VIEW rascvetai_na_marksa AS SELECT id, title, price,constr_year, quarter_of_delivery, 
material_id, area, flr, last_floor, owner_id FROM  apartments
where id in (SELECT apartments_id FROM  apartments_residential_complex where residential_complex_id = 2) ORDER BY area;

SELECT * FROM rascvetai_na_marksa;


