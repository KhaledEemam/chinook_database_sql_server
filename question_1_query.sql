/*query 1 - which artist has earned the most according to the InvoiceLine?*/
SELECT table_d.ArtistId, table_d.Name, sum(table_a.UnitPrice)
FROM InvoiceLine AS table_a
INNER JOIN Track AS table_b
ON table_b.TrackId = table_a.TrackId
INNER JOIN Album AS table_c
ON table_c.AlbumId = table_b.AlbumId
INNER JOIN Artist AS table_d
ON table_d.ArtistId = table_c.ArtistId
GROUP BY table_d.ArtistId , table_d.Name
ORDER BY 3 DESC
LIMIT 10 ;