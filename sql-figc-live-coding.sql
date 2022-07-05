-- creo il database
CREATE DATABASE figc;
-- DROP DATABASE db_biblioteca;

-- uso il database appena creato
USE figc;

-- creo le tabelle
CREATE TABLE stadi(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	numero_posti INT,
	numero_anelli SMALLINT,
	indirizzo VARCHAR(255),
	PRIMARY KEY(id)
);


CREATE TABLE squadre(
	id BIGINT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL UNIQUE,
	bilancio DECIMAL(19,4),
	numero_dipendenti INT,
	allenatore VARCHAR(255),
	presidente VARCHAR(255),
	anno_fondazione YEAR,
	numero_scudetti SMALLINT DEFAULT(0),
	PRIMARY KEY(id)
);

-- aggiungo la foreign key
ALTER TABLE squadre ADD COLUMN stadi_id INT;
ALTER TABLE squadre ADD FOREIGN KEY(stadi_id) REFERENCES stadi(id);

-- DROP TABLE squadre;

-- popoliamo la tabella stadi
INSERT INTO stadi(nome, numero_posti, numero_anelli, indirizzo) 
VALUES('Maradona', 80000, 4, 'Piazzale Tecchio, Napoli');

DELETE FROM stadi WHERE id = 2;

UPDATE stadi SET nome = 'Stadio Olimpico', numero_posti = 76000 WHERE id = 3;

SELECT *  FROM stadi;

INSERT INTO squadre
(nome, bilancio, numero_dipendenti, allenatore, presidente, anno_fondazione, numero_scudetti, stadi_id)
VALUES('Napoli S.S.C.', 58000000, 80, 'Ruben Fiore', 'Davied Catalano', '1926', 2, 1);

INSERT INTO squadre
(nome, bilancio, numero_dipendenti, allenatore, presidente, anno_fondazione, numero_scudetti, stadi_id)
VALUES('Napoli', 58000000, 80, 'Ruben Fiore', 'Davied Catalano', '1926', 2, 10);

INSERT INTO squadre
(nome, bilancio, numero_dipendenti, allenatore, presidente, anno_fondazione, numero_scudetti, stadi_id)
VALUES('Napoli JANA60', 58000000, 80, 'Ruben Fiore', 'Davied Catalano', '1926', 2, 3);
