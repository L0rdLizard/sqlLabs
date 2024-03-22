SELECT s.first_name, s.last_name
FROM mydb.Student s
JOIN mydb.Student_Presentation sp ON s.student_id = sp.student
JOIN mydb.Presentation p ON sp.presentation = p.presentation_id
JOIN mydb.Conference_Theme ct ON p.conference_theme_id = ct.conference_theme_id
GROUP BY s.student_id
HAVING COUNT(DISTINCT ct.conference_id) = (SELECT COUNT(*) FROM mydb.Conference)


-- Студентов, выступивших на всех конференциях