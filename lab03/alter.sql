ALTER TABLE Form
DROP FOREIGN KEY fk_form_reader_ticket,
DROP FOREIGN KEY fk_form_book;

ALTER TABLE Form
ADD CONSTRAINT fk_form_reader_ticket  FOREIGN KEY (reader_ticket_id) REFERENCES Reader_ticket (id) ON DELETE CASCADE,
ADD CONSTRAINT fk_form_book FOREIGN KEY (book_id) REFERENCES Book (id) ON DELETE CASCADE;


ALTER TABLE BookAuthor
DROP FOREIGN KEY fk_bookAuthor_book,
DROP FOREIGN KEY fk_bookAuthor_author;

ALTER TABLE BookAuthor
ADD CONSTRAINT fk_bookAuthor_book FOREIGN KEY (book_id) REFERENCES Book (id) ON DELETE CASCADE,
ADD CONSTRAINT fk_bookAuthor_author  FOREIGN KEY (author_id) REFERENCES Author (id) ON DELETE CASCADE;


ALTER TABLE BookGenre
DROP FOREIGN KEY fk_bookGenre_book,
DROP FOREIGN KEY fk_bookGenre_genre;

ALTER TABLE BookGenre
ADD CONSTRAINT fk_bookGenre_book  FOREIGN KEY (book_id) REFERENCES Book (id) ON DELETE CASCADE,
ADD CONSTRAINT fk_bookGenre_genre  FOREIGN KEY (genre_id) REFERENCES Genre (id) ON DELETE CASCADE;