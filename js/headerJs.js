$(".navbar-nav").ready(function (){

    //Faire mon append ici
    console.log("On est la");

    $.ajax({
        url: 'who_am_i',
        dateType: 'json',
        type: 'POST',
    }).done(function (data){
        console.log(data);
        console.log(data.picture);
        if (data !== "nobody"){

            $(".navbar-nav").append('<li className="nav-item"><a className="nav-link"><img className="img-thumbnail user-pic img-fluid" src=" '+data.picture+' " alt="profil picture"></a> </li>');
        }
    });
})
