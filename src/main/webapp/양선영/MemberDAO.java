package member;

import javax.servlet.ServletContext;

import common.ConnectDB;
import member.MemberDTO;

public class MemberDAO extends ConnectDB {
	public MemberDAO(ServletContext application) {
		super(application);
	}
	

	public int insertMember(MemberDTO member) {
		
		String sql = "insert into MEMBER"
				+ "	(M_ID,M_NAME,M_BIRTH,M_LEVEL,M_GEN,P_NUMBER,EMAIL,NICKNAME,PASSWORD,M_TYPE_ID,SBSCR_DATE) "
				+ " value(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, member.getMemberId());
			psmt.setString(2, member.getMemberName());
			psmt.setString(3, member.getBirth());
			psmt.setString(4, member.getLevel());
			psmt.setString(5, member.getGender());
			psmt.setString(6, member.getPhoneNumber());
			psmt.setString(7, member.getEmail());
			psmt.setString(8, member.getNickName());
			psmt.setString(9, member.getPassword());
			psmt.setString(10, member.getMemberTypeId());
			psmt.setString(11, member.getRegDate().toString());
			return psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("회원가입 중 오류");
			e.printStackTrace();
		}
		return -1;
	}
}
