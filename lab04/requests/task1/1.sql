SELECT DISTINCT Reader_ticket.name
FROM Reader_ticket
JOIN Form ON Reader_ticket.id = Form.reader_ticket_id
WHERE Form.get_date >= CURDATE() - INTERVAL 2 YEAR;
