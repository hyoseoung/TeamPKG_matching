<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title> 
</head>
<body>
    <h3>Sign up</h3>
    <h2>아이디 찾기</h2>
    <% if(session.getAttribute("phoneNumber")==null && session.getAttribute("MemberName")==null ) %>
        <form action="FindId.jsp" method="post" name="Find_id">
            이름:<input type="text" id="membername" required/><br>
            전화번호:<input type="text" id="phoneNumer" required/><br>
            인증번호:<input type="text" id="certNum" required/><br>
            <input type="submit" value="확인"/>
            <a href="FindPwSelect.jsp">비밀번호찾기</a>
        	<button type="button">확인</button>
        </form>
		<% }else{ //아이디 찾은 상태 %>
			고객님의 아이디는 .. 입니다.
		<% } %>
</body>
</html>