SELECT Reader_ticket.name
FROM Reader_ticket
WHERE NOT EXISTS (
    SELECT *
    FROM Genre
    WHERE NOT EXISTS (
        SELECT *
        FROM Form
        JOIN Book ON Form.book_id = Book.id
        JOIN BookGenre ON Book.id = BookGenre.book_id
        WHERE Reader_ticket.id = Form.reader_ticket_id AND Genre.id = BookGenre.genre_id
    )
);

-- читателей, читающих книги всех жанров