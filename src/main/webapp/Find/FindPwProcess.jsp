<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.MemberDAO" %>
<%@ page import = "member.MemberDTO" %>
<%@ page import = "util.AlertFunction" %>
<%
	String Id = request.getParameter("memberId");
	MemberDTO dto = new MemberDTO();
	dto.setPassword(Id);

	MemberDAO dao = new MemberDAO();
	String data = dao.searchPw(dto);

	if(data!=null){
		request.setAttribute("data", data);
		request.getRequestDispatcher("../Find/PwPopup.jsp").forward(request, response);
	}else {
		request.getRequestDispatcher("../Find/FindPw.jsp").forward(request, response);
		AlertFunction.alertBack(response, "계정이 없습니다.");
	}
	dao.close();
%>