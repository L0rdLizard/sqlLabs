SELECT DISTINCT Book.book_name
FROM Book
JOIN BookAuthor ON Book.id = BookAuthor.book_id
JOIN Author ON BookAuthor.author_id = Author.id
WHERE Author.name IN ('Fyodor Dostoevsky', 'Mark Twain', 'Jane Austen');
