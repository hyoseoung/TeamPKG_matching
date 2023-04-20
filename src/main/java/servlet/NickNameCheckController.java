package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberDTO;

/**
 * Servlet implementation class NickNameCheckController
 */
@WebServlet("/NickNameCheckController")
public class NickNameCheckController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String value = req.getParameter("nickName");
		MemberDTO dto = new MemberDAO().getMember(value,0);
		if(dto == null) 
			resp.getWriter().print(0);
		else resp.getWriter().print(1);
			
		
	}

}
