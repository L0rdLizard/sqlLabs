SELECT i.name,
CASE
    WHEN COUNT(DISTINCT s.student_id) = 0 THEN 'неактивный институт'
    ELSE GROUP_CONCAT(DISTINCT CONCAT(s.first_name, ' ', s.last_name) SEPARATOR ', ')
END AS students
FROM mydb.Institute i
LEFT JOIN mydb.Group g ON i.id = g.Institute_id
LEFT JOIN mydb.Student s ON g.group_id = s.group_id
LEFT JOIN mydb.Student_Presentation sp ON s.student_id = sp.student
GROUP BY i.id


-- Институты вуза с указанием студентов, принимавших участие в конференциях;
-- если в институте нет таких студентов, то указать «неактивный институт»