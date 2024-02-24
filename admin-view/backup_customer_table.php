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
    $query = "SELECT  id, status, entry_date, entry_time, ticketcode, seatsID, cinema_number, customer_id FROM tbl_transaction WHERE customer_id = 1";
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
                            <th>Transaction ID</th>
                            <th>Status</th>
                            <th>Entry Date</th>
                            <th>Entry Time</th>
                            <th>Ticket Code</th>
                            <th>Seat ID</th>
                            <th>Cinema Number</th>
                            <th>Customer ID</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // Loop through each row and display data in table rows
                        while($row = mysqli_fetch_assoc($result)) {
                            ?>
                            <tr>
                   
                                <td><?= $row['id'] ?></td>
                                <td><?= $row['status'] ?></td>
                                <td><?= $row['entry_date'] ?></td>
                                <td><?= $row['entry_time'] ?></td>
                                <td><?= $row['ticketcode'] ?></td>
                                <td><?= $row['seatsID'] ?></td>
                                <td><?= $row['cinema_number'] ?></td>
                                <td><?= $row['customer_id'] ?></td>
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
