component {

    this.title = "cbauth";
    this.autoMapModels = false;
    this.dependencies = [ "cbstorages" ];

    function configure() {
        settings = {
            userServiceClass = "",
            sessionStorage = "SessionStorage@cbstorages",
            requestStorage = "RequestStorage@cbstorages"
        };

        interceptorSettings = {
            customInterceptionPoints = "preAuthentication,postAuthentication"
        };
    }

    function onLoad() {
        binder.map( "SessionStorage@cbauth" ).toDSL( settings.sessionStorage );
        binder.map( "RequestStorage@cbauth" ).toDSL( settings.requestStorage );
        binder.map( "AuthenticationService@cbauth" ).to( "#moduleMapping#.models.AuthenticationService" );

        var helpers = controller.getSetting( "applicationHelper" );
        arrayAppend(
            helpers,
            "#moduleMapping#/helpers/AuthenticationServiceHelpers.cfm"
        );
        controller.setSetting( "applicationHelper", helpers );
    }

    function onUnload() {
        controller.setSetting(
            "applicationHelper",
            arrayFilter( controller.getSetting( "applicationHelper" ), function( helper ) {
                return helper != "#moduleMapping#/helpers/AuthenticationServiceHelpers.cfm";
            } )
        );
    }

}
