<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료 게시판</title>
<link rel="stylesheet" href="../css/Board.css" type="text/css">
</head>
<header id="headerType" class="header__wrap nexon fix">
   <div class="header__inner">
        <div class="header__logo">
            <a href="#">Match <em>Get It!</em></a>
        </div>
        <nav class="header__menu" style="width: 55%">
            <ul>
                <li><a href="../Board/List.jsp">Board</a></li>
                <li><a href="#">Challenger</a></li>
            </ul>
        </nav>
     
   </div>
</header>
<body>
	<h2>비밀번호 검증</h2>
	<form action="../board/pass.do" method="post" name="writeForm">
		<input type="hidden" name="idx" value="${param.idx}" />
		<input type="hidden" name="mode" value="${param.mode}" />
		<table border="1" width="90%">
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="pass" style="width:100px;" required/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">검증하기</button>
					<button type="reset">초기화</button>
					<button type="button" onclick="location.href='../board/list.do';">
						목록 돌아가기
					</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>