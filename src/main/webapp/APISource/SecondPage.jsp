<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>두번째 페이지</title>
<link rel="stylesheet" href="../css/SecondPage.css" type="text/css">
<style>
</style>
</head>
<body>
	<header id="headerType" class="header__wrap nexon fix">
		<div class="header__inner">
			<div class="header__logo">
				<a href="./FirstPage.jsp">Plap <em>football</em></a>
			</div>
			<nav class="header__menu">
				<ul>
					<li><a href="#">Starter</a></li>
					<li><a href="#">Middle Class</a></li>
					<li><a href="#">Challenger</a></li>
				</ul>
			</nav>
			<div class="header__member">
				<a id="login_btn" href="#">로그인</a>
			</div>
		</div>
	</header>
	<div id="form-container">
      <div id="form-inner-container">
        <div id="sign-up-container">
          <h3 id="LoginLogo">Plap <em>FootBall</em></h3>
          <form>
            <label for="name">ID</label>
            <input type="text" name="id" id="id" placeholder="ID">
            <label for="password">Password</label>
            <input type="password" name="password" id="id" placeholder="password">
            <div id="form-controls">
              <button type="submit" id="smbtn">Sign In</button>
              <button type="button" id="subtn">Sign Up</button>
            </div>
          </form>
          <!-- <button type="button" class="login-btn naver">네이버로 로그인</button> -->
          <button type="button" class="login-btn kakao">카카오로 로그인</button>
          <!-- <button type="button" class="login-btn google">구글로 로그인</button> -->
        </div>
      </div>
  </div>
  <button id="chat">고객 문의</button>
</body>
</html>