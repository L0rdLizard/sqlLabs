CREATE PROCEDURE DeleteStudent(IN _student_id INT)
BEGIN
    DECLARE _group_id INT;
    SELECT group_id INTO _group_id FROM mydb.Student WHERE student_id = _student_id;
    DELETE FROM mydb.Student WHERE student_id = _student_id;
    IF NOT EXISTS (SELECT * FROM mydb.Student WHERE group_id = _group_id) THEN
        DELETE FROM mydb.Group WHERE group_id = _group_id;
    END IF;
END

-- удаляется информация о студенте;
-- если в его группе нет больше студентов, запись удаляется из таблицы с
-- перечнем групп