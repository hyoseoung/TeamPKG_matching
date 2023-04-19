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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id= request.getParameter("user_email");
		String pw= request.getParameter("user_pass");
		MemberDTO dto= new MemberDAO().getMember(id);
		if(dto!=null) {	
				System.out.println("연결1");
				if(pw.equals(dto.getPassword())){
					System.out.println("연결2");
					request.getRequestDispatcher("../CheckAuth/changeMemberckeck.jsp").forward(request, response);
				}else AlertFunction.alertBack(response, "비밀번호 틀림");
		}
		else AlertFunction.alertBack(response, "계정이 읎다 자슥아");
		
		
		System.out.println("연결");
	}
	
	

}
