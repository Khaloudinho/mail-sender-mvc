package fr.miage.m2.mail;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Service
public class MailSender implements MailSenderService {

    @Value("${mail.from}")
    private String from;

    @Value("${mail.to}")
    private String to;

    @Value("${mail.host}")
    private String host;

    @Value("${mail.username}")
    private String username;

    @Value("${mail.password}")
    private String password;

    @Value("${mail.smtp}")
    private String smtp;

    @Value("${mail.pop3}")
    private String pop3;

    public Properties initClientSMTPConf(){
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", this.host);
        props.put("mail.smtp.port", this.smtp);
        return props;
    }

    public boolean send(String subject, String content) {
        final String username = this.username;
        final String password = this.password;

        Session session = Session.getInstance(initClientSMTPConf(),
                new javax.mail.Authenticator() {
                    protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                        return new javax.mail.PasswordAuthentication(username, password);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(this.from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            message.setText(content);

            Transport.send(message);

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getHost() {
        return host;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getTo() {
        return to;
    }

    public void setSmtp(String smtp) {
        this.smtp = smtp;
    }

    public String getSmtp() {
        return smtp;
    }

    public void setPop3(String pop3) {
        this.pop3 = pop3;
    }

    public String getPop3() {
        return pop3;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getFrom() {
        return from;
    }
}
