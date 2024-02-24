<?php
    session_start();
    if(!isset($_SESSION["user"])){
        header("Location: ../login/login.php");
    }

    // Include the database connection file
    include '../database.php';

    // Assuming the user's ID is stored in the session
    $userID = $_SESSION["user"];

    // Fetch all user information from the database
    $query = "
SELECT
    t.id,
    c.customer_first_name,
    c.customer_last_name,
    c.email,
    ci.cinema_name,
    s.seat_designation,
    t.transaction_date,
    t.random_string
FROM
    tbl_transaction t
JOIN tbl_customer c ON t.customer_id = c.id
JOIN tbl_cinema1 ci ON t.cinema_id = ci.id
JOIN tbl_seats s ON t.seats_id = s.id
";

    $result = mysqli_query($conn, $query);

    // Check if there are any rows returned
    if(mysqli_num_rows($result) > 0) {
        ?>
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Customer Table</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
            <link rel="stylesheet" href="style.css">
        </head>
        <body>
            <div class="container">
                <h1>Customer Table</h1>

                <!-- User Information Table -->
                <table class="table">
                    <thead>
                        <tr>
                            <th>Custoemr ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Cinema Number</th>               
                            <th>Seat Designation</th>                 
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // Loop through each row and display data in table rows
                        while($row = mysqli_fetch_assoc($result)) {
                            ?>
                            <tr>
                   
                                <td><?= $row['id'] ?></td>
                                <td><?= $row['customer_first_name'] ?></td>
                                <td><?= $row['customer_last_name'] ?></td>
                                <td><?= $row['email'] ?></td>
                                <td><?= $row['cinema_name'] ?></td> 
                                <td><?= $row['seat_designation'] ?></td>                    
                            </tr>
                            <?php
                        }
                        ?>
                    </tbody>
                </table>
                <a href="../logout.php" class="btn btn-warning">Logout</a>
            </div>
        </body>
        </html>
        <?php
    } else {
        // Handle case where no rows are returned
        echo "No records found.";
    }
?>
