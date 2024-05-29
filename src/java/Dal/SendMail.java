package Dal;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendMail {
 public boolean sendEmailResetPass(String emailReset) {
        boolean isSent = false;
        
        final String username = "quypdhe173508@fpt.edu.vn";
        final String password = "ytzd nljp jtur rbms";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailReset));
            message.setSubject("Reset Password");
            message.setText("Click the following link to reset your password:");

            Transport.send(message);
            isSent = true;

        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return isSent;
    }

}
