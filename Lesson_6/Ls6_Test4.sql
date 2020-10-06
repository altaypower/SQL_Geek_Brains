-- Определить кто больше поставил лайков (всего) - мужчины или женщины?


SELECT user_id, COUNT(*) 'likes' from likes_posts lp  group by user_id; 

SELECT id, gender FROM  users u where `gender` = 'm';

SELECT COUNT(*) FROM (SELECT COUNT(*) 'likes' 
    from likes_posts lp where user_id in (SELECT * from ((SELECT id, gender FROM  users u 
        where gender = 'm')) as man group by user_id);
