CREATE PROCEDURE InsertStudent(IN _first_name VARCHAR(255), IN _last_name VARCHAR(255), IN _group_id INT, IN _course INT, IN _Institute_id INT)
BEGIN
    IF NOT EXISTS (SELECT * FROM mydb.Group WHERE group_id = _group_id) THEN
        INSERT INTO mydb.Group(group_id, course, Institute_id) VALUES (_group_id, _course, _Institute_id);
    END IF;
    INSERT INTO mydb.Student(first_name, last_name, group_id) VALUES (_first_name, _last_name, _group_id);
END


-- вставляется информация о студенте;
-- если указанный номер группы отсутствует в БД, запись добавляется в
-- таблицу с перечнем групп