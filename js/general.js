// function displayNotif() {
//     if (displayNotif.style.display === "none") {
//     } else {
//     }
// }
$(document).ready(function () {
    // let displayNotif = document.getElementById('displayNotif')
    let displayNotig = $('#displayNotif')
    $(document).mousemove(function () {
        if ($("#displayNotif:hover").length != 0) {
            $('#displayNotif').show()
            console.log('show')
        } else {
            $('#displayNotif').hide();
            console.log('hide')
        }
    });
});

// $("#id").css("display", "none");
// $("#id").css("display", "block");

function displayPostIndex() {
    $.$.ajax({
        type: "POST",
        url: "displayPostIndex",
        dataType: "Json",
        success: function (response) {
            console.log(data)
        }
    });
}
