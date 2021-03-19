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
