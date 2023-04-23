<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<h2>수정하기</h2>
	<form action="../m2board/edit.do" method="post" name="writeForm"
		enctype="multipart/form-data">
		<input type="hidden" name="idx" value="${dto.idx}" />
		<input type="hidden" name="preOfile" value="${dto.ofile}" />
		<input type="hidden" name="preNfile" value="${dto.nfile}" />
	<table border="1" width="90%">
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="name" style="width: 150px;" 
						value="${dto.name}"/>
				</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" style="width: 90px;" 
						value="${dto.title}" />
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" style="width: 90%;height: 100px;">${dto.content }</textarea>
				</td>
			</tr>
			<tr>
				<td>첨부 파일</td>
				<td>
					<input type="file" name="ofile" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성완료</button>
					<button type="reset">초기화</button>
					<button type="button" onclick="location.href='../board/list.do';">
						목록 바로가기
					</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>