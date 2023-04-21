package member;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.ConnectDB;

public class MemberDAO extends ConnectDB {
	
	public MemberDAO() {}
	
	public int insertMember(MemberDTO member) {
		String sql = "insert into MEMBER"
				+ "	(M_ID,M_NAME,M_BIRTH,M_LEVEL,M_GENDER,P_NUMBER,EMAIL,NICKNAME,PASSWORD,M_TYPECODE,REG_DATE,STATEMENT) "
				+ " values(SEQ_MEMBER_NUM.NEXTVAL,?,?,?,?,?,?,SEQ_MEMBER_NUM.NEXTVAL,?,?,SYSDATE,0)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, member.getMemberName());
			psmt.setString(2, member.getBirth());
			psmt.setString(3, member.getLevel());
			psmt.setString(4, member.getGender());
			psmt.setString(5, member.getPhoneNumber());
			psmt.setString(6, member.getEmail());
			psmt.setString(7, member.getPassword());
			psmt.setString(8, member.getMemberTypeId());
			return psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("회원가입 중 오류");
			e.printStackTrace();
		}
		return 0;
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
	public MemberDTO getPNum(String pNum,int type) {
	      String sql="select * from member where p_number=? and m_typecode=?";
	      MemberDTO dto=null;
	      try {
	         psmt = con.prepareStatement(sql);
	         psmt.setString(1, pNum);
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
	public List<MemberDTO> getMemberList(Map<String, Object> param) {
		List<MemberDTO> list = new ArrayList<>();
		
		String query = "select * from ("
				+ "select row_number() over(order by m_id desc) pnum, m.* "
				+ "from member m ";
		if (param.get("searchValue") != null) {
			query += "where "+param.get("searchType")+" like '%"+param.get("searchValue")+"%' ";
			//query += "where ? like '%?%' ";
		}
		query += "order by m_id desc"
			+ ")";
			//+ " where pnum between ? and ?";
		
		try {
			psmt = con.prepareStatement(query);
//			psmt.setString(1, param.get("searchType").toString());
//			psmt.setString(2, param.get("searchValue").toString());
//			psmt.setString(3, param.get("start").toString());
//			psmt.setString(4, param.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
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
				list.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("게시물 목록 조회 중 에러");
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int updateMember(MemberDTO dto) {
		int res = 0;
		String query = "update member "
				+ "set M_NAME=?, PASSWORD=?, P_NUMBER=?, EMAIL=?, NICKNAME=?, M_LEVEL=?, M_GENDER=? "
				+ "where M_ID=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getMemberName());
			psmt.setString(2, dto.getPassword());
			psmt.setString(3, dto.getPhoneNumber());
			psmt.setString(4, dto.getEmail());
			psmt.setString(5, dto.getNickName());
			psmt.setString(6, dto.getLevel());
			psmt.setString(7, dto.getGender());
			psmt.setString(8, dto.getMemberId());
			res = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("회원 정보 수정 중 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	public int deleteMember(String memberId) {
		int res = 0;
		String query = "delete from member where m_id=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, memberId);
			res = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("회원 삭제 중 에러");
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int countMember(Map<String, Object> param) {
		int totalCount = 0;
		
		String query = "select count(*) from member";
		if (param.get("searchValue") != null) {
			query += " where "+param.get("searchType")+" like '%"+param.get("searchValue")+"%' ";
		}
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return totalCount;
	}
}
