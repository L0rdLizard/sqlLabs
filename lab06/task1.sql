-- BEFORE INSERT
CREATE TRIGGER check_date_before_insert
BEFORE INSERT ON Book
FOR EACH ROW
BEGIN
    IF NEW.book_date > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Дата выпуска книги не может быть в будущем';
    END IF;
END;

-- AFTER INSERT
CREATE TRIGGER check_double_author_after_insert
AFTER INSERT ON BookAuthor
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM BookAuthor WHERE book_id = NEW.book_id AND author_id = NEW.author_id) > 1 THEN
        DELETE FROM BookAuthor WHERE author_id = LAST_INSERT_ID();
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Автор уже добавлен к этой книге';
    END IF;
END;


-- BEFORE UPDATE
CREATE TRIGGER check_return_date_before_update
BEFORE UPDATE ON Form
FOR EACH ROW
BEGIN
    IF NEW.get_date > OLD.return_date THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Дата возврата не может быть раньше взятия';
    END IF;
END;

-- AFTER UPDATE
CREATE TRIGGER check_book_name_after_update
AFTER UPDATE ON Book
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM Book WHERE book_name = NEW.book_name) > 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Название книги должно быть уникальным';
    END IF;
END;

-- BEFORE DELETE
CREATE TRIGGER check_book_before_delete
BEFORE DELETE ON Book
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM Form WHERE book_id = OLD.id AND return_date IS NULL) > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Нельзя удалить книгу, которая находится у читателя';
    END IF;
END;

-- AFTER DELETE
CREATE TRIGGER update_book_count_after_delete
AFTER DELETE ON BookAuthor
FOR EACH ROW
BEGIN
    UPDATE Author SET book_count = (SELECT COUNT(*) FROM BookAuthor WHERE author_id = OLD.author_id)
    WHERE id = OLD.author_id;
END;