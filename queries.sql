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

-- считается сколько книг каждого автора есть в библиотеке
SELECT
	authors.firstname AS "Имя",
	authors.lastname AS "Фамилия",
	COUNT(books.id) AS "Кол-во книг"
FROM
	authors
	INNER JOIN books
		ON authors.id = books.author_id
GROUP BY
	authors.firstname,
	authors.lastname
ORDER BY
	COUNT(books.id) DESC;

-- выводятся все книги, даже если есть значение null
SELECT
	books.title AS "Название",
	books.release_date AS "Год выхода",
	books.page_count AS "Страниц",
	countries.title AS "Страна"
FROM books
LEFT JOIN countries
	ON books.country_id = countries.id;
