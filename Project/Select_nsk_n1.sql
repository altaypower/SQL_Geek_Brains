
-- сбросил sql_mode
SET sql_mode = '';


-- поиск вариантов в Ленинском районе с ценой в пределах 1560000 - 3800000 рублей с общей площадью
--  в пределах 33 - 70 кв. м сгруппированных по количеству комнат в квартирах.
SELECT * FROM novosibirsk_n1.apartments where district_id = 6 
and 1500000 < price < 3800000 and 33 < area < 70 GROUP BY type_id;


-- Поиск вариантов в районе метро "Площадь Маркса" сгруппированных по количеству комнат в квартире.
SELECT * FROM novosibirsk_n1.apartments where id in 
(SELECT apartments_id FROM novosibirsk_n1.apartments_metro WHERE metro_id = 1) ORDER BY type_id;
-- то же самое через join
SELECT * FROM novosibirsk_n1.apartments join novosibirsk_n1.apartments_metro on novosibirsk_n1.apartments.id = 
novosibirsk_n1.apartments_metro.apartments_id and novosibirsk_n1.apartments_metro.metro_id = 1;



-- Поиск самых активных пользователей
SELECT * FROM
(SELECT owner_id, SUM(s) as a FROM 
(SELECT owner_id, COUNT(*) as s FROM novosibirsk_n1.apartments GROUP BY owner_id
UNION 
SELECT from_owner_id, COUNT(*)*0.15 FROM novosibirsk_n1.messages m GROUP BY from_owner_id) as tbl
GROUP BY owner_id) as tbl2 ORDER BY a DESC;






