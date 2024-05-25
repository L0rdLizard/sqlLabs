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
-- Перед вставкой даты в таблицу Book, проверяется не является ли дата больше, чем текущая.
INSERT INTO labs.Book (book_name, book_date) VALUES ('New Book', '2025-12-12');

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
-- После вставки записи в таблицу BookAuthor, проверяется, что автор не был добавлен к этой книге дважды.
-- Если такая запись найдена, происходит её удаление и выбрасывается ошибка.
INSERT INTO labs.BookAuthor (book_id, author_id) VALUES (11, 1);

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
-- Перед обновлением записи в таблице Form, проверяется, что новая дата возврата не может быть раньше даты взятия книги.
UPDATE labs.Form t SET t.get_date = '2023-01-21' WHERE t.id = 13;

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
-- После обновления записи в таблице Book, проверяется, что новое название книги является уникальным.
-- Если в таблице найдены другие книги с таким же названием, выбрасывается ошибка.
UPDATE labs.Book t SET t.book_name = 'Big Story' WHERE t.id = 12;

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
-- Перед удалением записи из таблицы Book, проверяется, что данная книга не находится у читателя на руках.
-- Если найдены записи, у которых дата возврата не установлена, выбрасывается ошибка.
DELETE FROM labs.Book WHERE id = 10;

-- AFTER DELETE
CREATE TRIGGER update_book_count_after_delete
AFTER DELETE ON BookAuthor
FOR EACH ROW
BEGIN
    UPDATE Author SET book_count = (SELECT COUNT(*) FROM BookAuthor WHERE author_id = OLD.author_id)
    WHERE id = OLD.author_id;
END;
-- После удаления записи из таблицы BookAuthor, обновляется количество книг у автора в таблице Author для соответствующего автора.
DELETE FROM labs.BookAuthor WHERE book_id = 10 AND author_id = 5;