package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberDTO;
import util.AlertFunction;

@SuppressWarnings("serial")
@WebServlet("/MatchGetIt/MemberInfoPage.do")
public class MemberInfoController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String emailAddr = req.getParameter("email");
		
		// 이메일 주소로 회원을 찾아서 가져옴
		MemberDTO dto = dao.getMember(emailAddr);
		dao.close();
		
		// 회원 정보를 요청에 저장하고 보내기
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/AdminPage/MemberInfoPage.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 인코딩
		req.setCharacterEncoding("UTF-8");
		
		// form에서 넘어온 값 변수에 저장
		String memberName = req.getParameter("memberName");
		String nickname = req.getParameter("nickname");
		String password = req.getParameter("password");
		String email = req.getParameter("email");
		String phoneNum = req.getParameter("phoneNum");
		String gender = req.getParameter("gender");
		String level = req.getParameter("level");
		Date startBan = null;
		Date endBan = null;
		
		if (req.getParameter("ban").equals("doBan")) {
			System.out.println(req.getParameter("startBan"));
			startBan = Date.valueOf(req.getParameter("startBan"));
			endBan = Date.valueOf(req.getParameter("endBan"));
		}
		
		
		// dto 생성하고 값을 설정
		MemberDTO dto = new MemberDTO();
		dto.setMemberName(memberName);
		dto.setNickName(nickname);
		dto.setPassword(password);
		dto.setEmail(email);
		dto.setPhoneNumber(phoneNum);
		dto.setGender(gender);
		dto.setLevel(level);
		
		
		// dao 생성 후 DB의 값 수정
		MemberDAO dao = new MemberDAO();
		//int res = dao.updateMember(dto);
		int res = 1;
		dao.close();
		
		
		if (res == 1) { //성공
			AlertFunction.alertLocation(resp, "수정이 완료되었습니다.", "../MatchGetIt/MemberInfoPage.do?email="+email);
		}
		else {
			AlertFunction.alertBack(resp, "수정이 되지 않았습니다.");
		}
		
		
	}
	
}
