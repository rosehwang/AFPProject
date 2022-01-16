package mail.dao;

public interface MailServiceDAO {

	boolean send(String subject,String text,String from, String to);
}
