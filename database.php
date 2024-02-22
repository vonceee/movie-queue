<?php

    $hostName="localhost";
    $dbUser="root";
    $dbPassword="";
    $dbName="cinema_20240126_afterchecking_1";
    $conn= mysqli_connect($hostName, $dbUser, $dbPassword, $dbName);
    if (!$conn) {
        die("Something went wrong!");
    }

?>