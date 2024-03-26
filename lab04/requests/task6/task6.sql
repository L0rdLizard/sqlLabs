INSERT INTO Book (book_name, book_date)
SELECT 'New Mystery', CURDATE()
FROM dual
WHERE NOT EXISTS
    (SELECT 1 FROM Book WHERE book_name = 'New Mystery');
