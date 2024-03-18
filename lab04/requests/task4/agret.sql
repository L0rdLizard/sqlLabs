SELECT SUM(NumberOfBooks) as TotalBooks
FROM (
    SELECT COUNT(*) as NumberOfBooks
    FROM Form
    WHERE return_date IS NULL
    GROUP BY reader_ticket_id
) AS SubQuery;
