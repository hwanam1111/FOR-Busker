package mail;

import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends javax.mail.Authenticator {

	public PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("hwanam1111", "kdlatylatlppatgl"); // Google id, pwd, ����) @gmail.com �� �����ϼ���
	}
}