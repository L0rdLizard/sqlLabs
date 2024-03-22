SELECT s1.first_name, s1.last_name, s2.first_name, s2.last_name
FROM mydb.Student s1
JOIN mydb.Student s2 ON s1.student_id < s2.student_id
JOIN mydb.Student_Presentation sp1 ON s1.student_id = sp1.student
JOIN mydb.Student_Presentation sp2 ON s2.student_id = sp2.student
GROUP BY s1.student_id, s2.student_id
HAVING COUNT(DISTINCT sp1.presentation) = COUNT(DISTINCT sp2.presentation)


-- Пары студентов, всегда выступающие вместе