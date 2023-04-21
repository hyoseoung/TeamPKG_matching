package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
import member.MemberDTO;

@WebServlet("/servlet/UpdateController.do")
public class UpdateController extends HttpServlet {

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      HttpSession session = req.getSession();
      String email = (String) session.getAttribute("email");
      
      String memberName = req.getParameter("memberName");
      String nickName = req.getParameter("nickName");
      String password = req.getParameter("password");
      String phoneNumber = req.getParameter("phoneNumber");
      String level = req.getParameter("level");
      
      MemberDAO dao = new MemberDAO();
      MemberDTO dto = new MemberDTO();
      
      dto.setMemberName(memberName);
      dto.setNickName(nickName);
      dto.setPassword(password);
      dto.setPhoneNumber(phoneNumber);
      dto.setLevel(level);
      dto.setEmail(email);
      int result = dao.updateInfo(dto);
      
      if(result > 0) {
         resp.sendRedirect("../Title/TitleMain.jsp");
      } else {
         System.out.println("개인정보 수정 실패");
      }
   }
}