SELECT s.first_name, s.last_name
FROM mydb.Student s
JOIN mydb.Student_Presentation sp ON s.student_id = sp.student
JOIN mydb.Presentation p ON sp.presentation = p.presentation_id
JOIN mydb.Conference_Theme ct ON p.conference_theme_id = ct.conference_theme_id
JOIN mydb.Conference c ON ct.conference_id = c.conference_id
WHERE s.Institute_id = 2 AND c.name = 'IT';

-- студентов второго института, выступавших на конференции по IT