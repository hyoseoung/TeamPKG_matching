package member;

import java.sql.SQLException;

import common.ConnectDB;

public class MemberDAO extends ConnectDB {
	
	public MemberDAO() {}
	
	public int insertMember(MemberDTO member) {
		String sql = "insert into MEMBER"
				+ "	(M_ID,M_NAME,M_BIRTH,M_LEVEL,M_GENDER,P_NUMBER,EMAIL,NICKNAME,PASSWORD,M_TYPECODE,REG_DATE) "
				+ " values(SEQ_MEMBER_NUM.NEXTVAL,?,?,?,?,?,?,?,?,?,SYSDATE)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, member.getMemberName());
			psmt.setString(2, member.getBirth());
			psmt.setString(3, member.getLevel());
			psmt.setString(4, member.getGender());
			psmt.setString(5, member.getPhoneNumber());
			psmt.setString(6, member.getEmail());
			psmt.setString(7, member.getNickName());
			psmt.setString(8, member.getPassword());
			psmt.setString(9, member.getMemberTypeId());
			return psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("회원가입 중 오류");
			e.printStackTrace();
		}
		return 0;
	}
	
	public boolean DuplCheck (String col, String value) {
		boolean isRight = false;
		try {
			String query = "select count(*) from member where "
					+ col
					+ " =?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, value);
			rs=psmt.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) {
				isRight=true;
				System.out.println("사용가능한 "+col+" 입니다.");
			} else {
				System.out.println("중복된 "+col+" 입니다.");
			}
		} catch(Exception e) {
			isRight = false;
			System.out.println("오류가 발생했습니다.");
			e.printStackTrace();
		}
		return isRight;
	}
	
	public MemberDTO getMember(String id,int type) {
	      String sql="select * from member where email=? and m_typecode=?";
	      MemberDTO dto=null;
	      try {
	         psmt = con.prepareStatement(sql);
	         psmt.setString(1, id);
	         psmt.setString(2, String.valueOf(type));
	         rs=psmt.executeQuery();
	         if(rs.next()) {
	            dto = new MemberDTO();
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
	         e.printStackTrace();
	      }
	      return dto;
	   }
}
