CREATE TABLE IF NOT EXISTS mydb.Student_History
(
    history_id   INT          NOT NULL AUTO_INCREMENT,
    student_id   INT          NOT NULL,
    change_time  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data         VARCHAR(255) NOT NULL,
    PRIMARY KEY (history_id)
);

-- AFTER UPDATE

CREATE TRIGGER after_student_update
AFTER UPDATE ON mydb.Student
FOR EACH ROW
BEGIN
    INSERT INTO mydb.Student_History(student_id, data) VALUES (NEW.student_id, CONCAT('Updated student ', NEW.first_name, ' ', NEW.last_name));
END;
