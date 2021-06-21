/**
 * Authentication services for your application
 */
component singleton {

	/* *********************************************************************
	 **						DI
	 ********************************************************************* */

	property name="wirebox"            inject="wirebox";
	property name="interceptorService" inject="coldbox:interceptorService";
	property name="sessionStorage"     inject="SessionStorage@cbauth";
	property name="requestStorage"     inject="RequestStorage@cbauth";
	property name="userServiceClass"   inject="coldbox:setting:userServiceClass@cbauth";

	/* *********************************************************************
	 **						Static Vars
	 ********************************************************************* */

	variables.USER_ID_KEY = "cbauth__userId";
	variables.USER_KEY    = "cbauth__user";

	/**
	 * Constructor
	 */
	function init() {
		return this;
	}

	/**
	 * Logout a user
	 */
	public void function logout( boolean quiet = false ) {
		// Annouce pre logout with or without user
		if ( !arguments.quiet ) {
			variables.interceptorService.processState(
				"preLogout",
				{ user: isLoggedIn() ? getUser() : javacast( "null", "" ) }
			);
		}

		// cleanup
		variables.sessionStorage.delete( variables.USER_ID_KEY );
		variables.requestStorage.delete( variables.USER_KEY );

		// Announce post logout
		if ( !arguments.quiet ) {
			variables.interceptorService.processState( "postLogout", {} );
		}
	}

	/**
	 * Logout a user without raising interceptor events.
	 * Useful when testing "logged in" user no longer exists.
	 */
	public void function quietLogout() {
		arguments.quiet = true;
		logout( argumentCollection = arguments );
	}

	/**
	 * Login a user into our persistent scopes
	 *
	 * @user The user object to log in
	 *
	 * @return The same user object so you can do functional goodness
	 */
	public any function login( required user ) {
		variables.interceptorService.processState( "preLogin", { user: arguments.user } );

		variables.sessionStorage.set( variables.USER_ID_KEY, arguments.user.getId() );
		variables.requestStorage.set( variables.USER_KEY, arguments.user );

		variables.interceptorService.processState(
			"postLogin",
			{
				user          : arguments.user,
				sessionStorage: variables.sessionStorage,
				requestStorage: variables.requestStorage
			}
		);

		return arguments.user;
	}

	/**
	 * Try to authenticate a user into the system. If the authentication fails an exception is thrown, else the logged in user object is returned
	 *
	 * @username The username to test
	 * @password The password to test
	 *
	 * @throws InvalidCredentials
	 *
	 * @return User : The logged in user object
	 */
	public any function authenticate( required string username, required string password ) {
		variables.interceptorService.processState(
			"preAuthentication",
			{
				"username": arguments.username,
				"password": arguments.password
			}
		);

		if ( !getUserService().isValidCredentials( arguments.username, arguments.password ) ) {
			variables.interceptorService.processState(
				"onInvalidCredentials",
				{
					"username": arguments.username,
					"password": arguments.password
				}
			);
			throw( type = "InvalidCredentials", message = "Incorrect Credentials Entered" );
		}

		var user = getUserService().retrieveUserByUsername( arguments.username );

		variables.interceptorService.processState(
			"postAuthentication",
			{
				user          : user,
				sessionStorage: variables.sessionStorage,
				requestStorage: variables.requestStorage
			}
		);

		return login( user );
	}

	/**
	 * Verify if the user is logged in
	 */
	public boolean function isLoggedIn() {
		return variables.sessionStorage.exists( variables.USER_ID_KEY );
	}

	/**
	 * Alias to the isLoggedIn function
	 */
	public boolean function check() {
		return isLoggedIn();
	}

	/**
	 * Verify if you are NOT logged in, but a guest in the site
	 */
	public boolean function guest() {
		return !isLoggedIn();
	}

	/**
	 * Get the currently logged in user object
	 *
	 * @throws NoUserLoggedIn : If the user is not logged in
	 *
	 * @return User
	 */
	public any function getUser() {
		if ( !variables.requestStorage.exists( variables.USER_KEY ) ) {
			try {
				var userBean = getUserService().retrieveUserById( getUserId() );
			} catch ( any e ) {
				// if there was a problem retrieving the user,
				// remove the key from the sessionStorage so we
				// don't keep trying to log in the user.
				variables.sessionStorage.delete( variables.USER_ID_KEY );
				rethrow;
			}

			variables.requestStorage.set( variables.USER_KEY, userBean );
		}

		return variables.requestStorage.get( variables.USER_KEY );
	}

	/**
	 * Alias to `getUser()`
	 */
	public any function user() {
		return getUser();
	}

	/**
	 * Get the currently logged in user Id
	 *
	 * @throws NoUserLoggedIn
	 *
	 * @return The user Id
	 */
	public any function getUserId() {
		if ( !isLoggedIn() ) {
			throw( type = "NoUserLoggedIn", message = "No user is currently logged in." );
		}

		return variables.sessionStorage.get( variables.USER_ID_KEY );
	}

	/**
	 * Get the appropriate user service configured by the settings
	 *
	 * @throws IncompleteConfiguration
	 */
	private any function getUserService() {
		if ( !structKeyExists( variables, "userService" ) ) {
			if ( variables.userServiceClass == "" ) {
				throw(
					type    = "IncompleteConfiguration",
					message = "No [userServiceClass] provided.  Please set in `config/ColdBox.cfc` under `moduleSettings.cbauth.userServiceClass`."
				);
			}

			variables.userService = variables.wirebox.getInstance( dsl = variables.userServiceClass );
		}

		return variables.userService;
	}

}
