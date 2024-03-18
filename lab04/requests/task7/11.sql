SELECT Book.book_name, COALESCE(Author.name, 'Фольклор') as AuthorName
FROM Book
LEFT JOIN BookAuthor ON Book.id = BookAuthor.book_id
LEFT JOIN Author ON BookAuthor.author_id = Author.id;
