/* 



5.Selezionare tutti gli appelli d'esame che avvengononel pomeriggio (dopo le 14) del20/06/2020(21)
6.Selezionare tutti i corsi di laurea magistrale(38)
7.Da quanti dipartimenti è composta l'università?(12)
8.Quanti sono gli insegnanti che non hanno un numerodi telefono?(50) */


/* 1.Selezionare tutti gli studenti nati nel 1990(160) */
SELECT *
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;


/* 2.Selezionare tutti i corsi che valgono più di 10 crediti(479) */
SELECT *
FROM `courses`
WHERE `cfu` > 10;

/* 3.Selezionare tutti gli studenti che hanno più di 30anni */
SELECT *
FROM `students`
WHERE (2021 - YEAR(`date_of_birth`)) > 30;

/* 4.Selezionare tutti i corsi del primo semestre del primoanno di un qualsiasi corso dilaurea(286) */
SELECT *
FROM `courses`
WHERE `year` = 1 AND `period` = 'I semestre';