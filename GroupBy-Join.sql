/*
Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
 */
 
/* GROUP BY: */
 /* Contare quanti iscritti ci sono stati ogni anno */
 SELECT COUNT(`id`) AS numero_di_iscritti, YEAR(`enrolment_date`) AS anno_di_iscrizione 
 FROM `students` 
 GROUP BY anno_di_iscrizione;

 /* Contare gli insegnanti che hanno l'ufficio nello stesso edificio */
 SELECT COUNT(`id`) AS numero_insegnanti, `office_address` AS edificio
 GROUP BY edificio

 /* Calcolare la media dei voti di ogni appello d'esame */
SELECT AVG(`vote`) AS voto_medio, `exam_id` AS esame
FROM `exam_student`
GROUP BY `exam_id`;

/* Contare quanti corsi di laurea ci sono per ogni dipartimento */
SELECT COUNT(`id`) AS n_corsi_di_laurea, `department_id` AS dipartimento 
FROM `degrees` 
GROUP BY dipartimento;

/* JOINS: */
/* Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia */
SELECT students.name, students.surname, students.email,degrees.name,degrees.level,degrees.website
FROM `students`
JOIN `degrees`
ON degree_id = degrees.id
WHERE degrees.name = "Corso di Laurea in Economia";

