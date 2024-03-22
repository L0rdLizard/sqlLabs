INSERT INTO University (name, address)
VALUES ('Harvard University', 'Cambridge, MA, USA'),
       ('Stanford University', 'Stanford, CA, USA'),
       ('University of Oxford', 'Oxford, England'),
       ('University of Cambridge', 'Cambridge, England'),
       ('Massachusetts Institute of Technology', 'Cambridge, MA, USA');

INSERT INTO Institute (name, university_id)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5);

INSERT INTO Course (number)
VALUES (1),
       (2),
       (3),
       (4),
       (5),
       (6);

INSERT INTO Groupp (number, course_id, id)
VALUES (1, 1, 1),
       (2, 2, 2),
       (3, 3, 3),
       (4, 4, 4),
       (5, 5, 5);

INSERT INTO Student (first_name, last_name, group_id, Institute_id)
VALUES ('John', 'Doe', 1, 1),
       ('Jane', 'Doe', 2, 2),
       ('Jim', 'Smith', 3, 3),
       ('Jill', 'Johnson', 4, 4),
       ('Jack', 'Brown', 5, 5);

INSERT INTO Conference (name)
VALUES ('AI Conference'),
       ('Physics Symposium'),
       ('Chemistry Convention'),
       ('Mathematics Colloquium'),
       ('Biology Summit');

INSERT INTO Conference_Theme (name, conference_id)
VALUES ('Neural Networks', 1),
       ('Quantum Physics', 2),
       ('Organic Chemistry', 3),
       ('Algebraic Topology', 4),
       ('Genetic Engineering', 5);

INSERT INTO Presentation (title, author_id, conference_theme_id)
VALUES ('Deep Learning Applications', 1, 1),
       ('Quantum Entanglement', 2, 2),
       ('Levitation', 3, 2),
       ('Synthesis of Complex Molecules', 3, 3),
       ('Homotopy Theory', 4, 3),
       ('Euclidean Algorithm', 4, 4),
       ('CRISPR Technology', 5, 5);

INSERT INTO Presentation_Theme (title, presentation_id, conference_id)
VALUES ('Convolutional Neural Networks', 1, 1),
       ('Quantum Teleportation', 2, 2),
       ('Chemistry tips', 3, 2),
       ('Stereochemistry', 4, 3),
       ('Knot Theory', 5, 3),
       ('Chaos Theory', 6, 4),
       ('Gene Editing', 7, 5);

INSERT INTO Student_Presentation (student, presentation)
VALUES (1, 1),
       (2, 2),
       (3, 2),
       (3, 3),
       (4, 3),
       (4, 4),
       (5, 5);
