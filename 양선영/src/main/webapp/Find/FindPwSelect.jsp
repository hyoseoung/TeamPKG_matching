<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
button {
	height: 40px;
	width: 100%;
	display: block;
	margin: 20px auto 10px auto;
	border-radius: 5px;
	background-color: #4CAF50;
	color: #fff;
	border: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<h3>sign up</h3>
	<h2 >비밀번호 찾기</h2>
	<button onclick="goEmail()">이메일로 인증</button>
	<button onclick="goPhone()">휴대폰으로 인증</button>
	
	<script>
		function goEmail(){
			window.location.href = "FindPwEmail.jsp"
		}
		function goPhone(){
			window.location.href = "FindPwPhone.jsp"
		}
	</script>
</body>
</html>