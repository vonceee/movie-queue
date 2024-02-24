<?php
// Include the database connection file
include_once "database.php";

// Check if the seatValue parameter is set in the POST request
if(isset($_POST['seatValue'])) {
    // Get the seat value from the POST request
    $seatValue = $_POST['seatValue'];

    // Perform any necessary validation or sanitization on the seatValue

    try {
        // Prepare SQL statement
        // Prepare and execute the SQL statement to update the available column
        $sql = "UPDATE tbl_seats SET available = 0 WHERE seat_designation = ?";
        $stmt = $conn->prepare($sql); 
        
        // Bind parameters
        $stmt->bind_param("s", $seatValue); // "s" indicates a string parameter
        
        // Execute statement
        $stmt->execute();
        
        // Return success message
        echo "Seat inserted successfully";
    } catch(PDOException $e) {
        // Return error message if an exception occurs
        echo "Error: " . $e->getMessage();
    }
} else {
    // Return error message if seatValue parameter is not set
    echo "Seat value not received";
}
?>
