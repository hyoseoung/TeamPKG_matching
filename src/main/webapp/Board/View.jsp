<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료 게시판</title>
<link rel="stylesheet" href="css/MainPage.css" type="text/css">
</head>
<body>
<header id="headerType" class="header__wrap nexon fix">
	<div class="header__inner">
        <div class="header__logo">
            <a href="../Title/TitleMain.jsp">Plap <em>football</em></a>
        </div>
        <nav class="header__menu" style="width: 55%">
            <ul>
                <li><a href="#">Board</a></li>
                <li><a href="#">Middle Class</a></li>
                <li><a href="#">Challenger</a></li>
            </ul>
        </nav>
		<div class="header__member">
			<c:if test="${empty dto and empty admin}" >
			<span>로그인이 필요합니다</span>
	    		<a id="login_btn" href="../Login/LoginForm.jsp">로그인</a>
	    		<a id="login_btn" href="../SignUp/SignUp.jsp">회원가입</a>
	    	</c:if>
	    	<c:if test="${not empty dto}">
	    		<span>${dto.memberName}님</span>
	    		<a href="../Logout/LogoutController.do">로그아웃</a>
	    		<a href="../CheckAuth/changeMemberckeck.jsp">개인정보 변경</a>
	    	</c:if>	
	    	<c:if test="${not empty admin}">
	    		<span>${admin.memberName}님</span>
	    		<a href="../Logout/LogoutController.do">로그아웃</a>
	    		<a href="../MatchGetIt/AdminPage.do">관리자 페이지</a>
	    	</c:if>	
		</div>
	</div>
</header>
   <h2>게시판 상세보기</h2>
   <table border="1" width="90%">
      <colgroup>
         <col width="15%"/><col width="35%"/><col width="15%"/>
         <col width="*"/>
      </colgroup>
      <tr>
         <td>번호</td><td>${dto.idx}</td>
         <td>작성자</td><td>${dto.name}</td>
      </tr>
      <tr>
         <td>작성일</td><td>${dto.postdate}</td>
         <td>조회수</td><td>${dto.visitcount}</td>
      </tr>
      <tr>
         <td>제목</td>
         <td colspan="3">${dto.title}</td>
      </tr>
      <tr>
         <td>내용</td>
         <td colspan="3">${dto.content}</td>
      </tr>
      <tr>
         <td>첨부파일</td>
         <td>
            <c:if test="${not empty dto.ofile}">
            ${dto.ofile}
            <a href="../m2board/download.do?ofile=${dto.ofile}&nfile=${dto.nfile}
               &idx=${dto.idx}">[다운로드]</a>
            <button type="button" id="downbtn">다운로드</button>
            </c:if>
         </td>
         <td>다운로드수</td>
         <td id="dcount">${dto.downcount}</td>
      </tr>
      <tr>
         <td colspan="4" align="center">
            <button type="button" 
               onclick="location.href='../m2board/pass.do?mode=edit&idx=${param.idx}';">
               수정하기
            </button>
            <button type="button" 
               onclick="location.href='../m2board/pass.do?mode=delete&idx=${param.idx}';">
               삭제하기
            </button>
            <button type="button" 
               onclick="location.href='../m2board/list.do';">
               목록 바로가기
            </button>
         </td>
   </table>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script> 
<script>
	$('#downbtn').on("click",(e)=>{
		e.preventDefault();
		console.log('btn click');
		$.ajax({
			type:'post',
			async:false,
			url:'/package/boardCon/download.do',
			dataType:'text',
			data:{idx:'${dto.idx}'},
			success: function(data,textStatus){
				console.log(data);
				$('#dcount').text(data);
			},
			error:function(data,textStatus){
				console.log('error',data,textStatus);
			}
		})
	});
</script>
</body>
</html>