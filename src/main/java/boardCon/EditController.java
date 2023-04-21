package boardCon;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import util.AlertFunction;
import util.FileUtil;


@WebServlet("/m2board/edit.do")
public class EditController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idx=req.getParameter("idx");
		MBoardDAO dao = new MBoardDAO();
		MBoardDTO dto = dao.getView(idx);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/14M2Board/Edit.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//>업로드 디렉터리의 물리적 경로 확인
		String saveDirectory = req.getServletContext().getRealPath("/Storage");
  
		//파일 업로드를 위한 기본 정보
		ServletContext application = getServletContext();
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
  
		//>파일 업로드
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		if(mr == null) {
		//파일 업로드 실패하면
			AlertFunction.alertBack(resp, "파일이 업로드 되지 않았습니다.");
			return;
		}
		//DB 정보 저장
		String idx=mr.getParameter("idx");
		String prevOfile=mr.getParameter("preOfile");
		String prevNfile=mr.getParameter("preNfile");
		
		HttpSession session=req.getSession();
		String pass=(String)session.getAttribute("pass");
		
		//폼값을 DTO에 저장
		MBoardDTO dto = new MBoardDTO();
		dto.setIdx(idx);
		dto.setName(mr.getParameter("name"));
		dto.setTitle(mr.getParameter("title"));
		dto.setContent(mr.getParameter("content"));
		dto.setPass(pass);
		//원본 파일명과 수정된 파일명
		String filename=mr.getFilesystemName("ofile");
		if(filename != null) {
			//새 파일 명 생성
			String nfname = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String ext = filename.substring(filename.lastIndexOf("."));
			String newFileName=nfname + ext;
			//파일명 변경
			File oldFile = new File(saveDirectory+File.separator+filename);
			File newFile = new File(saveDirectory+File.separator+newFileName);
			oldFile.renameTo(newFile);
			dto.setOfile(filename);   //원래 파일 이름
			dto.setNfile(newFileName); //서버에 저장된 파일 이름
			//기존 파일 삭제
			FileUtil.deleteFile(req, "/Storage", prevNfile);
		}else {
			dto.setOfile(prevOfile);
			dto.setNfile(prevNfile);
		}
		//DAO를 통해 DB에 내용 저장
		MBoardDAO dao = new MBoardDAO();
		int result = dao.updatePost(dto);
		dao.close();
		//성공 여부
		if(result==1) {   //성공
			session.removeAttribute("pass");
			resp.sendRedirect("../m2board/view.do?idx="+idx);
		}else {
			AlertFunction.alertLocation(resp, "수정이 되지 않았습니다.", "../m2board/view.do?idx="+idx);
		}
	}
}
