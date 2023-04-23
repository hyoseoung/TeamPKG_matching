<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫번째 페이지</title>
	<link rel="stylesheet" href="../css/FirstPage.css" type="text/css">
</head>
<body>
	<header id="headerType" class="header__wrap nexon fix">
       	<div class="header__inner">
            <div class="header__logo">
                <a href="#">Plap <em>football</em></a>
            </div>
            <nav class="header__menu">
                <ul>
                    <li><a href="#">Starter</a></li>
                    <li><a href="#">Middle Class</a></li>
                    <li><a href="#">Challenger</a></li>
                </ul>
            </nav>
            <div class="header__member">
                <a id="login_btn" href="LoginPage.jsp">로그인</a>
            </div>
        </div>
    </header>
    <section id="cardType" class="card__wrap section nex">
        <h2>풋살 매칭 시스템</h2>
        <p>
            풋살 모여서 시작하기 어려우신 분들을 위한! 서비스<br>
        </p>
        <div class="card__inner container">
            <article class="card" onclick="window.open('http://naver.com');">
                <figure class="card__header">
                    <img class="img" src="./image/soccer.jpg" alt="이미지가 경로에 존재하지 않습니다">
                </figure>
                <div class="card__body">
                    <h3 class="title">Starter</h3>
                    <p class="desc">늅늅이도 대환영!</p>
                    <a class="btn" href="#">
                        더 자세히 보기
                    </a>
                </div>
            </article>
            <article class="card" onclick="window.open('http://kakaocorp.com');">
                <figure class="card__header">
                    <img class="img" src="./image/soccer2.jpg" alt="이미지가 경로에 존재하지 않습니다">
                </figure>
                <div class="card__body">
                    <h3 class="title">MiddleClass</h3>
                    <p class="desc">중급 숙련도 분들 신청!</p>
                    <a class="btn" href="#">
                        더 자세히 보기
                    </a>
                </div>
            </article>
            <article class="card" onclick="window.open('http://daum.net');">
                <figure class="card__header">
                    <img class="img" src="./image/soccer3.jpg" alt="이미지가 경로에 존재하지 않습니다">
                </figure>
                <div class="card__body">
                    <h3 class="title">Challenger</h3>
                    <p class="desc">풋살하면 내가 갑이다! 하시는 분들만!</p>
                    <a class="btn" href="#">
                        더 자세히 보기
                    </a>
                </div>
            </article>
        </div>
    </section>
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
</body>
</html>