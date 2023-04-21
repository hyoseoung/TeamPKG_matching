package servlet;

import java.io.IOException;
//import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberDTO;
import util.AlertFunction;

@SuppressWarnings("serial")
@WebServlet("/MatchGetIt/MemberEditPage.do")
public class MemberModifyController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String emailAddr = req.getParameter("email");
		int emailType = Integer.parseInt(req.getParameter("emailType"));
		String mode = req.getParameter("mode");
		
		// 이메일 주소로 회원을 찾아서 가져옴
		MemberDTO dto = dao.getMember(emailAddr, emailType);
		dao.close();
		
		if (mode.equals("edit")) {
			// 회원 정보를 요청에 저장하고 보내기
			req.setAttribute("dto", dto);
			req.getRequestDispatcher("/AdminPage/MemberEditPage.jsp").forward(req, resp);
		}
		else if (mode.equals("delete")) {
			dao = new MemberDAO();
			int res = dao.deleteMember(dto.getMemberId());
			dao.close();
			
			if (res > 0) AlertFunction.alertLocation(resp, "삭제하였습니다.", "../MatchGetIt/AdminPage.do");
			else AlertFunction.alertBack(resp, "삭제에 실패하였습니다.");
		}
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// form에서 넘어온 값 변수에 저장
		String memberId = req.getParameter("memberId");
		String memberName = req.getParameter("memberName");
		String nickname = req.getParameter("nickname");
		String email = req.getParameter("email");
		String phoneNum = req.getParameter("phoneNum");
		String gender = req.getParameter("gender");
		String level = req.getParameter("level");
//		Date startBan = null;
//		Date endBan = null;
//		
//		if (req.getParameter("ban").equals("doBan")) {
//			System.out.println(req.getParameter("startBan"));
//			startBan = Date.valueOf(req.getParameter("startBan"));
//			endBan = Date.valueOf(req.getParameter("endBan"));
//		}
		
		// dto 생성하고 값을 설정
		MemberDTO dto = new MemberDTO();
		dto.setMemberId(memberId);
		dto.setMemberName(memberName);
		dto.setNickName(nickname);
		dto.setEmail(email);
		dto.setPhoneNumber(phoneNum);
		dto.setGender(gender);
		dto.setLevel(level);
		
		
		// dao 생성 후 DB의 값 수정
		MemberDAO dao = new MemberDAO();
		int res = dao.updateMember(dto);
		dao.close();
		
		
		if (res == 1) { //성공
			AlertFunction.alertLocation(resp, "수정이 완료되었습니다.", "../MatchGetIt/MemberInfoPage.do"
					+ "?email="+email+"&emailType="+req.getParameter("emailType"));
		}
		else {
			AlertFunction.alertBack(resp, "수정이 되지 않았습니다.");
		}
		
		
	}
	
}
