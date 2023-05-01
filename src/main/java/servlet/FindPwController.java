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

@WebServlet("/Find/FindPw.do")
public class FindPwController extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		
		MemberDTO dto = new MemberDTO();
		dto.setEmail(email);

		MemberDAO dao = new MemberDAO();
		String data = dao.searchPw(dto);

		if(data!=null){
			request.setAttribute("data", data);
			request.getRequestDispatcher("../Find/FindReset.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("../Find/FindPwPhone.jsp").forward(request, response);
			AlertFunction.alertBack(response, "계정이 없습니다.");
		}
		dao.close();
	}
}

