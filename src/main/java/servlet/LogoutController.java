package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.AlertFunction;

@SuppressWarnings("serial")
@WebServlet("/Logout/LogoutController.do")
public class LogoutController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("dto");
		AlertFunction.alertLocation (response, "로그아웃!","../Title/TitleMain.jsp");
	}

}
