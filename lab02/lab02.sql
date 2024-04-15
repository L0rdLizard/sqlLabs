CREATE TABLE Genre
(
    id   INT AUTO_INCREMENT,
    name TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE Author
(
    id      INT AUTO_INCREMENT,
    name    TEXT,
    book_count INT,
    country VARCHAR(64),
    PRIMARY KEY (id)
);

CREATE TABLE Book
(
    id        INT AUTO_INCREMENT,
    book_name TEXT,
    book_date DATE,
    PRIMARY KEY (id)
);

CREATE TABLE BookAuthor
(
    book_id   INT NOT NULL,
    author_id INT NOT NULL,
    CONSTRAINT fk_bookAuthor_book FOREIGN KEY (book_id) REFERENCES Book (id),
    CONSTRAINT fk_bookAuthor_author FOREIGN KEY (author_id) REFERENCES Author (id)
);

CREATE TABLE BookGenre
(
    book_id  INT NOT NULL,
    genre_id INT NOT NULL,
    CONSTRAINT fk_bookGenre_book FOREIGN KEY (book_id) REFERENCES Book (id),
    CONSTRAINT fk_bookGenre_genre FOREIGN KEY (genre_id) REFERENCES Genre (id)
);



CREATE TABLE Reader_ticket
(
    id       INT AUTO_INCREMENT,
    name     TEXT NOT NULL,
    passport INT  NOT NULL UNIQUE,
    bd_date  DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Form
(
    id               INT AUTO_INCREMENT,
    reader_ticket_id INT  NOT NULL,
    book_id          INT  NOT NULL,
    get_date         DATE NOT NULL,
    deadline         DATE NOT NULL,
    return_date      DATE,
    PRIMARY KEY (id),
    CONSTRAINT fk_form_reader_ticket FOREIGN KEY (reader_ticket_id) REFERENCES Reader_ticket (id),
    CONSTRAINT fk_form_book FOREIGN KEY (book_id) REFERENCES Book (id)
);