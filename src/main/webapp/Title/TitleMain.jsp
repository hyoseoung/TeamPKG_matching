<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>매칭 서비스</title>
	<link rel="stylesheet" href="css/MainPage.css" type="text/css">
<style type="text/css">
	.main-view{
		margin:  auto;
		margin-bottom: 20px;
		margin-top: 50px;
		text-align: conter;
		height: 50%;
		width: 50%;
		overflow: hidden;
 
		}
		.main-view ul{
		width:calc(100% * 5);
		display:flex;
		animation:slide 13s infinite; /* slide를 13초동안 진행하며 무한반복 함 */
		text-align: left;
		}
		.main-view img{
		width:100%;
		}
		
		.main-view li{
		width:calc(100% / 5);
		width:30%;
		height:25%;
		
		}
    
@keyframes slide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      100% {margin-left:0;}
    }
.calendar{
text-align: right;border-bottom-right-radius: 5px;
}
</style>


</head>
<body>
<form>
<header id="headerType" class="header__wrap nexon fix">
	<div class="header__inner">
        <div class="header__logo">
            <a href="#">Match <em>Get It!</em></a>
        </div>
        <nav class="header__menu" style="width: 55%">
            <ul>
                <li><a href="../Board/List.jsp">Board</a></li>
                <li><a href="#">Nocitice</a></li>
                <li><a href="#">Challenger</a></li>
            </ul>
        </nav>
		<div class="header__member">
			<c:if test="${empty dto}" >
			<span>로그인이 필요합니다</span>
	    		<a id="login_btn" href="../Login/LoginForm.jsp">로그인</a>
	    		<a id="login_btn" href="../SignUp/SignUp.jsp">회원가입</a>
	    	</c:if>
	    	<c:if test="${not empty dto}">
	    		<span>${dto.memberName}님</span>
	    		<a href="../Logout/LogoutController.do">로그아웃</a>
	    		<a href="../CheckAuth/changeMemberckeck.jsp">개인정보 변경</a>
	    	</c:if>	
		</div>
	</div>
</header>


<div class="matching">

	<section  class="card__wrap section nex" >
		<h2>풋살 매칭 시스템</h2>
	 	<p>풋살 모여서 시작하기 어려우신 분들을 위한! 서비스<br></p>
	</section>
	
	
	
	
	<section class="calendar"  style="font-size: 20px; margin: 50px 60px;">
			<div class="time-select" style="margin-top: 2px" >
				<label for="Datetime">시간대 선택</label>	
        		<input type="date" id="Datetime" name="Date" value="" ><br>
				<select id="Datetime">
					<option value="A">오전 6시~오전 8시</option>
					<option value="B">오전 8시~오전 10시</option>
					<option value="C">오후 10시~오후 12시</option>
					<option value="D">오후 12시~오후 2시</option>
					<option value="E">오후 2시~오후 4시</option>
					<option value="F">오후 4시~오후 6시</option>
					<option value="G">오후 6시~오후 8시</option>
					<option value="H">오후 8시~오후 10시</option>
					<option value="I">오후 10시~오전 12시</option>
				</select>
				<div class="attendees" style="font-size: 20px;">
					<label for="attendee-count" >참여 인원</label>
					<input type="number" id="attendee-count" min="1" max="6" value="1">
				</div>
			<button type="submit" onclick="startMatching" >매칭 시작</button>
	        </div>
	       <div class="main-view">
	          <ul >
	            <li><img src="../img/backgroundImage.jpg " width="100%" /></li>
	            <li><img src="../img/google.png" width="100%"/></li>
	            <li><img src="../img/soccer.jpg" width="100%"/></li>
	            <li><img src="../img/soccer2.jpg" width="100%"/></li>
	            <li><img src="../img/soccer3.jpg" width="100%"/></li>
	          </ul><!-- 35 70 50 -->
			</div>
	</section>
	

	
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
	<script src="script.js">
	function startMatching() {
		 // 계정 정보를 받아옵니다.
		  var id = "";
		  var pw = "";

		  // 로그인 여부를 확인합니다.
		  if (sessionStorage.getItem("dto")) {
		    window.location.href = "../Matching/matchingpage.jsp";
		  } else {
		    // 로그인하지 않은 경우 로그인 페이지로 이동합니다.
		    window.location.href = "../Login/LoginForm1.jsp";
		  }
		}
	</script>
</form>
</body>
</html>