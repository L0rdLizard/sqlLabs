SELECT s.first_name, s.last_name
FROM mydb.Student s
JOIN mydb.Group g ON s.group_id = g.group_id
JOIN mydb.Institute i ON g.Institute_id = i.id
LEFT JOIN mydb.Student_Presentation sp ON s.student_id = sp.student
WHERE i.name = 4 AND sp.student IS NULL

-- Студентов четвертого института, не выступавших на конференциях