CREATE TABLE Book_history
(
    id          INT AUTO_INCREMENT,
    book_id     INT,
    old_name    TEXT,
    new_name    TEXT,
    change_time TIMESTAMP,
    PRIMARY KEY (id)
);

CREATE TRIGGER book_history_after_update
AFTER UPDATE ON Book
FOR EACH ROW
BEGIN
    INSERT INTO Book_history (book_id, old_name, new_name, change_time)
    VALUES (OLD.id, OLD.book_name, NEW.book_name, NOW());
END;

UPDATE labs.Book t SET t.book_date = '1998-12-01' WHERE t.id = 12;