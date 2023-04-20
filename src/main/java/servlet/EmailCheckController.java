package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ConnectDB;
import member.MemberDAO;
import member.MemberDTO;

@WebServlet("/SignUp/EmailCheckController.do")
public class EmailCheckController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String value = req.getParameter("email");
		MemberDTO dto = new MemberDAO().getMember(value,0);
		if(dto == null) 
			resp.getWriter().print(0);
		else resp.getWriter().print(1);
			
		
	}
	
	/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String col = req.getParameter("mode");
		String value = req.getParameter("email)
		
		MemberDTO dto = new MemberDTO();
		
		dto = new
	   }*/
}
