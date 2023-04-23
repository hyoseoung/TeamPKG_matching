<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 회원 정보 수정을 나타내는 헤더 스타일 */
	.header {
		background-color: #5BB551;
		color: white;
		text-align: center;
	    padding: 10px;
	    
	}
	/* 입력 폼을 감싸는 div 스타일 */
	.form-container {
		margin: 50px auto;
		width: 50%;
		padding: 20px;
		border: 1px solid #ccc;
		border-radius: 10px;
	}
	/* input 스타일 */
	input[type="text"], input[type="password"] {
	  width: 100%;
	  padding: 10px;
	  margin: 10px 0;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	  box-sizing: border-box;
	}
	
</style>	
</head>
<body>
<div class="header">
    	<h1>회원 정보 수정</h1>
</div>
<div class="form-container">
    	<form>
        	<label for="email">이메일:</label>
        	<input type="text" id="email" name="email" value="" readonly><br>
        	<label for="password">비밀번호:</label>
        	<input type="password" id="password" name="password" placeholder="비밀번호"><br>
	        <input type="submit" value="계정 인증 확인"/>
  		</form>
    </div>
</body>
</html>