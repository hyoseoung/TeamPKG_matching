<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매치기릿 관리자 페이지</title>

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

	<h3>회원 목록</h3>
	<table border="1">
		<tr>
			<td>회원 번호</td>
			<td>회원 이름</td>
			<td>닉네임</td>
			<td>이메일 주소</td>
			<td>연락처</td>
			<td>패스워드</td>
			<td>가입일</td>
			<td>최근 접속일</td>
		</tr>
		<c:choose>
			<c:when test="${empty memberList}">
				<tr>
					<td colspan="8" align="center">등록된 게시물이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${memberList}" var="list" varStatus="stat">
				<tr align="center">
					<td>
						<a href="#">${list.memberId}</a>
					</td>
					<td>${list.memberName}</td>
					<td>${list.nickname}</td>
					<td>${list.emailAddr}</td>
					<td>${list.telNum}</td>
					<td>${list.password}</td>
					<td>${list.regdate}</td>
					<td>${list.lastLoginDate}</td>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
	<footer></footer>

</body>
</html>