package fr.miage.m2.mail;

public interface MailSenderService {

    boolean send(String subject, String content);
}
