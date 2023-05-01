package stadium;

import java.sql.SQLException;

import common.ConnectDB;
import member.MemberDTO;

public class StadiumDAO extends ConnectDB {
	public StadiumDAO() {}
	
	public StadiumDTO getStadium (String std_Id) {
	      String sql="select * from stadium where std_Id=?";
	      StadiumDTO dto=null;
	      try {
	         psmt = con.prepareStatement(sql);
	         psmt.setString(1, std_Id);
	         rs=psmt.executeQuery();
	         if(rs.next()) {
	            dto = new StadiumDTO();
	            dto.setStd_Id(rs.getString("std_Id"));
	            dto.setStd_Name(rs.getString("std_Name"));
	            dto.setLink(rs.getString("link"));
	            dto.setCoordinate_X(rs.getString("coordinate_X"));
	            dto.setCoordinate_Y(rs.getString("coordinate_Y"));
	            dto.setP_Number(rs.getString("p_Number"));
	            dto.setImg_Url(rs.getString("img_Url"));
	            dto.setMng_Name(rs.getString("mng_Name"));
	            dto.setView_Details(rs.getString("view_Details"));
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {close();}
	    return dto;
	}
}
