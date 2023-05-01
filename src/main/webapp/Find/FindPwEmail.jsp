<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../css/MainPage.css" type="text/css">
<meta charset="UTF-8">
<style>
h3 {
   font-family: 'Noto Sans KR', 산세리프;
   text-align: center;
   margin-top: 100px
}
h5 {
   font-family: 'Noto Sans KR', 산세리프;
   text-align: center;
   margin-top: 10px
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
.cert {
   height: 40px;
   width: 392px;
   display: block;
   margin: 10px auto 10px auto;
   border-radius: 5px;
   background-color: #4CAF50;
   color: #fff;
   border: none;
   cursor: pointer;
}
.submit {
   height: 40px;
   width: 100%;
   display: block;
   margin: 10px auto 10px auto;
   border-radius: 5px;
   background-color: #FAFAD2;
   color: black;
   border: none;
   cursor: pointer;
}
input[type=email],[type=text]  {
   display: block;
   padding: 6px;
   font-size: 16px;
   border-radius: 5px;
   border: 1px solid #ccc;
   box-sizing: border-box;
   margin-bottom: 5px;
   width: 90%;
}
label {
	display: block;
	margin-bottom: 5px;
	font-size: 16px;
	font-weight: bold;
	text-align: right;
	width: 20%;
	padding-right: 10px;
	line-height: 32px;
}
</style>
<title>비밀번호 찾기</title>
</head>
<body>
<header id="headerType" class="header__wrap nexon fix">
	<div class="header__inner">
        <div class="header__logo">
            <a href="#">MATCH<em> GET IT!</em></a>
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
	<h3>비밀번호 찾기</h3>
	<h5>이메일로 인증</h5>
		<div class="form-container">
		<form action="../Find/EmailCheck.do" method="post">
			<label for="id">아이디</label>
			<input type="email" id="Id" name="Id"/>
			<label for="id">이메일</label>
			<input type="email" id="email" name="email" required/>	
			<button class="cert" type="button" id="sendMailBtn">인증번호 발급</button>
			<label for="admit">인증번호</label> 
			<input type="text" id="certNum" style="display:inline-block;" name="checkCode"/> 
			<button class="submit" type="button" onclick="location.href = 'FindReset.jsp'" id="finPw" >확인</button>
		</form>
		</div>
<script>
            $(function () {
              $('#sendMailBtn').click(function () {
                   $.ajax({
                     url: "EmailProcess.jsp",
                     type: "post",                 
                     data: {                       
                        email:$('#email').val()
                     },
                     success : sucFuncJson,  // 요청 성공 시 호출할 메서드 설정
                     error : errFunc         // 요청 실패 시 호출할 메서드 설정
                   });
              });
            });
            function sucFuncJson(e) {
               alert("성공: " + e.status);
            }

            // 실패 시 경고창을 띄워줍니다.
            function errFunc(e) {
                alert("실패: " + e.status);
            }
            
            $(function() {
              $('#findPwBtn').click(function() {
                var memberId = $('#memberId').val();
                $.ajax({
                  url: 'FindPwProcess.jsp',
                  type: 'POST',
                  data: { email : email },
                  success: function(data) {
                    if (data) {
                      
                    } else {
                      alert('계정이 없습니다.');
                    }
                  },
                  error: function() {
                    alert('서버 오류가 발생했습니다.');
                  }
                });
              });
            });
            	
            </script>
</body>
</html>