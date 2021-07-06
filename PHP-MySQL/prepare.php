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
    /* var_dump($connection);
    die(); */
}

$statement = $connection->prepare("INSERT INTO `departments` (`name`,`address`, `phone`,`email`,`website`,`head_of_department`) VALUES (?, ?, ?, ?, ?,?)");
$statement->bind_param("ssssss", $nome, $indirizzo, $telefono, $email, $sito, $capo);
$nome = "prova_1";
$indirizzo = "Prova 2";
$telefono = "Lorem, ipsum dolor.";
$email = "blabla@mail.com";
$sito = "www.mannaggia.it";
$capo = "me stesso";

$statement->execute();
var_dump($statement);
