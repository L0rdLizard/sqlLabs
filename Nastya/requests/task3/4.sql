SELECT c.name, COUNT(p.presentation_id) AS num_presentations
FROM mydb.Conference c
JOIN mydb.Conference_Theme ct ON c.conference_id = ct.conference_id
JOIN mydb.Presentation p ON ct.conference_theme_id = p.conference_theme_id
GROUP BY c.conference_id


-- Количество докладов для каждой конференции