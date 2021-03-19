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