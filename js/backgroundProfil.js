$(document).ready(function()
{
    $("#submitBackground").click(function()
    {
        var fd = new FormData();
        var files = $('#file')[0].files;

        if(files.length > 0 )
        {
            fd.append('file',files[0]);
            $.ajax({
                url: 'upload_file',
                type: 'post',
                data: fd,
                contentType: false,
                processData: false,
                success: function(response)
                {
                    if(response !== 0)
                    {
                        $("#background").attr("src", response);
                        $(".preview img").show();
                    } else {
                        alert('file not uploaded');
                    }
                },
            });
        }else{
            alert("Please select a file.");
        }
    });
});