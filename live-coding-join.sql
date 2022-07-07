-- quante prenotazioni sono state fatte per ogni stanza e mostrarle in ordine discendente
SELECT COUNT(*) as numero_prenotazioni, stanza_id 
FROM prenotazioni
GROUP BY stanza_id
ORDER BY numero_prenotazioni DESC;

-- raggruppare le stanze per piano
SELECT `floor`, COUNT(*) as numero_stanze
FROM stanze
GROUP BY `floor`
ORDER BY `floor` ASC;

-- selezionare i paganti e i relativi dati ospite
SELECT *
FROM paganti p 
INNER JOIN ospiti o 
ON p.ospite_id = o.id; 


-- seleziona nome e cognome di tutti i paganti con la relativa data di nascita (se presente)
SELECT p.name , p.lastname , o.date_of_birth 
FROM paganti p 
LEFT OUTER JOIN ospiti o 
ON p.ospite_id = o.id; 


SELECT p.name , p.lastname , o.date_of_birth 
FROM paganti p 
RIGHT OUTER JOIN ospiti o 
ON p.ospite_id = o.id; 

-- Selezionare tutti i pagamenti con i dati relativi alla prenotazione
SELECT pa.status , pa.price , pa.pagante_id , pa.created_at , pa.updated_at , pr.stanza_id , pr.configurazione_id , pr.created_at , pr.updated_at 
FROM pagamenti pa
INNER JOIN prenotazioni pr
ON pa.prenotazione_id = pr.id; 

-- Selezionare tutti i pagamenti con i dati relativi alla prenotazione e il nome e cognome del pagante
-- ordinati per nome e cognome del pagante
SELECT pa.status , pa.price , pag.name , pag.lastname , pr.stanza_id , pr.configurazione_id 
FROM pagamenti pa
INNER JOIN prenotazioni pr
ON pa.prenotazione_id = pr.id
INNER JOIN paganti pag 
ON pa.pagante_id = pag.id
ORDER BY pag.name , pag.lastname ; 

-- Selezionare tutte le prenotazioni ordinate per data di creazione, 
-- mostrando i dati della stanza e della configurazione
SELECT p.id , p.created_at , s.room_number , s.`floor` , c.title 
FROM prenotazioni p 
INNER JOIN stanze s 
ON p.stanza_id = s.id 
INNER JOIN configurazioni c 
ON p.configurazione_id = c.id
ORDER BY p.created_at; 

-- quante prenotazioni sono state fatte per ogni stanza e mostrarle in ordine discendente
SELECT s.room_number, COUNT(p.id) 
FROM stanze s 
LEFT OUTER JOIN prenotazioni p 
ON s.id = p.stanza_id
GROUP BY s.room_number 
ORDER BY s.room_number; 

-- quanto ha speso in media ogni pagante prendendo solo quelli che hanno un ospite associato
SELECT p2.name , p2.lastname, AVG(p.price) as average_price
FROM pagamenti p 
INNER JOIN paganti p2
ON p.pagante_id = p2.id
WHERE p.status = 'accepted' AND p2.ospite_id IS NOT NULL
GROUP BY p2.name , p2.lastname 
ORDER BY average_price DESC; 


-- DIVAGAZIONE SULLE VIEW
-- una view è una select che viene salvata in una tabella virtuale
CREATE VIEW stanze_con_piano AS
SELECT `floor`, COUNT(*) as numero_stanze
FROM stanze
GROUP BY `floor`
ORDER BY `floor` ASC;

SELECT * FROM stanze_con_piano;



INSERT INTO stanze
(room_number, floor, beds, created_at, updated_at)
VALUES(110, 1, 5, '2022-07-07 12:17:10', '2022-07-07 12:17:10');


SELECT *
FROM ospiti o 
INNER JOIN paganti p 
ON LOWER(o.name) = LOWER(p.name) AND LOWER(o.lastname)  = LOWER(p.lastname); 


