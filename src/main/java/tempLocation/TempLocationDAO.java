package tempLocation;

import java.sql.Connection;
import java.sql.SQLException;

import common.ConnectDB;

public class TempLocationDAO extends ConnectDB{
	
	public TempLocationDAO(){}

    public boolean insertTempLocation(TempLocationDTO tempLocation) {
        String query = "INSERT INTO templocation (TMP_IDX,MEM_id, COORDINATE_X, COORDINATE_Y,TIME,EXPRESS,STADIUM_ID) VALUES (SEQ_TEMP_NUM.NEXTVAL ,?, ?, ?, ?, ?, '0')";

        try  {
        	psmt=con.prepareStatement(query);
            psmt.setString(1, tempLocation.getUserId());
            psmt.setDouble(2, tempLocation.getLatitude());
            psmt.setDouble(3, tempLocation.getLongitude());
            psmt.setString(4, tempLocation.getWantTime());
            psmt.setString(5, tempLocation.getExpress());

            int result = psmt.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public TempLocationDTO getLocation(String id){
		 String sql="select * from TEMPLOCATION where MEM_ID= ?";
		 TempLocationDTO dto = new TempLocationDTO();
		 try {
			psmt= con.prepareStatement(sql);
			psmt.setString(1, id);
			rs=psmt.executeQuery();
			if(rs.next()) {
				dto.setUserId(rs.getString("mem_id"));
				dto.setLatitude(rs.getDouble("COORDINATE_X"));
				dto.setLongitude(rs.getDouble("COORDINATE_Y"));
				dto.setExpress(rs.getString("express"));
				dto.setWantTime(rs.getString("time"));
				dto.setStdId(rs.getString("stadium_id"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
    public int	updateTempLocation(TempLocationDTO dto,String st_id){
		 String sql="update templocation set st_id= ? where m_id=?";
		 int res = 0;
		 try {
			psmt= con.prepareStatement(sql);
			psmt.setString(1,st_id);
			psmt.setString(2, dto.getUserId());
			res=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
    public int	deleteTempLocation(TempLocationDTO dto){
		 String sql="delete from templocation where mem_id = ? ";
		 int res = 0;
		 try {
			psmt= con.prepareStatement(sql);
			psmt.setString(1, dto.getUserId());
			res=psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return res;
	}
    public int	updateExpress(String id,String express){
    	String sql="update templocation set express = ? where mem_id = ?" ;
		 int res = 0;
		 try {
			psmt= con.prepareStatement(sql);
			psmt.setString(1, express);
			psmt.setString(2, id);
			res=psmt.executeUpdate();
		} catch (SQLException e) {
		}
		return res;
    }
}