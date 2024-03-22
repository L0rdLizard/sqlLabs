SELECT AVG(num_presentations) AS avg_presentations
FROM (
    SELECT COUNT(p.presentation_id) AS num_presentations
    FROM mydb.Student s
    JOIN mydb.Group g ON s.group_id = g.group_id
    JOIN mydb.Institute i ON g.Institute_id = i.id
    JOIN mydb.Student_Presentation sp ON s.student_id = sp.student
    JOIN mydb.Presentation p ON sp.presentation = p.presentation_id
    WHERE i.name = 3
    GROUP BY s.student_id
) AS student_presentations


-- Среднее количество докладов, сделанных студентами третьего института на конференциях