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
<title>비밀번호 찾기</title>
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
   width: 410px;
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
   margin: 20px auto 10px auto;
   border-radius: 5px;
   background-color: #FAFAD2;
   color: black;
   border: none;
   cursor: pointer;
}
input[type=text],[type=email]  {
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
		<div class="header__member">
			
		</div>
	</div>
</header>
  <h3>비밀번호 찾기</h3>
   <h5>휴대폰으로 인증</h5>
      <div class="form-container">
      	<form action="../Find/FindPw.do" method="post">
      	<label for="id">아이디</label>
		<input type="email" id="Id" name="email" placeholder="아이디를 입력하세요">
         <label for="tel">전화번호</label> 
         <input type="text" id="pNum" style="display:inline-block;" placeholder="핸드폰 번호를 입력하세요">
         <button id="sendBtn" class="cert" type="button">인증번호 전송</button>
         <label for="admit">인증번호</label> 
         <input type="text" id="inputCode" name="inputCode" placeholder="인증번호를 입력하세요">
  			
  			<button id="verifyBtn" class="cert" type="button">인증번호 확인</button>
			
         <button class="submit" type="submit" onclick="location.href='Find/FindReset.jsp'">확인</button>
         </form>
      </div>
      
     <script>
      $(function() {
    	  $('#sendBtn').click(function() {
    	      var pNum = $('#pNum').val();
    	      if (!pNum) { // 전화번호가 비어있으면 경고창을 띄웁니다.
    	        alert('전화번호를 입력해주세요.');
    	        return;
    	      }
      		  var randNum = Math.floor(Math.random() * 900000) + 100000; // 6자리 랜덤 숫자 생성
      		  $.ajax({
      		    url : "http://apis.aligo.in/send/",
      		    method : "POST",
      		    dataType: "String",
      		    data: {
      		      key : "a1dxalhnggeiylvvtw24k8l7juo7200t",
      		      user_id : "lho2046",
      		      sender : "01089428020",
      		      receiver : $('#pNum').val(),
      		      msg : "Match Get It 입니다. 인증코드는 " + randNum + " 입니다."
      		    },
      		  }).catch(function(error) {
      			  sessionStorage.setItem("authCode", randNum);
      		    alert("전송에 성공했습니다.");
      		    console.log(error);
      		  });
      		});
      	
        $('#verifyBtn').click(function() {
          // 세션에서 인증코드를 가져옴
          var authCode = sessionStorage.getItem("authCode");
          // 폼으로부터 입력받은 인증번호를 가져옴
          var userCode = $('#inputCode').val();
          if (userCode === '') {
              alert("인증코드를 입력하세요!");
           }else if (authCode === userCode) {
            alert("인증 성공!");
          } else {
            alert("인증 실패!");
          }
        });
        
      });
   
  </script>
</body>
</html>