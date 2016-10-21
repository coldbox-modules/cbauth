component {

    this.title = "cbauth";

    function configure() {
        settings = {
            userServiceClass = ""
        };

        interceptorSettings = {
            customInterceptionPoints = "preAuthentication,postAuthentication"
        };
    }

    function onLoad() {
        var helpers = controller.getSetting( "applicationHelper" );
        arrayAppend(
            helpers,
            "#moduleMapping#/helpers/AuthenticationServiceHelper.cfm"
        );
        controller.setSetting( "applicationHelper", helpers );
    }

    function onUnload() {
        controller.setSetting(
            "applicationHelper",
            arrayFilter( controller.getSetting( "applicationHelper" ), function( helper ) {
                return helper != "#moduleMapping#/helpers/AuthenticationServiceHelper.cfm"; 
            } )
        );
    }

}