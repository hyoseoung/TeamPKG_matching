<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn</title>
<style></style>
</head>
<body align="center">
	<!--<jsp:include page="../common/Top.jsp" />-->
	<h2>로그인</h2>

	<form action="LoginProcess.jsp" method="post">
		<%--아아디 패스워드 입력받아 'LP'페이지로 POST방식으로 전송 --%>
		<div>
			<label> E-mail : 
				<input id="eamil" type="email" name="user_id" placeholder="이메일 입력" />
			</label> <label></label>
		</div><br> 
		<div>
			<label> Password : 
				<input id="pw" type="password" name="user_pw" placeholder="비밀번호 입력" /><br>
			</label>
		</div><br>
		<div class="links">
			<a href="">회원가입</a>&nbsp;
			<a href="">|</a>
			<a href="">ID 찾기</a>&nbsp;
			<a href="">PW 찾기</a>
		</div><br>
		<button type="button">로그인</button><br><br>
		<button type="button">카카오톡 간편 로그인</button>
	</form>
</body>
</html>
