component {

    this.title = "cbauth";
    // Don't map models, we will do it manually
    this.autoMapModels = false;
    // Module Dependencies
    this.dependencies = [ "cbstorages" ];
    // Helpers automatically loaded
	this.applicationHelper 	= [ "helpers/Mixins.cfm" ];

    function configure() {
        settings = {
            userServiceClass = "",
            sessionStorage = "SessionStorage@cbstorages",
            requestStorage = "RequestStorage@cbstorages"
        };

        // Custom Events
        interceptorSettings = {
            customInterceptionPoints = [
                "preAuthentication",
                "onInvalidCredentials",
                "postAuthentication",
                "preLogout",
                "postLogout",
                "preLogin",
                "postLogin"
            ]
        };
    }

    function onLoad() {
        binder.map( "SessionStorage@cbauth" ).toDSL( settings.sessionStorage );
        binder.map( "RequestStorage@cbauth" ).toDSL( settings.requestStorage );
        binder.map( "AuthenticationService@cbauth" ).to( "#moduleMapping#.models.AuthenticationService" );
    }

    function onUnload() {
    }

}
