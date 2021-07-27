function displayNotif() {

}
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