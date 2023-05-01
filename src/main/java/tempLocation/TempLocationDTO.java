package tempLocation;

public class TempLocationDTO {

	private String tempIdx;
	private double latitude; // 위도
	private double longitude; // 경도
	private String userId;
	private String stdId;
	private String wantTime;
	private String express;
	  public TempLocationDTO(String userId, double latitude, double longitude,String wantTime,String express) {
	        this.userId = userId;
	        this.latitude = latitude;
	        this.longitude = longitude;
	        this.wantTime=wantTime;
	        this.express="0";
	    }
	  public TempLocationDTO( String tempIdx,String userId, double latitude, double longitude,String wantTime,String stdId ,String express) {
		  	this.tempIdx=tempIdx;
	        this.userId = userId;
	        this.latitude = latitude;
	        this.longitude = longitude;
	        this.wantTime=wantTime;
	        this.stdId=stdId;
	        this.express=express;
	    }
	  
	  public TempLocationDTO(){}
	  
	  
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getStdId() {
		return stdId;
	}
	public void setStdId(String stdId) {
		this.stdId = stdId;
	}
	public String getWantTime() {
		return wantTime;
	}
	public void setWantTime(String wantTime) {
		this.wantTime = wantTime;
	}

	public String getExpress() {
		return express;
	}

	public void setExpress(String express) {
		this.express = express;
	}
	public String getTempIdx() {
		return tempIdx;
	}
	public void setTempIdx(String tempIdx) {
		this.tempIdx = tempIdx;
	}
}