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

/**
 * Servlet implementation class SignUpController
 */
@SuppressWarnings("serial")
@WebServlet("/SignUp/NaverSignUpController.do")
public class NaverSignUpController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		 MemberDTO dto= (MemberDTO)request.getSession().getAttribute("dto");
		if(dto!= null) {
			new MemberDAO().getMember(dto.getEmail(),1);//네이버 간편 로그인인 경우
			dto.setPassword("");//네이버는 공백(api로 못 받아옴)
			dto.setMemberTypeId("1");
			//
		}else {
			dto = new MemberDTO();
			dto.setMemberName(request.getParameter("name"));
			dto.setEmail(request.getParameter("email"));
			dto.setGender(request.getParameter("gender"));
			dto.setPhoneNumber(request.getParameter("pNum"));
			dto.setPassword(request.getParameter("password"));
			dto.setBirth(request.getParameter("birth"));
			dto.setNickName(request.getParameter("nickname"));
			dto.setMemberTypeId("0");//LEVEL만 남은 상태
		}
			new MemberDAO().insertMember(dto);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDTO dto=((MemberDTO)req.getSession().getAttribute("dto"));
		req.setCharacterEncoding("utf8");
		dto.setLevel(req.getParameter("level"));
		new MemberDAO().insertMember(dto);
		AlertFunction.alertLocation(resp, "회원가입 완료","../Login/LoginForm.jsp");
	}

}
