CREATE TABLE workers(
  id serial PRIMARY KEY,
  birthday date NOT NULL CHECK (birthday < current_date),
  name_worker varchar(64) NOT NULL CHECK (name_worker != ''),
  salary integer NOT NULL
);
--INSERT--
-------------------------------------------------
INSERT INTO workers (name_worker, birthday, salary)
VALUES('Никита', '1990/5/4', 300);
-------------------------------------------------
INSERT INTO workers (name_worker, birthday, salary)
VALUES('Светлана', '1985/6/1', 1200);
-------------------------------------------------
INSERT INTO workers (name_worker, birthday, salary)
VALUES('Ярослав', '1980/9/10', 1200),
  ('Петр', '1993/7/3', 1000);
-------------------------------------------------
INSERT INTO workers (name_worker, birthday, salary)
VALUES('Сергей', '1994/6/6', 900),
  ('Андрей', '1998/2/2', 950),
  ('Василий', '1997/9/9', 1100),
  ('Артем', '1995/7/7', 500),
  ('Анна', '1991/6/5', 500),
  ('Наталья', '1989/3/9', 1400),
  ('Николай', '1984/3/9', 1600),
  ('Александр', '1986/9/1', 400),
  ('Владимир', '1996/10/8', 300),
  ('Михаил', '1975/10/10', 2500);
--===============================================
--UPDATE--
-------------------------------------------------
UPDATE workers
SET salary = 200
WHERE name_worker = 'Василий';
-------------------------------------------------
UPDATE workers
SET birthday = '1987/7/3'
WHERE id = 4;
-------------------------------------------------
UPDATE workers
SET salary = 700
WHERE salary = 500;
-------------------------------------------------
UPDATE workers
SET birthday = '1999-1-1'
WHERE id > 2
  AND id <= 5;
-------------------------------------------------
UPDATE workers
SET name_worker = 'Евгений',
  salary = 900
WHERE name_worker = 'Василий';
--===============================================
--SELECT
-------------------------------------------------
SELECT *
FROM workers
WHERE id = 3;
-------------------------------------------------
SELECT *
FROM workers
WHERE salary > 400;
-------------------------------------------------
SELECT *
FROM workers
WHERE salary != 500;
-------------------------------------------------
SELECT salary,
  EXTRACT (
    YEAR
    FROM age(birthday)
  ) AS age
FROM workers
WHERE name_worker = 'Евгений';
-------------------------------------------------
SELECT *
FROM workers
WHERE name_worker = 'Петр';
-------------------------------------------------
SELECT *
FROM workers
WHERE name_worker != 'Петр';
-------------------------------------------------
SELECT *
FROM workers
WHERE EXTRACT (
    YEAR
    FROM age(birthday)
  ) = 27
  OR salary = 1000;
-------------------------------------------------
SELECT *
FROM workers
WHERE EXTRACT (
    YEAR
    FROM age(birthday)
  ) > 25
  AND EXTRACT (
    YEAR
    FROM age(birthday)
  ) <= 28;
-------------------------------------------------
SELECT *
FROM workers
WHERE (
    EXTRACT (
      YEAR
      FROM age(birthday)
    ) > 23
    AND EXTRACT (
      YEAR
      FROM age(birthday)
    ) < 27
  )
  OR (
    salary > 400
    AND salary < 1000
  );
-------------------------------------------------
SELECT *
FROM workers
WHERE EXTRACT (
    YEAR
    FROM age(birthday)
  ) = 27
  OR salary != 400;
--===============================================
--DELETE--
-------------------------------------------------
DELETE FROM workers
WHERE id = 7
RETURNING *;
-------------------------------------------------
DELETE FROM workers
WHERE name_worker = 'Николай'
RETURNING *;
-------------------------------------------------
DELETE FROM workers
WHERE EXTRACT (
    YEAR
    FROM age(birthday)
  ) = 23
RETURNING *;
-------------------------------------------------