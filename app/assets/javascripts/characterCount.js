$(document).ready(function() {
    $("#test_result_comments").on("keydown", updateCharacterCount);
});

function updateCharacterCount(event) {
    var count = $(this).val().length;
    $('#character_count').html(count);
    if(count >= 140) $('#character_count').css("color", "green");
    else $('#character_count').css("color", "red");
}