<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn</title>
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
				<a href="">회원가입</a>&nbsp; <a>|</a>&nbsp; <a href="">ID 찾기</a>&nbsp;
				<a href="">PW 찾기</a>
			</div>
			<br>

			<button id="loginBtn1" class="" type="submit" onclick="login();"
				value="">로그인</button>
			<br>
			<br>
			<button id="loginBtn2" class="" type="submit" onclick="naverlogin();">네이버
				간편 로그인</button>
		</form>
	</div>
</body>
</html>
