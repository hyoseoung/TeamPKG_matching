package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import match.MatchDAO;
import tempLocation.TempLocationDTO;

@SuppressWarnings("serial")
@WebServlet("/Matching/MatchingFinalController.do")
public class MatchingFinalController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		HttpSession session=request.getSession();
		MatchDAO dao = new MatchDAO();
		String stdId=	((TempLocationDTO)session.getAttribute("tmpdto")).getStdId();
		request.setAttribute("listA",dao.getTeam(stdId,session.getAttribute("time").toString(),"A"));
		request.setAttribute("listB",dao.getTeam(stdId,session.getAttribute("time").toString(),"B"));
		dao.close();
		session.removeAttribute("tmpdto");
		session.removeAttribute("time");	
		request.getRequestDispatcher("../Matching/matchCompletionPage.jsp").forward(request, response);
	}
}
