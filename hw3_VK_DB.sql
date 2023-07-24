-- Посчитать количество документов у каждого пользователя (doc, docx, html)

USE lesson_4;

SELECT user_id, COUNT(filename) AS documents_number
FROM media
GROUP BY user_id, media_type_id
HAVING media_type_id=4
ORDER BY user_id;


-- Посчитать лайки для документов, которые выложил каждый пользователь (моих медиа)

SELECT m.user_id, CONCAT(u.firstname, " ", u.lastname) AS fullname, COUNT(l.id) AS likes_sum
FROM media AS m
LEFT JOIN likes AS l ON l.media_id=m.id
JOIN users AS u ON u.id=m.user_id
GROUP BY m.user_id;
