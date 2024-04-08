CREATE FUNCTION TotalStudents(
)RETURNS INT
    reads sql data
BEGIN
    DECLARE _total INT;
    SELECT COUNT(*) INTO _total FROM mydb.Student;
    RETURN _total;
END

-- возвращает общее число студентов в базн данных