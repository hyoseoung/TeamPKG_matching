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
	}
	
	nav {
		width: 200px;
		height: 500px;
		float: left;
	}
	
	table {
		width: 50%;
	}
</style>

</head>

<body>
	<header>
		<!-- img 태그로 로고 -->
		<h2>관리자 페이지</h2>
		<!-- 관리자 프로필 -->
	</header>
	
	<nav>
		<h4>관리자 메뉴</h4>
		<a href="#">회원 정보</a>
	</nav>
	
	<h2>${dto.memberName} 회원의 정보</h2>
	<span>회원 번호: ${dto.memberId}</span><br>
	<span>닉네임: ${dto.nickname}</span><br>
	<span>이메일 주소: ${dto.emailAddr}</span><br>
	<span>연락처: ${dto.telNum}</span><br>
	<span>패스워드: ${dto.password}</span><br>
	<span>생년월일: ${dto.birthdate}</span><br>
	<span>성별: ${dto.gender}</span><br>
	<span>숙련도: ${dto.level}</span><br>
	<span>가입일: ${dto.regdate}</span><br>
	<span>최근 접속일: ${dto.lastLoginDate}</span><br>
	<span>계정 상태: ${dto}</span><br> <!-- 정지된 계정인지 아닌지 보여줌 -->
	
</body>
</html>