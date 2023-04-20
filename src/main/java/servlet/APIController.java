package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import NaverLoginAPI.CallBack;
import NaverLoginAPI.FindInfo;
import member.MemberDAO;
import member.MemberDTO;
import util.AlertFunction;

/**
 * Servlet implementation class APIController
 */
@SuppressWarnings("serial")
@WebServlet("/API/APIController.do")
public class APIController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String json=new FindInfo(new CallBack(req).getToken()).res;
		StringBuffer sb = new StringBuffer();
		// 글자를 하나하나 탐색한다.
		String[] data = json.split("\"");
		MemberDTO dto = new MemberDAO().getMember(data[21],1);
		if(dto == null){
			String uniName=data[33];
			for (int i = 0; i < uniName.length(); i++) {
				if ('\\' == uniName.charAt(i) && 'u' == uniName.charAt(i + 1)) {
					Character r = (char) Integer.parseInt(uniName.substring(i + 2, i + 6), 16);
					// 변환된 글자를 버퍼에 넣는다.
					sb.append(r);
					// for의 증가 값 1과 5를 합해 6글자를 점프
					i += 5;
				} else {
					// ascii코드면 그대로 버퍼에 넣는다.
					sb.append(uniName.charAt(i));
				}//유니코드 디코딩 메소드 만들 지 말지는 아직 미정
			}
			dto= new MemberDTO();
			dto.setBirth(data[41]+"-"+data[37]);
			dto.setMemberName(sb.toString());
			dto.setEmail(data[21]);
			dto.setGender(data[17]);
			dto.setPhoneNumber(data[25]);
			dto.setMemberTypeId("1");
			req.getSession().setAttribute("dto",dto);
			AlertFunction.alertLocation(resp,"세부사항 입력", "../SignUp/SignUp2.jsp");
		}
		else {
			req.getSession().setAttribute("dto",dto);			
			AlertFunction.alertLocation(resp, dto.getMemberName()+"님 환영합니다", "../Matching/matchingwaitpage.jsp");
		}
	}

}
