package mail;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public class Gmail
{
	public static void main(String[] args) 
	{
		Properties p = new Properties();
		p.put("mail.smtp.user", "hwanam1111@gmail.com"); // Google����@gmail.com���� ����
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
			session.setDebug(true); // ������ ������ �� ���� ��Ȳ�� �ֿܼ� ����Ѵ�.

			//session = Session.getDefaultInstance(p);
			String authNum = "";
			authNum = RandomNum();
			MimeMessage msg = new MimeMessage(session);
			msg.setSubject("PolarBear ������ȣ �����Դϴ�");
			String message = "������ȣ : " + authNum;
			Address fromAddr = new InternetAddress("hwanam1111@gmail.com"); // ������ ����� �����ּ�
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress("hwanam1111@naver.com");  // �޴� ����� �����ּ�
			msg.addRecipient(Message.RecipientType.TO, toAddr); 
			msg.setContent(message, "text/plain;charset=KSC5601");
			System.out.println("Message: " + msg.getContent());
			Transport.send(msg);
			System.out.println("Gmail SMTP������ �̿��� ���Ϻ����� ����");
		}
		catch (Exception mex) { // Prints all nested (chained) exceptions as well 
			System.out.println("Gmail SMTP������ �̿��� ���Ϻ����� ����" + mex.getMessage());
			mex.printStackTrace(); 
		} 
	}

	public static String RandomNum(){
		StringBuffer buffer = new StringBuffer();
		for(int i = 0; i < 10; i++){
			int n = (int)(Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}

	private static class SMTPAuthenticator extends javax.mail.Authenticator {

		public PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication("hwanam1111", "kdlatylatlppatgl"); // Google id, pwd, ����) @gmail.com �� �����ϼ���
		}
	} 
}