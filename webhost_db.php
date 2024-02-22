<?php

    $hostName="localhost";
    $dbUser="id21911344_root";
    $dbPassword="Datama2_2024";
    $dbName="id21911344_movie_queue_register";
    $conn= mysqli_connect($hostName, $dbUser, $dbPassword, $dbName);
    if (!$conn) {
        die("Something went wrong!");
    }

?>