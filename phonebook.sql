-- оператор для создания базы данных — CREATE DATABASE
-- CREATE DATABASE имя
--     [ [ WITH ] [ OWNER [=] имя_пользователя ]
--            [ TEMPLATE [=] шаблон ]
--            [ ENCODING [=] кодировка ]
--            [ LC_COLLATE [=] категория_сортировки[@провайдер] ]
--            [ LC_CTYPE [=] категория_типов_символов ]
--            [ TABLESPACE [=] табл_пространство ]
--            [ ALLOW_CONNECTIONS [=] разр_подключения ]
--            [ CONNECTION LIMIT [=] предел_подключений ]
--            [ IS_TEMPLATE [=] это_шаблон ] ]

CREATE DATABASE phonebook
  WITH
  OWNER = academy
  ENCODING = 'UTF8'
  TEMPLATE = template0;
  LC_COLLATE = 'C'
  LC_CTYPE = 'C'
  CONNECTION LIMIT = -1;
