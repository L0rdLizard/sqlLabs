SELECT DISTINCT Reader_ticket.name
FROM Reader_ticket
JOIN Form ON Reader_ticket.id = Form.reader_ticket_id
JOIN Book ON Form.book_id = Book.id
JOIN BookAuthor ON Book.id = BookAuthor.book_id
JOIN Author ON BookAuthor.author_id = Author.id
WHERE Author.name IN ('Fyodor Dostoevsky', 'Mark Twain', 'Jane Austen');

-- читателей, которые брали книги трех конкретных авторов;