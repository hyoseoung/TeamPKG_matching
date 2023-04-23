<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매치기릿 회원 상세정보</title>

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
	
	table {
		width: 50%;
	}
</style>

</head>

<body>
	<jsp:include page="./AdminHeader.jsp" />
	
	<form method="post">
		<h2>${dto.memberName} 회원의 정보</h2>

		<span>회원 이름: </span>  <input type="text" name="memberName" value="${dto.memberName}" required /> <br>
		<span>회원 번호: ${dto.memberId}</span> <br>
		<span>닉네임: </span> <input type="text" name="nickname" value="${dto.nickName}" /> <br>
		<span>패스워드: </span> <input type="text" name="password" value="${dto.password}" required /> <br>
		<span>이메일 주소: </span> <input type="text" name="email" value="${dto.email}" required /> <br>
		<span>연락처: </span> <input type="text" name="phoneNum" value="${dto.phoneNumber}" required /> <br>
		<span>성별: </span> <input type="text" name="gender" value="${dto.gender}" /> <br>
		<span>숙련도: </span> <input type="text" name="level" value="${dto.level}" /> <br>
		<span>가입일: ${dto.regDate}</span> <br>

		<%-- <span>최근 접속일: </span> ${dto.lastLoginDate} <br>
		<span>계정 상태: </span> <input type="text" name="isBanned" value="${dto.isBanned}"> <br> --%> <!-- 정지된 계정인지 아닌지 보여줌 -->
		<span>계정 상태: </span> <br>
		<c:if test="">
			<span>현재 계정 정지 날짜: <!-- 2023-01-01 ~ 2023-04-30 --></span> <br>
		</c:if>
		
		<div id="banSetting">
			<span>계정 정지 설정</span> <br>
			<input type="radio" name="ban" value="doBan" /> 정지하기
			<input type="radio" name="ban" value="notBan" checked /> 정지하지 않기
		</div>

		<div id="setBanDate" style="display: none;">
			<label for="startBan">정지 시작일: </label>  <input type="date" name="startBan" />
			<label for="endBan">정지 종료일: </label>  <input type="date" name="endBan" />
		</div>

		<br>
		<button type="submit">수정 사항 저장</button>
	</form>


<script>
	var doBan = document.getElementsByName('ban').item(0);
	var notBan = document.getElementsByName('ban').item(1);
	var bandateDiv = document.querySelector('#setBanDate');

	document.querySelector('#banSetting').addEventListener('click', function(e) {
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