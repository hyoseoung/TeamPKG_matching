<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>배치완료 수락 대기 페이지</title>
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
				<img src="../Title/img/i15009557230.jpg" alt="팀 이미지">
			</div>
			<!-- 팀을 찾기 위해 매칭 중 -->
			<h2>다른 플레이어의 수락을 대기중입니다.</h2>
			<!-- 현재 대기시간 -->
			<p>현재 수락한 인원을 나타내면 좋을 칸</p>
		</div>
	</main>
	
	<div style="display: flex; justify-content: center; align-items: center; width: 100%;">
		<!-- 매칭 취소 버튼 -->
		<button type="submit" style="display: flex; justify-content: center; align-items: center;" class=bu onclick='cancell()'>매칭 거절</button>
	</div>
	<div class="bottom">
   	<form>
   		<input type="submit" onclick="#" id="문의사항" value="문의사항">
   		<input type="submit" onclick="#" id="고객센터" value="고객센터">
   		<input type="submit" onclick="#" id="챗봇" value="챗봇안내">
   	</form>
</div>
<script>
function cancell() {
	if (confirm("매칭을 거절하시겠습니까?")) {
	    window.location.href = "../Title/TitleMain.jsp";
	}
}
</script>
</body>
</html>