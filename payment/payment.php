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

    //This part is responsible for displaying the contents of the array and not the whole array 
    // Check if the session variable is set
    if (isset($_SESSION['cinema-seat'])) {
        // Decode the JSON string into a PHP array
        $cinemaSeatArray = json_decode($_SESSION['cinema-seat']);

        // Check if decoding was successful
        if ($cinemaSeatArray !== null) {
            // Initialize an empty string to store the values
            $seatValues = "";

            // Loop through the array and concatenate the values
            foreach ($cinemaSeatArray as $value) {
                $seatValues .= $value . ", ";
            }

            // Remove the trailing comma and space
            $seatValues = rtrim($seatValues, ", ");
        }
    }
    //This part is responsible for displaying the contents of the array and not the whole array 

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

    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- JQuery -->

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
                        //header("Location: ../ticket.html");
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
        
    <?php echo '<p class="text-success">Your chosen seat ID is: <mark>' . $seatValues . ' </mark>'; ?>
    <p class="lead text-muted">Insert Payment Below:</p>                
    <form action="payment.php" method="post">
    <div class="form-group"> 
    <input type="text" class="form-control-lg" name="paymentMoney" id="exampleFormControlTextarea1" rows="3"></textarea>
    </div>        
    <div class="form-group">
    <input type="submit" class="btn btn-primary my-3 btn-lg" name="transactPay" value="Pay Now!" placeholder="transactPay">
    </div>
    </form>
        
           
    



    </div>

    <!-- JavaScript To Insert To Data Base -->
   <!-- JavaScript To Insert To Data Base -->

    <script>
        // Function to insert seat value into the database via AJAX
        function insertSeatToDatabase(seatValue) {
            $.ajax({
                url: '../insert-seat.php',
                type: 'POST',
                data: { seatValue: seatValue },
                success: function(response) {
                    console.log(response); // Log success response
                },
                error: function(xhr, status, error) {
                    console.error(error); // Log error message
                }
            });
        }
        
        document.addEventListener('DOMContentLoaded', function() {
        // Retrieve the form element
        const paymentForm = document.querySelector('form');

        // Add a submit event listener to the form
        paymentForm.addEventListener('submit', function(event) {
            // Prevent the default form submission behavior
            event.preventDefault();        -            
            
            console.log(<?php echo $_SESSION['cinema-seat']?>);
            var test = JSON.stringify(<?php echo $_SESSION['cinema-seat']?>);
            console.log(test);
            insertSeatToDatabase(test);
            // Insert seat values into the database
            

            // Log "test" to the console when the button is clicked

            // Retrieve the cinema seat value from the PHP session
            // Insert your code here to retrieve and handle the cinema seat value
            
            // Optionally, you can submit the form programmatically if needed
            // paymentForm.submit();
        });
    });



</script>

</body>
</html>
