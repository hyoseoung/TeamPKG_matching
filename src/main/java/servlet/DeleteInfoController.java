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

@WebServlet("/servlet/DeleteInfoController.do")
public class DeleteInfoController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		MemberDAO dao = new MemberDAO();
		int result = dao.deleteInfo(email);
		if(result > 0) {
			HttpSession session = req.getSession();
			session.removeAttribute("dto");
			AlertFunction.alertLocation(resp, "탈퇴하였습니다.", "../Title/TitleMain.jsp");
		}else {
			AlertFunction.alertBack(resp, "탈퇴하기 실패하였습니다.");
		}
		
		
	}
}
