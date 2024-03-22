SELECT DISTINCT p.title
FROM mydb.Presentation p
JOIN mydb.Student_Presentation sp ON p.presentation_id = sp.presentation
JOIN mydb.Student s ON sp.student = s.student_id
JOIN mydb.Group g ON s.group_id = g.group_id
WHERE g.group_id = 3


-- Темы докладов студентов для заданной группы