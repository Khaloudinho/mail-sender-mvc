package fr.miage.m2.controllers;

import fr.miage.m2.mail.Mail;
import fr.miage.m2.mail.MailReceiverService;
import fr.miage.m2.mail.MailSenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class MailController {

    @Autowired
    public MailReceiverService mailReceiver;

    @Autowired
    public MailSenderService mailSender;

    @GetMapping("/mailbox")
    public String printMails(Model model) {
        List<Mail> mails = mailReceiver.receive();
        model.addAttribute("mails", mails);
        return "index";
    }

    @GetMapping("/send")
    public String getMailForm(){
        return "send";
    }

    @PostMapping("/send")
    public String sendMail(String subject, String content) {
        mailSender.send(subject, content);
        return "redirect:/mailbox";
    }
}
