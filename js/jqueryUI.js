var letter = document.getElementById('text_search').value;
$('#text_search').keyup(function () {
    $.ajax({
        url: 'request_all_user',
        dateType: 'json',
        type: 'POST',
        data: 'letter=' + $(this).val()

    }).done(function (data) {
        var str = ""
        console.log(document.getElementById('text_search').value)

        var data = JSON.parse(data)
        // var data = JSON.stringify(data)
        console.log(data)

        for (var i = 0; i < data.length; i++) {

            str = str + '<a style="cursor:pointer;" href=' + data[i][0]['id_google'] + '>' + data[i][0]['login'] + '</a><img class="img-thumbnail" src="' + data[i][0]['image'] + '"><br />'

            // console.log(data[i][0]['img'])
            // console.log(str)
        }
        document.getElementById('matchList').innerHTML = str
    })

});


$('#matchList').on('click', 'a', function (e) {
    // dont allow the <a> to perform its default functionality
    e.preventDefault();
    // get content of <a> tag
    console.log($(this).text());
    var target_name = $(this).text()
    document.getElementById('text_search').value = $(this).text();

    $.ajax({
        url: 'request_all_user',
        dateType: 'json',
        type: 'POST',
        data: 'letter=' + $(this).val()
    }).done(function (data) {
        var str_result = ""
        // console.log(data)
        var data = JSON.parse(data)
        for (var i = 0; i < data.length; i++) {

            str_result = str_result + 'coucou'
        }

        // console.log(data)
        document.getElementById('result').value = str_result
        console.log(document.getElementById('result').value)
        $('#search').on('click', function (e) {
            e.preventDefault();
            $('body').append("<p>" + $('#text_search').val() + "</p>");
            var hiddenID = document.getElementById('hiddenID').value
            console.log(target_name)
            console.log(hiddenID)
            $('#sendMsg').on('click', function () {

                var msg = document.getElementById("desc")
                // console.log(msg.val())
                $.ajax({
                    url: 'sendMessage',
                    dataType: 'json',
                    type: 'POST',
                    data: { hiddenID: hiddenID, target_name: target_name }
                }).done(function (data) {
                    console.log(data) // renvoie true or failure

                })
            });
        });
    });
});