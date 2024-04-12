CREATE TABLE IF NOT EXISTS mydb.Student_Presentation_Count
(
    student_id   INT NOT NULL,
    presentation_count INT NOT NULL,
    PRIMARY KEY (student_id),
    CONSTRAINT Student_Presentation_Count_fk0
        FOREIGN KEY (student_id)
            REFERENCES mydb.Student (student_id)
);

-- AFTER INSERT
CREATE TRIGGER after_student_presentation_insert
AFTER INSERT ON mydb.Student_Presentation
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM mydb.Student_Presentation_Count WHERE student_id = NEW.student) > 0 THEN
        UPDATE mydb.Student_Presentation_Count SET presentation_count = presentation_count + 1 WHERE student_id = NEW.student;
    ELSE
        INSERT INTO mydb.Student_Presentation_Count(student_id, presentation_count) VALUES (NEW.student, 1);
    END IF;
END;