package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import member.MemberDAO;
import member.MemberDTO;

/**
 * Servlet implementation class SignUpController
 */
@SuppressWarnings("serial")
@WebServlet("/SignUp/SignUpController.do")
public class SignUpController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		MemberDTO dto = new MemberDTO();
		dto.setPassword(request.getParameter("password"));
		dto.setMemberName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		dto.setBirth(request.getParameter("birth"));
		dto.setPhoneNumber(request.getParameter("pNum"));
		dto.setGender(request.getParameter("gender"));
		dto.setNickName(request.getParameter("nickname"));
		dto.setMemberTypeId("1");
		dto.setLevel("하");
		new MemberDAO().insertMember(dto);
		request.setAttribute("dto",dto);
		request.getRequestDispatcher("../SignUp/SignUp2.jsp").forward(request, resp);
	}
	
	public void storeInfo(MemberDTO dto) {
		
	}
	
	
	
	//회원가입 끝날때 removeAttribute
	
	

}
