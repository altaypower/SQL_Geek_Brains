-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.


select * from users where id in (select DISTINCT  user_id  from orders);









