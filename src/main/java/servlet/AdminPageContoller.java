package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberDTO;

@SuppressWarnings("serial")
@WebServlet("/MatchGetIt/AdminPage.do")
public class AdminPageContoller extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		
		Map<String, Object> param = new HashMap<>();
		
		String searchType = req.getParameter("searchType");
		String searchValue = req.getParameter("searchValue");
		if (searchValue != null) {
			param.put("searchType", searchType);
			param.put("searchValue", searchValue);
		}
		
		List<MemberDTO> memberList = dao.getMemberList(param);
		
		req.setAttribute("memberList", memberList);
		req.setAttribute("param", param);
		req.getRequestDispatcher("/AdminPage/AdminMainPage.jsp").forward(req, resp);
		
		dao.close();
	}
	
}
