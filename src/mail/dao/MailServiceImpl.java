package mail.dao;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailServiceDAO {

	
	private JavaMailSender mailSender;
	
	@Autowired
	public MailServiceImpl(JavaMailSender mailSender) {
	   this.mailSender = mailSender;	
	}
	@Override
	public boolean send(String subject, String text, String from, String to) {
		MimeMessage message = mailSender.createMimeMessage();
		
		System.out.print("Impl에서 값:"+subject);
		System.out.print("Impl에서 값:"+text);
		System.out.print("Impl에서 값:"+from);
		System.out.print("Impl에서 값:"+to);
		
		
		try {
		 MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
		 helper.setSubject(subject);
		 helper.setText(text);
		 helper.setFrom(from);
		 helper.setTo(to);
		 
		 mailSender.send(message);
		 return true; 
		}catch(MessagingException e) {
			e.printStackTrace();
		}
		 return false;
	}

}
