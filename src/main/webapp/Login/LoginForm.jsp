<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../Header/APIHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn</title>
    <link rel="stylesheet" href="../css/LoginPage.css" type="text/css">
</head>
<body>
	<header id="headerType" class="header__wrap nexon fix">
		<div class="header__inner">
			<div class="header__logo">
				<a href="../Matching/matchingwaitpage.jsp">Match <em>Get It!</em></a>
			</div>
			<div class="header__member">
				<a id="login_btn" href="#">로그인</a>
			</div>
		</div>
	</header>
	<div id="form-container">
      <div id="form-inner-container">
        <div id="sign-up-container">
          <h3 id="LoginLogo">Match <em>Get It!</em></h3>
          <form action="../Login/LoginController.do" method="post">
            <label for="name">ID</label>
            <input type="text" name="email" placeholder="email"/>
            <label for="password">Password</label>
            <input type="password" name="password" placeholder="password"/>
            <div id="form-controls">
              	<button type="submit" id="Signup">Sign In</button>
              <button type="button" id="subtn" onclick="location.href='../SignUp/SignUp.jsp';">Sign Up</button>
            </div>
          </form>
          <button onclick="location.href='<%=apiURL%>'" class="login-btn naver">네이버로 로그인</button>
        </div>
      </div>
  </div>
  <button id="chat">고객 문의</button>
</body>
</html>
