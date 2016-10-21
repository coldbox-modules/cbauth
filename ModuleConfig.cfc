component {

    this.title = "cbauthentication";

    function configure() {
        settings = {
            userServiceClass = ""
        };

        interceptorSettings = {
            customInterceptionPoints = "preAuthentication,postAuthentication"
        };
    }

}