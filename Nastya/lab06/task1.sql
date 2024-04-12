-- BEFORE INSERT
CREATE TRIGGER before_student_insert
BEFORE INSERT ON mydb.Student
FOR EACH ROW
BEGIN
    IF NEW.first_name IS NULL OR NEW.last_name IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERROR: Student name cannot be NULL';
    END IF;
END;

-- BEFORE DELETE
CREATE TRIGGER before_student_delete
BEFORE DELETE ON mydb.Student
FOR EACH ROW
BEGIN
    DECLARE presentation_count INT;
    SELECT COUNT(*) INTO presentation_count
    FROM mydb.Student_Presentation
    WHERE student = OLD.student_id;

    IF presentation_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete student, student is still associated with a presentation.';
    END IF;
END;

-- BEFORE UPDATE !
CREATE TRIGGER before_presentation_update
BEFORE UPDATE ON mydb.Presentation
FOR EACH ROW
BEGIN
    IF NEW.title IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERROR: Presentation title cannot be NULL';
    END IF;
END;

-- AFTER INSERT !
CREATE TRIGGER after_presentation_id_theme_insert
AFTER INSERT ON mydb.Presentation_Theme
FOR EACH ROW
BEGIN
    UPDATE mydb.Presentation
    SET title = Presentation.title + '(Updated)'
    WHERE presentation_id = NEW.presentation_id;
END;


-- AFTER DELETE
CREATE TABLE IF NOT EXISTS mydb.Deleted_Records
(
    id            INT AUTO_INCREMENT,
    student_id    INT,
    deleted_at    DATETIME,
    PRIMARY KEY (id)
);

CREATE TRIGGER after_student_delete
AFTER DELETE ON mydb.Student
FOR EACH ROW
BEGIN
    INSERT INTO mydb.Deleted_Records(student_id, deleted_at)
    VALUES (OLD.student_id, NOW());
END;


-- AFTER UPDATE
CREATE TABLE IF NOT EXISTS mydb.Student_Audit
(
    audit_id     INT          NOT NULL AUTO_INCREMENT,
    student_id   INT          NOT NULL,
    old_first_name VARCHAR(255),
    new_first_name VARCHAR(255),
    old_last_name VARCHAR(255),
    new_last_name VARCHAR(255),
    updated_at   TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (audit_id)
);

CREATE TRIGGER after_student_update
AFTER UPDATE ON mydb.Student
FOR EACH ROW
BEGIN
    INSERT INTO mydb.Student_Audit(student_id, old_first_name, new_first_name, old_last_name, new_last_name)
    VALUES (OLD.student_id, OLD.first_name, NEW.first_name, OLD.last_name, NEW.last_name);
END;

