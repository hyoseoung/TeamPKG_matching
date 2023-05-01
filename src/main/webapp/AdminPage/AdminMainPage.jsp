<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매치기릿 관리자 페이지</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/AdminPage/AdminHeader.css" type="text/css">
</head>

<body>
<header id="headerType" class="header__wrap nexon fix">
	<div class="header__inner">
		 <div class="header__logo">
			<a href="../Title/TitleMain.jsp">Match <em>Get It!</em></a>
		 </div>
		 <nav class="header__menu" style="width: 55%">
			<!-- 관리자 프로필 -->
		 	<ul>
				<li><a>관리자 페이지</a></li>
				<li><a>관리자 메뉴</a></li>
				<li><a href="../MatchGetIt/AdminPage.do">회원 정보</a></li>
			</ul>
		</nav>
		<div class="header__member">
			<c:if test="${not empty admin}">
	    		<span>${admin.memberName}님</span>
	    		<a href="../Logout/LogoutController.do">로그아웃</a>
   			</c:if>
		</div>
	</div>
</header>
	<h2></h2><br><br><br><br>
	
	<form method="get" style="padding-left: 20px">
	<div id="search">
		<div style="display: flex; justify-content: flex-end; margin-right: 25%;">
			<select name="searchType">
				<option value="M_id">회원 번호</option>
				<option value="M_name">회원 이름</option>
				<option value="nickname">닉네임</option>
				<option value="email">이메일 주소</option>
				<option value="P_number">연락처</option>
				<option value="reg_date">가입일</option>
				<%-- <option value="">최근 접속일</option>
				<option value="">계정 정지 여부</option> --%>
			</select>
			<input type="search" name="searchValue" value="${map.searchValue}" />
			<input type="submit" value="검색" />
	</div>
		<br>
		<div style="display: flex; justify-content: flex-end; margin-right: 25%;">
			<select name="pageSize">
				<option value="">한 페이지에 보여줄 회원 수</option>
				<option>10</option>
				<option>20</option>
				<option>30</option>
				<option>50</option>
				<option>70</option>
				<option>100</option>
			</select>
			<input type="submit" value="적용">
		</div>
	</div>
	</form>
	<br>

	<h2 style="padding-left: 20px">회원 목록</h2>
	
<form method="post" onsubmit="return checkbox(this);" style="padding-left: 20px">

	<div style="display: flex; justify-content: space-between; margin-right: 25%;">
		<button type="button" style="padding: 10px;" id="downloadBtn" onclick="location.href='../MatchGetIt/Download.do';">Excel 파일로 다운로드</button><br>
		<button type="submit">선택한 회원 삭제하기</button>
	</div><br>
	
	<table border="1">
		<tr>
			<td><input type="checkbox" name="selectAllcheckbox" onclick="selectAll(this);" ></td>
			<td>회원 번호</td>
			<td>회원 성함</td>
			<td>닉네임</td>
			<td>이메일 주소</td>
			<td>연락처</td>
			<td>가입일</td>
			<%-- <td>최근 접속일</td>
			<td>계정 정지 여부</td> --%>
		</tr>
		<c:choose>
			<c:when test="${empty memberList}">
				<tr>
					<td colspan="9" align="center">등록된 회원이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
			<c:set var="startNum" value="${(map.currentPage - 1) * map.pageSize}" />
				<c:forEach items="${memberList}" var="member" varStatus="stat">
				<tr align="center">
					<td>
						<input type="checkbox" name="selectedMember" value="${member.memberId}">
					</td>
					<td>
						${startNum + stat.count}
					</td>
					<td>
						<a href="../MatchGetIt/MemberInfoPage.do
						?email=${member.email}&emailType=${member.memberTypeId}">${member.memberId}</a>
					</td>
					<td>${member.memberName}</td>
					<td>${member.nickName}</td>
					<td>${member.email}</td>
					<td>${member.phoneNumber}</td>
					<td>${member.regDate}</td>
					<%-- <td></td><td></td> --%>
					<%-- <td>${member.lastLoginDate}</td>
					<td>${member.isBanned}</td> --%>
				</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>

	<br>
	<div id="bottom">
		
		
	</div>
	
	<table>
		<tr>
			
			<td align="center">
				<span>${map.pagingStr}</span>
			</td>
		</tr>
	</table>
</form>
	
<script>
	let selectedOption = document.querySelector('option[value="${map.searchType}"]');
	if (selectedOption) selectedOption.selected = true;

	function checkbox(form) {
		let selectedMember = document.querySelectorAll('input[name="selectedMember"]:checked');
		//console.log(selectedMember);
		
		if (selectedMember.length == 0) {
			alert('선택한 회원이 없습니다.');
			return false;
		}

		return confirm(selectedMember.length+"명의 회원을 삭제하시겠습니까? (삭제하면 되돌릴 수 없습니다.)");
	}
	
	function selectAll(selectAll) {
		let checkBoxes = document.getElementsByName('selectedMember');
		checkBoxes.forEach((checkBox)=>{
			checkBox.checked = selectAll.checked;
		})
	}
</script>

</body>
</html>
