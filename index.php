<?php
    session_start();
    if(!isset($_SESSION["user"])){
        header("Location: login.php");
    }

    // Include the database connection file
    include 'database.php';

    // Assuming the user's ID is stored in the session
    $userID = $_SESSION["user"];

    // Fetch the user's information from the database
    $query = "SELECT customer_first_name, customer_last_name, cinemaID, status, entry_date, entry_time, ticketcode, seatsID, cinema_number FROM tbl_customer WHERE customerID = 1";
    $result = mysqli_query($conn, $query);

    $userInfo = mysqli_fetch_assoc($result);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>Welcome to Dashboard</h1>
        <a href="logout.php" class="btn btn-warning">Logout</a>

        <!-- User Information Table -->
        <table class="table">
            <thead>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Cinema ID</th>
                    <th>Status</th>
                    <th>Entry Date</th>
                    <th>Entry Time</th>
                    <th>Ticket Code</th>
                    <th>Seat ID</th>
                    <th>Cinema Number</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><?= $userInfo['customer_first_name'] ?></td>
                    <td><?= $userInfo['customer_last_name'] ?></td>
                    <td><?= $userInfo['cinemaID'] ?></td>
                    <td><?= $userInfo['status'] ?></td>
                    <td><?= $userInfo['entry_date'] ?></td>
                    <td><?= $userInfo['entry_time'] ?></td>
                    <td><?= $userInfo['ticketcode'] ?></td>
                    <td><?= $userInfo['seatsID'] ?></td>
                    <td><?= $userInfo['cinema_number'] ?></td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
