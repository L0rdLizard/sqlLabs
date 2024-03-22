SELECT DISTINCT p.title
FROM mydb.Presentation p
JOIN mydb.Student_Presentation sp1 ON p.presentation_id = sp1.presentation
JOIN mydb.Student_Presentation sp2 ON p.presentation_id = sp2.presentation
JOIN mydb.Student s1 ON sp1.student = s1.student_id
JOIN mydb.Student s2 ON sp2.student = s2.student_id
JOIN mydb.Group g1 ON s1.group_id = g1.group_id
JOIN mydb.Group g2 ON s2.group_id = g2.group_id
JOIN mydb.Institute i1 ON g1.Institute_id = i1.id
JOIN mydb.Institute i2 ON g2.Institute_id = i2.id
WHERE i1.id <> i2.id

-- Выступления, подготовленные двумя студентами различных институтов