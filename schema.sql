-- запросы для удаления таблиц
DROP TABLE IF EXISTS books_readers;
DROP TABLE IF EXISTS books_publishers;
DROP TABLE IF EXISTS books_genres;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS readers;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS publishers;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS countries;

-- создание таблицы countries (страны)
CREATE TABLE countries
(
  id SERIAL PRIMARY KEY,
  title VARCHAR (50) NOT NULL
);

-- создание таблицы authors (авторы)
CREATE TABLE authors (
	id SERIAL PRIMARY KEY,
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL,
	birth_date DATE,
  -- числовой идентификатор, соответствующий стране из таблицы countries
	country_id INTEGER,
  -- определение внешнего ключа
	FOREIGN KEY (country_id) REFERENCES countries (id)
    -- поведение при удалении и обновлении
		ON DELETE SET NULL
		ON UPDATE SET NULL
);

-- создание таблицы publishers (издатели)
CREATE TABLE publishers
(
	id SERIAL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	country_id INTEGER,
	FOREIGN KEY (country_id) REFERENCES countries (id)
		ON UPDATE CASCADE
		ON DELETE SET NULL
);

-- создание таблицы genres (жанры)
CREATE TABLE genres
(
	id SERIAL PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);

-- создание таблицы readers (читатели)
CREATE TABLE readers
(
	id SERIAL PRIMARY KEY,
	firstname VARCHAR(50) NOT NULL,
	lastname VARCHAR(50) NOT NULL,
	birth_date DATE
);

-- создание таблицы books (книги)
CREATE TABLE books
(
	id SERIAL PRIMARY KEY,
	title VARCHAR(100) NOT NULL,
	release_date DATE NOT NULL,
	page_count INTEGER NOT NULL DEFAULT 0,
	author_id INTEGER NOT NULL,
	country_id INTEGER,
	FOREIGN KEY (author_id) REFERENCES authors (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (country_id) REFERENCES countries(id)
		ON DELETE SET NULL
		ON UPDATE SET NULL
);

-- создание таблицы books_genres (жанры книг)
CREATE TABLE books_genres
(
	book_id INTEGER NOT NULL,
	genre_id INTEGER NOT NULL,
  -- используем название двух связанных таблиц, чтобы показать связи между таблицами
	CONSTRAINT books_genres_pk PRIMARY KEY (book_id, genre_id),
  FOREIGN KEY (book_id) REFERENCES books (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (genre_id) REFERENCES genres (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- создание таблицы books_publishers (книгоиздатели)
CREATE TABLE books_publishers
(
	book_id INTEGER NOT NULL,
	publisher_id INTEGER NOT NULL,
	CONSTRAINT book_publishers_pk PRIMARY KEY (book_id, publisher_id),
	FOREIGN KEY (book_id) REFERENCES books (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (publisher_id) REFERENCES publishers (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- создание таблицы books_readers (читатели книг)
CREATE TABLE books_readers
(
	book_id INTEGER NOT NULL,
	reader_id INTEGER NOT NULL,
	CONSTRAINT books_readers_pk PRIMARY KEY (book_id, reader_id),
	FOREIGN KEY (book_id) REFERENCES books(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (reader_id) REFERENCES readers(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);
