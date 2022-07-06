USE db_university;

INSERT INTO dipartimenti (nome, capo, indirizzo) 
VALUES ('Ingegneria', 'Pinco Pallino', 'piazzale Leonardo, Milano');
INSERT INTO dipartimenti (nome, capo, indirizzo) 
VALUES ('Architettura', 'Rosa Chiara', 'piazzale Leonardo, Milano');

-- DELETE FROM dipartimenti WHERE id = 3;

SELECT * FROM dipartimenti;

INSERT INTO corso_di_laurea
(nome, tipo, segreteria, dipartimento_id)
VALUES('Ingegneria informatica', 'Laurea Triennale', 'Didattica', 4);
INSERT INTO corso_di_laurea
(nome, tipo, segreteria, dipartimento_id)
VALUES('Intelligenza Artificiale', 'Laurea Specialistica', 'Didattica', 4);


INSERT INTO corso
(nome, cfu, numero_ore, corso_di_laurea_id)
VALUES('Basi di dati', 10, 50, 1);

INSERT INTO corso
(nome, cfu, numero_ore, corso_di_laurea_id)
VALUES('Robotica', 40, 500, 2);

INSERT INTO insegnanti
(nome, cognome, email)
VALUES('Costanza', 'Zanoletti', 'cz@emali.it');
INSERT INTO insegnanti
(nome, cognome, email)
VALUES('Francesco', 'Elia', 'fe@emali.it');

SELECT * from insegnanti;

INSERT INTO insegnanti_corsi
(insegnanti_id, corsi_id)
VALUES(1, 1);
INSERT INTO insegnanti_corsi
(insegnanti_id, corsi_id)
VALUES(2, 1);
INSERT INTO insegnanti_corsi
(insegnanti_id, corsi_id)
VALUES(2, 2);


