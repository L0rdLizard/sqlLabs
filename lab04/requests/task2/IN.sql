# SELECT DISTINCT Book.book_name
# FROM Book
# JOIN BookAuthor ON Book.id = BookAuthor.book_id
# JOIN Author ON BookAuthor.author_id = Author.id
# WHERE Author.name IN ('Fyodor Dostoevsky', 'Mark Twain', 'Jane Austen');

SELECT DISTINCT b.book_name
FROM Book AS b
JOIN BookAuthor AS ba ON b.id = ba.book_id
JOIN Author AS a ON ba.author_id = a.id
WHERE a.name IN ('Fyodor Dostoevsky', 'Mark Twain', 'Jane Austen');

