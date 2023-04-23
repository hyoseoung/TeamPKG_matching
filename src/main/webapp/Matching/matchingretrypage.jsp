<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>매칭 실패 페이지</title>
<link rel="stylesheet" href="../css/MainPage.css" type="text/css">

</head>
<body>
<header id="headerType" class="header__wrap nexon fix">
	<div class="header__inner">
        <div class="header__logo">
            <a href="#">Match <em>Get It!</em></a>
        </div>
        <nav class="header__menu" style="width: 55%">
            <ul>
                <li><a href="../Board/List.jsp">Board</a></li>
                <li><a href="#">Notice Board</a></li>
                <li><a href="#">Challenger</a></li>
            </ul>
        </nav>
		<div class="header__member">
	    		<span>${dto.memberName}님</span>
	    		<a href="../Logout/LogoutController.do">로그아웃</a>
	    		<a href="../CheckAuth/changeMemberckeck.jsp">개인정보 변경</a>
		</div>
	</div>
</header>
		<p align="center">현재매칭중인 팀원수: <%= request.getAttribute("teamCount") %></p>


	<main>
		<!-- 중앙에 큰 원안에 이미지 삽입 -->
		<div style="text-align: center;">
			<div style="display: inline-block; border: none; border-radius: 50%; padding: 20px;">
	<img src="../img/soccer2.jpg" style="width: 30%;" alt="팀 이미지">
</div>
			<!-- 팀을 찾지 못하거나 예외상황발생 -->
			<h2>해당 지역에서의 매칭이 실패하였습니다.<br>
				재 매칭을 원하신다면 다시 시도를 클릭<br>
				조건을 변경하여 매칭을 원하신다면 
				돌아가기를 클릭</h2>

		</div>
	</main>
	
	<div style="text-align: center;">
  		<button type="submit" style="display: inline-block; margin-right: 30%;" onclick="remaching()">다시 시도</button>
  		<button type="submit" style="display: inline-block;" onclick="returnpage()">돌아가기</button>
	</div>
<button id="chat">고객 문의</button>
<footer id="footerType" class="footer__wrap section gmarket gray">
    <h2 class="ir_so">푸터 영역</h2>
    <div class="footer__inner container">
        <div class="footer__menu">
            <div>
                <h3>Package Team</h3>
            </div>
            <div>
                <h3>Team Leader</h3>
                <ul>
                    <li><a href="#">이효성</a></li>
                </ul>
            </div>
            <div>
                <h3>Other IT Majors</h3>
                <ul>
                    <li><a href="#">공승환</a></li>
                    <li><a href="#">임유진</a></li>
                </ul>
            </div>
            <div>
                <h3>Team members</h3>
                <ul>                        
                    <li><a href="#">김선명</a></li>
                    <li><a href="#">김종호</a></li>
                    <li><a href="#">김준현</a></li>
                    <li><a href="#">양선영</a></li>
                </ul>
            </div>
        </div>
        <address class="footer__right">
            ©2023 Package Team!
        </address>
    </div>
</footer>



<script>
function remaching() {
	if (confirm("매칭을 다시 시도하시겠습니까?")) {
	    window.location.href = "./matchingpage.jsp";
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