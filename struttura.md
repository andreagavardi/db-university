<!-- Modellizzare la struttura di una tabella per memorizzare tutti i dati riguardanti una università:
- sono presenti diversi dipartimenti, ciascuno con i propri corsi di laurea;
- ogni corso di laurea è formato da diversi corsi;
- ogni corso può essere tenuto da diversi insegnanti e prevede più appelli d'esame;
- ogni studente è iscritto ad un corso di laurea;
- per ogni appello d'esame a cui lo studente ha partecipato, è necessario memorizzare il voto ottenuto, anche se non sufficiente
 -->

# Università

- ID BIGINT PRIMARY_KEY UNIQUE AUTO_INCREMENT NOT NULL
- nome VARCHAR(50) NOT NULL INDEX
- indirizzo VARCHAR(50) NOT NULL INDEX
- contatti VARCHAR(255) NULL

## dipartimenti

- ID BIGINT PRIMARY_KEY UNIQUE AUTO_INCREMENT NOTNULL
- nome VARCHAR(50) NOTNULL INDEX
- indirizzo VARCHAR(50) NULL
- contatti VARCHAR(255) NULL
- università_ID BIGINT FK NOTNULL INDEX

## corsi di laurea

- ID INT PRIMARY_KEY UNIQUE AUTO_INCREMENT NOTNULL
- nome VARCHAR(50) NOTNULL INDEX
- anno_accademico YEAR NOTNULL INDEX
- tipologia_di_corso <!-- triennale, magisrale, specialistica --> VARCHAR(15) NOTNULL INDEX
- dipartimento_ID BIGINT FK NOTNULL INDEX

## studenti

- ID BIGINT PRIMARY_KEY UNIQUE AUTO_INCREMENT NOT NULL
- nome VARCHAR(20) NOTNULL INDEX
- cognome VARCHAR(20) NOTNULL INDEX
- contatti VARCHAR(255) NULL
- corso_di_laurea_ID INT FK NOTNULL UNIQUE INDEX

## appelli d'esame

- ID BIGINT PRIMARY_KEY UNIQUE AUTO_INCREMENT NOT NULL
- corso_di_laurea_ID BIGINT FK NOTNULL INDEX
- studente_ID BIGINT FK NOTNULL INDEX
- data DATETIME NOTNULL INDEX
- voto VARCHAR(13) NOTNULL

## docenti

- ID BIGINT PRIMARY_KEY UNIQUE AUTO_INCREMENT NOT NULL
- nome VARCHAR(20) NOTNULL INDEX
- cognome VARCHAR(20) NOTNULL INDEX
- dipartimento_ID BIGINT FK NOTNULL INDEX
- corso di laurea_ID BIGINT FK NOTNULL INDEX
