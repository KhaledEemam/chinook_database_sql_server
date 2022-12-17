/*query 4 - most popular gener per country */
WITH genres as 
(SELECT namee, MAX(num) AS largest
from 
(SELECT table_e.country AS namee, table_a.Name,count(table_a.Name) AS num
FROM Genre table_a
JOIN Track table_b
ON table_a.GenreId = table_b.GenreId
JOIN InvoiceLine table_c
ON table_c.TrackId = table_b.TrackId
JOIN Invoice table_d
ON table_d.InvoiceId = table_c.InvoiceId
JOIN Customer table_e
on table_e.CustomerId = table_d.CustomerId
GROUP by table_e.country , table_a.Name) AS t1
GROUP BY namee)
SELECT table_k.country AS namee, table_f.Name, COUNT(table_f.Name) AS num
FROM Genre table_f
JOIN Track table_q
ON table_f.GenreId = table_q.GenreId
JOIN InvoiceLine table_w
ON table_w.TrackId = table_q.TrackId
JOIN Invoice table_h
ON table_h.InvoiceId = table_w.InvoiceId
JOIN Customer table_k
on table_k.CustomerId = table_h.CustomerId
JOIN genres table_x
on table_x.Namee = table_k.Country
GROUP by table_k.country , table_f.Name
HAVING table_x.largest = count(table_f.name) 
ORDER BY count(table_f.Name) DESC
LIMIT 20 ;