# SELECT DISTINCT name FROM Author;

SELECT DISTINCT Reader_ticket.name
FROM Reader_ticket
JOIN Form ON Reader_ticket.id = Form.reader_ticket_id
WHERE Form.return_date IS NOT NULL;
