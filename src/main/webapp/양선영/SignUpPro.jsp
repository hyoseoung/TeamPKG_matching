<%@ page import="common.ConnectDB"%>
<%@ page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ConnectDB con = null;
	ConnectDB psmt = null;
	//한글로
	request.setCharacterEncoding("UTF-8");

	//데이터 가져오기
	String memberId = request.getParameter("id");
	String password = request.getParameter("password");
	String memberName = request.getParameter("name");
	String birth = request.getParameter("birth");
	String phoneNumber = request.getParameter("pNum");
	String email = request.getParameter("email");
	String nickName = request.getParameter("nickName");
	String typeId = request.getParameter("memberTypeId");
	String regDate = request.getParameter("regDate");
	String gender = request.getParameter("gender");
	String level = request.getParameter("level");
	

	
%>