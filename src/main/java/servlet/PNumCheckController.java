package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberDTO;

@WebServlet("/SignUp/PNumCheckController.do")
public class PNumCheckController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String value = req.getParameter("value");
		MemberDTO dto = new MemberDAO().getPNum(value,0);
		if(dto == null) {
			resp.getWriter().print("true");
			req.getSession().setAttribute("statement", 1);
		}
		else {
			resp.getWriter().print("false");
			req.getSession().setAttribute("statement", 0);
		}

	}
	
}
