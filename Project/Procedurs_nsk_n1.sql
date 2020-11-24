
drop procedure if exists news_apartments;

delimiter //

create procedure news_apartments (your_data DATE)
-- Показывает обновления и новые объявления в день x всех вариантов квартир
begin	
	select * from apartments where DATE(updated_at) = your_data ORDER BY 'type_id';
end//

delimiter ;

CALL news_apartments ('2020-10-19');


drop procedure if exists low_price;

delimiter //

create procedure low_price (x int)
-- Показывает x самых дешевых вариантов квартир
begin	
	select * from apartments ORDER BY price LIMIT x;
end//

delimiter ;

CALL low_price (5);

