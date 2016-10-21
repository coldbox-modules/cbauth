<cfscript>

    function auth() {
        return wirebox.getInstance( "AuthenticationService@cbauth" );
    }

</cfscript>