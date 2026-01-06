# v7.0.0
## 06 Jan 2026 — 18:15:11 UTC

### BREAKING

+ __box.json:__ Update dependencies ([299099c](https://github.com/coldbox-modules/cbauth/commit/299099ced7d116d0e1660f399ea119a93e75261e))
+ __\*:__ feat: Added interception points and return user from authorize ([778cd73](https://github.com/coldbox-modules/cbauth/commit/778cd739e80a73d3efe772e0475b2ed9db9db088))
+ __cbstorages:__ Upgrade cbstorages to 2.0.0 ([10b3156](https://github.com/coldbox-modules/cbauth/commit/10b3156b3861c97ae7f87c53377db00226abe5e9))
+ __Storages:__ Allow customizing of storages ([b97a8ad](https://github.com/coldbox-modules/cbauth/commit/b97a8adfd90fdace338a516d383750152dbe3d61))
+ __build:__ Trigger major release for prior commit ([fca4bc5](https://github.com/coldbox-modules/cbauth/commit/fca4bc5bba38026a10c689f0c0ad21bc7a7d2211))

### chore

+ __CI:__ Update target branch to main
 ([ff4d99e](https://github.com/coldbox-modules/cbauth/commit/ff4d99e851cd2ab1c3cd04e1193dc61d3caa7971))
+ __build:__ Use openjdk8 on Travis ([0ba288b](https://github.com/coldbox-modules/cbauth/commit/0ba288b7c8e89320eb33b9dfc08d3e1237a6a4c3))
+ __ci:__ Add commandbox-semantic-release ([d9a0411](https://github.com/coldbox-modules/cbauth/commit/d9a0411e471f39f91f14fc17d68acc8f57a4be3a))
+ __formatting:__ Clean up spacing at end of lines
 ([ba8f1d3](https://github.com/coldbox-modules/cbauth/commit/ba8f1d375a4d5b6460833203c80e044123e5633f))
+ __server.json:__ Default to adobe@11 servers ([a73da29](https://github.com/coldbox-modules/cbauth/commit/a73da292232ca14db844d42010e57120a1435a49))
+ __tests:__ Remove Gulpfile and npm dependencies ([031a697](https://github.com/coldbox-modules/cbauth/commit/031a6978dfe33cedcceba7a2d81420bf4b759d88))
+ __initial commit:__ Initial commit
 ([3a7af6d](https://github.com/coldbox-modules/cbauth/commit/3a7af6d7f7fb342ccc745c7b1f167ab04c573374))

### feat

+ __AuthenticationService:__ Make `getUserService` publically available
 ([4f83978](https://github.com/coldbox-modules/cbauth/commit/4f839786602e2841c8d6ba43195acda9f965488e))
+ __Login:__ Add new `preLogin` and `postLogin` interception points ([495d516](https://github.com/coldbox-modules/cbauth/commit/495d516b09e126ab92fac1423958ce8adaeb3be7))

### fix

+ __AuthenticationService:__ Ensure the auth service is threadsafe for injections ([cb4dce9](https://github.com/coldbox-modules/cbauth/commit/cb4dce99e4346cc29164bbe1714e172fb8fbdc90))
+ __CI:__ Ensure coldbox is not added as a dependency from CI
 ([132adc4](https://github.com/coldbox-modules/cbauth/commit/132adc474e914fb748306f300dd09f1c38875741))
+ __build:__ Update box.json references to elpete
 ([76e416e](https://github.com/coldbox-modules/cbauth/commit/76e416ed099892494d0f849621fdb75fa9dfd3f0))
+ __build:__ Remove incompatible scripts for commandbox-semantic-release
 ([252db7e](https://github.com/coldbox-modules/cbauth/commit/252db7e6f65623b7a77a59c152dfdfcbe76548f2))
+ __tests:__ Fix MockBox expectation to match struct pattern
 ([2e5fe23](https://github.com/coldbox-modules/cbauth/commit/2e5fe23fc764612c35e572883ec655f7ef195759))

### other

+ __\*:__ #fix for making the auth service threadsafe for injections
 ([01e64dd](https://github.com/coldbox-modules/cbauth/commit/01e64dd4c35e90bd3ad38f0d4d11c23d9124f1b0))
+ __\*:__ chore: Update interception calls to latest cb7 standards of announce() ([1f2c2d3](https://github.com/coldbox-modules/cbauth/commit/1f2c2d31558333312f1d35e034ab20cda26f4fd2))
+ __\*:__ feat: Add onInvalidCredentials to the customInterceptionPoints
 ([f717586](https://github.com/coldbox-modules/cbauth/commit/f71758627c96be6fd49271fce07d1164d6394e38))
+ __\*:__ fix: name metadata attribute replaced by displayName ([dad0b1c](https://github.com/coldbox-modules/cbauth/commit/dad0b1c3a7da67c25ac405d336eef86380ebbe1c))
+ __\*:__ feat: Add username and password to postAuthentication interception point
 ([15bbfa2](https://github.com/coldbox-modules/cbauth/commit/15bbfa21d31d568a99ffae8ef6433b8729c0b727))
+ __\*:__ feat: Add onInvalidCredentials interception point ([b0b2c09](https://github.com/coldbox-modules/cbauth/commit/b0b2c09511d0456ab904d6f11e3b6026eae80908))
+ __\*:__ feat: Add quietLogout method ([ffe62b2](https://github.com/coldbox-modules/cbauth/commit/ffe62b20fe63f51cc733c4c188b3d33df20509ba))
+ __\*:__ Apply cfformat changes
 ([bae8be0](https://github.com/coldbox-modules/cbauth/commit/bae8be083861e356cd678cd943e57686f68e1737))
+ __\*:__ Add quietLogout method
 ([fb9c40c](https://github.com/coldbox-modules/cbauth/commit/fb9c40c3632d52c11952039eb3cd083a8f9c920d))
+ __\*:__ chore: Migrate to GitHub Actions ([c43353a](https://github.com/coldbox-modules/cbauth/commit/c43353a73f30da0addf27a1e0ca377286ae3af57))
+ __\*:__ fix: Removing session key if there is a problem retrieving the user
 ([799211b](https://github.com/coldbox-modules/cbauth/commit/799211b1a0b627c0f08bc4aa6fc3b47ab4223df8))
+ __\*:__ fix: Allow any dsl to be the user service
 ([7cfb533](https://github.com/coldbox-modules/cbauth/commit/7cfb533f9b06f924961bd5f900e843801b2506e8))
+ __\*:__ Adjust gitignore file for better directory matching
 ([a2d0ba3](https://github.com/coldbox-modules/cbauth/commit/a2d0ba3e52a85410f307ccf0e8acf480082930a5))
+ __\*:__ chore: Use forgeboxStorage ([7ac6965](https://github.com/coldbox-modules/cbauth/commit/7ac6965013b3a08c027d85f4b0700e3d4ac75930))
+ __\*:__ chore: Transfer cbauth to coldbox-modules namespace
 ([2616896](https://github.com/coldbox-modules/cbauth/commit/26168963563d25accb007fb274c95416938b6baf))
+ __\*:__ docs: Fixed Coldbox 4.3 docs link ([d4252ce](https://github.com/coldbox-modules/cbauth/commit/d4252cee40997d2e2747082791be0498072374eb))
+ __\*:__ Merge pull request #3 from elpete/add_csr ([74c4f63](https://github.com/coldbox-modules/cbauth/commit/74c4f63a97d4b3d98b28b5a729595c353b159d3e))
+ __\*:__ Merge pull request #2 from jclausen/master ([8c71db8](https://github.com/coldbox-modules/cbauth/commit/8c71db88efc70eec1fdc72679fef493ad5998d22))
+ __\*:__ 1.0.6 ([d37332a](https://github.com/coldbox-modules/cbauth/commit/d37332a29700baea620d8c57261657dbd91f52f3))
+ __\*:__ Merge pull request #1 from homestar9/patch-1 ([43c3d2f](https://github.com/coldbox-modules/cbauth/commit/43c3d2f5df99d9db721398ee3a337a438f4f694e))
+ __\*:__ Adobe ColdFusion requires that properties are declared first in CFCs ([8abed60](https://github.com/coldbox-modules/cbauth/commit/8abed60ad1d362a861a20b921eaae7fa0b776aae))
+ __\*:__ Updates session to use CacheStorage@cbstorages ([2d10a34](https://github.com/coldbox-modules/cbauth/commit/2d10a346061ac2e9534487dbfd52816e2ae62429))
+ __\*:__ 1.0.5 ([43b2aea](https://github.com/coldbox-modules/cbauth/commit/43b2aea9515d219df2475db13fddbe5bdf121b25))
+ __\*:__ Update tests to match fixed variable name
 ([335781d](https://github.com/coldbox-modules/cbauth/commit/335781ddeb214f7b27e6e73ac24e635452f7c60b))
+ __\*:__ 1.0.4 ([1367d83](https://github.com/coldbox-modules/cbauth/commit/1367d839469fecda0f92cd2c1af48e8a5d137948))
+ __\*:__ Rename variable to avoid naming collision
 ([3a1d792](https://github.com/coldbox-modules/cbauth/commit/3a1d792b7eb5401e25f8f26653f89849352264c8))
+ __\*:__ Fix incorrect method name
 ([470ca47](https://github.com/coldbox-modules/cbauth/commit/470ca47521f9c767f28bf6333b44d470853e2564))
+ __\*:__ Testing the onRelease interception point ([e666b68](https://github.com/coldbox-modules/cbauth/commit/e666b6800dd683b131870a71a16309170384c57a))
+ __\*:__ Fix for CommandBox's auto-versioning ([2161add](https://github.com/coldbox-modules/cbauth/commit/2161add2b74a639333efdff45a786d6507ff3b21))
+ __\*:__ 1.0.1 ([53b27f9](https://github.com/coldbox-modules/cbauth/commit/53b27f947514ddba2bbe2ff3fc5b320614b70a91))
+ __\*:__ Add auto-versioning scripts ([f58ca37](https://github.com/coldbox-modules/cbauth/commit/f58ca3783d64a4261de59877bca7e456e0d9ebe5))
+ __\*:__ Update ModuleConfig.cfc ([e773c38](https://github.com/coldbox-modules/cbauth/commit/e773c3846d36297c6cdab6a8dac4c3dad1733358))
+ __\*:__ Add docs
 ([297bb86](https://github.com/coldbox-modules/cbauth/commit/297bb86d2c75525ac2e7d436ae465205a9b38d9c))
+ __\*:__ Add a quick `auth()` helper function to quickly get the AuthenticationService.
 ([b41ec90](https://github.com/coldbox-modules/cbauth/commit/b41ec90f0a310caf9459467085332640585a5337))
+ __\*:__ Rename package to cbauth
 ([ee09ebe](https://github.com/coldbox-modules/cbauth/commit/ee09ebe23ee3d78ad8e8363b3839203a25145526))
+ __\*:__ Announce custom interception points for authentication ([44e9249](https://github.com/coldbox-modules/cbauth/commit/44e9249eff0bc99008e27757565c68a6d59b7d33))
+ __\*:__ Register custom interception points
 ([d9e3f0b](https://github.com/coldbox-modules/cbauth/commit/d9e3f0b60e92a07262ef1fa3930d2715fe48c544))
+ __\*:__ Fix modules typo
 ([9b70c80](https://github.com/coldbox-modules/cbauth/commit/9b70c80f864331abb0bb61ccdd9e8863b9b8c910))
+ __\*:__ can log out a user now
 ([30b65ea](https://github.com/coldbox-modules/cbauth/commit/30b65ea59bd7f213bfd4b7ff987de7d97f7f3374))
+ __\*:__ isLoggedIn and getUser helpers
 ([79e1ff9](https://github.com/coldbox-modules/cbauth/commit/79e1ff9ed0c3f2576d14ceff8a33dc5752ff076a))
+ __\*:__ It can log a user in relying on a userServiceClass
 ([5ee8805](https://github.com/coldbox-modules/cbauth/commit/5ee880582d01d2e3937bca997e0e50379338f49a))


# v5.0.3
## 25 Aug 2020 — 16:56:30 UTC

### fix

+ __CI:__ Ensure coldbox is not added as a dependency from CI
 ([132adc4](https://github.com/coldbox-modules/cbauth/commit/132adc474e914fb748306f300dd09f1c38875741))


# v5.0.2
## 19 May 2020 — 05:46:52 UTC

### other

+ __\*:__ fix: Removing session key if there is a problem retrieving the user
 ([799211b](https://github.com/coldbox-modules/cbauth/commit/799211b1a0b627c0f08bc4aa6fc3b47ab4223df8))


# v5.0.1
## 24 Apr 2020 — 03:47:00 UTC

### other

+ __\*:__ fix: Allow any dsl to be the user service
 ([7cfb533](https://github.com/coldbox-modules/cbauth/commit/7cfb533f9b06f924961bd5f900e843801b2506e8))


# v5.0.0
## 02 Apr 2020 — 22:10:08 UTC

### BREAKING

+ __\*:__ feat: Added interception points and return user from authorize ([778cd73](https://github.com/coldbox-modules/cbauth/commit/778cd739e80a73d3efe772e0475b2ed9db9db088))


# v4.1.2
## 18 Feb 2020 — 17:27:02 UTC

### other

+ __\*:__ Adjust gitignore file for better directory matching
 ([a2d0ba3](https://github.com/coldbox-modules/cbauth/commit/a2d0ba3e52a85410f307ccf0e8acf480082930a5))


# v4.1.1
## 13 Feb 2020 — 17:36:32 UTC

### other

+ __\*:__ chore: Use forgeboxStorage ([7ac6965](https://github.com/coldbox-modules/cbauth/commit/7ac6965013b3a08c027d85f4b0700e3d4ac75930))


# v4.1.0
## 23 Dec 2019 — 18:06:36 UTC

### feat

+ __Login:__ Add new `preLogin` and `postLogin` interception points ([495d516](https://github.com/coldbox-modules/cbauth/commit/495d516b09e126ab92fac1423958ce8adaeb3be7))


# v4.0.0
## 02 Oct 2019 — 05:29:36 UTC

### BREAKING

+ __cbstorages:__ Upgrade cbstorages to 2.0.0 ([10b3156](https://github.com/coldbox-modules/cbauth/commit/10b3156b3861c97ae7f87c53377db00226abe5e9))


# v3.0.3
## 24 Sep 2019 — 16:40:21 UTC

### other

+ __\*:__ chore: Transfer cbauth to coldbox-modules namespace
 ([2616896](https://github.com/coldbox-modules/cbauth/commit/26168963563d25accb007fb274c95416938b6baf))


# v3.0.2
## 22 Sep 2019 — 19:08:45 UTC

### other

+ __\*:__ docs: Fixed Coldbox 4.3 docs link ([d4252ce](https://github.com/elpete/cbauth/commit/d4252cee40997d2e2747082791be0498072374eb))


# v3.0.1
## 22 Sep 2019 — 18:58:14 UTC

### chore

+ __build:__ Use openjdk8 on Travis ([0ba288b](https://github.com/elpete/cbauth/commit/0ba288b7c8e89320eb33b9dfc08d3e1237a6a4c3))


# v3.0.0
## 12 Jul 2019 — 20:14:17 UTC

### BREAKING

+ __Storages:__ Allow customizing of storages ([b97a8ad](https://github.com/elpete/cbauth/commit/b97a8adfd90fdace338a516d383750152dbe3d61))


# v2.0.0
## 25 Oct 2018 — 06:56:50 UTC

### BREAKING

+ __build:__ Trigger major release for prior commit ([fca4bc5](https://github.com/elpete/cbauth/commit/fca4bc5bba38026a10c689f0c0ad21bc7a7d2211))

### chore

+ __ci:__ Add commandbox-semantic-release ([d9a0411](https://github.com/elpete/cbauth/commit/d9a0411e471f39f91f14fc17d68acc8f57a4be3a))
+ __formatting:__ Clean up spacing at end of lines
 ([ba8f1d3](https://github.com/elpete/cbauth/commit/ba8f1d375a4d5b6460833203c80e044123e5633f))
+ __server.json:__ Default to adobe@11 servers ([a73da29](https://github.com/elpete/cbauth/commit/a73da292232ca14db844d42010e57120a1435a49))
+ __tests:__ Remove Gulpfile and npm dependencies ([031a697](https://github.com/elpete/cbauth/commit/031a6978dfe33cedcceba7a2d81420bf4b759d88))

### fix

+ __build:__ Update box.json references to elpete
 ([76e416e](https://github.com/elpete/cbauth/commit/76e416ed099892494d0f849621fdb75fa9dfd3f0))
+ __build:__ Remove incompatible scripts for commandbox-semantic-release
 ([252db7e](https://github.com/elpete/cbauth/commit/252db7e6f65623b7a77a59c152dfdfcbe76548f2))
+ __tests:__ Fix MockBox expectation to match struct pattern
 ([2e5fe23](https://github.com/elpete/cbauth/commit/2e5fe23fc764612c35e572883ec655f7ef195759))

### other

+ __\*:__ Merge pull request #3 from elpete/add_csr ([74c4f63](https://github.com/elpete/cbauth/commit/74c4f63a97d4b3d98b28b5a729595c353b159d3e))
+ __\*:__ Merge pull request #2 from jclausen/master ([8c71db8](https://github.com/elpete/cbauth/commit/8c71db88efc70eec1fdc72679fef493ad5998d22))


# v2.0.0
## 25 Oct 2018 — 06:40:06 UTC

### BREAKING

+ __build:__ Trigger major release for prior commit ([fca4bc5](https://github.com/octanner/cbauth/commit/fca4bc5bba38026a10c689f0c0ad21bc7a7d2211))

### chore

+ __ci:__ Add commandbox-semantic-release ([d9a0411](https://github.com/octanner/cbauth/commit/d9a0411e471f39f91f14fc17d68acc8f57a4be3a))
+ __formatting:__ Clean up spacing at end of lines
 ([ba8f1d3](https://github.com/octanner/cbauth/commit/ba8f1d375a4d5b6460833203c80e044123e5633f))
+ __server.json:__ Default to adobe@11 servers ([a73da29](https://github.com/octanner/cbauth/commit/a73da292232ca14db844d42010e57120a1435a49))
+ __tests:__ Remove Gulpfile and npm dependencies ([031a697](https://github.com/octanner/cbauth/commit/031a6978dfe33cedcceba7a2d81420bf4b759d88))

### fix

+ __build:__ Remove incompatible scripts for commandbox-semantic-release
 ([252db7e](https://github.com/octanner/cbauth/commit/252db7e6f65623b7a77a59c152dfdfcbe76548f2))
+ __tests:__ Fix MockBox expectation to match struct pattern
 ([2e5fe23](https://github.com/octanner/cbauth/commit/2e5fe23fc764612c35e572883ec655f7ef195759))

### other

+ __\*:__ Merge pull request #3 from elpete/add_csr ([74c4f63](https://github.com/octanner/cbauth/commit/74c4f63a97d4b3d98b28b5a729595c353b159d3e))
+ __\*:__ Merge pull request #2 from jclausen/master ([8c71db8](https://github.com/octanner/cbauth/commit/8c71db88efc70eec1fdc72679fef493ad5998d22))
