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
		
		// 검색어와 검색할 항목
		String searchType = req.getParameter("searchType");
		String searchValue = req.getParameter("searchValue");
		if (searchValue != null) {
			param.put("searchType", searchType);
			param.put("searchValue", searchValue);
		}
		
		// 회원 목록 불러오기
		List<MemberDTO> memberList = dao.getMemberList(param);
		
		// 요청 속성에 값을 설정하고 보내기
		req.setAttribute("memberList", memberList);
		req.setAttribute("param", param);
		req.getRequestDispatcher("/AdminPage/AdminMainPage.jsp").forward(req, resp);
		
		dao.close();
	}
	
}
