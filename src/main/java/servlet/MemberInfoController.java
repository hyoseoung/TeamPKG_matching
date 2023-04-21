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
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String emailAddr = req.getParameter("email");
		int emailType = Integer.parseInt(req.getParameter("emailType"));
		
		// 이메일 주소로 회원을 찾아서 가져옴
		MemberDTO dto = dao.getMember(emailAddr, emailType);
		dao.close();
		
		// 회원 정보를 요청에 저장하고 보내기
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/AdminPage/MemberInfoPage.jsp").forward(req, resp);
	}
	
}
