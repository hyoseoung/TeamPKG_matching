<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	body {
		text-align: center;
	}
</style>
<script>
	<%--
	const loginEmail = document.querySelector('#login_email');
	const loginPw = document.querySelector('#login_pw');
	const loginBtn = document.querySelector('#login_btn');
	const loginBtn2 = document.querySelector('#login_btn2');
	
	function checkemail(){
		var email = document.querySelector('#login_email').value;
		var regEmail= /^[A-z0-9]+@[A-z]{2,20}+\.[a-z]{2,3}$/;
			if(regEmail.test(email) == false) {
		    	alert("E-mail 형식을 확인하세요.");
			}else if(loginEmail.value.length == 0){
				alert("E-mail을 입력하세요.");
			}
		}
	--%>
	
	<%--
	const email = document.querySelector('#login_email');
	const pass = document.querySelector('#login_pw');
	const loginBtn1 = document.querySelector('#login_btn1');
	const loginBtn2 = document.querySelector('#login_btn2');	
	--%>
	
		$('#loginBtn1').on("click", function() {
			var email = $('#loginEmail').val();
			var regEmail= /^[A-z0-9]+@[A-z]{2,20}+\.[a-z]{2,3}$/;
			var pass = $('#loginPass').val();
			
				if(regEmail.test(email) == false){
					alert("E-mail 형식을 확인하세요.");
				}else if(email.length == 0){
					alert("E-mail을 입력하세요.");
				}else if(pass.length == 0){
					alert("비밀번호를 입력하세요.");
				}else{
					
				$.ajax({
					url:"/member/check",
					data:{"loginEmail":email,
						  "loginPass":pass
						  },
					type:"get",
					success:function(result){
						if(result == 0){
							alert("계정이 존재하지 않습니다.")
	 					    $('#loginEmail').val('');
	 					    $('#loginPass').val('');
						}else if(result == -1){
							alert("비밀번호가 일치하지 않습니다.");
							$('#loginPass').val('');
						}else if (result == 1) {
					        alert("${name}님 로그인 하였습니다"); //name 변수선언 안됨.
					        moveToMain();
					    }
					},
					error:function(){
						alert("서버 연결 실패.");
					}
				});
			}
		});
		

	function moveToMain() {
		location.replace("./main.html");
	}

	loginId.addEventListener('keyup', logerr);
	loginPw.addEventListener('keyup', logerr);
	loginBtn.addEventListener('click', moveToMain);
	loginBtn2.addEventListener('click', moveToMain);
</script>
</head>
<body>
	<h1>로고, 이름</h1>
	<form action="" class="loginForm" method="post">
		<div>
			<label> E-mail : <input id="loginEmail" class="login_text"
				type="email" name="user_email" placeholder="이메일 입력" />
			</label><br><br> 
			<label> Password : <input id="loginPass" class="login_text" 
			type="password" name="user_pass" placeholder="비밀번호 입력" />
			</label><br>
		</div><br>
		
		<div class="links">
			<a href="">회원가입</a>&nbsp; 
			<a>|</a>&nbsp; 
			<a href="">ID 찾기</a>&nbsp; 
			<a href="">PW 찾기</a>
		</div><br>
		
		<button id="loginBtn1" class="" type="submit" onclick="login();" value="">로그인</button><br><br>
		<button id="loginBtn2" class="" type="submit" onclick="naverlogin();">네이버 간편 로그인</button>
	</form>
</body>
</html>
