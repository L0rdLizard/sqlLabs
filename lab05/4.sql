CREATE PROCEDURE GetAuthorStatistics()
BEGIN
    CREATE TEMPORARY TABLE AuthorStatistics AS
    SELECT Author.name, COUNT(BookAuthor.book_id) as total_books
    FROM Author
    LEFT JOIN BookAuthor ON Author.id = BookAuthor.author_id
    GROUP BY Author.name;

    SELECT * FROM AuthorStatistics;

    DROP TEMPORARY TABLE AuthorStatistics;
END

-- формирование статистики во временной таблице
-- AuthorStatistics содержит количество книг для каждого автора