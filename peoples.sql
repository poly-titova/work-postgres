CREATE TABLE peoples
(
  id bigserial NOT NULL,
  firstname character varying(100),

  lastname character varying(100),
  birth_date date,
  email character varying(100),
  PRIMARY KEY (id)
);

-- смена владельца
ALTER TABLE peoples
  OWNER to academy;

-- запрос для добавления информации о первом абоненте, расширенный вариант синтаксиса
INSERT INTO peoples (firstname, lastname, email, birth_date)
VALUES ('Richie', 'Sambora', 'rr@notfound.local', '1959-07-11');

-- без перечисления всех полей
INSERT INTO peoples
VALUES (DEFAULT, 'James', 'Hetfield', '1963-08-03', 'metallica@aaa.local');

-- есть возможность добавлять сразу несколько строк
INSERT INTO peoples VALUES
(DEFAULT, 'Jon', 'Bon Jovi', '1962-03-02', 'bon@pisem.local'),
(DEFAULT, 'Ivan', 'Ivanov', '1994-02-05', 'ivanov@ivan.local'),
(DEFAULT, 'Ozzy', 'Osbourne', '1948-12-03', 'ozz@fan.local');
