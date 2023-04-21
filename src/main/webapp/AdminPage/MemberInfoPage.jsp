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
	
	/*
	#modify {
		float: right;
		margin: 20px;
		padding: 10px;
	}
	*/
</style>

</head>

<body>
	<jsp:include page="./AdminHeader.jsp" />
	
	<h2 style="display: inline-block;">${dto.memberName} 회원의 정보</h2>&emsp;
	<button type="button" id="modify1"
		onclick="location.href='../MatchGetIt/MemberEditPage.do?email=${dto.email}&emailType=${dto.memberTypeId}&mode=edit';">수정하기</button>
	<button type="button" id="modify2" onclick="confirmDelete()">삭제하기</button>
	<br>
	
	<span>회원 번호: ${dto.memberId}</span><br>
	<span>닉네임: ${dto.nickName}</span><br>
	<span>이메일 주소: ${dto.email}</span><br>
	<span>연락처: ${dto.phoneNumber}</span><br>
	<span>성별: ${dto.gender}</span><br>
	<span>숙련도: ${dto.level}</span><br>
	<span>가입일: ${dto.regDate}</span><br>
	<%-- <span>최근 접속일: ${dto.lastLoginDate}</span><br>
	<span>계정 상태: ${dto.isBanned}</span><br> <!-- 정지된 계정인지 아닌지 보여줌 -->
	<c:if test="">
		<span>현재 계정 정지 날짜: <!-- 2023-01-01 ~ 2023-04-30 --></span> <br>
	</c:if> --%>
	
<script>
	function confirmDelete() {
		let res = confirm('삭제하시겠습니까? (삭제하면 되돌릴 수 없습니다.)');
		
		if (res === true)
		location.href = '../MatchGetIt/MemberEditPage.do?email=${dto.email}&emailType=${dto.memberTypeId}&mode=delete';
	}
</script>

</body>
</html>