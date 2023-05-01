package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDTO;
import tempLocation.TempLocationDAO;
import tempLocation.TempLocationDTO;

/**
 * Servlet implementation class MatchingController
 */
@SuppressWarnings("serial")
@WebServlet("/MatchingFirstController.do")
public class MatchingController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDTO dto= ((MemberDTO)request.getSession().getAttribute("dto")); //회원정보 객체 
		try {Thread.sleep(1000);} catch (InterruptedException e){}
		TempLocationDAO tmpdao = new TempLocationDAO();
		TempLocationDTO tmpdto= tmpdao.getLocation(dto.getMemberId());
		if(tmpdto.getExpress().equals("1")) {
			System.out.println("매칭");
			request.getSession().setAttribute("tmpdto",tmpdto);
			response.getWriter().print("success");
			
		}
	}
}
