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

@WebServlet("/servlet/UpdateController.do")
public class UpdateController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		System.out.println(email);
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMember(email,0);
		HttpSession session = req.getSession();
	
		String memberName = req.getParameter("memberName");
		String nickName = req.getParameter("nickname");
		String password = req.getParameter("password");
		String phoneNumber = req.getParameter("phoneNumber");
		String level = req.getParameter("level");
		
		if(email == null || email.trim().isEmpty()) {
			System.out.println("이메일 미입력");
			return;
		}else if (memberName == null || memberName.trim().isEmpty()) {
			System.out.println("이름 미입력");
			return;
		}else if (password == null || password.trim().isEmpty()) {
			System.out.println("패스워드 미입력");
			return;
		}else if (phoneNumber == null || phoneNumber.trim().isEmpty()) {
			System.out.println("번호 미입력");
			return;
		}else {

		dto.setMemberName(memberName);
		dto.setNickName(nickName);
		dto.setPassword(password);
		dto.setPhoneNumber(phoneNumber);
		dto.setLevel(level);
		dto.setEmail(email);
		int result = dao.updateInfo(dto);
		System.out.println(result);
		if(result > 0) {
			session.setAttribute("dto", dto);
			AlertFunction.alertLocation (resp, "개인정보 수정완료","../Title/TitleMain.jsp");
		} else {
			AlertFunction.alertBack(resp, "개인정보 수정실패");
		}
		
		}
	}
}
