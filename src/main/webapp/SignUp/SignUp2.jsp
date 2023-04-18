<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 정보 입력</title>
<style>
	#button {
		border: 1px solid green;
		background-color: green;
		color: white;
		width: 40px;
		height: 40px;
		font-size: 20px;
		text-align: center;
	}
	#button:hover {
		background-color: rgba(0,200,0,0.5);
		box-shadow: 0px 0px 0.5px 0.5px rgb(0,0,0);
	}
	#button:active {
      transform: scale(0.98);
      box-shadow: 3px 2px 22px 1px rgba(0, 0, 0, 0.24);
    }
    #submit {
		border: none;
		width: 200px;
		height: 40px;
		font-size: 20px;
		text-align: center;
	}
	#submit:hover {
		background-color: rgba(0,400,0,0.5);
		box-shadow: 0px 0px 0.5px 0.5px rgb(0,0,0);
		border: none;
	}
	#submit:active {
    	transform: scale(0.98);
    	box-shadow: 3px 2px 22px 1px rgba(0, 0, 0, 0.24);
    }
</style>
</head>
<body>
	<h2>Sign Up</h2>
	<h1 align="center" style="background-color: #ADFF2F;">상세 정보 입력</h1> <br>
	
	<div align="center">
		<h2>숙련도</h2>
		<h5>본인의 실력을 선택해주세요.</h5> <br>
		<input type="button" value="상" id="button"> <div style="width: 4px;display: inline-block;"></div>
		<input type="button" value="중" id="button"> <div style="width: 4px;display: inline-block;"></div>
		<input type="button" value="하" id="button">
		<br>
	</div>
	<br><br><br>
	<div>
		<input type="submit" value="회원가입완료" id="submit" style="margin-left: 60%" >
	</div>
</body>
</html>

