<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%
    String clientId = "QMzZCB86eMc75Lc6X1y7";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8081/Package/API/APIController.do", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn</title>
 	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" href="./css/LoginPage.css" type="text/css">
</head>
<body>
	<header id="headerType" class="header__wrap nexon fix">
		<div class="header__inner">
			<div class="header__logo">
				<a href="../Matching/matchingwaitpage.jsp">Match <em>Get It!</em></a>
			</div>
			<div class="header__member">
				<a id="login_btn" href="#">로그인</a>
			</div>
		</div>
	</header>
	<div id="form-container">
      <div id="form-inner-container">
        <div id="sign-up-container">
          <h3 id="LoginLogo">Match <em>Get It!</em></h3>
          <form action="../Login/LoginController.do" method="post">
            <label for="name">ID</label>
            <input type="text" name="email" id="id" placeholder="email"/>
            <label for="password">Password</label>
            <input type="password" name="password" id="id" placeholder="password"/>
            <div id="form-controls">
              <button type="submit" id="smbtn">Sign In</button>
              <button type="button" id="subtn" onclick="location.href='../SignUp/SignUp.jsp';">Sign Up</button>
            </div>
          </form>
           <button onclick="location.href='<%=apiURL%>'" class="login-btn naver">네이버로 로그인</button>
        </div>
      </div>
  </div>
  <button id="chat">고객 문의</button>
</body>
</html>
