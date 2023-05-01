package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
import member.MemberDTO;
import util.AlertFunction;

@WebServlet("/Find/pass.do")
public class ResetController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//매개변수 저장
				
		String email = req.getParameter("email");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		HttpSession session = req.getSession();		
		dto.setEmail(email);
		
		String password = req.getParameter("password");
		dto.setPassword(password);
		int result = dao.updatePw(dto);
		if(result > 0) {
			session.setAttribute("dto", dto);
			AlertFunction.alertLocation (resp, "비밀번호 재설정 완료","../Title/TitleMain.jsp");
		} else {
			AlertFunction.alertBack(resp, "비밀번호 재설정 실패");
		}
	}
}