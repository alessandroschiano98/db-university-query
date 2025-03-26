-- ESERCIZIO 1 
-- 1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT *
FROM `students`
WHERE `date_of_birth` LIKE "1990%";
-- ALTERNATIVA --
/*
SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990
ORDER BY `date_of_birth` DESC;
*/

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT * 
FROM `courses` 
WHERE `cfu` > 10 
ORDER BY `cfu` ASC;
-- 3. Selezionare tutti gli studenti che hanno più di 30 anni (corretto tramite lezione)
SELECT `id`, `name`, `surname`, `date_of_birth`, TIMESTAMPDIFF(YEAR,`date_of_birth`,CURDATE()) as `age`
FROM `students`
WHERE TIMESTAMPDIFF(YEAR,`date_of_birth`,CURDATE()) > 30
ORDER BY `age`;
-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT *
FROM `courses`
WHERE `period` = "I semestre" AND `year` = 1;
-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20-06-2020 (21)
SELECT * 
FROM `exams`
WHERE YEAR(`date`) = 2020
AND MONTH(`date`) = 6 
AND DAY (`date`) = 20
AND HOUR (`hour`) >= 14;
-- 6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT * 
FROM `degrees`
WHERE `level` = "magistrale";
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
SELECT YEAR (`enrolment_date`), COUNT(*)
FROM `students`
GROUP BY YEAR (`enrolment_date`);
-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT `office_address`, COUNT(*)
FROM `teachers`
GROUP BY `office_address`;
-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_id`, AVG(`vote`)
FROM `exam_student`
GROUP BY `exam_id`;
-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT `department_id`, COUNT(*)
FROM `degrees`
GROUP BY `department_id`;

-- ESERCIZIO 3 

-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia -- 
-- 2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze --
-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44) --
-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome --
-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti --
-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54) --
-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami --