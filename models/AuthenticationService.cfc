component singleton {

    property name="wirebox" inject="wirebox";
    property name="sessionStorage" inject="SessionStorage@cbstorages";
    property name="requestStorage" inject="RequestStorage@cbstorages";
    property name="userServiceClass" inject="coldbox:setting:userServiceClass@cbauthentication";

    function login( required user ) {
        sessionStorage.setVar( "cbauthentication__userId", user.getId() );
        requestStorage.setVar( "cbauthentication__user", user );
    }

    function authenticate( required string username, required string password ) {
        if ( NOT getUserService().isValidCredentials( username, password ) ) {
            throw( "Incorrect Credentials Entered", "InvalidCredentials" );
        }
        
        var user = getUserService().retrieveUser( username, password );
        login( user );

        return true;
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