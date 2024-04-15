-- BEFORE INSERT
CREATE TRIGGER before_student_insert
    BEFORE INSERT
    ON mydb.Student
    FOR EACH ROW
BEGIN
    IF NEW.first_name IS NULL OR NEW.last_name IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'ERROR: Student name cannot be NULL';
    END IF;
END;

-- BEFORE DELETE
CREATE TRIGGER before_student_delete
    BEFORE DELETE
    ON mydb.Student
    FOR EACH ROW
BEGIN
    DECLARE presentation_count INT;
    SELECT COUNT(*)
    INTO presentation_count
    FROM mydb.Student_Presentation
    WHERE student = OLD.student_id;

    IF presentation_count > 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot delete student, student is still associated with a presentation.';
    END IF;
END;

-- BEFORE UPDATE
CREATE TRIGGER prevent_student_id_update
    BEFORE UPDATE
    ON mydb.Student
    FOR EACH ROW
BEGIN
    IF OLD.student_id != NEW.student_id THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Изменение student_id не разрешено';
    END IF;
END;

-- AFTER INSERT
CREATE TRIGGER after_conference_insert
    BEFORE INSERT
    ON mydb.Conference
    FOR EACH ROW
    SET NEW.name = CONCAT(NEW.name, ' 2024');

-- AFTER DELETE
CREATE TABLE IF NOT EXISTS mydb.Deleted_Records
(
    id         INT AUTO_INCREMENT,
    student_id INT,
    deleted_at DATETIME,
    PRIMARY KEY (id)
);

CREATE TRIGGER after_student_delete
    AFTER DELETE
    ON mydb.Student
    FOR EACH ROW
BEGIN
    INSERT INTO mydb.Deleted_Records(student_id, deleted_at)
    VALUES (OLD.student_id, NOW());
END;


-- AFTER UPDATE
CREATE TABLE IF NOT EXISTS mydb.Student_Audit
(
    audit_id       INT       NOT NULL AUTO_INCREMENT,
    student_id     INT       NOT NULL,
    old_first_name VARCHAR(255),
    new_first_name VARCHAR(255),
    old_last_name  VARCHAR(255),
    new_last_name  VARCHAR(255),
    updated_at     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (audit_id)
);

CREATE TRIGGER after_student_update
    AFTER UPDATE
    ON mydb.Student
    FOR EACH ROW
BEGIN
    INSERT INTO mydb.Student_Audit(student_id, old_first_name, new_first_name, old_last_name, new_last_name)
    VALUES (OLD.student_id, OLD.first_name, NEW.first_name, OLD.last_name, NEW.last_name);
END;

