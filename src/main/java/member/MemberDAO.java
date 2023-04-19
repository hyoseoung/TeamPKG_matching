package member;

import java.sql.SQLException;

import common.ConnectDB;

public class MemberDAO extends ConnectDB {
	public int insertMember(MemberDTO member) {
		
		String sql = "insert into MEMBER"
				+ "	(M_ID,M_NAME,M_BIRTH,M_LEVEL,M_GEN,P_NUMBER,EMAIL,NICKNAME,PASSWORD,M_TYPE_ID,SBSCR_DATE) "
				+ " value(?,?,?,?,?,?,?,?,?,?,SYSDATE)";
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
			return psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("회원가입 중 오류");
			e.printStackTrace();
		}
		return 0;
	}
	@SuppressWarnings("null")
	public MemberDTO getMember(String id) {
		String sql="select * from member where email=?";
		MemberDTO dto = new MemberDTO();
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs=psmt.executeQuery();
			if(rs.next()) {
				dto.setBirth(rs.getString("m_birth"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("m_gender"));
				dto.setLevel(rs.getString("m_level"));
				dto.setMemberId(rs.getString("m_id"));
				dto.setMemberName(rs.getString("m_name"));
				dto.setMemberTypeId(rs.getString("m_typecode"));
				dto.setNickName(rs.getString("nickname"));
				dto.setPassword(rs.getString("password"));
				dto.setPhoneNumber(rs.getString("p_number"));
				dto.setRegDate(rs.getDate("reg_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
}
