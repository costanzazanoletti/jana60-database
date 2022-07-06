CREATE DATABASE db_university;

USE db_university;

CREATE TABLE dipartimenti(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL,
	capo VARCHAR(255),
	indirizzo VARCHAR(255),
	PRIMARY KEY(id)
);

ALTER TABLE dipartimenti ADD CONSTRAINT unique_name UNIQUE(nome);

CREATE TABLE corso_di_laurea(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL, 
	tipo VARCHAR(255),
	segreteria VARCHAR(255),
	dipartimento_id INT,	
	PRIMARY KEY(id),
	FOREIGN KEY(dipartimento_id) REFERENCES dipartimenti(id)
);

CREATE TABLE corso(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL, 
	cfu SMALLINT, 
	numero_ore INT,
	PRIMARY KEY(id)
);
ALTER TABLE corso ADD COLUMN corso_di_laurea_id INT;
ALTER TABLE corso ADD FOREIGN KEY(corso_di_laurea_id) REFERENCES corso_di_laurea(id);

CREATE TABLE insegnanti(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL, 
	cognome VARCHAR(255) NOT NULL,
	email VARCHAR(255), 
	PRIMARY KEY(id)
);

CREATE TABLE insegnanti_corsi(
	insegnanti_id INT, 
	corsi_id INT,
	FOREIGN KEY(insegnanti_id) REFERENCES insegnanti(id),
	FOREIGN KEY(corsi_id) REFERENCES corso(id),
	PRIMARY KEY(insegnanti_id, corsi_id)
);

CREATE TABLE studenti(
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(255) NOT NULL, 
	cognome VARCHAR(255) NOT NULL,
	matricola VARCHAR(255) NOT NULL UNIQUE, 
	corso_di_laurea_id INT,
	PRIMARY KEY(id),
	FOREIGN KEY(corso_di_laurea_id) REFERENCES corso_di_laurea(id)
);

















