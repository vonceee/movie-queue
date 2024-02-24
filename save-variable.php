<?php
session_start();

// Check if the JavaScript variable is sent via POST
if (isset($_POST['jsVariable'])) {
    // Store the JavaScript variable in a PHP session variable
    $_SESSION['cinema-seat'] = $_POST['jsVariable'];

    // Respond to the AJAX request
    echo 'Variable saved successfully';
} else {
    // If the JavaScript variable is not sent, respond with an error
    echo 'Error: JavaScript variable not found';
}
?>
