<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
	h2{text-align:center; margin-top:100px;}
</style>
</head>
<body>
	<h2>비밀번호 찾기</h2>
	<h5><label for="id">이메일</label></h5>
			<input type="text" name="id1" class="input"> @
			<input type="text" name="id2" class="input"><br>
			<button onclick="goSelect()">입력</button>
			
<script>
	function goSelect(){
		if(session.getAttribute("memberId")!=null){
			window.location.href="FindPwSelect.jsp"
		}else{
			alert("아이디가 없습니다."); //<=임시작성   alertfunction 이용할예정 
		}
	}
</script>
</body>
</html>