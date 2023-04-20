<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>매칭 실패 페이지</title>
<style>
/* 인증 확인 버튼 스타일 */
	button[type="submit"] {
		background-color: #5BB551;
		color: white;
		padding: 10px 20px;
		border: none;
		border-radius: 4px;
		cursor: pointer;
		float: inherit;
	}
	/* 인증 확인 버튼 스타일 */
	button[type="submit"]:hover {
		background-color: #2c81ba;
		margin: 5px 0;
    }
   	.header {
	background-color: #5BB551;
	color: white;
	text-align: center;
    padding: 30px;
	    
	}
	p{
	font-size: large;
	}
	img{
	
	}
	.bottom {
		background-color: #5BB551;
		color: white;
		text-align: center;
		top: 80%;
	    padding: 10px;
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
	/* 인증 확인 버튼 스타일 */
	input[type="submit"] {
		background-color: #5BB551;
		color: white;
		padding: 10px 20px;
		border: none;
		border-radius: 4px;
		cursor: pointer;
		float: right;
	}
	input[type="submit"]:hover {
		background-color: #2c81ba;
		margin: 5px 0;
    }
</style>	
</head>
<body>
	<header>
		<!-- 로고 이미지 -->
		<img src="logo.png" alt="로고 이미지">
		<div class="header">
		<!-- 현재 매칭 중인 팀원 수 -->
		<p align="center">현재매칭중인 팀원수: <%= request.getAttribute("teamCount") %></p>
		</div>
	</header>

	<main>
		<!-- 중앙에 큰 원안에 이미지 삽입 -->
		<div style="text-align: center;">
			<div style="display: inline-block; border: 5px solid black; border-radius: 50%; padding: 20px;">
				<img src="../img/i15009557230.jpg" alt="팀 이미지">
			</div>
			<!-- 팀을 찾지 못하거나 예외상황발생 -->
			<h2>해당 지역에서의 매칭이 실패하였습니다.<br>
				재 매칭을 원하신다면 다시 시도를 클릭<br>
				조건을 변경하여 매칭을 워하신다면 
				돌아가기를 클릭</h2>

		</div>
	</main>
	
	<div style="text-align: center;">
  		<button type="submit" style="display: inline-block; margin-right: 30%;" onclick="remaching()">다시 시도</button>
  		<button type="submit" style="display: inline-block;" onclick="returnpage()">돌아가기</button>
	</div>
	
	<div class="bottom">
   	<form>
   		<input type="submit" onclick="#" id="문의사항" value="문의사항">
   		<input type="submit" onclick="#" id="고객센터" value="고객센터">
   		<input type="submit" onclick="#" id="챗봇" value="챗봇안내">
   	</form>
</div>
<script>
function remaching() {
	if (confirm("매칭을 다시 시도하시겠습니까?")) {
	    window.location.href = "./machingpage.jsp";
	}
}
function returnpage() {
	if (confirm("메인화면으로 돌아가시겠습니까?")) {
	    window.location.href = "../Title/TitleMain.jsp";
	}
}
</script>
</body>
</html>