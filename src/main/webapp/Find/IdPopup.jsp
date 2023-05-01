<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="member.MemberDAO, member.MemberDTO, util.AlertFunction" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/MainPage.css" type="text/css">
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<header id="headerType" class="header__wrap nexon fix">
	<div class="header__inner">
        <div class="header__logo">
            <a href="../Title/TitleMain.jsp">Match <em>Get It!</em></a>
        </div>
        <nav class="header__menu" style="width: 55%">
            <ul>
                <li><a href="../Board/List.jsp">Board</a></li>
                <li><a href="#">Nocitice</a></li>
                <li><a href="#">Challenger</a></li>
            </ul>
        </nav>
		
	</div>
</header>
	<br><br><br><br><br><br>
	<div class="form-container" id="pwPopup" style="align-items: center; font-size: large; padding: 20px;" >
	<p>회원님의 아이디는 <%=request.getAttribute("data")%> 입니다.</p>
	<button onclick="location.href='../Login/LoginForm1.jsp'">확인</button>
	</div>
</body>
</html>