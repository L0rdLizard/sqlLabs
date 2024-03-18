INSERT INTO Reader_ticket (name, passport, bd_date)
VALUES
    ('Denis', 401784334, '2003-07-10'),
    ('Nastya', 132141214, '2002-05-02'),
    ('Maxim', 401780066, '2003-05-02'),
    ('Sergey', 402341405, '2002-11-05'),
    ('Dima', 231355533, '2003-02-20');

INSERT INTO Author (name, country)
VALUES
    ('Leo Tolstoy', 'Russia'),
    ('Jane Austen', 'England'),
    ('Gabriel Garcia Marquez', 'Colombia'),
    ('Fyodor Dostoevsky', 'Russia'),
    ('Mark Twain', 'United States');

INSERT INTO Genre (name)
    VALUES
        ('Fiction'),
        ('Non-Fiction'),
        ('Science Fiction'),
        ('Fantasy'),
        ('Mystery');

INSERT INTO Book (book_name, book_date)
    VALUES
        ('Colorful History', '2009-11-26'),
        ('Amazing Adventure', '2022-11-29'),
        ('Ancient Secret', '2015-03-12'),
        ('Modern Journey', '2008-07-19'),
        ('Digital Life', '2001-04-25'),
        ('New Mystery', '2020-06-30'),
        ('Classic Future', '2004-09-17'),
        ('Small Dream', '2017-02-05'),
        ('Classic Past', '2010-01-24'),
        ('Digital Mystery', '2013-11-17'),
        ('Big Story', '2013-12-28');


INSERT INTO BookGenre (book_id, genre_id)
    VALUES
        (1, 2),
        (1, 3),
        (1, 4),
        (2, 1),
        (3, 5),
        (4, 1),
        (5, 4),
        (5, 5),
        (6, 3),
        (7, 2),
        (7, 4),
        (8, 2),
        (9, 3),
        (10, 3),
        (11, 1);

INSERT INTO BookAuthor (book_id, author_id)
    VALUES
        (1, 4),
        (2, 4),
        (3, 2),
        (4, 1),
        (5, 4),
        (5, 5),
        (6, 1),
        (7, 1),
        (8, 2),
        (9, 3),
        (10, 3),
        (10, 5),
        (11, 1);

INSERT INTO Form (reader_ticket_id, book_id, get_date, deadline, return_date)
VALUES
    (1, 1, '2023-01-01', '2023-01-15', '2023-01-14'),
    (1, 6, '2023-01-06', '2023-01-20', '2023-01-18'),
    (2, 2, '2023-01-02', '2023-01-16', '2023-01-13'),
    (2, 7, '2023-01-07', '2023-01-21', NULL),
    (3, 2, '2023-01-08', '2023-01-22', NULL),
    (3, 3, '2023-01-03', '2023-01-17', NULL),
    (3, 4, '2023-01-03', '2023-01-17', '2023-01-16'),
    (3, 5, '2023-01-03', '2023-01-17', NULL),
    (3, 8, '2023-01-08', '2023-01-22', '2023-01-21'),
    (3, 9, '2023-01-08', '2023-01-23', '2023-01-24'),
    (4, 4, '2023-01-04', '2023-01-18', '2023-01-07'),
    (4, 9, '2023-01-09', '2023-01-23', NULL),
    (5, 6, '2023-01-05', '2023-01-19', '2023-01-06'),
    (5, 10, '2023-01-10', '2023-01-24', NULL);

