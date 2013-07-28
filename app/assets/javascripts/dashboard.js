$(document) .ready(function() {
    $('.show-test-details').on('click', showDetails)
});

function showDetails(event) {
    var id = $(this).attr('data-id')
    $('.test-detail[data-id=' + id + ']').slideToggle();
    return false;
}