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

}