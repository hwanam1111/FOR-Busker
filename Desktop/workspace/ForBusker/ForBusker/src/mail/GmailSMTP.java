package mail;
import javax.mail.*;

import javax.mail.internet.*; 
import javax.activation.*;
 
import java.io.*;
import java.util.*;

public class GmailSMTP 
{ 
 public static void main(String[] args) 
 {
  Properties p = new Properties();
  p.put("mail.smtp.user", "hwanam1111@gmail.com"); // Google 본인 Gmail p.put나머지는 건들지말것
  p.put("mail.smtp.host", "smtp.gmail.com");
  p.put("mail.smtp.port", "465");
  p.put("mail.smtp.starttls.enable","true");
  p.put( "mail.smtp.auth", "true");

  p.put("mail.smtp.debug", "true");
  p.put("mail.smtp.socketFactory.port", "465"); 
  p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
  p.put("mail.smtp.socketFactory.fallback", "false");

  //Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());

  try {
   Authenticator auth = new SMTPAuthenticator();
   Session session = Session.getInstance(p, auth);
   session.setDebug(true); 

   //session = Session.getDefaultInstance(p);
   MimeMessage msg = new MimeMessage(session);
   String message = "Gmail SMTP avaMail ";
   msg.setSubject("Gmail SMTP JavaMail ");
   Address fromAddr = new InternetAddress("hwanam1111@gmail.com");  // 본인 지메일
   msg.setFrom(fromAddr);
   Address toAddr = new InternetAddress("hwanam1111@naver.com"); // 본인 지메일
   msg.addRecipient(Message.RecipientType.TO, toAddr); 
   /*
   msg.setContent(message, "text/plain;charset=KSC5601");
   System.out.println("Message: " + msg.getContent());
   Transport.send(msg);
   */
   BodyPart messageBodyPart = new MimeBodyPart();
   
   // Fill the message
   messageBodyPart.setText("Java Mail API.");
   Multipart multipart = new MimeMultipart();
   multipart.addBodyPart(messageBodyPart);
  
   // Part two is attachment
   messageBodyPart = new MimeBodyPart();
   File file = new File("C:/log.txt");
   FileDataSource fds = new FileDataSource(file);
   messageBodyPart.setDataHandler(new DataHandler(fds));
   messageBodyPart.setFileName(fds.getName());
   multipart.addBodyPart(messageBodyPart);
  
   // Put parts in message
   msg.setContent(multipart, "text/plain;charset=KSC5601");
  
   // Send the message
   Transport.send(msg);
   System.out.println("Gmail SMTP");
  }
  catch (Exception mex) { // Prints all nested (chained) exceptions as well 
   System.out.println(""
   		+ "");
   mex.printStackTrace(); 
  } 
 }

 private static class SMTPAuthenticator extends javax.mail.Authenticator {

  public PasswordAuthentication getPasswordAuthentication() {
   return new PasswordAuthentication("hwanam1111@gmail.com", "kdlatylatlppatgl"); // Google id, pwd(2차 비밀번호)
  }
 } 
}