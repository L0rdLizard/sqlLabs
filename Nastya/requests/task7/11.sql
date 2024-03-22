SELECT p.title,
CASE
    WHEN COUNT(sp.student) = 1 THEN 'соло-авторство'
    ELSE 'соавторство'
END AS authorship
FROM mydb.Presentation p
JOIN mydb.Student_Presentation sp ON p.presentation_id = sp.presentation
GROUP BY p.presentation_id


-- Темы докладов с указанием категории «соло-авторство» или «соавторство»