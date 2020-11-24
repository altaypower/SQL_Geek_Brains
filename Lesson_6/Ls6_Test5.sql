-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.


SELECT count(*) as quontity FROM likes_posts lp where posts_id  in (SELECT id FROM posts p2 
     where user_id in (SELECT * from (SELECT id FROM users u 
     where birthday  is not NULL ORDER BY birthday DESC LIMIT 10) as foo));
