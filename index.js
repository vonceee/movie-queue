document.addEventListener('DOMContentLoaded', function() {
    var cinemaButtons = document.querySelectorAll('.cinema-seat');
    var selectedButtonId = localStorage.getItem('selectedButtonId');
    var saveChangesBtn = document.querySelector('.modal-footer .btn-primary');

    // Set an empty array as the value of the selectedButtonIds key in localStorage/Another way to empty array
    // localStorage.setItem('selectedButtonIds', JSON.stringify([]));
    
    // Retrieve the array of selected button IDs from localStorage
    var storedButtonIds = localStorage.getItem('selectedButtonIds');

    // Parse the storedButtonIds string to convert it to a JavaScript array
    var selectedButtonIds = storedButtonIds ? JSON.parse(storedButtonIds) : [];

    // Check if selectedButtonIds is an array before iterating over it
    if (Array.isArray(selectedButtonIds)) {
        // Disable the buttons with the stored IDs
        selectedButtonIds.forEach(function(buttonId) {
            var button = document.getElementById(buttonId);
            if (button) {        
                button.classList.add("selected");
            }
        });
    } else {
        console.error("Error: selectedButtonIds is not a valid array.");
    }



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
                //  Unsure if != selectedButtonId is needed
                selectedButtonIds.forEach(function(buttonId) {

                    if (response.available === 0) {
                        // Disable the button
                        button.disabled = true;

                        // If the cinema seat is selected, removes the 'selected' class so the css for disable to take effect 
                        button.classList.remove('selected')
                    }
                })
            },
            error: function(xhr, status, error) {
                console.error('AJAX Error:', error);
            }
        });

        // Cinema Seat Buttons
        button.addEventListener('click', function() {                        
            selectedButtonId = button.id;
            
            // Toggle active state of cinema seat button
            if (button.classList.contains('selected')) {
                // If the button is already active, deactivate it
                button.classList.remove('selected');
                
                // Retrieve the array of selected button IDs from localStorage
                var selectedButtonIds = JSON.parse(localStorage.getItem('selectedButtonIds')) || [];
                
                // Remove the ID of the clicked button from the array
                var index = selectedButtonIds.indexOf(selectedButtonId);
                if (index !== -1) {
                    selectedButtonIds.splice(index, 1);
                }
                console.log(selectedButtonIds);
                
                // Save the updated array of selected button IDs in localStorage
                localStorage.setItem('selectedButtonIds', JSON.stringify(selectedButtonIds));
            } else {
                // If the button is not active, activate it
                button.classList.add('selected');
                
                // Retrieve the array of selected button IDs from localStorage or create an empty array if it doesn't exist
                var selectedButtonIds = JSON.parse(localStorage.getItem('selectedButtonIds')) || [];
                
                // Check if the ID of the clicked button is not already in the array
                if (!selectedButtonIds.includes(selectedButtonId)) {
                    // Add the ID of the clicked button to the array
                    selectedButtonIds.push(selectedButtonId);
                    console.log(selectedButtonIds);
                    
                    // Save the updated array of selected button IDs in localStorage
                    localStorage.setItem('selectedButtonIds', JSON.stringify(selectedButtonIds));
                }
            }
        });
        
        
    });

     // Add click event listener to the "Save changes" button
     saveChangesBtn.addEventListener('click', function() {
        var jsVariable = storedButtonIds;        

        // AJAX request to send the variable to PHP
        $.ajax({
            url: 'save-variable.php',
            type: 'POST',
            data: { jsVariable: jsVariable },
            success: function(response) {
                console.log(response); // Handle success response
                
                insertSeatToDatabase(jsVariable);
                
                // Deletes localStorage 
                localStorage.setItem('selectedButtonIds', JSON.stringify([]));
                 
                    
                //window.location.href = './login/login.php';
            },
            error: function(xhr, status, error) {
                console.error(error); // Handle errors
            }
        })
        
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
