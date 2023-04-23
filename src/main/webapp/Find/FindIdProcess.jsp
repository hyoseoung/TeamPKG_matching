<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDTO" %>
<%@ page import="member.MemberDAO" %>
<%-- 회원의 정보(전화번호,이름)가 회원관리 명단에 존재할 때 아이디는 ".." 입니다. 
	존재하지 않을 시 계정이 존재하지 않습니다  --%>
<% 
	String phoneNumber = request.getParameter("phoneNumber");
	String MemberName = request.getParameter("membername");
	
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleUrl = application.getInitParameter("OracleUrl");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePw = application.getInitParameter("OraclePw");
	MemberDAO dao = new MemberDAO();
	MemberDTO memberDTO = dao.getMember(phoneNumber, MemberName);
	dao.close();
	
	if(memberDTO.getmemberId()!=null){
		session.setAttribute("phoneNumber", memberDTO.getmemberId());
		session.setAttribute("MemberName", memberDTO.getmemberName());
		response.sendRedirect("FindId.jsp");
	}else{
		request.setAttribute("ErrMsg", "계정이 존재하지 않습니다.");
		request.getRequestDispatcher("FindId.jsp").forward(request,response);
	}
%>


