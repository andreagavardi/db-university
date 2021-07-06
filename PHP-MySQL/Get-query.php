<?php


define("DB_SERVERNAME", "localhost");
define("DB_USERNAME", "root");
define("DB_PASSWORD", "");
define("DB_NAME", "university");


$connection = new mysqli(DB_SERVERNAME, DB_USERNAME, DB_PASSWORD, DB_NAME);
//var_dump($connection);

#controllo connessione
if ($connection && $connection->connect_error) {
    echo 'Connessione falita, errore:' . $connection->connect_error;
} else {
    echo 'Connessione avvenuta correttamente';
    //var_dump($connection);
}

//var_dump($_GET['year']);
if ($_GET['year'] != null) {
    $anno_di_iscrizione = $_GET['year'];
}
#creo la query
$sql = "SELECT `students`.`name`,students.surname,students.date_of_birth,students.email,students.enrolment_date\n"

    . "FROM `students`\n"

    . "WHERE YEAR(`enrolment_date`) >= " . $anno_di_iscrizione . "\n"

    . "ORDER BY (`surname`)ASC;";

$result = $connection->query($sql);
$students = [];
$no_data = null;
#controllo il risultato
if ($result && $result->num_rows > 0) {

    //ciclo all'interno delle righe
    while ($student = $result->fetch_array()) {
        $students[] = $student;
    }
} elseif ($result) {
    echo "nessun risultato";
    $no_data = "Non ci sono studenti immatricolati da questa data in poi";
} else {
    echo "errore nella query";
};
//var_dump($students);


?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Get Students From Year</title>
</head>

<body>
    <form action="#" method="get">
        <div class="form-group">
            <label for="year">Anno d'iscrizione</label>
            <input type="text" name="year" id="year" class="form-control" placeholder="inserisci un anno" aria-describedby="helpId">
            <small id="helpId" class="text-muted">Inserisci un anno compreso tra 2018 e 2021</small>
        </div>
    </form>
    <div class="students">
        <h2>Studenti immatricolati dal <?= $_GET['year'] ?> in poi</h2>

        <?php
        //var_dump($no_data);
        if ($no_data == null) {

            foreach ($students as $student) :
                /* ($student['name']);
                    die(); */ ?>
                <div class="student">
                    <span><strong>Cognome:</strong>
                        <?= $student['surname'] ?>
                    </span>
                    <span> <strong>Nome:</strong>
                        <?= $student['name'] ?>
                    </span>
                    <span> <strong>Anno di nascita:</strong>
                        <?= $student['date_of_birth'] ?>
                    </span>
                    <span> <strong>email: </strong>
                        <?= $student['email'] ?>
                    </span>
                    <span> <strong>Anno di iscrizione: </strong>
                        <?= $student['enrolment_date'] ?>
                    </span>

                </div>
            <?php endforeach ?>
        <?php } else {
            echo $no_data;
        } ?>

    </div>
</body>

</html>