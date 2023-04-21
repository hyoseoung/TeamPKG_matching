<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 기본정보 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	function emailDuplCheck() {
		var email = $("input[name='email']").val();
		var data="";
		$.ajax({
			url: "../SignUp/EmailCheckController.do",
			data: { "value": email},
			type: "post",
			success: function(result) {
				data=result;
				if(data =="true") {
					alert("사용 가능한 이메일입니다.");
					$("input[name='email']").attr('readonly', true);
				} else if(data =="false"){
				}else alert("서버 오류가 발생하였습니다.");
			},
			error: function() {
				alert("서버 오류가 발생하였습니다.");
			}
		});
	};
	
	const hypenTel = (target) => {
		 target.value = target.value
		   .replace(/[^0-9]/g, '')
		   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
	

</script>
<style type="text/css">
	div{
		
		line-height: 30px;
	}
	botton:hover {
		transition: 0.7s;
		background-color:#002ead;
	}
	#button{
		border: 1px solid green;
		background-color: rgba(0,0,0,0);
		color: green;
		padding: 3px;
		margin-left: 15px;
	}
	#button:hover {
		background-color: rgba(0,200,0,0.5);
		box-shadow: 0px 0px 0.5px 0.5px rgb(0,0,0);
	}
	#button:active {
      transform: scale(0.98);
      box-shadow: 3px 2px 22px 1px rgba(0, 0, 0, 0.24);
    }
     input[type="text"], input[type="email"],input[type="password"] {
      padding: 5px;
      margin: 5px 0;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
      
   }
</style>
</head>
<body>
	<h2>Sign Up</h2>
	<h1 align="center" style="background-color: #ADFF2F;">기본 정보 입력</h1> <br><br>
	<div style="float: left; text-align: right;width: 40%; margin-right: 20px;line-height: 36px ">
		이메일 <br>
		비밀번호 <br>
		이름 <br>
		생년월일 <br>
		전화번호 <br>
		성별 <br>
	</div>
	<div style="float: left; text-align: left; margin-left: 5px; width: 40%">
		<form action="../SignUp/SignUpController.do" method="get">
			<input type="email" name="email" size="20" id="email" required />
			<input type="button" value="중복 확인" onclick="emailDuplCheck()"> <br>
			<input type="password" name="password" placeholder="8자리 이상 입력해주세요." pattern="^([a-z0-9_]){6,50}$" required /> <br>
			<input type="text" name="name" size="10" required /> <br>
			<input type="date" name="birth" required /> <br>
			<input type="tel" name="pNum" class="tel" maxlength="13" placeholder="ex)010-1234-5678" oninput="hypenTel(this)" required /><br>
			<label>
                  <input type="radio" name="gender" value="남" />
                  <span>남</span>
            </label> 
            <label>
                  <input type="radio" name="gender" value="여" />
                  <span>여</span>
            </label>
            <br>
			<input type="submit" value="NEXT" id="button">
		</form>
	</div>
</body>
</html>







