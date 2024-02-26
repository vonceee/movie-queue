<?php
// Include database connection file
include_once "database.php";

// Initialize response array
$response = array();

// Check if seat designation is provided via GET parameter
if(isset($_GET['seatDesignation'])) {
    // Retrieve seat designation from GET parameter
    $seatDesignation = $_GET['seatDesignation'];

    // Prepare and execute SQL query to retrieve availability status
    $sql = "SELECT available FROM tbl_seats WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $seatDesignation);
    $stmt->execute();
    $stmt->bind_result($available);

    // Fetch availability status
    if($stmt->fetch()) {
        // Add availability status to the response array
        $response['available'] = $available;
    } else {
        // Seat designation not found
        $response['error'] = 'Seat designation not found';
    }

    // Close statement
    $stmt->close();
} else {
    // Seat designation not provided
    $response['error'] = 'Seat designation not provided';
}

// Send JSON response
header('Content-Type: application/json');
echo json_encode($response);
?>
