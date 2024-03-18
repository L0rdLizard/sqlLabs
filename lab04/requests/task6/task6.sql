SELECT book_name
FROM Book
WHERE id IN (
    SELECT book_id
    FROM BookAuthor
    WHERE author_id = (
        SELECT author_id
        FROM BookAuthor
        GROUP BY author_id
        ORDER BY COUNT(*) DESC
        LIMIT 1
    )
);
