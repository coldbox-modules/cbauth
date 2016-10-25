component singleton {

    variables.USER_ID_KEY = "cbauth__userId";
    variables.USER_KEY = "cbauth__user";

    property name="wirebox" inject="wirebox";
    property name="interceptorService" inject="coldbox:interceptorService";
    property name="sessionStorage" inject="SessionStorage@cbstorages";
    property name="requestStorage" inject="RequestStorage@cbstorages";
    property name="userServiceClass" inject="coldbox:setting:userServiceClass@cbauth";

    public void function logout() {
        sessionStorage.deleteVar( USER_ID_KEY );
        requestStorage.deleteVar( USER_KEY );
    }

    public void function login( required user ) {
        sessionStorage.setVar( USER_ID_KEY, user.getId() );
        requestStorage.setVar( USER_KEY, user );
    }

    public boolean function authenticate( required string username, required string password ) {
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

    public boolean function isLoggedIn() {
        return sessionStorage.exists( USER_ID_KEY );
    }

    public boolean function check() {
        return isLoggedIn();
    }

    public boolean function guest() {
        return ! isLoggedIn();
    }

    public any function getUser() {
        if ( ! requestStorage.exists( USER_KEY ) ) {
            var userBean = getUserService().retrieveUserById( getUserId() );
            requestStorage.setVar( USER_KEY, userBean );
        }

        return requestStorage.getVar( USER_KEY );
    }

    public any function user() {
        return getUser();
    }

    public any function getUserId() {
        if ( ! isLoggedIn() ) {
            throw( "No user is currently logged in.", "NoUserLoggedIn" );
        }

        return sessionStorage.getVar( USER_ID_KEY );
    }

    private any function getUserService() {
        if ( ! structKeyExists( variables, "userService" ) ) {
            if ( userServiceClass == "" ) {
                throw( "No [userServiceClass] provided.  Please set in `config/ColdBox.cfc` under `moduleSettings.cbauth.userServiceClass`.", "IncompleteConfiguration" );
            }

            variables.userService = wirebox.getInstance( userServiceClass );
        }

        return variables.userService;
    }
}