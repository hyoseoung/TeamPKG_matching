<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/MainPage.css" type="text/css">
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<style>
h3 {
   font-family: 'Noto Sans KR', 산세리프;
   text-align: center;
   margin-top: 100px
}
input[type=password],[type=text]  {
   display: block;
   padding: 6px;
   font-size: 15px;
   border-radius: 5px;
   border: 1px solid #ccc;
   margin-bottom: 5px;
   width: 70%;
}
label {
   display: block;
   margin-bottom: 5px;
   font-size: 13px;
   font-weight: bold;
   text-align: right;
   width: 20%;
   padding-right: 10px;
   line-height: 32px;
}
.submit {
   height: 40px;
   width: 100%;
   display: block;
   margin: 20px auto 10px auto;
   border-radius: 5px;
   background-color: #FAFAD2;
   color: black;
   border: none;
   cursor: pointer;
}
.form-container {
   display: flex;
   flex-wrap: wrap;
   justify-content: center;
   background-color: #FFFFFF;
   border-radius: 10px;
   box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
   margin: 20px auto;
   max-width: 500px;
   padding: 20px;
}
</style>
</head>
<body>
<header id="headerType" class="header__wrap nexon fix">
	<div class="header__inner">
        <div class="header__logo">
            <a href="../Title/TitleMain.jsp">MATCH<em> GET IT!</em></a>
        </div>
        <nav class="header__menu">
            <ul>
                <li><a href="#">Starter</a></li>
                <li><a href="#">Middle Class</a></li>
                <li><a href="#">Challenger</a></li>
            </ul>
        </nav>
	</div>
</header>
   <h3>비밀번호 재설정</h3><br>
   <form action="../Find/pass.do" method="post">
   <div class="form-container">	
	<label for="email">이메일</label>
   <input type="text" id="email_id" name="email" title="이메일 아이디" placeholder="이메일" />
   <label for="newPw">새 비밀번호</label>
   <input type="password" id="newPw" name="password" style="display:inline-block;" placeholder="비밀번호를 입력하세요.">
   <input type="submit" class="submit" id="changebtn" value="변경"/>
   </div>
   </form>
</body>
</html>