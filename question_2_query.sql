/*query 2 - artists with the most amount of albums created */
SELECT table_a.name, count(table_b.title)
FROM Artist table_a
JOIN Album table_b
on table_a.ArtistId = table_b.ArtistId
GROUP by table_a.name
order by count(table_b.title) DESC
LIMIT 10 ;