<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="NaverLoginAPI.FindInfo" %>
<%@ page import="NaverLoginAPI.CallBack" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String json=new FindInfo(new CallBack(request).getToken()).res;
    StringBuffer sb = new StringBuffer();
    // 글자를 하나하나 탐색한다.
    String uniName= json.split("\"")[33];
    for (int i = 0; i < uniName.length(); i++) {
      if ('\\' == uniName.charAt(i) && 'u' == uniName.charAt(i + 1)) {
        Character r = (char) Integer.parseInt(uniName.substring(i + 2, i + 6), 16);
        // 변환된 글자를 버퍼에 넣는다.
        sb.append(r);
        // for의 증가 값 1과 5를 합해 6글자를 점프
        i += 5;
      } else {
        // ascii코드면 그대로 버퍼에 넣는다.
        sb.append(uniName.charAt(i));
      }
    }
    %>
<!DOCTYPE html>
<html>
<head>
    <title>네이버로그인</title>
  </head>
  <body>
	  	<p>성별 :<%=json.split("\"")[17]%></p>
  		<p>이메일 :<%=json.split("\"")[21]%></p>
  		<p>전화번호 :<%=json.split("\"")[25]%></p>
  		<p>이름 :<%=sb%></p>
  		<p>생년월일 :<%=json.split("\"")[41]%>-<%=json.split("\"")[37]%></p>
  
  </body>
</html>