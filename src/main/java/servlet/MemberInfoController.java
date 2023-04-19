package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberDTO;

@SuppressWarnings("serial")
@WebServlet("/MatchGetIt/MemberInfoPage.do")
public class MemberInfoController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String memberId = req.getParameter("email");
		MemberDTO dto = dao.getMember(memberId);
		dao.close();
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/AdminPage/MemberInfoPage.jsp").forward(req, resp);
	}
	
}
