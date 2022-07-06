-- Selezionare tutti gli ospiti
SELECT *
FROM `ospiti`;

-- Selezionare tutti gli ospiti con document type = a CI
SELECT *
FROM `ospiti`
WHERE `document_type` = 'CI';

-- Selezionare i paganti che abbiano un ospite id associato
SELECT *
FROM `paganti`
WHERE `ospite_id` IS NOT NULL;

-- Selezionare tutte le stanze del primo piano
SELECT *
FROM `stanze`
WHERE `floor` = 1;

-- Modificare la stanza 104 in modo che abbia 3 letti
UPDATE `stanze` SET `beds` = 3 WHERE `room_number` = 104;

-- Selezionare tutti gli ospiti che iniziano per E
SELECT *
FROM `ospiti`
WHERE `name` LIKE 'E%';

-- Selezionare tutti gli ospiti che abbiano meno di 30 anni
SELECT *
FROM `ospiti`
WHERE TIMESTAMPDIFF(YEAR, `date_of_birth`, CURDATE()) < 30;

