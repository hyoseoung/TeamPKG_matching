package matchBoard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.FileUtil;



@WebServlet("/matchBoard/download.do")
public class DownloadController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//매개변수 받기
		String ofile = req.getParameter("ofile"); //원본 파일명
		String nfile = req.getParameter("nfile"); //저장된 파일명
		String idx = req.getParameter("idx"); //게시물 일련번호
		//파일 다운로드
		FileUtil.downloadFile(req,resp,"/Storage",nfile,ofile);
		//게시물의 다운로드 수 1 증가
		MBoardDAO dao = new MBoardDAO();
		dao.updateDowncount(idx);
		dao.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		MBoardDAO dao = new MBoardDAO();
		int downcount = dao.getDowncount(idx);
		dao.close();
		
		PrintWriter out = resp.getWriter();
		out.print(downcount);
		
	}
}
