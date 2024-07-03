package Dal;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class SendMail {

    private final String username = "quypdhe173508@fpt.edu.vn";
    private final String password = "ytzd nljp jtur rbms";

    private Properties getMailProperties() {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        return props;
    }

    private Session getSession() {
        return Session.getInstance(getMailProperties(),
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
    }

    public String sendOTP(String email) {
        String otp = generateOTP();
        try {
            Message message = new MimeMessage(getSession());
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Haircare");
            message.setContent("Mã OTP của bạn là: " + otp, "text/plain; charset=UTF-8");
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
            return null;
        }
        return otp;
    }

    private String generateOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }

    public void sendMail(String to, String sub, String message) {
        try {
            Message msg = new MimeMessage(getSession());
            msg.setFrom(new InternetAddress(username));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            msg.setSubject(sub);
            msg.setContent(message, "text/html; charset=UTF-8");
            Transport.send(msg);
            System.out.println("Email sent successfully!");
        } catch (MessagingException e) {
            System.out.println("Failed to send email.");
            e.printStackTrace();
        }
    }

    // Main method for testing purposes
    public static void main(String[] args) {
        SendMail mailer = new SendMail();
        mailer.sendMail("hannhe171759@fpt.edu.vn", "Test Subject", "This is a test email with UTF-8 encoding.");
    }
}
