SELECT Reader_ticket.name, COUNT(*) AS NumberOfBooks
FROM Reader_ticket
JOIN Form ON Reader_ticket.id = Form.reader_ticket_id
WHERE Form.return_date IS NULL
GROUP BY Reader_ticket.name
ORDER BY NumberOfBooks DESC
LIMIT 1;
