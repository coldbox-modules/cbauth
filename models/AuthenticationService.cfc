component singleton {

    variables.USER_ID_KEY = "cbauth__userId";
    variables.USER_KEY = "cbauth__user";

    property name="wirebox" inject="wirebox";
    property name="interceptorService" inject="coldbox:interceptorService";
    property name="sessionStorage" inject="SessionStorage@cbstorages";
    property name="requestStorage" inject="RequestStorage@cbstorages";
    property name="userServiceClass" inject="coldbox:setting:userServiceClass@cbauth";

    function logout() {
        sessionStorage.removeVar( USER_ID_KEY );
        requestStorage.removeVar( USER_KEY );
    }

    function login( required user ) {
        sessionStorage.setVar( USER_ID_KEY, user.getId() );
        requestStorage.setVar( USER_KEY, user );
    }

    function authenticate( required string username, required string password ) {
        var args = {
            username = username,
            password = password
        };

        interceptorService.processState( "preAuthentication", args );

        if ( NOT getUserService().isValidCredentials( args.username, args.password ) ) {
            throw( "Incorrect Credentials Entered", "InvalidCredentials" );
        }
        
        var user = getUserService().retrieveUserByUsername( args.username );

        interceptorService.processState( "postAuthentication", {
            user = user,
            sessionStorage = sessionStorage,
            requestStorage = requestStorage
        } );

        login( user );

        return true;
    }

    function isLoggedIn() {
        return sessionStorage.exists( USER_ID_KEY );
    }

    function check() {
        return isLoggedIn();
    }

    function guest() {
        return ! isLoggedIn();
    }

    function getUser() {
        if ( ! requestStorage.exists( USER_KEY ) ) {
            if ( ! isLoggedIn() ) {
                throw( "No user is currently logged in.", "NoUserLoggedIn" );
            }

            var user = getUserService().retrieveUserById( getUserId() );
            requestStorage.setVar( USER_KEY, user );
        }

        return requestStorage.getVar( USER_KEY );
    }

    function user() {
        return getUser();
    }

    function getUserId() {
        return sessionStorage.getVar( USER_ID_KEY );
    }

    private function getUserService() {
        if ( ! structKeyExists( variables, "userService" ) ) {
            if ( userServiceClass == "" ) {
                throw( "No [userServiceClass] provided.  Please set in `config/ColdBox.cfc` under `moduleSettings.cbauth.userServiceClass`.", "IncompleteConfiguration" );
            }

            variables.userService = wirebox.getInstance( userServiceClass );
        }

        return variables.userService;
    }
}