document.addEventListener('DOMContentLoaded', function() {
    var cinemaButtons = document.querySelectorAll('.cinema-seat');
    var selectedButtonId = localStorage.getItem('selectedButtonId');
    var saveChangesBtn = document.querySelector('.modal-footer .btn-primary');


    // Iterate over each button
    cinemaButtons.forEach(function(button) {
        // Retrieve seat designation from button ID
        var seatDesignation = button.id;

        // Make AJAX request to retrieve availability status
        $.ajax({
            url: 'retrieve-seat.php',
            type: 'GET',
            dataType: 'json',
            data: { seatDesignation: seatDesignation },
            success: function(response) {
                // Check if availability status is 0
                if (response.available === 0) {
                    // Disable the button
                    button.disabled = true;            
                    
                }
            },
            error: function(xhr, status, error) {
                console.error('AJAX Error:', error);
            }
        });

        // Cinema Seat Buttons
        button.addEventListener('click', function() {
            // Disable the previously selected button (if any)
            var previousSelectedButton = document.getElementById(selectedButtonId);
            if (previousSelectedButton) {
                previousSelectedButton.disabled = false;
            }

            // Disable the current button
            selectedButtonId = button.id;
            button.disabled = true;
            localStorage.setItem('selectedButtonId', selectedButtonId);

            
        });
    });
    
    if (selectedButtonId) {
        var previousSelectedButton = document.getElementById(selectedButtonId);
        if (previousSelectedButton) {
            previousSelectedButton.disabled = true;
        }
    }

    
     // Add click event listener to the "Save changes" button
     saveChangesBtn.addEventListener('click', function() {
        var jsVariable = selectedButtonId

        // AJAX request to send the variable to PHP
        $.ajax({
            url: 'save-variable.php',
            type: 'POST',
            data: { jsVariable: jsVariable },
            success: function(response) {
                console.log(response); // Handle success response
            },
            error: function(xhr, status, error) {
                console.error(error); // Handle errors
            }
        })
        
        window.location.href = './login/login.php';

    });

});


function insertSeatToDatabase(seatValue) {
    $.ajax({
        url: 'insert-seat.php',
        type: 'POST',
        data: { seatValue: seatValue },
        success: function(response) {
            console.log(response);
        },
        error: function(xhr, status, error) {
            console.error(error);
        }
    });
}
