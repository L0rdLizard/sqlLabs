SELECT Reader_ticket.name
FROM Reader_ticket
JOIN Form ON Reader_ticket.id = Form.reader_ticket_id
WHERE Form.return_date IS NOT NULL
GROUP BY Reader_ticket.name
HAVING COUNT(*) > 1;
