<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn</title>
<style>
	.links {text-decoration: none;}
</style>
</head>
<body align="center">
	<h1>로고, 이름</h1>
	<form action="" class="login_form" method="">
		<div>
			<label> E-mail : 
				<input id="login_email" class="login_text" type="email" name="user_email" placeholder="이메일 입력" />
			</label><br><br>
			<label> Password : 
				<input id="login_pw" class="login_text" type="password" name="user_pass" placeholder="비밀번호 입력" /><br>
			</label>
		</div><br>
		<div class="links">
			<a href="" >회원가입</a>&nbsp;
			<a>|</a>&nbsp;
			<a href="">ID 찾기</a>&nbsp;
			<a href="">PW 찾기</a>
		</div><br>
		<button id="" class="login_btn" type="button">로그인</button><br><br>
		<button id="" class="login_btn" type="button">카카오톡 간편 로그인</button>
	</form>
</body>
</html>
