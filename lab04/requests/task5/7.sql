SELECT DISTINCT Reader_ticket.name
FROM Reader_ticket
JOIN Form ON Reader_ticket.id = Form.reader_ticket_id
WHERE Form.book_id IN (
    SELECT book_id
    FROM Form
    GROUP BY book_id
    HAVING COUNT(*) = 1
);
