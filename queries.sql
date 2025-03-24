-- ESERCIZIO 1 
-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT *
FROM `students`
WHERE `date_of_birth` LIKE "1990%";
-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT * 
FROM `courses` 
WHERE `cfu` > 10 
ORDER BY `cfu` ASC;
-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT *
FROM `students`
WHERE `date_of_birth` LIKE "1995%"; 
-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT *
FROM `courses`
WHERE `period` = "I semestre" AND `year` = 1;
-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20-06-2020 (21)

-- 6. Selezionare tutti i corsi di laurea magistrale (38)

-- 7. Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(*) AS `dipartimenti_università`
FROM `departments`;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT COUNT(*) AS `insegnanti_sprovvisti_di_numero_cell`
FROM `teachers`
WHERE `phone` IS NULL;
-- 9. Inserire nella tabella degli studenti un nuovo record con i propri dati (per il campo degree_id, inserire un valore casuale)
SELECT * 
FROM `students`;
INSERT INTO `students` (degree_id,name, surname, date_of_birth, fiscal_code, enrolment_date, registration_number, email)
VALUES (5,"Alessandro","Schiano", '1998-10-17', "SCHLSN98R17F839O", '2025-03-21', 621033, "schianoski98@gmail.com");
-- 10. Cambiare il numero dell’ufficio del professor Pietro Rizzo in 126
UPDATE teachers
SET office_number = 126
WHERE id = 58;
-- 11. Eliminare dalla tabella studenti il record creato precedentemente al punto 9
DELETE FROM `students` 
WHERE `degree_id` = 5 AND `email` = "schianoski98@gmail.com";


-- ESERCIZIO 2
-- 1. Contare quanti iscritti ci sono stati ogni anno
-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
-- 3. Calcolare la media dei voti di ogni appello d'esame
-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento