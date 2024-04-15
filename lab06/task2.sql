CREATE TRIGGER count_books_after_insert
AFTER INSERT ON BookAuthor
FOR EACH ROW
BEGIN
    UPDATE Author SET book_count = (SELECT COUNT(*) FROM BookAuthor WHERE author_id = NEW.author_id)
    WHERE id = NEW.author_id;
END;
