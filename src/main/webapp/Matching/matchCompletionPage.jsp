<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>matching 성사 안내 page</title>
<link rel="stylesheet" href="../css/MatchingComplete.css" type="text/css">

</head>
<header id="headerType" class="header__wrap nexon fix">
   <div class="header__inner">
        <div class="header__logo">
            <a href="..Title/TitleMain.jsp">Match <em>Get It!</em></a>
        </div>
        <nav class="header__menu" style="width: 55%">
            <ul>
                <li><a href="../Board/List.jsp">Board</a></li>
                <li><a href="#">Challenger</a></li>
            </ul>
        </nav>
        <div class="header__member">
	    	<c:if test="${not empty dto}">
	    		<span>${dto.memberName}님</span>
	    		<a href="../Logout/LogoutController.do">로그아웃</a>
	    		<a href="../CheckAuth/changeMemberckeck.jsp">개인정보 변경</a>
	    	</c:if>	
		</div>
   </div>
</header>
<body>
<br><br><br><br>
	<div class="stadiumImg" >
        <input type="image" id="img" src="https://yeyak.seoul.go.kr/web/common/file/FileDown.do?file_id=1679631208027LRDRRHZ6LU46PKHWC538B40FV" >
    </div>

    <div class="matchInfoTop">
    	<h2>매치 안내</h2>
    </div>
	<div class="matchInfo" >
		<div class="leftmatchInfo">
			<p>매치 시간</p>
			<h2>14:00:00</h2>
			<p>매치 장소</p>
			<h2>플랩 스타디움 가산 마리오</h2>
			<h4></h4>
			<p>지도예정</p>
		</div>
		<div class="rightmatchInfo">
			<div class="rightmatchInfo" style="flex-direction: column;border: none;">
				<img id="teamImg" src="../img/blue.png" alt="이미지 없음">
				<ul style="list-style: none; text-align: left;">
					<c:forEach items="${listA}" var="teamA" varStatus="l">
					<li><c:if test="조건식">${teamA.memberName}</c:if>
					</c:forEach>
				</ul>
			</div>
			<h3>vs</h3>
			<div class="rightmatchInfo" style="flex-direction: column;border: none;">
				<img id="teamImg" src="../img/red.png" alt="이미지 없음">
				<ul style="list-style: none; text-align: left;">
					<c:forEach items="${listB}" var="teamB" varStatus="l">
					<li>${teamB.memberName}
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<br>
	<div class="secondInfo">
		<div class="leftInfo">
			<h2>구장 시설 안내</h2>
			<hr>
			<p>1. 공공시설 예약서비스 이용시 필수 준수사항  모든 서비스의 이용은 담당 기관의 규정에 따릅니다. 각 시설의 규정 및 허가조건을 반드시 준수하여야 합니다.각 관리기관의 시설물과 부대시설을 이용함에 있어 담당자들과 협의 후 사용합니다.각 관리기관의 사고 발생시 서울시청에서는 어떠한 책임도 지지않습니다.시설이용료 납부는 각 관리기관에서 규정에 준 합니다.본 사이트와 각 관리기관의 규정을 위반할시에는 시설이용 취소 및 시설이용 불허의 조치를 취할 수 있습니다.접수시간을 기준으로 브라우저에서 새로고침을 하면 변경된 정보를 볼 수 있습니다.2. 시설예약비회원일 경우에는 실명 확인을 통하여 사용하실 수 있으며 서울시 통합 회원에 가입 하시게 되면 서울시에서 제공하는 다양하고 많은 혜택을 받으실 수 있습니다.3. 상세내용 고척돔 실외체육시설(축구,풋살구장) - 개방시간 : 평일 및 휴일 06 ~ 22시 2시간 단위 이용 * 4.26(수), 실외체육시설 정기보수일 ※ ‘23년 5월 예약 접수는 4.20(목) 세부공지, 4.25(화) 10시 접수 예정 - 예약접수 : 3.27.(월) 10시 부터 접수(축구·풋살 동일) </p>
		</div>
		<div class="rightInfo">
			<h2>경기시 주의사항</h2> <hr>
			<ul>
				<li>모든 파울은 사이드라인에서 킥인 골키퍼에게 백패스 가능</li>
				<li>손으로는 잡으면 안돼요. 사람을 향한 태클 금지</li>
				<li>골키퍼와 휴식을 공평하게 돌아가면서 해요.</li>
				<li>서로 존중하고 격려하며 함께 즐겨요!</li>
			</ul>
		</div>
		<div class="rightInfo2">
			<h2>구장 정보</h2>
			<hr>
			<div>
				<p>전화번호</p>
				<h3>0507-1347-6508</h3>
				<p>구장 홈페이지</p>
				<h3><a href="https://yeyak.seoul.go.kr/web/reservation/selectReservView.do?rsv_svc_id=S230324131227240443">
				<p id="p7">홈페이지로 이동</p></a></h3>
			</div>
		</div>
	</div>
</body>
<button id="chat">고객 문의</button>
</html>