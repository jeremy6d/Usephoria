var users = 5;

$(document).ready(function() {
    $( "#user-slider" ).slider({ min: 1, max: 10, change: sliderChange });
    updateNumbers();
});

function sliderChange(event, ui) {
    users = ui.value * ui.value * 5;
    updateNumbers();
}

function updateNumbers() {
    $('#users').val(users);
    $('#users-count').html(users);
    var budget = users + (users * .5);
    $('#pricing').html(budget);
    $('#total-charge-field').val(budget);
}