<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.FileReader"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String from = "rlatjsaud65@naver.com";
	String username = "rlatjsaud65@naver.com";
	String pass = "tjsaud0811";
	out.print(request.getParameter("email"));
   Random rand = new Random();
   int randCode = rand.nextInt(900000) + 100000;
   String authCode = Integer.toString((int)randCode);
   session.setAttribute("code", authCode);
   Properties serverInfo = new Properties();

   serverInfo.put("mail.smtp.host", "smtp.naver.com");
   serverInfo.put("mail.smtp.port", "465");
   serverInfo.put("mail.smtp.auth", "true");
   serverInfo.put("mail.smtp.starttls.enable", "true");
   serverInfo.put("mail.smtp.starttls.required", "true");
   serverInfo.put("mail.smtp.ssl.enable", "true");
   serverInfo.put("mail.smtp.ssl.trust", "smtp.naver.com");
   serverInfo.put("mail.smtp.ssl.protocols", "TLSv1.2");
   serverInfo.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

   Session mailSession = Session.getInstance(serverInfo, new Authenticator() {
      protected PasswordAuthentication getPasswordAuthentication() {
           return new PasswordAuthentication(username, pass);
      }
   });

   try {
        MimeMessage message = new MimeMessage(mailSession);
        message.setFrom(new InternetAddress(from));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(request.getParameter("email")));
        message.setSubject("인증 코드");
        message.setText("인증코드는 " + authCode + " 입니다..");
        Transport.send(message);
        System.out.println("이메일 보내기 성공.");
   } catch (MessagingException mex) {
      mex.printStackTrace();
      System.out.println("보내기 실패.");
   }
%>