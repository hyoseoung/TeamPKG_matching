<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>배치완료 수락 대기 페이지</title>
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
	<main>
		<!-- 중앙에 큰 원안에 이미지 삽입 -->
		<div style="text-align: center;">
			<div style="display: inline-block; border: none; border-radius: 50%; padding: 20px;">
	<img src="../img/soccer2.jpg" style="width: 30%;" alt="팀 이미지">
</div>
			<!-- 팀을 찾기 위해 매칭 중 -->
			<h2>다른 플레이어의 수락을 대기중입니다.</h2>
			<!-- 수락한 인워들 값을 불러줄 공간 -->
			<p>현재 수락한 인원을 나타내면 좋을 칸</p>
			 <h1>매칭이 완료되었습니다!</h1>
   			 <p>매칭이 완료된 시간:${timeDetail}</p>
		</div>
	</main>
	
	<div style="display: flex; justify-content: center; align-items: center; width: 100%;">
		<!-- 매칭 취소 버튼 -->
		<button type="submit" style="display: flex; justify-content: center; align-items: center;" class=bu onclick='cancel()'>매칭 거절</button>
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
function cancel() {
	if (confirm("매칭을 거절하시겠습니까?")) {
	    window.location.href = "../Matching/MatchingNextController.do?confirm=0";
	}
}
window.onload = function() {
    var intervalId = setInterval(function() {
        $.ajax({
            url: "../Matching/MatchingWaitController.do",
            type: "post",
            async:true,
            success: function(count){
                if(count == "success")location.href='../Matching/MatchingFinalController.do';
            },
            error: function() {
                alert("서버 오류가 발생하였습니다.");
            }
        });
        
    }, 10000); 
    setTimeout(function() {
        clearInterval(intervalId);
        window.location.href = "./matchingretrypage.jsp?time=" + minutes + "분 " + seconds + "초 소요"; //시간 초과의 경우
    }, 120000);
    }
</script>
</body>
</html>