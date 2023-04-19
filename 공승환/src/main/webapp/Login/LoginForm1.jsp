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
<style>
#form {
	text-align: center;
}
</style>
</head>
<body>
	<div id="form">
		<h1>로고, 이름</h1>
		<form action="../Login/LoginController.do" class="loginForm" method="post">
			<div>
				<label> E-mail : <input id="loginEmail" class="login_text"
					type="email" name="user_email" placeholder="이메일 입력" />
				</label><br>
				<br> <label> Password : <input id="loginPass"
					class="login_text" type="password" name="user_pass"
					placeholder="비밀번호 입력" />
				</label><br>
			</div>
			<br>
			<div class="links">
				<a href="../SignUp/SignUp.jsp">일반 회원가입</a>&nbsp; <a>|</a>&nbsp; <a href="">ID 찾기</a>&nbsp;
				<a href="../Find/findPwSelect.jsp">pw 찾기</a>
			</div>
			<br>

			<button id="loginBtn1" class="" type="submit"
				value="">로그인</button>
			<br>
			<br>
		</form>
		<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
	</div>
</body>
</html>
