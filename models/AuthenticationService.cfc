component singleton {

    variables.USER_ID_KEY = "cbauthentication__userId";
    variables.USER_KEY = "cbauthentication__user";

    property name="wirebox" inject="wirebox";
    property name="sessionStorage" inject="SessionStorage@cbstorages";
    property name="requestStorage" inject="RequestStorage@cbstorages";
    property name="userServiceClass" inject="coldbox:setting:userServiceClass@cbauthentication";

    function login( required user ) {
        sessionStorage.setVar( USER_ID_KEY, user.getId() );
        requestStorage.setVar( USER_KEY, user );
    }

    function authenticate( required string username, required string password ) {
        if ( NOT getUserService().isValidCredentials( username, password ) ) {
            throw( "Incorrect Credentials Entered", "InvalidCredentials" );
        }
        
        var user = getUserService().retrieveUserByUsername( username );
        login( user );

        return true;
    }

    function isLoggedIn() {
        return sessionStorage.exists( USER_ID_KEY );
    }

    function check() {
        return isLoggedIn();
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
                throw( "No [userServiceClass] provided.  Please set in `config/ColdBox.cfc` under `moduleSettings.cbauthentication.userServiceClass`.", "IncompleteConfiguration" );
            }

            variables.userService = wirebox.getInstance( userServiceClass );
        }

        return variables.userService;
    }
}