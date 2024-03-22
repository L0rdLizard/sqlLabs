CREATE TABLE IF NOT EXISTS University
(
    university_id INT          NOT NULL AUTO_INCREMENT,
    name          VARCHAR(255) NOT NULL,
    address       VARCHAR(255) NOT NULL,
    UNIQUE INDEX (university_id ASC) VISIBLE,
    PRIMARY KEY (university_id)
);

CREATE TABLE IF NOT EXISTS Institute
(
    id            INT NOT NULL AUTO_INCREMENT,
    name          INT NOT NULL,
    university_id INT NOT NULL,
    PRIMARY KEY (id),
    INDEX Institute_fk0 (university_id ASC) VISIBLE,
    CONSTRAINT Institute_fk0
        FOREIGN KEY (university_id)
            REFERENCES University (university_id)
);

CREATE TABLE IF NOT EXISTS Course
(
    course_id INT NOT NULL AUTO_INCREMENT,
    number    INT NOT NULL,
    UNIQUE INDEX (course_id ASC) VISIBLE,
    PRIMARY KEY (course_id)
);

CREATE TABLE IF NOT EXISTS Groupp
(
    group_id  INT NOT NULL AUTO_INCREMENT,
    number    INT NOT NULL,
    course_id INT NOT NULL,
    id        INT NOT NULL,
    UNIQUE INDEX (group_id ASC) VISIBLE,
    PRIMARY KEY (group_id),
    INDEX Group_fk0 (course_id ASC) VISIBLE,
    INDEX Group_fk1 (id ASC) VISIBLE,
    CONSTRAINT Group_fk0
        FOREIGN KEY (course_id)
            REFERENCES Course (course_id),
    CONSTRAINT Group_fk1
        FOREIGN KEY (id)
            REFERENCES Institute (id)
);

CREATE TABLE IF NOT EXISTS Student
(
    student_id   INT          NOT NULL AUTO_INCREMENT,
    first_name   VARCHAR(255) NOT NULL,
    last_name    VARCHAR(255) NOT NULL,
    group_id     INT          NOT NULL,
    Institute_id INT          NOT NULL,
    UNIQUE INDEX (student_id ASC) VISIBLE,
    PRIMARY KEY (student_id),
    INDEX Student_fk0 (group_id ASC) VISIBLE,
    INDEX Student_fk1 (institute_id ASC) VISIBLE,

    CONSTRAINT Student_fk0
        FOREIGN KEY (group_id)
            REFERENCES Groupp (group_id),
    CONSTRAINT Student_fk1
        FOREIGN KEY (institute_id)
            REFERENCES Institute (id)
);

CREATE TABLE IF NOT EXISTS Conference
(
    conference_id INT          NOT NULL AUTO_INCREMENT,
    name          VARCHAR(255) NOT NULL,
    UNIQUE INDEX (conference_id ASC) VISIBLE,
    PRIMARY KEY (conference_id)
);

CREATE TABLE IF NOT EXISTS Conference_Theme
(
    conference_theme_id INT          NOT NULL AUTO_INCREMENT,
    name                VARCHAR(255) NOT NULL,
    conference_id       INT          NOT NULL,
    UNIQUE INDEX (conference_theme_id ASC) VISIBLE,
    PRIMARY KEY (conference_theme_id),
    INDEX Conference_Theme_fk0 (conference_id ASC) VISIBLE,
    CONSTRAINT Conference_Theme_fk0
        FOREIGN KEY (conference_id)
            REFERENCES Conference (conference_id)
);

CREATE TABLE IF NOT EXISTS Presentation
(
    presentation_id     INT          NOT NULL AUTO_INCREMENT,
    title               VARCHAR(255) NOT NULL,
    author_id           INT          NOT NULL,
    conference_theme_id INT          NOT NULL,
    UNIQUE INDEX (presentation_id ASC) VISIBLE,
    PRIMARY KEY (presentation_id),
    INDEX Presentation_fk0 (author_id ASC) VISIBLE,
    INDEX Presentation_fk1 (conference_theme_id ASC) VISIBLE,
    CONSTRAINT Presentation_fk0
        FOREIGN KEY (author_id)
            REFERENCES Student (student_id),
    CONSTRAINT Presentation_fk1
        FOREIGN KEY (conference_theme_id)
            REFERENCES Conference_Theme (conference_theme_id)
);

CREATE TABLE IF NOT EXISTS Presentation_Theme
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
            REFERENCES Presentation (presentation_id),
    CONSTRAINT Presentation_Theme_fk1
        FOREIGN KEY (conference_id)
            REFERENCES Conference (conference_id)
);

CREATE TABLE IF NOT EXISTS Student_Presentation
(
    St_P         INT NOT NULL AUTO_INCREMENT,
    student      INT NOT NULL,
    presentation INT NOT NULL,
    PRIMARY KEY (St_P),
    INDEX Student_Presentation_fk0 (student ASC) VISIBLE,
    INDEX Student_Presentation_fk1 (presentation ASC) VISIBLE,
    CONSTRAINT Student_Presentation_fk0
        FOREIGN KEY (student)
            REFERENCES Student (student_id),
    CONSTRAINT Student_Presentation_fk1
        FOREIGN KEY (presentation)
            REFERENCES Presentation (presentation_id)
);