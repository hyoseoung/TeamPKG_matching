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

@WebServlet("/Find/FindId.do")
public class FindIdController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String m_name = request.getParameter("m_name");
		String p_number = request.getParameter("p_number");
		
		MemberDTO dto = new MemberDTO();
		dto.setMemberName(m_name);
		dto.setPhoneNumber(p_number);
		MemberDAO dao = new MemberDAO();
		String data = dao.searchId(dto);
		System.out.println(data);

		if(data!=null){
			request.setAttribute("data", data);
			request.getRequestDispatcher("../Find/IdPopup.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("../Find/FindId.jsp").forward(request, response);
			AlertFunction.alertBack(response, "계정이 없습니다.");
		}
		dao.close();
	}
}
