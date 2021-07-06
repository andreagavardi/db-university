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


#creo la query
$sql = "SELECT * FROM departments";

$result = $connection->query($sql);
//var_dump($result);


#controllo il risultato
if ($result && $result->num_rows > 0) {

    //ciclo all'interno delle righe
    while ($department = $result->fetch_array()) {
        //var_dump($department);
?>
        <h1><?= $department['name']; ?></h1>
        <h4>Indirizzo: <?= $department['address']; ?></h4>
        <h4>Contatti: </h4>
        <span>Telefono: <?= $department['phone']; ?> </span> <span>Email: <?= $department['email']; ?></span>
        <div class="site">
            <h4>Pagina web: </h4>
            <a href="#"><?= $department['website']; ?></a>
        </div>
<?php
    }
} elseif ($result) {
    echo "nessun risultato";
} else {
    echo "errore nella query";
};

//$connection->close;
