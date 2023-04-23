<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매칭 페이지</title>
<link rel="stylesheet" href="../css/MainPage.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<header id="headerType" class="header__wrap nexon fix">
		<div class="header__inner">
			<div class="header__logo">
				<a href="#">Match <em>Get It!</em></a>
			</div>
			<nav class="header__menu" style="width: 55%">
				<ul>
					<li><a href="../Board/List.jsp">Notice Board</a></li>
				</ul>
			</nav>
			<div class="header__member">
				<span>${dto.memberName}님</span> <a
					href="../Logout/LogoutController.do">로그아웃</a> <a
					href="../CheckAuth/changeMemberckeck.jsp">개인정보 변경</a>
			</div>
		</div>
	</header>
	<main>
		<!-- 중앙에 큰 원안에 이미지 삽입 -->
		<div style="text-align: center;">
			<div
				style="display: inline-block; border: none; border-radius: 50%; padding: 20px;">
				<img src="../img/soccer2.jpg" style="width: 30%;" alt="팀 이미지">
			</div>
			<!-- 팀을 찾기 위해 매칭 중 -->
			<p style="font-size: x-large;">팀을 찾기위해 매칭중</p>
			<!-- 현재 매칭 중인 팀원 수 -->
			<div>현재 매칭 중인 팀원 수: ${count}</div>
			<!-- 현재 대기시간 -->
			<div id="timer" style="font-size: x-large;"></div>
		</div>
	</main>

	<div style="display: flex; justify-content: center;">
		<!-- 매칭 취소 버튼 -->
		<button type="submit" style="" onclick='cancel();'>매칭 취소</button>
	</div>

	<button id="chat">고객 문의</button>
	<footer id="footerType" class="footer__wrap section gmarket gray">
		<h2 class="ir_so">푸터 영역</h2>
		<input type=hidden id="wtime" value="${time}"/>
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
			<address class="footer__right">©2023 Package Team!</address>
		</div>
	</footer>



	<script>
	function cancel() {
        if( confirm("매칭을 취소하시겠습니까?")) {
            window.location.href = "../Title/TitleMain.jsp";
        }
    }
    
    window.onload = function() {
        var startTime = new Date().getTime();
        var elapsedTime;
        var minutes;
        var seconds;
        var popupShown = false;
        var popupMessage = "30 분이 경과했습니다. 매칭 실패로인해 매칭을 다시 시도하시려면 다시 시도 버튼을 클릭해주세요.";
        var intervalId = setInterval(function() {
            var currentTime = new Date().getTime();
            elapsedTime = Math.floor((currentTime - startTime) / 1000);
            minutes = Math.floor(elapsedTime / 60);
            seconds = elapsedTime % 60;
            document.getElementById("timer").innerHTML = '현재 매칭 대기시간: ' + minutes + ' 분 ' + seconds + ' 초 경과';
            $.ajax({
                url: "../Matching/MatchingController.do",
                type: "post",
                success: function(count){
                    if(count == "success")location.href='../Matching/MatchingNextController.do?timeDetail=현재 매칭 대기시간: ' + minutes + ' 분 ' + seconds + ' 초 경과'+'&confirm='+((confirm('수락하시겠습니까?'))?'1':'0')+'&wtime='+document.getElementById('wtime').value;
                    //삼항 연산자로 confirm 처리
                },
                error: function() {
                    alert("서버 오류가 발생하였습니다.");
                }
            });
            
        }, 10000);
        
        setTimeout(function() {
            clearInterval(intervalId);
            window.location.href = "./matchingretrypage.jsp?time=" + minutes + "분 " + seconds + "초 소요"; //시간 초과의 경우
        }, 180000);
        }

</script>
</body>
</html>