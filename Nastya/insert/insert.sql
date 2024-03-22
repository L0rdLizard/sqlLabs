INSERT INTO University (name, address)
VALUES ('SUAI', 'St. Petersburg, Russia'),
       ('Stanford University', 'Stanford, CA, USA'),
       ('University of Oxford', 'Oxford, England'),
       ('University of Cambridge', 'Cambridge, England'),
       ('Massachusetts Institute of Technology', 'Cambridge, MA, USA');

INSERT INTO Institute (name, university_id)
VALUES (1, 1),
       (2, 1),
       (3, 1),
       (4, 1),
       (1, 2),
       (2, 2),
       (3, 2),
       (1, 3),
       (1, 4),
       (1, 5),
       (2, 5),
       (3, 5);


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
       (5, 5, 5),
       (6, 6, 6);

INSERT INTO Student (first_name, last_name, group_id, Institute_id)
VALUES ('John', 'Doe', 1, 1),
       ('Jane', 'Doe', 1, 5),
       ('Jim', 'Smith', 3, 7),
       ('Jill', 'Johnson', 3, 9),
       ('Jack', 'Brown', 5, 11),
       ('Kris', 'Robertson', 6, 12);

INSERT INTO Conference (name)
VALUES ('AI Conference'),
       ('Physics Symposium'),
       ('Chemistry Convention'),
       ('Mathematics Colloquium'),
       ('Biology Summit'),
       ('IT');

INSERT INTO Conference_Theme (name, conference_id)
VALUES ('Neural Networks', 1),
       ('Quantum Physics', 2),
       ('Organic Chemistry', 3),
       ('Algebraic Topology', 4),
       ('Genetic Engineering', 5),
       ('Cryptographic', 6);

INSERT INTO Presentation (title, conference_theme_id)
VALUES ('Deep Learning Applications', 1),
       ('Quantum Entanglement', 2),
       ('Levitation', 2),
       ('Synthesis of Complex Molecules', 3),
       ('Homotopy Theory', 3),
       ('Euclidean Algorithm', 4),
       ('CRISPR Technology', 5),
       ('Cipher', 6);

INSERT INTO Presentation_Theme (title, presentation_id, conference_id)
VALUES ('Convolutional Neural Networks', 1, 1),
       ('Quantum Teleportation', 2, 2),
       ('Chemistry tips', 3, 2),
       ('Stereochemistry', 4, 3),
       ('Knot Theory', 5, 3),
       ('Chaos Theory', 6, 4),
       ('Gene Editing', 7, 5),
       ('Cipher RK95', 8, 6);

INSERT INTO Student_Presentation (student, presentation)
VALUES (1, 1),
       (2, 1),
       (2, 2),
       (3, 3),
       (3, 4),
       (4, 4),
       (4, 5),
       (4, 6),
       (5, 7),
       (5, 8);
