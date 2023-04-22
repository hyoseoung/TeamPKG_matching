package matchBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/matchBoard/view.do")
public class ViewController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//게시물 읽어오기
		MBoardDAO dao = new MBoardDAO();
		String idx = req.getParameter("idx");
		dao.updateVisitCount(idx); //조회수 증가
		MBoardDTO dto = dao.getView(idx); //내용 읽어오기
		//dao.close();
		//줄바꿈 처리
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));
		//게시물 뷰로 전달
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/MatchBoard/View.jsp").forward(req, resp);
	}
}
