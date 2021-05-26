var GoogleAuth;
var SCOPE = 'https://www.googleapis.com/auth/drive.metadata.readonly';
function handleClientLoad() {
    // Load the API's client and auth2 modules.
    // Call the initClient function after the modules load.
    gapi.load('client:auth2', initClient);
}

function initClient() {
    // In practice, your app can retrieve one or more discovery documents.
    var discoveryUrl = 'https://www.googleapis.com/discovery/v1/apis/drive/v3/rest';
    var clientID = '715843356551-u92it250uv3rljvhk0jdfkck5qmmm9m8.apps.googleusercontent.com';
    // Initialize the gapi.client object, which app uses to make API requests.
    // Get API key and client ID from API Console.
    // 'scope' field specifies space-delimited list of access scopes.
    gapi.client.init({
        'apiKey': 'AIzaSyBOPfwans4898FVPPL2trMS1WGsGEnGU5k',
        'clientId': '715843356551-u92it250uv3rljvhk0jdfkck5qmmm9m8.apps.googleusercontent.com',
        'discoveryDocs': [discoveryUrl],
        'scope': SCOPE
    }).then(function () {
        GoogleAuth = gapi.auth2.getAuthInstance();

        console.log('mabite');


        // Listen for sign-in state changes.
        GoogleAuth.isSignedIn.listen(updateSigninStatus);

        // Handle initial sign-in state. (Determine if user is already signed in.)
        var user = GoogleAuth.currentUser.get();
        setSigninStatus();

        // Call handleAuthClick function when user clicks on
        //      "Sign In/Authorize" button.
        $('#sign-in-or-out-button').click(function () {
            handleAuthClick(); // marhce pas 

        });
        $('#revoke-access-button').click(function () {
            // expire le token 
            revokeAccess();
            $.ajax({
                url: 'log_out',
                dateType: 'json',
                type: 'POST',

            }).done(function (data) {
                console.log(data);
                console.log('ssion destroyed');
                location.reload();
            })

        });
    });
}

function handleAuthClick() {
    if (GoogleAuth.isSignedIn.get()) {
        // User is authorized and has clicked "Sign out" button.
        GoogleAuth.signOut();
    } else {
        // User is not signed in. Start Google auth flow.
        GoogleAuth.signIn();
    }
}

function revokeAccess() {
    GoogleAuth.disconnect();
}

function setSigninStatus() {
    var user = GoogleAuth.currentUser.get();
    var isAuthorized = user.hasGrantedScopes(SCOPE);
    if (isAuthorized) {
        $('#sign-in-or-out-button').html('Sign out');
        $('#revoke-access-button').css('display', 'inline-block');
        $('#auth-status').html('You are currently signed in and have granted ' +
            'access to this app.');

        console.log(GoogleAuth.currentUser.he.qc.id_token)
        console.log(GoogleAuth.currentUser.he.Ft['NT'])
        console.log(GoogleAuth.currentUser.he.Ft['Ve']) // name
        console.log(GoogleAuth.currentUser.he.Ft['uK'])

        $('#auth-status').append('  Bonjour ' + GoogleAuth.currentUser.he.Ft['Ve']);


        let token = GoogleAuth.currentUser.he.qc.id_token

        let id = GoogleAuth.currentUser.he.Ft['NT']
        let name = GoogleAuth.currentUser.he.Ft['Ve']
        let image = GoogleAuth.currentUser.he.Ft['uK']

        $.ajax({
            url: 'authentification',
            dateType: 'json',
            type: 'POST',
            data: { token: token }
            // data: { id: id, name: name, image: image },

        }).done(function (data) {
            // data = JSON.stringify(data)
            // data = JSON.parse(data)

            console.log(data)
        })

    } else {
        $('#sign-in-or-out-button').html('Sign In/Authorize');
        $('#revoke-access-button').css('display', 'none');
        $('#auth-status').html('You have not authorized this app or you are ' +
            'signed out.');
    }
}

function updateSigninStatus() {
    setSigninStatus();
}