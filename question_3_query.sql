/*query 3 - the most sold genre */
SELECT table_a.Name, SUM(table_c.UnitPrice)
FROM Genre table_a
JOIN Track table_b
ON table_a.GenreId = table_b.GenreId
JOIN InvoiceLine table_c
ON table_c.TrackId = table_b.TrackId
GROUP BY table_a.Name
ORDER BY SUM(table_c.UnitPrice) DESC;