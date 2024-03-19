SELECT name, bd_date,
CASE
    WHEN TIMESTAMPDIFF(YEAR, bd_date, CURDATE()) < 7 THEN 'дети'
    WHEN TIMESTAMPDIFF(YEAR, bd_date, CURDATE()) BETWEEN 7 AND 18 THEN 'школьники'
    ELSE 'взрослые'
END as AgeCategory
FROM Reader_ticket;

-- читателей, указав их категорию в зависимости от возраста Р менее 7 лет дети,
-- от 7 до 18 лет школьники, старше 18 лет взрослые