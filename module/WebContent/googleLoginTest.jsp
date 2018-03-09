<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head></head>
  <body>
  	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
      function handleClientLoad() {
        // Loads the client library and the auth2 library together for efficiency.
        // Loading the auth2 library is optional here since `gapi.client.init` function will load
        // it if not already loaded. Loading it upfront can save one network request.
        gapi.load('client:auth2', initClient);
      }

      function initClient() {
        // Initialize the client with API key and People API, and initialize OAuth with an
        // OAuth 2.0 client ID and scopes (space delimited string) to request access.
        gapi.client.init({
            apiKey: 'AIzaSyBTeFf4p7OR9j0a-19FPIT9B2WUkgXHK1Q',
           // discoveryDocs: ["https://people.googleapis.com/$discovery/rest?version=v1"],
           discoveryDocs : ['https://www.googleapis.com/discovery/v1/apis/drive/v3/rest'],
            clientId: '61361841866-vo4t7lvuvivtcd2emeeda8v2qnrk9358.apps.googleusercontent.com',
            scope: 'profile'
        }).then(function () {
          // Listen for sign-in state changes.
          gapi.auth2.getAuthInstance().isSignedIn.listen(updateSigninStatus);

          // Handle the initial sign-in state.
          updateSigninStatus(gapi.auth2.getAuthInstance().isSignedIn.get());
        });
      }

      function updateSigninStatus(isSignedIn) {
        // When signin status changes, this function is called.
        // If the signin status is changed to signedIn, we make an API call.
        if (isSignedIn) {
          makeApiCall();
        }
      }

      function handleSignInClick(event) {
        // Ideally the button should only show up after gapi.client.init finishes, so that this
        // handler won't be called before OAuth is initialized.
        gapi.auth2.getAuthInstance().signIn();
      }

      function handleSignOutClick(event) {

//     	    var auth2 = gapi.auth2.getAuthInstance();
//     	    auth2.signOut().then(function () {
//     	      console.log('User signed out.');
//     	    });
        //gapi.auth2.getAuthInstance().signOut();
    	  document.location.href = "https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost:8080/module/googleLoginTest.jsp";
      }

      function makeApiCall() {
        // Make an API call to the People API, and print the user's given name.
        gapi.client.people.people.get({
          'resourceName': 'people/me',
          'requestMask.includeField': 'person.names'
        }).then(function(response) {
          console.log('Hello, ' + response.result.names[0].givenName);
        }, function(reason) {
          console.log('Error: ' + reason.result.error.message);
        });
      }
      
      function logout() {
    	  // 로그아웃 아이프레임
    	  $("body").append("<iframe id='logoutIframe' style='display: none;'></iframe>");
    	  $("#logoutIframe").attr("src", "http://nid.naver.com/nidlogin.logout");
    	  // 로그아웃 처리
    	  $("#naver_id_login").show();
    	  $("#naver_id_logout").hide();
    	 }
    </script>
    <script async defer src="https://apis.google.com/js/api.js"
      onload="this.onload=function(){};handleClientLoad()"
      onreadystatechange="if (this.readyState === 'complete') this.onload()">
    </script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <div>
    	<span>구글 계정 로그인</span>
        <button id="signin-button" onclick="handleSignInClick()">Sign In</button>
    	<button id="signout-button" onclick="handleSignOutClick()">Sign Out</button>
    </div>
    <div>
    	<span>네이버 아이디로 로그인</span>
    	 <div id="naver_id_login"></div>
    	   <script type="text/javascript">
  				var naver_id_login = new naver_id_login("mOABlqJZLjbiXsTKoCig", "http://localhost:8080/module/loginafter.jsp");
  				var state = naver_id_login.getUniqState();
  				naver_id_login.setButton("white", 2,40);
  				naver_id_login.setDomain("http://localhost:8080/module/googleLoginTest.jsp");
  				naver_id_login.setState(state);
  				naver_id_login.setPopup();
  				naver_id_login.init_naver_id_login();
  			</script>
  			<div id="naver_id_logout">
   				<a href="#" onclick="logout();">네이버  로그아웃</a>
    			<!-- 로그인 사용자 정보출력 -->
    			<div id="dvLogin"></div>
    			<!-- 로그인 사용자 정보출력 끝 -->
   			</div>
    </div>

  </body>
</html>