$(document).ready(function () {
    $('#submitBackground').click(function () {
        const fd = new FormData();
        const files = $('#background')[0].files[0];
        fd.append('file', files);
        console.log(files);
        $.ajax({
            url: 'upload_file',
            type: 'post',
            data: fd,
            dataType: 'JSON',
            contentType: false,
            processData: false,
        }).done( function (response) {
                console.log(response)
                if (response !== 0) {
                    $('#change-bg-profil').attr('src', response);
                } else {
                    alert('File not uploaded !');
                }
            }).fail(function (data) {
                console.log('mabite')
            })
        });
    });
