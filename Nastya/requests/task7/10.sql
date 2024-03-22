SELECT c.name,
CASE
    WHEN c.name LIKE '%Algebra%' OR c.name LIKE '%Physics%' OR c.name LIKE '%Mathematics%' THEN 'Технические науки'
    WHEN c.name LIKE '%Networks%' OR c.name LIKE '%Cryptographic%' OR c.name LIKE 'IT' THEN 'It направления'
    WHEN c.name LIKE '%Chemistry%' OR c.name LIKE '%Genetic%' OR c.name LIKE '%Biology%'  THEN 'Естественные науки'
    ELSE 'Другие науки'
END AS category
FROM mydb.Conference c

-- Конференции, указав их вид в зависимости от тематики