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
import util.AlertFunction;

/**
 * Servlet implementation class MatchingNextController
 */
@SuppressWarnings("serial")
@WebServlet("/Matching/MatchingNextController.do")
public class MatchingNextController extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String confirm= req.getParameter("confirm");
		req.getSession().setAttribute("time", req.getParameter("wtime"));
		TempLocationDAO tmpdao = new TempLocationDAO();
		String userId=((MemberDTO)req.getSession().getAttribute("dto")).getMemberId();
		System.out.println(userId);
		if(confirm.equals("1")){
			req.getSession().setAttribute("tmpdto",tmpdao.getLocation(userId));
			//수락 이후
				tmpdao.updateExpress(userId,"2");
				req.getRequestDispatcher("../Matching/matchingwaitingpage.jsp").forward(req,resp);
		}else {			
			//거절
			TempLocationDTO dto = tmpdao.getLocation(userId);
			System.out.println(tmpdao.deleteTempLocation(dto));
			AlertFunction.alertLocation(resp, "매칭 거절", "../Title/TitleMain.jsp" );
		}
		
	}
}
