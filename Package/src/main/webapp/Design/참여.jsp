<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Second Page</title>
<style>
		
        @import url('https://webfontworld.github.io/NexonLv1Gothic/NexonLv1Gothic.css');
        
        .nex {
            font-family: "NexonLv1Gothic";
        }
        * {
            margin: 0;
            padding: 0;
        }
        body{
        	background-image:url('./Image/backgroundImage.')
        }
        a {
            text-decoration: none;
            color: #000;
        }
        li {
            list-style: none;
        }
        em {
            font-style: normal;
        }
        img {
            vertical-align: top;
        }
        .ir_so {
            overflow: hidden;
            position: absolute;
            width: 0;
            height: 0;
            line-height: 0;
            text-indent: -9999px;
        }
        .container {
            width: 1160px;
            margin: 0 auto;
            padding: 0 20px;
        }
        .section {
            padding: 120px 0;
        }
        .section > h2 {
            font-size: 50px;
            font-weight: 500;
            margin-bottom: 20px;
            line-height: 1;
            text-align: center;
        }
        .section > p {
            font-size: 22px;
            font-weight: 300;
            margin-bottom: 70px;
            line-height: 1.5;
            color: #777;
            text-align: center;
        }
	.header__inner {
            width: 100%;
            height: 70px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
            box-sizing: border-box;
            border-bottom: 1px solid #ccc;
        }
        .header__logo {
            font-size: 30px;
            font-weight: 700;
            text-transform: uppercase;
            width: 20%;
        }
        .header__logo em {
            font-size: 18px;
            font-weight: 400;
        }
        .header__menu {
            width: 60%;
            text-align: center;
        }
        .header__menu li {
            display: inline;
        }
        .header__menu li a {
            padding: 13px 30px;
            margin: 0 30px;
            transition: background-color 0.33s;
        }
        .header__menu li a:hover {
            background-color: #F1F1F1;
            border-radius: 5px;
        }
        .header__member {
            width: 20%;
            text-align: right;
        }
        .header__member a {
            font-size: 16px;
            border: 1px solid #000;
            padding: 10px 30px;
            border-radius: 50px;
        } 
</style>
</head>
<body>
	<header id="headerType" class="header__wrap nexon">
       	<div class="header__inner">
            <div class="header__logo">
                <a href="#">Flat <em>football</em></a>
            </div>
            <nav class="header__menu">
                <ul>
                    <li><a href="#">Starter</a></li>
                    <li><a href="#">Middle</a></li>
                    <li><a href="#">Challenger</a></li>
                </ul>
            </nav>
            <div class="header__member">
                <a href="#">로그인</a>
            </div>
        </div>
    </header>
</body>
</html>