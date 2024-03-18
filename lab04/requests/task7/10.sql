SELECT name,
CASE
    WHEN TIMESTAMPDIFF(YEAR, bd_date, CURDATE()) < 7 THEN 'дети'
    WHEN TIMESTAMPDIFF(YEAR, bd_date, CURDATE()) BETWEEN 7 AND 18 THEN 'школьники'
    ELSE 'взрослые'
END as AgeCategory
FROM Reader_ticket;
