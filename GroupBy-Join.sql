 
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

/* Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze */
SELECT degrees.name, degrees.level, departments.name, departments.address, departments.phone,departments.website
FROM `degrees`
JOIN `departments`
ON department_id = degrees.department_id
WHERE departments.name = "Dipartimento di Neuroscienze";

/* Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44) */
SELECT teachers.name, teachers.surname, courses.name, courses.period, courses.year, courses.cfu
FROM `course_teacher`
JOIN `courses`
ON course_teacher.course_id = courses.id
JOIN `teachers`
ON teachers.id = course_teacher.teacher_id
WHERE course_teacher.teacher_id = 44;

/* Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti
 e il relativo dipartimento, in ordine alfabetico per cognome e nome
 */
SELECT students.name, students.surname, students.date_of_birth, students.email, degrees.name, degrees.level, departments.name
FROM `students`
JOIN `degrees`
ON degrees.id = students.degree_id
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
ORDER BY (`students`.surname) ASC;

/* Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti */
SELECT degrees.name AS laurea, degrees.level,courses.name AS nome_corso, courses.period, courses.year, courses.cfu, teachers.name AS nome_docente, teachers.surname AS cognome_docente, teachers.email
FROM `degrees`
JOIN `courses`
ON degrees.id = courses.degree_id
JOIN `course_teacher`
ON courses.id = course_teacher.course_id
JOIN `teachers`
ON course_teacher.teacher_id = teachers.id
ORDER BY(`degrees`.`name`) ASC;

/* Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54) */
SELECT `departments`.`name` AS nome_dipartimento, departments.address, departments.website, teachers.name AS nome_docente, teachers.surname AS cognome_docente 
FROM `departments`
JOIN `degrees`
ON degrees.department_id = departments.id
JOIN `courses`
ON degrees.id = courses.degree_id
JOIN `course_teacher`
ON courses.id = course_teacher.course_id
JOIN `teachers`
ON course_teacher.teacher_id = teachers.id
WHERE departments.name = "Dipartimento di Matematica";

/*
BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
 */
 SELECT COUNT(`exam_id`) AS numero_di_tentativi, exams.id AS id_esame, students.name AS nome_studente, students.surname AS cognome_studente
FROM `exam_student`
JOIN students
ON exam_student.student_id = students.id
JOIN exams
ON exams.id = exam_student.exam_id
WHERE exam_student.vote < 18
GROUP BY exam_student.student_id
ORDER BY (`students`.`surname`) ASC;

