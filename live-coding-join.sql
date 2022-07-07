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











