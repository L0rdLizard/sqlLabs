SELECT Reader_ticket.name
FROM Reader_ticket
WHERE NOT EXISTS (
    SELECT *
    FROM Form
    JOIN Book ON Form.book_id = Book.id
    JOIN BookGenre ON Book.id = BookGenre.book_id
    JOIN Genre ON BookGenre.genre_id = Genre.id
    WHERE Reader_ticket.id = Form.reader_ticket_id AND Genre.name <> 'Science Fiction'
);
