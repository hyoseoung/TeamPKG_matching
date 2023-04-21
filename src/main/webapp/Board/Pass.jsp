<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료 게시판</title>
<link rel="stylesheet" href="css/MainPage.css" type="text/css">
</head>
<body>
<header id="headerType" class="header__wrap nexon fix">
	<div class="header__inner">
        <div class="header__logo">
            <a href="../Title/TitleMain.jsp">Plap <em>football</em></a>
        </div>
        <nav class="header__menu" style="width: 55%">
            <ul>
                <li><a href="#">Board</a></li>
                <li><a href="#">Middle Class</a></li>
                <li><a href="#">Challenger</a></li>
            </ul>
        </nav>
		<div class="header__member">
			<c:if test="${empty dto}" >
			<span >로그인이 필요합니다</span>
	    		<a id="login_btn" href="../Login/LoginForm.jsp" >로그인</a>

	    	</c:if>
	    	<c:if test="${not empty dto}">
	    		<span>${dto.memberName}님</span>
	    		<a href="../Logout/LogoutController.do">로그아웃</a>
	    		<a href="../CheckAuth/changeMemberckeck.jsp">개인정보 변경</a>
	    	</c:if>	
		</div>
	</div>
</header>
	<h2>비밀번호 검증</h2>
	<form action="../m2board/pass.do" method="post" name="writeForm">
		<input type="hidden" name="idx" value="${param.idx}"/>
		<input type="hidden" name="mode" value="${param.mode}"/>
		<table border="1" width="90%">
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="pass" style="width:100px;" required/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">검증하기</button>
					<button type="reset">초기화</button>
					<button type="button" onclick="location.href='../m2voard/list.do';">목록 돌아가기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>