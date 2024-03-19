SELECT Distinct Reader_ticket.name
FROM Reader_ticket
JOIN Form ON Reader_ticket.id = Form.reader_ticket_id
JOIN Book ON Form.book_id = Book.id
JOIN BookAuthor ON Book.id = BookAuthor.book_id
JOIN Author ON BookAuthor.author_id = Author.id
WHERE Form.return_date IS NULL
GROUP BY Reader_ticket.name, Author.name
HAVING COUNT(*) >= 2;

-- читателей, у которых на руках две или более книги одного автора