component singleton {

    property name="wirebox" inject="wirebox";
    property name="interceptorService" inject="coldbox:interceptorService";
    property name="sessionStorage" inject="SessionStorage@cbauth";
    property name="requestStorage" inject="RequestStorage@cbauth";
    property name="userServiceClass" inject="coldbox:setting:userServiceClass@cbauth";

    variables.USER_ID_KEY = "cbauth__userId";
    variables.USER_KEY = "cbauth__user";

    public void function logout() {
        variables.sessionStorage.delete( variables.USER_ID_KEY );
        variables.requestStorage.delete( variables.USER_KEY );
    }

    public void function login( required user ) {
        variables.interceptorService.processState( "preLogin", {
            user = arguments.user
        } );
        
        variables.sessionStorage.set( variables.USER_ID_KEY, arguments.user.getId() );
        variables.requestStorage.set( variables.USER_KEY, arguments.user );
        
        variables.interceptorService.processState( "postLogin", {
            user = arguments.user,
            sessionStorage = variables.sessionStorage,
            requestStorage = variables.requestStorage
        } );
    }

    public boolean function authenticate( required string username, required string password ) {
        variables.interceptorService.processState( "preAuthentication", {
            "username" = arguments.username,
            "password" = arguments.password
        } );

        if ( ! getUserService().isValidCredentials( arguments.username, arguments.password ) ) {
            throw(
                type = "InvalidCredentials",
                message = "Incorrect Credentials Entered"
            );
        }

        var user = getUserService().retrieveUserByUsername( arguments.username );

        variables.interceptorService.processState( "postAuthentication", {
            user = user,
            sessionStorage = variables.sessionStorage,
            requestStorage = variables.requestStorage
        } );

        login( user );

        return true;
    }

    public boolean function isLoggedIn() {
        return variables.sessionStorage.exists( variables.USER_ID_KEY );
    }

    public boolean function check() {
        return isLoggedIn();
    }

    public boolean function guest() {
        return ! isLoggedIn();
    }

    public any function getUser() {
        if ( ! variables.requestStorage.exists( variables.USER_KEY ) ) {
            var userBean = getUserService().retrieveUserById( getUserId() );
            variables.requestStorage.set( variables.USER_KEY, userBean );
        }

        return variables.requestStorage.get( variables.USER_KEY );
    }

    public any function user() {
        return getUser();
    }

    public any function getUserId() {
        if ( ! isLoggedIn() ) {
            throw(
                type = "NoUserLoggedIn",
                message = "No user is currently logged in."
            );
        }

        return variables.sessionStorage.get( variables.USER_ID_KEY );
    }

    private any function getUserService() {
        if ( ! structKeyExists( variables, "userService" ) ) {
            if ( variables.userServiceClass == "" ) {
                throw(
                    type = "IncompleteConfiguration",
                    message = "No [userServiceClass] provided.  Please set in `config/ColdBox.cfc` under `moduleSettings.cbauth.userServiceClass`."
                );
            }

            variables.userService = variables.wirebox.getInstance( variables.userServiceClass );
        }

        return variables.userService;
    }
}
