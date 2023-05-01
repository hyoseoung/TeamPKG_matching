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
            <a href="../Title/TitleMain.jsp">Match <em>Get It!</em></a>
        </div>
        <nav class="header__menu" style="width: 55%">
            <ul>
                <li><a href="../Board/List.jsp">Board</a></li>
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
<div class="card__wrap">
   <h2 >문의사항</h2>
</div>
   <!-- 검색 -->
   <form method="get">
      <table border="1" width="90%">
         <tr align="center">
            <td >
               <select name="searchType">
                  <option value="title" 
                     <c:if test="${map.searchType=='title'}">selected</c:if>>제목
                  </option>
                  <option value="content" 
                     <c:if test="${map.searchType=='content'}">selected</c:if>>내용
                  </option>
               </select>
               <input type="search" name="searchStr" value="${map.searchStr}"/>
               <input type="submit" value="검색"/>
            </td>
         </tr>
      </table>
   </form>
   <!-- 목록 -->
   <table border="1" width="90%">
      <tr align="center">
         <th width="5%">번호</th>
         <th width="30%">제목</th>
         <th>작성자</th>
         <th width="10%">조회수</th>
         <th>작성일</th>
         <th>첨부파일</th>
      </tr>
<c:choose>
   <c:when test="${ empty boardList }">
      <tr>
         <td colspan="6" align="center" height="50%">등록된 게시물이 없습니다.</td>
      </tr>
      </c:when>
   <c:otherwise>
      <c:forEach items="${boardList }" var="list" varStatus="stat">
      <tr align="center">
         <td>${map.totalCount-((map.pageNum-1)*map.pageSize)-stat.index}</td>
         <td align="center">
            <a href="../m2board/view.do?idx=${list.idx}">${list.title}</a>
         </td>
         <td>${list.name}</td>
         <td>${list.visitcount}</td>
         <td>${list.postdate}</td>
         <td>
         <c:if test="${not empty list.ofile}">
            <a href="../m2board/download.do?ofile=${list.ofile}&nfile=${list.nfile}&idx=${list.idx}">[${list.ofile}]</a>
         </c:if>
      </tr>
      </c:forEach>
   </c:otherwise>
</c:choose>
   </table>
   <!-- 하단 메뉴(페이징 글쓰기) -->
   <table border="1" width="90%">
      <tr align="center">
         <td>
            ${map.pagingStr}
         </td>
         <td width="100">
         <c:if test="${empty dto}" >
         <span>로그인이 필요합니다</span>
         </c:if>
         <c:if test="${not empty dto}">
            <button type="button" onclick="location.href='../m2board/write.do';">
               글쓰기
            </button>

         </c:if>
         </td>
      </tr>
   </table>
</body>
</html>