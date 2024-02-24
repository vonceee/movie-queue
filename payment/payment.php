<?php
    // Start the session
    session_start();
    include '../database.php';

    if(!isset($_SESSION["user"])){
        header("Location: ../login/login.php");           
    }   
    
    if(isset($_SESSION["user"])){
        $userId = $_SESSION["user"]["id"];
    }    

    $seatID =  $_SESSION['cinema-seat']
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    
    <!-- bootstrap navbar/header -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- bootstrap navbar/header -->

    <link rel="stylesheet" href="payment.css">
</head>
<body>
    
<!-- Image and text -->
    <nav class="navbar navbar-light bg-light">
        <div id="logo">
            <a class="navbar-brand" href="#">
                <img src="https://www.smsupermalls.com/themes/revamp2022/assets/img/logo.svg" class="d-inline-block align-top" alt="">
            </a>
        </div>
    </nav>
    <!-- Image and text -->

    <div class="container">
    
    <?php

        if(isset($_POST["transactPay"])) {
            // Validate form input and check for errors
            $paymentMoney = $_POST["paymentMoney"];
            $errors = array();
            // Fetch price from database
            $price = $_SESSION["price"];
            
            // Validate if the payment amount is empty
            if (empty($paymentMoney)) {
                array_push($errors, "Please put money in the box");
            
            // Validate if payment amount is less than the price
            } else if ($paymentMoney < $price) {
                array_push($errors, "Insufficient Fund");
            }
                    
            // If there are no errors, proceed with payment
            if (empty($errors)) {
                // Insert payment record into tbl_online_transaction table
                $sql = "INSERT INTO tbl_online_transaction (user_id, amount) VALUES (?, ?)";
                $stmt = mysqli_stmt_init($conn);
                
                if (mysqli_stmt_prepare($stmt, $sql)) {
                    mysqli_stmt_bind_param($stmt, "ii", $userId, $paymentMoney);
                    mysqli_stmt_execute($stmt);
                    mysqli_stmt_close($stmt); // Close the statement after execution
                
                    // Insert data into tbl_transaction
                    $sql_transaction = "INSERT INTO tbl_transaction (customer_id, cinema_id, seats_id) VALUES (?, ?, ?)";
                    $stmt_transaction = mysqli_stmt_init($conn);
                    $cinema_id_cheat = "1";
                
                    if (mysqli_stmt_prepare($stmt_transaction, $sql_transaction)) {
                        mysqli_stmt_bind_param($stmt_transaction, "iii", $userId, $cinema_id_cheat, $seatID);
                        mysqli_stmt_execute($stmt_transaction);
                        mysqli_stmt_close($stmt_transaction); // Close the statement after execution
                
                        // Redirect to ticket.html after successful payment
                        header("Location: ../ticket.html");
                        exit; // Terminate script execution after redirection
                    } else {
                        die("Error: Unable to prepare statement for tbl_transaction");
                    }
                } else {
                    die("Error: Unable to prepare statement for tbl_online_transaction");
                }
                
            } else {
                // Display validation errors
                foreach ($errors as $error) {
                    echo "<div class='alert alert-danger'>$error</div>";
                }
            }
            mysqli_close($conn); // Close database connection
        }                        
    ?>  

    <!-- Kahit hindi na php yung mga ito sa totoo lang, nakakatamad lang ibalik -->
    <?php
        if (isset($_SESSION['user'])) {
            echo '<p class="text-success">Your chosen seat ID is: <mark>' . $_SESSION['cinema-seat'] . ' </mark>';
            echo '<p class="lead text-muted">Insert Payment Below:</p>';                
            echo '<form action="./payment.php" method="post">';
            echo '<div class="form-group"> ';
            echo '<input type="text" class="form-control-lg" name="paymentMoney" id="exampleFormControlTextarea1" rows="3"></textarea>';
            echo '</div>';
            echo '<div class="form-group">';
            echo '<input type="submit" class="btn btn-primary my-3 btn-lg" name="transactPay" value="Pay Now!" placeholder="transactPay">';
            echo '</div>';
            echo "</form>";
                }
    ?>

    </div>

</body>
</html>
