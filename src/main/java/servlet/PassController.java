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

@WebServlet("/servlet/PassController.do")
public class PassController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    String password = req.getParameter("password");
	    String email = req.getParameter("email");
	    
	    MemberDAO dao = new MemberDAO();
	    boolean result = dao.checkPass(password, email);
	    if (!password.isEmpty()) {
	        if (result == true) {
	            HttpSession session = req.getSession();
	            session.setAttribute("email", email);
	            req.getRequestDispatcher("../CheckAuth/changeMemberMain.jsp").forward(req, resp);
	        } else {
	            AlertFunction.alertBack(resp, "패스워드를 확인하세요.");
	        }
	    }
	}
}