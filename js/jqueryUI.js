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

            str = str + '<a style="cursor:pointer;" href=' + data[i][0]['id_google'] + '>' + data[i][0]['login'] + '<br /><img class="img-thumbnail" src="' + data[i][0]['image'] + '"></a><br />'

            // console.log(data[i][0]['img'])
            // console.log(str)
            var img = data[i][0]['image']
        }

        document.getElementById('matchList').innerHTML = str
    })

});

$('#matchList').on('click', 'a', function (e) {
    // console.log(img)
    // dont allow the <a> to perform its default functionality
    e.preventDefault();
    // get content of <a> tag
    console.log($(this).text());
    var target_name = $(this).text()
    var user_img = $(this)[0]['children'][1]['attributes']['src']['nodeValue']
    var hiddenID = $(this)[0]['attributes']['href'].value
    console.log(hiddenID)
    console.log(user_img)
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
            // var hiddenID = document.getElementById('hiddenID').value

            console.log(target_name)
            console.log(hiddenID)
            // $('#sendMsg').on('click', function () {
            var msg = document.getElementById("desc")
            // console.log(msg.val())
            $.ajax({
                url: 'sendMessage',
                dataType: 'json',
                type: 'POST',
                data: { hiddenID: hiddenID, target_name: target_name, user_img: user_img }
            }).done(function (data) {
                console.log(data) // renvoie true or failure
            })
        });
    });
});


$("#display_group_chat").on("load", fetchGroupConversation());

function fetchGroupConversation() {
    $.ajax({
        url: 'loadConversation',
        dataType: 'json',
        type: 'POST'
        // pas de data que des tricks
    }).done(function (data) {
        console.log(data)



        for (var i = 0; i < data.length; i++) {

            $('#display_group_chat').append('<div style="cursor:pointer;" id="conversation_container"><img class="chat-picture img-thumbnail" src="' + data[i].img + '" alt="photo de profil"><input type="hidden" value="' + data[i].id_group + '"></div>');

        }
        $('#display_group_chat').on('click', 'div', function (e) {
            // var target_img = $(this)[0]['attributes']['src']['nodeValue']
            var img_conversation = $(this)[0]['childNodes'][0]['attributes']['src']['nodeValue'];
            var hidden_group_id = $(this)[0]['childNodes'][1]['attributes'][1]['value']
            console.log(hidden_group_id)
            console.log($(this))
            $.ajax({
                url: 'fetch_conversation',
                dataType: 'json',
                type: 'POST',
                data: { hidden_group_id: hidden_group_id }
            }).done(function (data) {
                console.log(data)
                console.log(data[1])
                console.log(data[0][0]['img'])
                console.log(data[0][0]['name'])

                $(".memberGroup-display").empty();
                $(".memberGroup-display").append('<h3 id="title_user">' + data[0][0]["name"] + '</h3><img id="user_img_conversation" src="' + data[0][0]["img"] + '" >')

                var i = 0
                data[1].forEach(element => {
                    console.log(data[1][i].content)
                    $(".chat-display").append(data[1][i].content)
                    i++;
                });

            });

            $('#sendMsg').on('click', function (e) {
                msg_content = document.getElementById("desc").value
                console.log(document.getElementById("desc").value)
                console.log(hidden_group_id)
                $.ajax({
                    url: 'sendMessages',
                    dataType: 'json',
                    type: 'POST',
                    data: { hidden_group_id: hidden_group_id, msg_content: msg_content }

                }).done(function (data) {
                    console.log(data)
                })
            })
        })
    })

}




