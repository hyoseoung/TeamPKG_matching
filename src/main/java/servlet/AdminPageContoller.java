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
import util.AlertFunction;
import util.PagingUtil;

@SuppressWarnings("serial")
@WebServlet("/MatchGetIt/AdminPage.do")
public class AdminPageContoller extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		Map<String, Object> param = new HashMap<>();
		
		// 검색어와 검색할 항목
		String searchType = req.getParameter("searchType");
		String searchValue = req.getParameter("searchValue");
		if (searchValue != null) {
			param.put("searchType", searchType);
			param.put("searchValue", searchValue);
		}
		
		// 전체 회원 수
		int totalCount = dao.countMember(param);
		
		
		// 한 페이지 당 회원 수
		int pageSize = 10;
		// 한 페이지 블록 당 페이지 개수
		int blockSize = 5;
		
		// 현재 페이지 확인
		int pageNum = 1;
		String pageTemp = req.getParameter("pageNum");
		
		if(pageTemp != null && !pageTemp.equals("")) {
			pageNum = Integer.parseInt(pageTemp);
		}
		
		// 목록에서 보여줄 회원의 범위 계산
		int start = (pageNum-1) * pageSize + 1;
		int end = pageNum * pageSize;
		param.put("start", start);
		param.put("end", end);
		
		String pagingStr = PagingUtil.pagingBlock(totalCount, pageSize, blockSize, pageNum, "../MatchGetIt/AdminPage.do");
		
		
		// 회원 목록 불러오기
		List<MemberDTO> memberList = dao.getMemberList(param);
		dao.close();
		
		// 요청 속성에 값을 설정하고 보내기
		param.put("pagingStr", pagingStr);
		req.setAttribute("memberList", memberList);
		req.setAttribute("map", param);
		req.getRequestDispatcher("/AdminPage/AdminMainPage.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String[] members = req.getParameterValues("selectedMember");
		int res = 0;
		
		for (String mem: members) {
			System.out.println(mem);
			res = dao.deleteMember(mem);
		}
		
		dao.close();
		
		if (res > 0) AlertFunction.alertLocation(resp, "선택한 회원을 삭제하였습니다.", "../MatchGetIt/AdminPage.do");
		else AlertFunction.alertBack(resp, "삭제에 실패하였습니다.");
	}
	
}
