component extends="testbox.system.BaseSpec" {

    function run() {
        describe( "authentication service", function() {
            beforeEach( function() {
                setUpWireBox();
                setUpUser();
                setUpSessionStorage();
                setUpRequestStorage();
                setUpUserService();

                variables.auth = getMockBox().createMock( "models.AuthenticationService" );
                auth.$property( propertyName = "wirebox", mock = wireboxMock );
                auth.$property( propertyName = "sessionStorage", mock = sessionStorageMock );
                auth.$property( propertyName = "requestStorage", mock = requestStorageMock );
            } );

            afterEach( function() {
                structDelete( variables, "auth" );
                structDelete( variables, "userServiceMock" );
                structDelete( variables, "requestStorageMock" );
                structDelete( variables, "sessionStorageMock" );
                structDelete( variables, "userMock" );
            } );

            describe( "instantiating the user service", function() {
                beforeEach( function() {
                    makePublic( auth, "getUserService", "getUserServicePublic" );
                } );

                it( "fails if no userServiceClass was specified in the settings", function() {
                    auth.$property( propertyName = "userServiceClass", mock = "" );

                    expect( function() {
                        auth.getUserServicePublic();
                    } ).toThrow( "IncompleteConfiguration");
                } );

                it( "calls wirebox with the userServiceClass and returns it", function() {
                    var mockedPath = "my.mocked.path";
                    auth.$property( propertyName = "userServiceClass", mock = mockedPath );
                    wireboxMock.$( "getInstance" ).$args( mockedPath ).$results( userServiceMock );

                    var actual = auth.getUserServicePublic();
                    
                    expect( actual ).toBe( userServiceMock );
                } );

                it( "caches the userService", function() {
                    var mockedPath = "my.mocked.path";
                    auth.$property( propertyName = "userServiceClass", mock = mockedPath );
                    wireboxMock.$( "getInstance" ).$args( mockedPath ).$results( userServiceMock );

                    auth.getUserServicePublic();
                    auth.getUserServicePublic();
                    
                    expect( wireboxMock.$once( "getInstance" ) )
                        .toBeTrue( "[getInstance] should only have been called once." );
                } );
            } );

            describe( "logging in", function() {
                it( "stores a user id in the session storage", function() {
                    auth.login( userMock );
                    expect( sessionStorageMock.$once( "setVar" ) ).toBeTrue();
                    expect( sessionStorageMock.$callLog().setVar[1][2] ) // first time called, second argument
                        .toBe( userId, "User id of #userId# should have been passed to `setVar`." );
                } );

                it( "sets the logged in user object in the request scope to save on multiple db requests", function() {
                    auth.login( userMock );
                    expect( requestStorageMock.$once( "setVar" ) ).toBeTrue();
                    expect( requestStorageMock.$callLog().setVar[1][2] ) // first time called, second argument
                        .toBe( userMock, "User object should have been passed to `setVar`." );
                } );
            } );

            describe( "authenticating users", function() {
                beforeEach( function() {
                    auth.$property( propertyName = "userServiceClass", mock = "doesnt.matter" );
                    wireboxMock.$( "getInstance" ).$args( "doesnt.matter" ).$results( userServiceMock );
                } );

                describe( "calling user-defined functions", function() {
                    it( "calls a user-defined function to validate correct credentials", function() {
                        var validUsername = "john.doe@example.com";
                        var correctPassword = "pass1234";

                        userServiceMock.$( "isValidCredentials", true );

                        auth.authenticate( validUsername, correctPassword );

                        expect( userServiceMock.$once( "isValidCredentials" ) )
                            .toBeTrue( "[isValidCredentials] was not called on the userService." );
                        expect( userServiceMock.$once( "retrieveUser" ) )
                            .toBeTrue( "[retrieveUser] was not called on the userService." );
                    } );

                    it( "calls the functions with the credentials", function() {
                        var validUsername = "john.doe@example.com";
                        var correctPassword = "pass1234";

                        userServiceMock.$( "isValidCredentials", true );

                        auth.authenticate( validUsername, correctPassword );

                        var isValidCredentialsCallLog = userServiceMock.$callLog().isValidCredentials;
                        var retrieveUserCallLog = userServiceMock.$callLog().retrieveUser;

                        expect( isValidCredentialsCallLog[1] )
                            .toBe( [ validUsername, correctPassword ] );

                        expect( retrieveUserCallLog[1] )
                            .toBe( [ validUsername, correctPassword ] );
                    } );

                    it( "throws an InvalidCredentials exception and does not call retrieveUser if the credentials are invalid", function() {
                        var validUsername = "john.doe@example.com";
                        var incorrectPassword = "h@ck3r4L!fe!";

                        userServiceMock.$( "isValidCredentials", false );

                        expect( function() {
                            auth.authenticate( validUsername, incorrectPassword );
                        } ).toThrow( "InvalidCredentials" );

                        expect( userServiceMock.$never( "retrieveUser" ) )
                            .toBeTrue( "[retrieveUser] should not have been called on the userService but was." );
                    } );
                } );

                xdescribe( "pre and post interception points", function() {
                    
                } );

                it( "returns true if the user was successfully authenticated", function() {
                    var validUsername = "john.doe@example.com";
                    var correctPassword = "pass1234";

                    userServiceMock.$( "isValidCredentials", true );

                    var result = auth.authenticate( validUsername, correctPassword );

                    expect( result ).toBeTrue();
                } );

                it( "logs in a user after being successfully authenticated", function() {
                    var validUsername = "john.doe@example.com";
                    var correctPassword = "pass1234";

                    userServiceMock.$( "isValidCredentials", true );

                    auth.authenticate( validUsername, correctPassword );

                    expect( sessionStorageMock.$once( "setVar" ) ).toBeTrue();
                    expect( sessionStorageMock.$callLog().setVar[1][2] ) // first time called, second argument
                        .toBe( userId, "User id of #userId# should have been passed to `setVar`." );
                } );
            } );
        } );
    }

    function setUpWireBox() {
        variables.wireboxMock = getMockBox().createStub();
    }

    function setUpUser() {
        variables.userMock = getMockBox().createStub();
        variables.userId = 1;
        userMock.$( "getId", userId );
    }

    function setUpSessionStorage() {
        variables.sessionStorageMock = getMockBox()
            .createMock( "modules.cbstorages.models.SessionStorage" );
        sessionStorageMock.init();
        sessionStorageMock.$( "setVar" );
    }

    function setUpRequestStorage() {
        variables.requestStorageMock = getMockBox().createMock( "modules.cbstorages.models.RequestStorage" );
        requestStorageMock.init();
        requestStorageMock.$( "setVar" );
    }

    function setUpUserService() {
        variables.userServiceMock = getMockBox().createStub();
        userServiceMock.$( "retrieveUser", userMock );
    }

}