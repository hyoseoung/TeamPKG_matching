package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberDTO;
import util.AlertFunction;

@SuppressWarnings("serial")
@WebServlet("/MatchGetIt/Download.do")
public class DownloadMemberList extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		makeCSVfile(req, resp);
	}
	
	private static void makeCSVfile(HttpServletRequest req, HttpServletResponse resp) {
		
		MemberDAO dao = new MemberDAO();
		Map<String, Object> param = new HashMap<>();
		param.put("start", 1);
		param.put("end", dao.countMember(param));
		
		List<MemberDTO> memberList = dao.getMemberList(param);
		dao.close();
		
		try {
			File file = new File(req.getServletContext().getRealPath("/AdminPage")+"/MemberList.csv");
			
			String content = "회원 번호,회원 성함,연락처,이메일 주소,닉네임,성별,숙련도,가입일\n";
			
			for (MemberDTO member: memberList) {
				content += String.format("\"%s\",", member.getMemberId());
				content += String.format("\"%s\",", member.getMemberName());
				content += String.format("\"%s\",", member.getPhoneNumber());
				content += String.format("\"%s\",", member.getEmail());
				content += String.format("\"%s\",", member.getNickName());
				content += String.format("\"%s\",", member.getGender());
				content += String.format("\"%s\",", member.getLevel());
				content += String.format("\"%s\"\n", member.getRegDate());
			}
			
			content = new String(content.getBytes("EUC-KR"), "EUC-KR");
			
			InputStream inStream = new FileInputStream(file);
			
			//파일 다운로드 응답 헤더 설정
			resp.reset();
			resp.setCharacterEncoding("EUC-KR");
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename=\"MemberList.csv\"");
			//resp.setHeader("Content-Length", ""+content.length());
			

			//response 내장 객체로 새로운 출력 스트림 생성
			Writer writer = resp.getWriter();
			writer.write(content);
			
			//입출력 스트림 닫기
			inStream.close();
			writer.close();
		}
		catch (FileNotFoundException e) {
			AlertFunction.alertBack(resp, "파일을 찾을 수 없습니다.");
			e.printStackTrace();
		}
		catch (Exception e) {
			System.out.println("예외가 발생했습니다.");
			e.printStackTrace();
		}
	}
	
}
