CREATE TABLE IF NOT EXISTS mydb.University
(
    university_id INT          NOT NULL AUTO_INCREMENT,
    name          VARCHAR(255) NOT NULL,
    address       VARCHAR(255) NOT NULL,
    UNIQUE INDEX (university_id ASC) VISIBLE,
    PRIMARY KEY (university_id)
);

CREATE TABLE IF NOT EXISTS mydb.Institute
(
    id            INT NOT NULL AUTO_INCREMENT,
    name          INT NOT NULL,
    university_id INT NOT NULL,
    PRIMARY KEY (id),
    INDEX Institute_fk0 (university_id ASC) VISIBLE,
    CONSTRAINT Institute_fk0
        FOREIGN KEY (university_id)
            REFERENCES mydb.University (university_id)
);

CREATE TABLE IF NOT EXISTS mydb.Group
(
    group_id  INT NOT NULL AUTO_INCREMENT,
    course INT NOT NULL,
    Institute_id        INT NOT NULL,
    UNIQUE INDEX (group_id ASC) VISIBLE,
    PRIMARY KEY (group_id),
    INDEX Group_fk0 (Institute_id ASC) VISIBLE,
    CONSTRAINT Group_fk0
        FOREIGN KEY (Institute_id)
            REFERENCES mydb.Institute (id)
);

CREATE TABLE IF NOT EXISTS mydb.Student
(
    student_id   INT          NOT NULL AUTO_INCREMENT,
    first_name   VARCHAR(255) NOT NULL,
    last_name    VARCHAR(255) NOT NULL,
    group_id     INT          NOT NULL,
    UNIQUE INDEX (student_id ASC) VISIBLE,
    PRIMARY KEY (student_id),
    INDEX Student_fk0 (group_id ASC) VISIBLE,
    CONSTRAINT Student_fk0
        FOREIGN KEY (group_id)
            REFERENCES mydb.Group (group_id)
);

CREATE TABLE IF NOT EXISTS mydb.Conference
(
    conference_id INT          NOT NULL AUTO_INCREMENT,
    name          VARCHAR(255) NOT NULL,
    UNIQUE INDEX (conference_id ASC) VISIBLE,
    PRIMARY KEY (conference_id)
);

CREATE TABLE IF NOT EXISTS mydb.Conference_Theme
(
    conference_theme_id INT          NOT NULL AUTO_INCREMENT,
    name                VARCHAR(255) NOT NULL,
    conference_id       INT          NOT NULL,
    UNIQUE INDEX (conference_theme_id ASC) VISIBLE,
    PRIMARY KEY (conference_theme_id),
    INDEX Conference_Theme_fk0 (conference_id ASC) VISIBLE,
    CONSTRAINT Conference_Theme_fk0
        FOREIGN KEY (conference_id)
            REFERENCES mydb.Conference (conference_id)
);

CREATE TABLE IF NOT EXISTS mydb.Presentation
(
    presentation_id     INT          NOT NULL AUTO_INCREMENT,
    title               VARCHAR(255) NOT NULL,
    conference_theme_id INT          NOT NULL,
    UNIQUE INDEX (presentation_id ASC) VISIBLE,
    PRIMARY KEY (presentation_id),
    INDEX Presentation_fk1 (conference_theme_id ASC) VISIBLE,
    CONSTRAINT Presentation_fk1
        FOREIGN KEY (conference_theme_id)
            REFERENCES mydb.Conference_Theme (conference_theme_id)
);

CREATE TABLE IF NOT EXISTS mydb.Presentation_Theme
(
    presentation_theme_id INT          NOT NULL AUTO_INCREMENT,
    title                 VARCHAR(255) NOT NULL,
    presentation_id       INT          NOT NULL,
    conference_id         INT          NOT NULL,
    UNIQUE INDEX (presentation_theme_id ASC) VISIBLE,
    PRIMARY KEY (presentation_theme_id),
    INDEX Presentation_Theme_fk0 (presentation_id ASC) VISIBLE,
    INDEX Presentation_Theme_fk1 (conference_id ASC) VISIBLE,
    CONSTRAINT Presentation_Theme_fk0
        FOREIGN KEY (presentation_id)
            REFERENCES mydb.Presentation (presentation_id),
    CONSTRAINT Presentation_Theme_fk1
        FOREIGN KEY (conference_id)
            REFERENCES mydb.Conference (conference_id)
);

CREATE TABLE IF NOT EXISTS mydb.Student_Presentation
(
    St_P         INT NOT NULL AUTO_INCREMENT,
    student      INT NOT NULL,
    presentation INT NOT NULL,
    PRIMARY KEY (St_P),
    INDEX Student_Presentation_fk0 (student ASC) VISIBLE,
    INDEX Student_Presentation_fk1 (presentation ASC) VISIBLE,
    CONSTRAINT Student_Presentation_fk0
        FOREIGN KEY (student)
            REFERENCES mydb.Student (student_id),
    CONSTRAINT Student_Presentation_fk1
        FOREIGN KEY (presentation)
            REFERENCES mydb.Presentation (presentation_id)
);