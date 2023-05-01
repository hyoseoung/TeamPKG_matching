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
<title>아이디 찾기</title>
<style>
h3 {
	font-family: 'Noto Sans KR', 산세리프;
	text-align: center;
	margin-top: 100px
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

input[type=text] {
	display: block;
	padding: 6px;
	font-size: 16px;
	border-radius: 5px;
	border: 1px solid #ccc;
	box-sizing: border-box;
	margin-bottom: 5px;
	width: 90%;
}

.fp {
	display: block;
	text-align: center;
	margin-top: 10px;
	font-size: 14px;
	color: #4CAF50;
	text-decoration: none;
}

.cert {
	height: 40px;
	width: 380px;
	display: block;
	margin: 10px auto 20px auto;
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
</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<header id="headerType" class="header__wrap nexon fix">
	<div class="header__inner">
        <div class="header__logo">
            <a href="../Title/TilteMain.jsp">Match <em>Get It!</em></a>
        </div>
        <nav class="header__menu" style="width: 55%">
            <ul>
                <li><a href="../Board/List.jsp">Board</a></li>
                <li><a href="#">Notice</a></li>
                <li><a href="#">Challenger</a></li>
            </ul>
        </nav>
		<div class="header__member">
			<c:if test="${empty dto}" >
			<span>로그인이 필요합니다</span>
	    		<a id="login_btn" href="../Login/LoginForm.jsp">로그인</a>
	    		<a id="login_btn" href="../SignUp/SignUp.jsp">회원가입</a>
	    	</c:if>
	    	<c:if test="${not empty dto}">
	    		<span>${dto.memberName}님</span>
	    		<a href="../Logout/LogoutController.do">로그아웃</a>
	    		<a href="../CheckAuth/changeMemberckeck.jsp">개인정보 변경</a>
	    	</c:if>	
		</div>
	</div>
</header>
	<h3>아이디찾기</h3>
	<div class="form-container">
		<form action="../Find/FindId.do" method="post">
			<label for="name">이 름</label> 
			<input type="text" id="user_id" name="m_name" style="display:inline-block;" placeholder="이름을 입력하세요"> 
			<label for="tel">전화번호</label> 
			<input type="text" id="pNum" name="p_number" style="display:inline-block;" placeholder="핸드폰 번호를 입력하세요">
			<button id="sendBtn" class="cert" type="button">인증번호 전송</button> 
			<label for="admit">인증번호</label> 
			<input type="text" id="inputCode" name="inputCode" placeholder="인증번호를 입력하세요"> 
			<button id="verifyBtn" class="cert" type="button">인증번호 확인</button>
			<a class="fp" href="FindPwSelect.jsp">비밀번호찾기</a>
			<button class="submit" type="submit">확인</button>
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