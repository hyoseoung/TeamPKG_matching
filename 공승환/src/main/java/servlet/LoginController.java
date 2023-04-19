package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberDTO;
import util.AlertFunction;


@SuppressWarnings("serial")
@WebServlet("/Login/LoginController.do")
public class LoginController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email= request.getParameter("user_email");
		String pw= request.getParameter("user_pass");
		MemberDTO dto= new MemberDAO().getMember(email,0);
		if(dto!=null) {	
				if(pw.equals(dto.getPassword())){
					request.getSession().setAttribute("client", dto); //기존 세션 기능!
					response.sendRedirect("../Matching/matchingwaitpage.jsp"); //maching >> matching 철자 틀림
					return;
				}else {
					AlertFunction.alertBack(response, "비밀번호 틀림");
					return;
				}
		}else AlertFunction.alertBack(response, "계정이 읎다 자슥아");
		
		
		dto=new MemberDAO().getMember(email,2);
		if(dto!= null) {
			if(pw.equals(dto.getPassword())){
				request.getSession().setAttribute("admin", dto);
				AlertFunction.alertLocation(response, "관리자 접속", "../AdminPage/AdminMainPage.jsp");
			}//관리자 접속
		}
	}
}
