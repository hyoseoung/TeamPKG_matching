<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="org.apache.http.HttpResponse"%>
<%@page import="org.apache.http.client.methods.HttpPost"%>
<%@page import="org.apache.http.impl.client.HttpClients"%>
<%@page import="org.apache.http.client.HttpClient"%>
<%@page import="org.apache.http.HttpEntity"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.apache.http.entity.ContentType"%>
<%@page import="org.apache.http.entity.mime.content.FileBody"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.nio.charset.Charset"%>
<%@page import="org.apache.http.entity.mime.HttpMultipartMode"%>
<%@page import="org.apache.http.entity.mime.MultipartEntityBuilder"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sms send</title>
<script src="http://apis.aligo.in/send/"></script>

<script>

<%
try{
	
	final String encodingType = "utf-8";
	final String boundary = "____boundary____";

	/**************** 문자전송하기 예제 ******************/
	/* "result_code":결과코드,"message":결과문구, */
	/* "msg_id":메세지ID,"error_cnt":에러갯수,"success_cnt":성공갯수 */
	/* 동일내용 > 전송용 입니다.  
	/******************** 인증정보 ********************/
	String sms_url = "https://apis.aligo.in/send/"; // 전송요청 URL
	
	Map<String, String> sms = new HashMap<String, String>();
	
	sms.put("user_id", ""); // SMS 아이디
	sms.put("key", ""); //인증키
	
	/******************** 인증정보 ********************/
	
	/******************** 전송정보 ********************/
	sms.put("msg", "%고객명%님. 안녕하세요. API TEST SEND"); // 메세지 내용
	sms.put("receiver", "01089428020"); // 수신번호
	
	sms.put("sender", "01089428020"); // 발신번호
	
	String image = "";
	//image = "/tmp/pic_57f358af08cf7_sms_.jpg"; // MMS 이미지 파일 위치
	
	/******************** 전송정보 ********************/
	
	MultipartEntityBuilder builder = MultipartEntityBuilder.create();
	
	builder.setBoundary(boundary);
	builder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
	builder.setCharset(Charset.forName(encodingType));
	
	for(Iterator<String> i = sms.keySet().iterator(); i.hasNext();){
		String key = i.next();
		builder.addTextBody(key, sms.get(key)
				, ContentType.create("Multipart/related", encodingType));
	}
	
	File imageFile = new File(image);
	if(image!=null && image.length()>0 && imageFile.exists()){

		builder.addPart("image",
				new FileBody(imageFile, ContentType.create("application/octet-stream"),
						URLEncoder.encode(imageFile.getName(), encodingType)));
	}
	
	HttpEntity entity = builder.build();
	
	HttpClient client = HttpClients.createDefault();
	HttpPost post = new HttpPost(sms_url);
	post.setEntity(entity);
	
	HttpResponse res = client.execute(post);
	
	String result = "";
	if(res != null){
		BufferedReader in = new BufferedReader(new InputStreamReader(res.getEntity().getContent(), encodingType));
		String buffer = null;
		while((buffer = in.readLine())!=null){
			result += buffer;
		}
		in.close();
	}
	
	out.print(result);
	
}catch(Exception e){
	out.print(e.getMessage());
}

%>

</script>
</head>
<body>
<div>
    <div>
            <input type="text" id="pNum" placeholder="휴대폰 번호를 입력하세요" />
            <button type="button" id="sendBtn">인증 요청</button>
    </div>
</div>
</body>
</html>