<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/MainPage.css" type="text/css">
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
button {
	width: 300px;
	height:100px;
  	border-radius: 8px;
  	overflow: hidden;
  	margin: 40px auto;
  	transition: all 0.3s cubic-bezier(0.42, 0.0, 0.58, 1.0);
  	background-color:#4CAF50;
}

h3 {
	font-family: 'Noto Sans KR', 산세리프;
	text-align:center; 
	margin-top:100px
}

.form-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	background-color: #FFFFFF;
	border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
	margin: 10px auto;
	max-width: 500px;
	padding: 20px;
}
</style>
</head>
<body>
<header id="headerType" class="header__wrap nexon fix">
	<div class="header__inner">
        <div class="header__logo">
            <a href="#">MATCH<em> GET IT!</em></a>
        </div>
        <nav class="header__menu">
            <ul>
                <li><a href="#">Starter</a></li>
                <li><a href="#">Middle Class</a></li>
                <li><a href="#">Challenger</a></li>
            </ul>
        </nav>
		
	</div>
</header>
	<h3>비밀번호 찾기</h3>
	<div class="form-container">
		<button class="go" onclick="goEmail()">이메일로 인증</button>
		<button class="go" onclick="goPhone()">휴대폰으로 인증</button>
	</div>

	<script>
		function goEmail() {
			window.location.href = "FindPwEmail.jsp"
		}
		function goPhone() {
			window.location.href = "FindPwPhone.jsp"
		}
	</script>
</body>
</html>