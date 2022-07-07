-- Selezionare il dipartimento il cui capo è Bernardo Sanna
SELECT * FROM departments WHERE head_of_department = 'Bernardo Sanna';

-- Selezionare tutti i corsi di laurea magistrale
SELECT * FROM `degrees` where `level` = 'magistrale'; 

SELECT DISTINCT `level` FROM `degrees`;

-- Selezionare tutti i corsi che valgono più di 10 crediti
SELECT name, cfu FROM courses WHERE cfu > 10;

-- Selezionare tutti gli insegnanti che non hanno il numero di telefono
SELECT * FROM teachers WHERE phone IS NULL;
UPDATE teachers SET phone = 'N.D.' WHERE phone IS NULL;

-- Selezionare tutti gli studenti che hanno più di 30 anni
SELECT * FROM students WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > 30;

-- Selezionare tutti gli studenti che hanno un indirizzo email gmail o yahoo
SELECT * FROM students WHERE email LIKE '%@gmail%' OR email LIKE '%@yahoo%';

-- Selezionare tutti gli esami che si sono svolti a luglio 2020
SELECT * FROM exams WHERE MONTH(`date`) = 7 AND YEAR(`date`) = 2020;
SELECT * FROM exams WHERE `date` >= '2020-07-01' AND `date` <= '2020-07-31';