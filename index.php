<?php
  session_start();

  include 'database.php';
    $sqlPrice = "SELECT price FROM tbl_cinema1";
    $result = mysqli_query($conn, $sqlPrice);
    $row = mysqli_fetch_assoc($result);
    $_SESSION["price"] = $row['price'];

  if(isset($_SESSION["user"])){
    $userId = $_SESSION["user"]["id"];
    }
?>



<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.72.0">
  <title>Transaction</title>

  <link rel="canonical" href="https://v5.getbootstrap.com/docs/5.0/examples/album/">

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js" integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  
  <!-- CSS Files -->
  <link rel="stylesheet" href="index.css">
  <link rel="stylesheet" href="cinema-seat.css">

  <!-- jQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- Include jQuery library -->

</head>

<body>
  <header>
    <div class="navbar navbar-light bg-light shadow-sm">
      <div class="container">
      <div id="logo">
            <a class="navbar-brand" href="#">
                <img src="https://www.smsupermalls.com/themes/revamp2022/assets/img/logo.svg" class="d-inline-block align-top" alt="">
            </a>
        </div>
      </div>
    </div>
  </header>

  <main>

    <section class="py-3 text-center container">        
        <div class="row py-lg-5 justify-content-center ">
            <div class="col-3 mx-4">
            <!-- movie poster -->
            <img src="https://m.media-amazon.com/images/M/MV5BOTVlNWEyNmMtYmI0ZC00NWJlLTgyZGItMmE5MWYxNTAyZDRlXkEyXkFqcGdeQXVyNTI5NjIyMw@@._V1_FMjpg_UX1000_.jpg" class="img-fluid" id="moviePoster" alt="Responsive image">        
            </div>
            <!-- movie poster -->
            <div class="col-lg-6 col-md-8 ">   
            

            <?php

              if(isset($_POST["transactPay"])) {
                // Validate form input and check for errors
                $paymentMoney = $_POST["paymentMoney"];
                $errors = array();
                // Validate if the payment amount is empty
                if (empty($paymentMoney)) {
                    array_push($errors, "Please put money in the box");
                }
                // Fetch price from database
                
                $price = $_SESSION["price"];
                // Validate if payment amount is less than the price
                if ($paymentMoney < $price) {
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
                        header("Location: ticket.html");
                        echo "<div class='alert alert-success'>Payment recorded successfully!</div>";

                    include 'database.php';
                    $tbl_customer = "SELECT * FROM tbl_customer";
                    $result_customer = mysqli_query($conn, $tbl_customer);
                    $tb_customer = mysqli_fetch_array($result_customer, MYSQLI_ASSOC);
                    } else {
                        die("Something went wrong");
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

          <h1 class="font-weight-light">Rewind.2023.1080p.WEBRip.DD5.1.x264-GalaxyRG</h1>
          
          <?php                            
              // To Use Next Time
              $price = $_SESSION["price"];
              echo '<p class="lead text-muted">' . $price . '</p>';           
              
              // if (isset($_SESSION['user'])) {
              //   echo '<p class="lead text-muted">Insert Payment Below:</p>';                
              //   echo '<form action="index.php" method="post">';
              //     echo '<div class="form-group"> ';
              //     echo '<input type="text" class="form-control-lg" name="paymentMoney" id="exampleFormControlTextarea1" rows="3"></textarea>';
              //   echo '</div>';
              //   echo '<div class="form-group">';
              //     echo '<input type="submit" class="btn btn-primary my-3 btn-lg" name="transactPay" value="Pay Now!" placeholder="transactPay">';
              //   echo '</div>';
              //   echo "</form>";
              // }
          ?>
          <div class="container mt-3 mx-auto">
            <div class="row seats">
              <!-- Cinema seat buttons -->
              <button id="1" class="cinema-seat m-1"></button>
              <button id="2" class="cinema-seat m-1"></button>
              <button id="3" class="cinema-seat m-1"></button>
              <button id="4" class="cinema-seat m-1"></button>
              <button id="5" class="cinema-seat m-1"></button>
            </div>
            <div class="row seats">
              <button id="6" class="cinema-seat m-1"></button>
              <button id="7" class="cinema-seat m-1"></button>
              <button id="8" class="cinema-seat m-1"></button>
              <button id="9" class="cinema-seat m-1"></button>
              <button id="10" class="cinema-seat m-1"></button>
            </div>
            <!-- More rows of seats can be added here -->
          </div>
          
          <!-- Button to trigger modal -->
          <button type="button" class="btn btn-primary my-3" data-toggle="modal" data-target="#exampleModal">
            Confirm
          </button>

          <!-- Modal -->
          <div class="modal" id="exampleModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Save Changes</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <p>Sign in to proceed to payment.</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary">Save changes</button>
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </section>

    

  </main>

  <footer class="text-muted py-1">
    <div class="container">
      <p class="mb-1">This is SM &copy; Property, Copyright 2024</p>
      <p class="mb-0">New to SM? <a href="/">Visit the homepage</a> or our FAQ <a
          href="/docs/5.0/getting-started/introduction/">to read more</a>.</p>
    </div>
  </footer>
  
<!-- JavaScript -->
<script src="index.js"></script>
</body>
</html>