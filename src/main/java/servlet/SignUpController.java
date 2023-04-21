package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import member.MemberDAO;
import member.MemberDTO;
import util.AlertFunction;


@SuppressWarnings("serial")
@WebServlet("/SignUp/SignUpController.do")
public class SignUpController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		if(Integer.parseInt(request.getSession().getAttribute("statement").toString())==1) {
			MemberDTO dto = new MemberDTO();
			dto.setPassword(request.getParameter("password"));
			dto.setMemberName(request.getParameter("name"));
			dto.setEmail(request.getParameter("email"));
			dto.setBirth(request.getParameter("birth"));
			dto.setPhoneNumber(request.getParameter("pNum"));
			dto.setGender(request.getParameter("gender"));
			dto.setMemberTypeId("0");
			MemberDAO dao= new MemberDAO();
			dao.insertMember(dto);
			request.getSession().setAttribute("dto",dto);
			resp.sendRedirect("../SignUp/SignUp2.jsp");
			dao.close();
		} else {
			AlertFunction.alertBack(resp, "이메일 중복확인을 해주세요.");
		}
	}
}

