package NaverLoginAPI;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

public class CallBack {
	public String clientId = "QMzZCB86eMc75Lc6X1y7";//애플리케이션 클라이언트 아이디값";
	public String clientSecret = "YY456xpdpH";//애플리케이션 클라이언트 시크릿값";
	public String apiURL="";
	public CallBack(HttpServletRequest request){
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI="";
		try {redirectURI = URLEncoder.encode("http://localhost:8081/Package/Pages/FirstPage.jsp", "UTF-8");}catch(UnsupportedEncodingException e) {e.printStackTrace();}
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
	}
	public String getToken(){
			String token="";
			try {
				URL url = new URL(apiURL);
		      HttpURLConnection con = (HttpURLConnection)url.openConnection();
		      con.setRequestMethod("GET");
		      int responseCode = con.getResponseCode();
		      BufferedReader br;
		      if(responseCode==200) { // 정상 호출
		        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		      } else {  // 에러 발생
		        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		      }
		      String inputLine;
		      StringBuffer res = new StringBuffer();
		      while ((inputLine = br.readLine()) != null) {
		        res.append(inputLine);
		      }
		      br.close();
		      if(responseCode==200) {
		    	   token= res.toString().split("\"")[3];
		      }	
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch(Exception e) {
				e.printStackTrace();
				
			}
			return token;
	}
}
