package matchBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.AlertFunction;
import util.FileUtil;



@WebServlet("/matchBoard/pass.do")
public class PassController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("mode", req.getParameter("mode"));
		req.getRequestDispatcher("/MatchBoard/Pass.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//매개변수 저장
		String idx = req.getParameter("idx");
		String mode = req.getParameter("mode");
		String pass = req.getParameter("pass");
		
		//비밀번호 확인
		MBoardDAO dao = new MBoardDAO();
		boolean confirmed = dao.confirmPassword(pass,idx);
		dao.close();
		
		//무엇을 진행할지 삭제 수정
		if(confirmed) { //비번 일치
			if(mode.equals("edit")) { //수정
				HttpSession session = req.getSession();
				session.setAttribute("pass", pass);
				resp.sendRedirect("../matchBoard/edit.do?idx="+idx);
			}else if(mode.equals("delete")){ //삭제
				dao = new MBoardDAO();
				MBoardDTO dto = dao.getView(idx);
				int result = dao.deletePost(idx); //게시물 삭제
				dao.close();
				if(result==1) { //게시물 삭제 성공시 첨부파일도 삭제
					String saveFileName = dto.getNfile();
					FileUtil.deleteFile(req,"/Storage",saveFileName);
				}
				AlertFunction.alertLocation(resp, "삭제되었습니다.", "../matchBoard/list.do");
			}
		} else { //비번 불일치
			AlertFunction.alertBack(resp, "비밀번호 검증이 실패했습니다.");
		}
	}
}



		