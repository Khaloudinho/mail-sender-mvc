package fr.miage.m2.controllers;

import fr.miage.m2.mail.Mail;
import fr.miage.m2.mail.MailReceiverService;
import fr.miage.m2.mail.MailSenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MailController {

    @Autowired
    public MailReceiverService mailReceiver;

    @Autowired
    public MailSenderService mailSender;

    @GetMapping({"/mailbox", "/"})
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

    @ExceptionHandler(Exception.class)
    public String catchErrors(Exception ex, Model model) {
        ex.printStackTrace();
        model.addAttribute("error", ex.toString());
        return "redirect:/send";
    }

    @GetMapping("/login")
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
                              @RequestParam(value = "logout", required = false) String logout) {
        ModelAndView model = new ModelAndView();

        if (error != null) model.addObject("error", "Invalid username and password!");

        if (logout != null) model.addObject("msg", "You've been logged out successfully!");

        model.setViewName("login");
        return model;
    }
}
