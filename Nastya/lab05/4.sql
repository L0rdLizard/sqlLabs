CREATE PROCEDURE InstituteStatistics()
BEGIN
    CREATE TEMPORARY TABLE IF NOT EXISTS InstituteStats AS
    SELECT
        i.id AS institute_id,
        COUNT(DISTINCT g.group_id) AS total_groups,
        COUNT(DISTINCT s.student_id) AS total_students,
        COUNT(DISTINCT c.conference_id) AS total_conferences
    FROM
        mydb.Institute i
        LEFT JOIN mydb.Group g ON i.id = g.Institute_id
        LEFT JOIN mydb.Student s ON g.group_id = s.group_id
        LEFT JOIN mydb.Student_Presentation sp ON s.student_id = sp.student
        LEFT JOIN mydb.Presentation p ON sp.presentation = p.presentation_id
        LEFT JOIN mydb.Conference_Theme ct ON p.conference_theme_id = ct.conference_theme_id
        LEFT JOIN mydb.Conference c ON ct.conference_id = c.conference_id
    GROUP BY
        i.id;

    SELECT * FROM InstituteStats;
    DROP TABLE InstituteStats;
END

-- для каждого института: количество групп, количество обучающихся студентов, количество конференций
