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

-- переводятся имена авторов в хеш-коды
SELECT
	concat(authors.firstname, ' ', authors.lastname) AS "Автор",
	concat(authors.lastname, ' ', left(authors.firstname, 1)) AS "Автор2",
    md5(authors.lastname) AS "hash"
FROM authors

-- вместо показа полной даты рождения автора отображается только год
SELECT
	concat(authors.firstname, ' ', authors.lastname) AS "Автор",
	to_char(authors.birth_date, 'YYYY') "Год рождения"
FROM authors

-- соберается в единое целое информация о книгах и авторах
SELECT
	authors.firstname AS "Имя",
	authors.lastname AS "Фамилия",
	books.title AS "Название",
	books.release_date AS "Год выхода",
	books.page_count AS "Страниц"
FROM books
INNER JOIN authors
	ON books.author_id = authors.id
