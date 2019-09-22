# cbauth

Wrapper for authentication for ColdBox.

## Installation

Requires ColdBox 4.3 for [module parent settings](https://github.com/ortus-docs/coldbox-docs/blob/v4.x/intro/introduction/whats-new-with-4.3.0.md).

`box install cbauth`

Specify a `userServiceClass` in your `config/ColdBox.cfc` inside `moduleSettings.cbauth.userServiceClass`.  This component needs to have three methods:

1. `isValidCredentials( username, password )`
2. `retrieveUserByUsername( username )`
3. `retrieveUserById( id )`

Additionally, the user component returned by the `retrieve` methods needs to respond to `getId()`.

You can also specify a `sessionStorage` and a `requestStorage` WireBox mapping.
These will be used inside `AuthenticationService`.  By default, these are
`SessionStorage@cbstorages` and `RequestStorage@cbstorages` respectively.
Interfaces are provided in the `models` folder for reference when building
your own.  (Your storage classes do not need to formally implement the interface.)

## Usage

You can inject the `authenticationService` using WireBox.

```js
property name="auth" inject="authenticationService@cbauth";

// OR

var auth = wirebox.getInstance( "authenticationService@cbauth" );
```

Or, the quick way, using the `auth()` helper.

```js
auth() == wirebox.getInstance( "authenticationService@cbauth" );
```

This is very useful in views.  And since WireBox handles singleton management, you don't need to worry about calling `auth()` too many times.

## Methods

### `login`

| name | type | required | default | description |
| --- | --- | --- | --- | --- |
| user | any | true | | The user component to log in.  The component must respond to the `getId()` method. |

Logs a user in to the system.  The user component must respond to the `getId()` method.  Additionally, the user is cached in the `request` scope.  If a user is already in the session, this will replace it with the given user.


### `logout`

| name | type | required | default | description |
| --- | --- | --- | --- | --- |
| No arguments |

Logs a user out of system.  This method can be called regardless of if there is currently a logged in user.


### `authenticate`

| name | type | required | default | description |
| --- | --- | --- | --- | --- |
| username | string | true | | The username to attempt to log in. |
| password | string | true | | The password to attempt to log in. |

Attempts to log a user by calling the `isValidCredentials` and `retrieveUserByUsername` on the provided `userServiceClass`.  If `isValidCredentials` returns `false`, it throws a `InvalidCredentials` exception.

If it succeeds, it returns `true`.  If it succeeds, it also sets the user id (obtained by calling `getId()` on the returned user component) in the session and the returned user component in the request.


### `isLoggedIn`

| name | type | required | default | description |
| --- | --- | --- | --- | --- |
| No arguments |

Returns whether a user is logged in to the system.


### `check`

| name | type | required | default | description |
| --- | --- | --- | --- | --- |
| No arguments |

_Alias for [`isLoggedIn`](#isLoggedIn)_


### `guest`

| name | type | required | default | description |
| --- | --- | --- | --- | --- |
| No arguments |

Returns whether a user is logged out of the system.


### `getUser`

| name | type | required | default | description |
| --- | --- | --- | --- | --- |
| No arguments |

Returns the currently logged in user component.

If there is no logged in user, it throws a `NoUserLoggedIn` exception.

Additionally, it sets the user in the `request` scope so subsequent calls to `getUser` don't re-fetch the user from the database or other permanent storage.


### `user`

| name | type | required | default | description |
| --- | --- | --- | --- | --- |
| No arguments |

_Alias for [`getUser`](#getUser)_


### `getUserId`

| name | type | required | default | description |
| --- | --- | --- | --- | --- |
| No arguments |

Returns the currently logged in user id.

If there is no logged in user, it throws a `NoUserLoggedIn` exception.


## Interception Points — (preAuthentication & postAuthentication)

cbauth announces two custom interception points — preAuthentication and postAuthentication.  You can use these interception points to change request data or add additional values to session or request scopes.

### `preAuthentication`

interceptData

| name | description |
| --- | --- |
| username | The username passed in to `cbauth`. |
| password | The password passed in to `cbauth`. |

Modifying the values in the `interceptData` will change what is passed to `isValidCredentials` and `retrieveUserByUsername`.  This is the prime time to ignore certain requests or remove or pad usernames.


### `postAuthentication`

interceptData

| name | description |
| --- | --- |
| user | The user component to be logged in. |
| sessionStorage | The sessionStorage object to store additional values if needed. |
| requestStorage | The requestStorage object to store additional values if needed. |

This is the prime time to store additional values based on the user returned.
