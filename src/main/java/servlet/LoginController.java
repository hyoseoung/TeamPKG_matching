package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberDTO;
import util.AlertFunction;


@SuppressWarnings("serial")
@WebServlet("/Login/LoginController.do")
public class LoginController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id= request.getParameter("email");
		String pw= request.getParameter("password");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto= dao.getMember(id,0);
		MemberDTO ad= dao.getMember(id,2);
		if(dto!=null) {
				if(pw.equals(dto.getPassword())){
					dao.updateState(dto.getMemberId(),dto.getMemberTypeId(),"1");
					request.getSession().setAttribute("dto", dto);
					request.getRequestDispatcher("../Title/TitleMain.jsp").forward(request, response);
				}else AlertFunction.alertBack(response, "비밀번호 틀림");
		}
		if(ad!=null) {
			if(pw.equals(dto.getPassword())){
				dto.setState("2");
				dao.updateState(dto.getMemberId(),dto.getMemberTypeId(),"2");
				request.getSession().setAttribute("dto", dto);
				AlertFunction.alertLocation(response, "관리자 로그인", "../AdminPage/AdminMainPage.jsp");
		}
		else AlertFunction.alertBack(response, "계정이 읎다 자슥아");
	}
	}
}
