SELECT Book.book_name,
CASE
    WHEN Author.country = 'Russia' THEN 'Родная литература'
    ELSE 'Иностранная литература'
END as LiteratureCategory
FROM Book
JOIN BookAuthor ON Book.id = BookAuthor.book_id
JOIN Author ON BookAuthor.author_id = Author.id;
