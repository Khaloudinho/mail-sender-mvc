package fr.miage.m2.mail;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Store;
import java.util.*;

@Service
public class MailReceiver implements MailReceiverService {

    @Value("${mail.username}")
    private String username;

    @Value("${mail.password}")
    private String password;

    @Value("${mail.host}")
    private String host;

    @Value("${mail.smtp}")
    private String smtp;

    @Value("${mail.pop3}")
    private String pop3;

    public Properties initClientPOP3Conf(){
        Properties props = new Properties();
        props.put("mail.pop3.host", this.host);
        props.put("mail.pop3.port", this.pop3);
        props.put("mail.pop3.starttls.enable", "true");
        return props;
    }

    public List<Mail> receive() {

        List<Mail> mails = new ArrayList<>();

        try {

            Session emailSession = Session.getInstance(initClientPOP3Conf());
            Store store = emailSession.getStore("pop3");

            store.connect(this.host, this.username, this.password);

            Folder emailFolder = store.getFolder("INBOX");
            emailFolder.open(Folder.READ_ONLY);

            Message[] messages = emailFolder.getMessages();

            for (int i = 0; i < messages.length; i++) {
                Message unMessage = messages[i];
                Mail unMail = new Mail(
                        unMessage.getFrom()[0].toString(),
                        unMessage.getSubject(),
                        unMessage.getContent().toString()
                );
                mails.add(unMail);
            }

            emailFolder.close(false);
            store.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return mails;
    }
}
