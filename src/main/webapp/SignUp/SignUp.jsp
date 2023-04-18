<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style type="text/css">
	div{
		margin-right: 50px;
		line-height: 30px;
	}
	botton:hover {
		transition: 0.7s;
		background-color:#002ead;
	}
	#button{
		border: 1px solid green;
		background-color: rgba(0,0,0,0);
		color: green;
		padding: 3px;
	}
	#button:hover {
		background-color: rgba(0,200,0,0.5);
		box-shadow: 0px 0px 0.5px 0.5px rgb(0,0,0);
	}
	#button:active {
      transform: scale(0.98);
      box-shadow: 3px 2px 22px 1px rgba(0, 0, 0, 0.24);
    }
</style>
</head>
<body>
	<h2>Sign Up</h2>
	<h1 align="center" style="background-color: #ADFF2F;">기본 정보 입력</h1> <br><br>
	<div style="float: left; text-align: right; margin-left: 250px">
		이메일 <br>
		비밀번호 <br>
		비밀번호 확인 <br>
		이름 <br>
		생년월일 <br>
		전화번호
	</div>
	<div style="float: left; text-align: left">
		<input type="text" name="email" size="10"/> @ <input type="text" name="email" size="15" />
		<input type="submit" value="중복확인" id="button" /> <br>
		<input type="password" name="password" /> <br>
		<input type="password" name="password" /> <br>
		<input type="text" name="name" size="10"/> <br>
		<input type="date" name="birth" /> <br>
		<input type="text" name="phone" class="tel" maxlength="13" />
		<input type="submit" value="인증하기" id="button" /> <br><br><br>
		<input type="button" value="NEXT" id="button" />
	</div>
</body>
</html>







