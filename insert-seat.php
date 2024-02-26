<?php
// Include the database connection file
include_once "database.php";

// Check if the seatValue parameter is set in the POST request
if(isset($_POST['seatValue'])) {
    // Get the seat values array from the POST request and decode it
    $seatValues = json_decode($_POST['seatValue']);

    // Perform any necessary validation or sanitization on the seatValues array

    try {
        // Prepare SQL statement
        $sql = "UPDATE tbl_seats SET available = 0 WHERE id = ?";
        $stmt = $conn->prepare($sql); 
        
        // Loop through the seatValues array
        foreach ($seatValues as $seatValue) {
            // Bind parameters
            $stmt->bind_param("s", $seatValue); // "s" indicates a string parameter
            
            // Execute statement
            $stmt->execute();
        }
        
        // Return success message
        echo "Seats inserted successfully";
    } catch(PDOException $e) {
        // Return error message if an exception occurs
        echo "Error: " . $e->getMessage();
    }
} else {
    // Return error message if seatValue parameter is not set
    echo "Seat values not received";
}
?>
