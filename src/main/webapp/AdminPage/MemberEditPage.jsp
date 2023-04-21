<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매치기릿 회원 정보 수정</title>

<style>
	header {
		background-color: greenyellow;
		height: 100px;
		text-align: center;
		line-height: 100px
	}
	
	nav {
		width: 200px;
		height: 500px;
		float: left;
		border: 1px solid gray;
		margin-right: 20px;
	}
</style>

</head>

<body>
	<jsp:include page="./AdminHeader.jsp" />
	
	<form method="post">
		<input type="hidden" name="memberId" value="${dto.memberId}">
		<h2>회원 정보 수정</h2>

		<span>회원 번호: ${dto.memberId}</span> <br>
		<span>회원 성함: </span>  <input type="text" name="memberName" value="${dto.memberName}" required /> <br>
		<span>닉네임: </span> <input type="text" name="nickname" value="${dto.nickName}" /> <br>
		<%-- <span>이메일 주소: </span> <input type="text" name="email" value="${dto.email}" required /> <br> --%>
		<span>연락처: </span> <input type="text" name="phoneNum" value="${dto.phoneNumber}" required /> <br>

		<span>성별:&emsp;</span>
		남 <input type="radio" name="gender" value="남" <c:if test="${dto.gender=='남'}">checked</c:if> />&emsp;
		여 <input type="radio" name="gender" value="여" <c:if test="${dto.gender=='여'}">checked</c:if> />&emsp;
		<%-- 선택 안 함 <input type="radio" name="gender" value="" /> --%><br>
		
		<span>숙련도:&emsp;</span>
		상 <input type="radio" name="level" value="상" <c:if test="${dto.level=='상'}">checked</c:if> />&emsp;
		중 <input type="radio" name="level" value="중" <c:if test="${dto.level=='중'}">checked</c:if> />&emsp;
		하 <input type="radio" name="level" value="하" <c:if test="${dto.level=='하'}">checked</c:if> />&emsp;
		<%-- 선택 안 함 <input type="radio" name="gender" value="" /> --%><br>
		
		<%-- 
		<div id="banSetting">
			<span>계정 정지 설정</span> <br>
			<input type="radio" name="ban" value="doBan" /> 정지하기
			<input type="radio" name="ban" value="notBan" checked /> 정지하지 않기
		</div>

		<div id="setBanDate" style="display: none;">
			<label for="startBan">정지 시작일: </label>  <input type="date" name="startBan" />
			<label for="endBan">정지 종료일: </label>  <input type="date" name="endBan" />
		</div>
		--%>

		<br>
		<button type="submit">수정 사항 저장</button>
	</form>


<script>
	var doBan = document.getElementsByName('ban').item(0);
	var notBan = document.getElementsByName('ban').item(1);
	var bandateDiv = document.querySelector('#setBanDate');

	document.querySelector('#banSetting').addEventListener('click', function() {
		if (doBan.checked === true) {
			bandateDiv.style.display = 'block';
		}
		else if (notBan.checked === true) {
			bandateDiv.style.display = 'none';
		}
		
	});
</script>

</body>
</html>