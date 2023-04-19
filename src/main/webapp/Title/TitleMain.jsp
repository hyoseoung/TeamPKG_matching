<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>매칭 서비스</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<style type="text/css">
header {
	padding: 50px;
	background-color: #5BB551;
	color: white;
	text-align: center;
	    
}
a {
  display: block;
  text-align: center;
  margin: .25rem;
  padding: .5rem 1rem;
  text-decoration: none;
  font-weight: bold;
  color: white;
  background: teal;
  float: right;
}

main {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}
div{	
	line-height: 30px;
}
.calendar {
	width: 30%;
}

.time-select {
	margin-bottom: 30px;
}

.attendees {
	margin-bottom: 20px;
}
.login-section{
margin-bottom: 30px
}
 .main-view{
      margin:  auto;
      margin-bottom: 20px;
      margin-top: 50px;
    text-align: center;
}
.main-view{
height:500px;
overflow:hidden; 
margin-bottom: 20px
}

.main-view ul{
width:calc(100% * 3);
display:flex;
animation:slide 13s infinite;} /* slide를 13초동안 진행하며 무한반복 함 */

.main-view li{
width:calc(100% / 3);
height:300px;
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
.time-select{
	style="float: left"; 
	text-align: left;
	
}
.attendees{
	text-align: right;
}

</style>


</head>
<body>
<form action="../servlet/title.do" method="post" name="titleForm">
<header class="login-section" style="inline">
	<div>
		<% if (session.getAttribute("userId") == null) { %>
    	<a href="../Login/LoginForm1.jsp">로그인</a>
    	<a href="../SignUp/SignUp.jsp">회원가입</a>
  		<% } else { %>
    	<span><%= session.getAttribute("userId") %>님</span>
    	<a href="logout.jsp">로그아웃</a>
    	<a href="changeMemberckeck1.01.jsp">개인정보 변경</a>
  		<% } %>	
	</div>
</header>
<main>
  <div class = "container">
       <div class="main-view">
          <ul>
            <li><img src="./img/i13493601463.png " width="35%" /></li>
            <li><img src="./img/i15009557230.jpg"width="70%"/></li>
            <li><img src="./img/i15452929240.jpg"width="50%"/></li>
          </ul>
        </div>
 	</div>

	<section class="calendar">
		<form>
			<div class="time-select">
				<label for="Datetime">시간대 선택</label>	
        		<input type="date" id="Datetime" name="Date" value="" ><br>
				<select id="Datetime">
					<option value="10~11">오전 10시~오전 11시</option>
					<option value="11~12">오전 11시~오후 12시</option>
					<option value="12~13">오후 12시~오후 1시</option>
					<option value="13~14">오전 1시~오후 2시</option>
					<option value="14">오후 2시~오후 3시</option>
					<option value="15">오후 3시~오후 4시</option>
					<option value="16">오후 4시~오후 5시</option>
					<option value="17">오후 5시~오후 6시</option>
					<option value="18">오후 6시~오후 7시</option>
					<option value="19">오후 7시~오후 8시</option>
					<option value="20">오후 8시~오후 9시</option>
					<option value="21">오후 9시~오후 10시</option>
					<option value="22">오후 10시~오후 11시</option>
					<option value="23">오후 11시~오후 12시</option>
				</select>
			<div class="attendees">
				<label for="attendee-count">참여 인원</label>
				<input type="number" id="attendee-count" min="1" max="6" value="1">
				<p id="selected-attendee"></p>
			</div>
				<p id="selected-time"></p>
			</div>
			<button type="submit" id="start-matching" onclick="startMatching">매칭 시작</button>
		</form>
	</section>
</main>
	<script src="script.js">
	function startMatching() {
		 // 계정 정보를 받아옵니다.
		  var id = "";
		  var pw = "";

		  // 로그인 여부를 확인합니다.
		  if (checkLogin(id, pw)) {
		    window.location.href = "../Maching/machingwaitpage.jsp";
		  } else {
		    // 로그인하지 않은 경우 로그인 페이지로 이동합니다.
		    window.location.href = "../Login/LoginForm1.jsp";
		  }
		}
	</script>
</form>
</body>
</html>