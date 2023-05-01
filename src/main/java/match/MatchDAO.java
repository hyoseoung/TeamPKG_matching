package match;

import java.sql.SQLException;
import java.util.ArrayList;

import common.ConnectDB;
import member.MemberDAO;
import member.MemberDTO;

	public class MatchDAO extends ConnectDB {
		
		public MatchDAO(){}
	    public ArrayList<MemberDTO> getTeam(String stdId, String time,String team) {
	        ArrayList<MemberDTO> list = new ArrayList<>();
	        MemberDAO dao = new MemberDAO();
	        MemberDTO dto= new MemberDTO();
	        String sql = "SELECT M.MEM_ID"
	                   + " FROM STADIUM S, MATCH M"
	                   + " WHERE M.STD_ID = S.STD_ID AND M.ST_TIME = ? AND M.STD_ID = ? AND TEAM=?";
	        try {
	            psmt = con.prepareStatement(sql);
	            psmt.setString(1, time);
	            psmt.setString(2, stdId);
	            psmt.setString(3, team);
	            rs = psmt.executeQuery();
	            while (rs.next()) {
	            	dto= new MemberDTO();
	            	dto = dao.getMember(rs.getString("mem_id"));
	                list.add(dto);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }finally {close();}
	        return list;
	    }
	
	public MatchDTO getMatch(String id,String stdId,String time,String team) {
		MatchDTO dto = new MatchDTO();
		String sql = " SELECT M.* "
    			+ "   FROM STADIUM S,MATCH M "
    			+ "   WHERE M.STD_ID=S.STD_ID AND M.MTC_ST_TIME = ? AND M.STD_ID = ? AND M.TEAM = ? AND M.MEM_ID = ?";
		try {
			psmt=con.prepareStatement(sql);
			psmt.setString(1, time);
			psmt.setString(2, stdId);
			psmt.setString(3, team);
			psmt.setString(4, id);
			rs=psmt.executeQuery();
			if(rs.next()) {
				dto.setStdId(rs.getString("std_id"));
				dto.setMemId(rs.getString("mem_id"));
				dto.setmTime(rs.getString("mtc_st_time"));
				dto.setTeam(rs.getString("team"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {close();}
		return dto;
		
	}
}