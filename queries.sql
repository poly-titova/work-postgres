-- учитываются все строки результата для подсчёта количества
SELECT COUNT(*)
FROM books;

-- считаются авторы с одной и той же фамилией
SELECT
  authors.lastname,
  count(authors.lastname)
FROM authors
GROUP BY authors.lastname
ORDER BY count(authors.lastname) DESC;

-- считаются авторы, которые встречают больше одного раза
SELECT 
  authors.lastname,
  count(authors.lastname)
FROM authors
GROUP BY
	authors.lastname
HAVING count(authors.lastname) > 1
ORDER BY count(authors.lastname) DESC

-- всё также, но уже с псевдонимами
SELECT 
 authors.lastname AS "authorLastName",
 count(authors.lastname) AS "count"
FROM authors
GROUP BY
	authors.lastname
HAVING count(authors.lastname) > 1
ORDER BY count(authors.lastname) DESC
