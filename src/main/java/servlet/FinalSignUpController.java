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


@WebServlet("/SignUp/FinalSignUpController.do")
public class FinalSignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public FinalSignUpController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDTO dto = (MemberDTO)(request.getSession().getAttribute("dto"));
		dto.setLevel(request.getParameter("level"));
		new MemberDAO().insertMember(dto);
		AlertFunction.alertLocation(response, "회원가입이 완료되었습니다.", "../Login/LoginForm1.jsp");
		
	}
}
