package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDTO;
import tempLocation.TempLocationDAO;

/**
 * Servlet implementation class MatchingWaitController
 */
@SuppressWarnings("serial")
@WebServlet("/Matching/MatchingWaitController.do")
public class MatchingWaitController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			TempLocationDAO dao= new TempLocationDAO();
			if(dao.getLocation(((MemberDTO)request.getSession().getAttribute("dto")).getMemberId()).getTempIdx() == null) {
				System.out.println("성공");
				response.getWriter().print("success");
			}
			dao.close();
	}

}
