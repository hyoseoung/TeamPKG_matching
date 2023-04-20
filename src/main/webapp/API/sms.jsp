<%@ page import="java.util.Random" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
  <title>Send SMS</title>
</head>
<body>
  <input type="text" id="pNum" placeholder="핸드폰 번호를 입력하세요">
  <button id="sendBtn">Send SMS</button>
  <br>
  <input type="text" id="inputCode" name="inputCode" placeholder="인증번호를 입력하세요">
  <button id="verifyBtn">인증번호 확인</button>
  <br>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(function() {
    	$('#sendBtn').click(function() {
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
    		      AccessControlAllowOrigin : "*", 
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
        if (authCode === userCode) {
          alert("인증 성공!");
        } else {
          alert("인증 실패!");
        }
      });
    });
  </script>
</body>
</html>