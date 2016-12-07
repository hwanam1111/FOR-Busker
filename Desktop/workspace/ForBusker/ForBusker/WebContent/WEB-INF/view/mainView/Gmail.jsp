<%@page import="busker.scan.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "javax.mail.*"%>
<%@ page import = "javax.mail.internet.*" %>
<%@ page import = "javax.servlet.http.HttpServletRequest" %>
<%@ page import = "javax.activation.*" %>
<%@ page import = "java.io.*" %> 
<%@ page import = "java.util.*" %> 
<%@ page import = "java.security.Security" %>
<%@ page import = "mail.SMTPAuthenticator" %> 
<%!
public static String RandomNum(){
	StringBuffer buffer = new StringBuffer();
	for(int i = 0; i < 10; i++){
		int n = (int)(Math.random() * 10);
		buffer.append(n);
	}
	return buffer.toString();
}
%>

<%
	Properties p = new Properties();
		p.put("mail.smtp.user", "hwanam1111@gmail.com"); // Google계정@gmail.com으로 설정
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable","true");
		p.put( "mail.smtp.auth", "true");

		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465"); 
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
		p.put("mail.smtp.socketFactory.fallback", "false");

		//Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());

		
			Authenticator auth = new SMTPAuthenticator();
			Session sess = Session.getInstance(p, auth);
			sess.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.

			//session = Session.getDefaultInstance(p);
			MemberVO mdao = new MemberVO();
			String emailOk = request.getParameter("memEmail");
			System.out.println("이메일값 : "+emailOk);
			String authNum = "";
			authNum = RandomNum();
			System.out.println("gmail : " +  authNum);
			MimeMessage msg = new MimeMessage(sess);
			msg.setSubject("ForBusker 인증메일입니다.");

			String message = "ForBusker 인증번호입니다. 인증번호를 공백없이 입력해주세요. >>> "  +
							"인증번호 : " + authNum;
			
			Address fromAddr = new InternetAddress("hwanam1111@gmail.com"); // 보내는 사람의 메일주소
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(emailOk);  // 받는 사람의 메일주소
			msg.addRecipient(Message.RecipientType.TO, toAddr); 
			msg.setContent(message, "text/plain;charset=KSC5601");
			System.out.println("Message: " + msg.getContent());
			Transport.send(msg);
			System.out.println("Gmail SMTP서버를 이용한 메일보내기 성공");
			/* request.setAttribute("authNum",authNum ); */
			out.write(authNum);
%>
